/**
 * Copyright 1996-2014 FoxBPM ORG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author kenshin
 */
package org.foxbpm.engine.impl.task.cmd;
import org.foxbpm.engine.impl.entity.TaskEntity;
import org.foxbpm.engine.impl.interceptor.CommandContext;
import org.foxbpm.engine.impl.task.command.TransferTaskCommand;
import org.foxbpm.engine.task.TaskCommand;
import org.foxbpm.kernel.runtime.FlowNodeExecutionContext;

/**
 * @author kenshin
 * 转发不创建新任务，只替换了处理人
 *
 */
public class TransferTaskCmd extends AbstractExpandTaskCmd<TransferTaskCommand, Void> {

	private static final long serialVersionUID = 1L;

	/**
	 * 转发的用户编号
	 */
	protected String transferUserId;

	public TransferTaskCmd(TransferTaskCommand transferTaskCommand) {

		super(transferTaskCommand);
		this.transferUserId = transferTaskCommand.getTransferUserId();

	}

	 
	protected Void execute(CommandContext commandContext, TaskEntity task) {
		
		/** 获取任务命令 */
		TaskCommand taskCommand = getTaskCommand(task);
		/** 获取流程内容执行器 */
		FlowNodeExecutionContext executionContext = getExecutionContext(task);
		/** 任务命令的执行表达式变量 */
		if(taskCommand != null){
			taskCommand.getExpressionValue(executionContext);
		}
		/** 设置任务处理者 */
		task.setAssignee(transferUserId);
		/** 设置任务的处理命令 commandId commandName commandType */
		task.setTaskCommand(taskCommand);
		/** 处理意见 */
		task.setTaskComment(taskComment);
		return null;
	}
	
	
	

}
