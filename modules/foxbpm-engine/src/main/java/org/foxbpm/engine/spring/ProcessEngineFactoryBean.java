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
 * @author ych
 */
package org.foxbpm.engine.spring;

import org.foxbpm.engine.ProcessEngine;
import org.foxbpm.engine.ProcessEngineManagement;
import org.foxbpm.engine.impl.ProcessEngineConfigurationImpl;
import org.foxbpm.engine.impl.ProcessEngineImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * spring引擎创建工厂
 * @author Administrator
 *
 */
public class ProcessEngineFactoryBean implements FactoryBean<ProcessEngine>,
		DisposableBean, ApplicationContextAware {
	private static final Logger log = LoggerFactory.getLogger(ProcessEngineFactoryBean.class);
	protected ProcessEngineConfigurationImpl processEngineConfiguration;
	protected ApplicationContext applicationContext;
	protected ProcessEngineImpl processEngine;

	 
	public ProcessEngine getObject() throws Exception {
		try{
			processEngine = (ProcessEngineImpl) processEngineConfiguration.setProcessEngineName(ProcessEngineManagement.NAME_DEFAULT)
					.buildProcessEngine();
		}catch(Exception ex){
			log.error("流程引擎启动失败，失败原因："+ex.getMessage());
			throw ex;
		}
		finally{
			ProcessEngineManagement.setInit();
		}
		return processEngine;
	}

	 
	public void destroy() throws Exception {
		if (processEngine != null) {
			processEngine.closeEngine();
		}
	}

	 
	public Class<?> getObjectType() {
		return ProcessEngine.class;
	}

	 
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.applicationContext = applicationContext;
	}

	 
	public boolean isSingleton() {
		return true;
	}

	public void setProcessEngineConfiguration(
			ProcessEngineConfigurationImpl processEngineConfiguration) {
		this.processEngineConfiguration = processEngineConfiguration;
	}

}
