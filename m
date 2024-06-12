Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBE17FADE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204518; cv=none; b=mv2M3bI5vbVCuAXerm8YI1iioFDnAdlfqA2VkF0MvkidbVFfWmxi9ZBFclz8yqQokTkSaRAsjtoCawQ05RlG2E2/oVPxXH4SfnOhIHIYEM20ZSQzPf2pVfrrdju00X9tc0Ore3rjMsAusUFTxcnUm23I4w4EgT6xKVzebnnbtHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204518; c=relaxed/simple;
	bh=P2iCcJYIFySC3lnRu+Gyudav6+d7SobSe+GbjW8tfXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bMq0hGbqJ3xC++gXJrpYTouvXkUtWegSKlrzJFNnDmwuRKqNFMB+ehyOMjzj2GWxn9mUo5ZlqmeaP+zVYg1ka/1GBRoh77Rgv4aOHN4fqwW51gIy+YO8aeSLDdYURG4MxhPj176d54FgBNnC0aPBrmtIZzJRdowFXPQvcDl3hz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn6/7JJ3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn6/7JJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718204516; x=1749740516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2iCcJYIFySC3lnRu+Gyudav6+d7SobSe+GbjW8tfXQ=;
  b=hn6/7JJ314ecHswmpSFmu5GyEgQoCCtAckPa42mYlKve/GVzgIDrO/Ag
   9JU/esPonvvFm78XKu58F0v/Ol6W9iuBozJOf1epp6Kp84SFBVEKuVRsG
   4SKoZCZULF58xUTPXUG+9bQE6TY/TcpyMMr7qWDw2EhC4q2wmgBdCfABt
   eXUNdtEpe73GOxumJmqu8A9UH0ihdfqRMGRv1StPXyKZOOcEDJvlgtua4
   K7DJ8d05dy0LbNNrBHL2n5FRsCll/izGK3nv4Z9GLvhWR30mGwrHXNs+i
   nx39hidwSTkXpdf8ze+t6znw3TQxctEtGeBWBFGGD+BvPjD2Wpg7Ih60j
   Q==;
X-CSE-ConnectionGUID: iVfqbriwSLO4uxrbcfnPQQ==
X-CSE-MsgGUID: Ds3GBlSTQA+9gpmO/t9bhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32458616"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="32458616"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:01:56 -0700
X-CSE-ConnectionGUID: jl97lXE/RKaAkMG43SdVFg==
X-CSE-MsgGUID: lK5NGkhcQeC6GJIGJhJS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40444683"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2024 08:01:55 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHPU0-0001dW-1N;
	Wed, 12 Jun 2024 15:01:52 +0000
Date: Wed, 12 Jun 2024 23:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.10-rc3 53/74]
 drivers/soc/qcom/qcom_pd_mapper.c:79:27: error: implicit declaration of
 function 'kzalloc'
Message-ID: <202406122214.IRlf9TGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.10-rc3
head:   5475612ad98c55b4a83979078f8326963b1538b6
commit: cc7fd75b1dac0e180d13d78127035931503f6fef [53/74] soc: qcom: add pd-mapper implementation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406122214.IRlf9TGW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122214.IRlf9TGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122214.IRlf9TGW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_add_service_domain':
>> drivers/soc/qcom/qcom_pd_mapper.c:79:27: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:79:25: warning: assignment to 'struct qcom_pdm_service *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^
   drivers/soc/qcom/qcom_pd_mapper.c:89:16: warning: assignment to 'struct qcom_pdm_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      89 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^
>> drivers/soc/qcom/qcom_pd_mapper.c:93:25: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      93 |                         kfree(service);
         |                         ^~~~~
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_get_domain_list':
>> drivers/soc/qcom/qcom_pd_mapper.c:160:13: warning: assignment to 'struct servreg_get_domain_list_resp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |         rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |             ^
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_start':
>> drivers/soc/qcom/qcom_pd_mapper.c:585:14: warning: assignment to 'struct qcom_pdm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     585 |         data = kzalloc(sizeof(*data), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +/kzalloc +79 drivers/soc/qcom/qcom_pd_mapper.c

    63	
    64	static int qcom_pdm_add_service_domain(struct qcom_pdm_data *data,
    65					       const char *service_name,
    66					       const char *domain_name,
    67					       u32 instance_id)
    68	{
    69		struct qcom_pdm_service *service;
    70		struct qcom_pdm_domain *domain;
    71	
    72		service = qcom_pdm_find(data, service_name);
    73		if (service) {
    74			list_for_each_entry(domain, &service->domains, list) {
    75				if (!strcmp(domain->name, domain_name))
    76					return -EBUSY;
    77			}
    78		} else {
  > 79			service = kzalloc(sizeof(*service), GFP_KERNEL);
    80			if (!service)
    81				return -ENOMEM;
    82	
    83			INIT_LIST_HEAD(&service->domains);
    84			service->name = service_name;
    85	
    86			list_add_tail(&service->list, &data->services);
    87		}
    88	
    89		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
    90		if (!domain) {
    91			if (list_empty(&service->domains)) {
    92				list_del(&service->list);
  > 93				kfree(service);
    94			}
    95	
    96			return -ENOMEM;
    97		}
    98	
    99		domain->name = domain_name;
   100		domain->instance_id = instance_id;
   101		list_add_tail(&domain->list, &service->domains);
   102	
   103		return 0;
   104	}
   105	
   106	static int qcom_pdm_add_domain(struct qcom_pdm_data *data,
   107				       const struct qcom_pdm_domain_data *domain)
   108	{
   109		int ret;
   110		int i;
   111	
   112		ret = qcom_pdm_add_service_domain(data,
   113						  TMS_SERVREG_SERVICE,
   114						  domain->domain,
   115						  domain->instance_id);
   116		if (ret)
   117			return ret;
   118	
   119		for (i = 0; domain->services[i]; i++) {
   120			ret = qcom_pdm_add_service_domain(data,
   121							  domain->services[i],
   122							  domain->domain,
   123							  domain->instance_id);
   124			if (ret)
   125				return ret;
   126		}
   127	
   128		return 0;
   129	
   130	}
   131	
   132	static void qcom_pdm_free_domains(struct qcom_pdm_data *data)
   133	{
   134		struct qcom_pdm_service *service, *tservice;
   135		struct qcom_pdm_domain *domain, *tdomain;
   136	
   137		list_for_each_entry_safe(service, tservice, &data->services, list) {
   138			list_for_each_entry_safe(domain, tdomain, &service->domains, list) {
   139				list_del(&domain->list);
   140				kfree(domain);
   141			}
   142	
   143			list_del(&service->list);
   144			kfree(service);
   145		}
   146	}
   147	
   148	static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
   149					     struct sockaddr_qrtr *sq,
   150					     struct qmi_txn *txn,
   151					     const void *decoded)
   152	{
   153		struct qcom_pdm_data *data = container_of(qmi, struct qcom_pdm_data, handle);
   154		const struct servreg_get_domain_list_req *req = decoded;
   155		struct servreg_get_domain_list_resp *rsp;
   156		struct qcom_pdm_service *service;
   157		u32 offset;
   158		int ret;
   159	
 > 160		rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
   161		if (!rsp)
   162			return;
   163	
   164		offset = req->domain_offset_valid ? req->domain_offset : 0;
   165	
   166		rsp->resp.result = QMI_RESULT_SUCCESS_V01;
   167		rsp->resp.error = QMI_ERR_NONE_V01;
   168	
   169		rsp->db_rev_count_valid = true;
   170		rsp->db_rev_count = 1;
   171	
   172		rsp->total_domains_valid = true;
   173		rsp->total_domains = 0;
   174	
   175		mutex_lock(&qcom_pdm_mutex);
   176	
   177		service = qcom_pdm_find(data, req->service_name);
   178		if (service) {
   179			struct qcom_pdm_domain *domain;
   180	
   181			rsp->domain_list_valid = true;
   182			rsp->domain_list_len = 0;
   183	
   184			list_for_each_entry(domain, &service->domains, list) {
   185				u32 i = rsp->total_domains++;
   186	
   187				if (i >= offset && i < SERVREG_DOMAIN_LIST_LENGTH) {
   188					u32 j = rsp->domain_list_len++;
   189	
   190					strscpy(rsp->domain_list[j].name, domain->name,
   191						sizeof(rsp->domain_list[i].name));
   192					rsp->domain_list[j].instance = domain->instance_id;
   193	
   194					pr_debug("PDM: found %s / %d\n", domain->name,
   195						 domain->instance_id);
   196				}
   197			}
   198		}
   199	
   200		pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->service_name,
   201			 req->domain_offset_valid ? req->domain_offset : -1, rsp->domain_list_len, rsp->total_domains);
   202	
   203		ret = qmi_send_response(qmi, sq, txn, SERVREG_GET_DOMAIN_LIST_REQ,
   204					SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
   205					servreg_get_domain_list_resp_ei, rsp);
   206		if (ret)
   207			pr_err("Error sending servreg response: %d\n", ret);
   208	
   209		mutex_unlock(&qcom_pdm_mutex);
   210	
   211		kfree(rsp);
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
