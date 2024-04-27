Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C444F894
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714228061; cv=none; b=MDcQufiJZeXgRAxLeYDGJ5rwnJRTLtL07drMlZenTxTbtyJu2LH7Lym5h14H0Y0idecRKt/9my3rIoFca4HnBCi1liKpVjbDc9hwtTgPwKY6ZcbQYhHpFgYFapl6xZawz26+Dpg92iLoNiSlczj30Rs6Sc16WOoISvB+8MAIOqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714228061; c=relaxed/simple;
	bh=UdN7tYBLqLqENAi0WQZ9U01CIf2+q6eWAF1S7NZy2kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckKxy1gEN9pNKMbnsWIgKe886ey06GMzLsRi4uhoUgGPIbpiTmPfYo5SnVWoPsrmPR8K8uUhOZ9DenDn5u74JZLXurpdNBf4yLT+4GzdyC9jlTy3K/OCFTrpXvBl7dm1pZVHpsNaMkJ9znJ5II0PtMTy6/mQXmdDelcjbRr9qCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtEvqwor; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtEvqwor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714228059; x=1745764059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UdN7tYBLqLqENAi0WQZ9U01CIf2+q6eWAF1S7NZy2kc=;
  b=HtEvqwormv1k8kfqLBdV1vxq9lgbsJkWznDwRsnhBqyr8u4WB2rz9Jgm
   xCTB3Of/QJPYrWf2AdP6OKnQOYKPyLEywKMyc+19cce40s0TLqSIrA6O0
   gbzxyq2JJ6csdhDtvAYiTabEXbEsXpr1eB1EVV1TjpdSuQKT6ZKElL20P
   oHcubBNcFjmD23tOlsHIfQOwgcDWOtHL8Ssu11KVl+e8oGnOL3IUOPm2T
   +v7bWbOe+DH8U7XB0CCRjpgv3bREpk6nMf8q5Mj+dkg+va7wLf/qFs+fI
   CxUnBiESnBL2cPGwpmXdHIn18C65AMaKjn21f92Amrr0gbJR2o5oIBeCE
   w==;
X-CSE-ConnectionGUID: 2Mr8dUiXQvCHxM15RdbIDg==
X-CSE-MsgGUID: hUeLdeiRSgmkdnYMO90bcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9812016"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="9812016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 07:27:39 -0700
X-CSE-ConnectionGUID: eQ6VYpPiRm63958xogu/zQ==
X-CSE-MsgGUID: 7Pqwwnh1TxWEPkeoE07ShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="56599894"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Apr 2024 07:27:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0j1b-00056G-1s;
	Sat, 27 Apr 2024 14:27:35 +0000
Date: Sat, 27 Apr 2024 22:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.8.y 102/104]
 drivers/soc/qcom/qcom_pd_mapper.c:78:25: warning: assignment to 'struct
 qcom_pdm_service *' from 'int' makes pointer from integer without a cast
Message-ID: <202404272236.4AFSN5vc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.8.y
head:   0bde7107456c88f5ccc83c66d7638f1bf02fa8a1
commit: 368e8c6cdf78e4d1e4eff7f1341108aaeb28cfd1 [102/104] soc: qcom: add pd-mapper implementation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240427/202404272236.4AFSN5vc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272236.4AFSN5vc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404272236.4AFSN5vc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_add_service_domain':
   drivers/soc/qcom/qcom_pd_mapper.c:78:27: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      78 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^~~~~~~
>> drivers/soc/qcom/qcom_pd_mapper.c:78:25: warning: assignment to 'struct qcom_pdm_service *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      78 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^
>> drivers/soc/qcom/qcom_pd_mapper.c:88:16: warning: assignment to 'struct qcom_pdm_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      88 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^
   drivers/soc/qcom/qcom_pd_mapper.c:92:25: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      92 |                         kfree(service);
         |                         ^~~~~
         |                         kvfree
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_get_domain_list':
>> drivers/soc/qcom/qcom_pd_mapper.c:150:52: warning: initialization of 'struct servreg_get_domain_list_resp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     150 |         struct servreg_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |                                                    ^~~~~~~
   cc1: some warnings being treated as errors


vim +78 drivers/soc/qcom/qcom_pd_mapper.c

    63	
    64	static int qcom_pdm_add_service_domain(const char *service_name,
    65					       const char *domain_name,
    66					       u32 instance_id)
    67	{
    68		struct qcom_pdm_service *service;
    69		struct qcom_pdm_domain *domain;
    70	
    71		service = qcom_pdm_find(service_name);
    72		if (service) {
    73			list_for_each_entry(domain, &service->domains, list) {
    74				if (!strcmp(domain->name, domain_name))
    75					return -EBUSY;
    76			}
    77		} else {
  > 78			service = kzalloc(sizeof(*service), GFP_KERNEL);
    79			if (!service)
    80				return -ENOMEM;
    81	
    82			INIT_LIST_HEAD(&service->domains);
    83			service->name = service_name;
    84	
    85			list_add_tail(&service->list, &qcom_pdm_services);
    86		}
    87	
  > 88		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
    89		if (!domain) {
    90			if (list_empty(&service->domains)) {
    91				list_del(&service->list);
    92				kfree(service);
    93			}
    94	
    95			return -ENOMEM;
    96		}
    97	
    98		domain->name = domain_name;
    99		domain->instance_id = instance_id;
   100		list_add_tail(&domain->list, &service->domains);
   101	
   102		return 0;
   103	}
   104	
   105	static int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data)
   106	{
   107		int ret;
   108		int i;
   109	
   110		ret = qcom_pdm_add_service_domain(TMS_SERVREG_SERVICE,
   111						  data->domain,
   112						  data->instance_id);
   113		if (ret)
   114			return ret;
   115	
   116		for (i = 0; data->services[i]; i++) {
   117			ret = qcom_pdm_add_service_domain(data->services[i],
   118							  data->domain,
   119							  data->instance_id);
   120			if (ret)
   121				return ret;
   122		}
   123	
   124		return 0;
   125	
   126	}
   127	
   128	static void qcom_pdm_free_domains(void)
   129	{
   130		struct qcom_pdm_service *service, *tservice;
   131		struct qcom_pdm_domain *domain, *tdomain;
   132	
   133		list_for_each_entry_safe(service, tservice, &qcom_pdm_services, list) {
   134			list_for_each_entry_safe(domain, tdomain, &service->domains, list) {
   135				list_del(&domain->list);
   136				kfree(domain);
   137			}
   138	
   139			list_del(&service->list);
   140			kfree(service);
   141		}
   142	}
   143	
   144	static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
   145					     struct sockaddr_qrtr *sq,
   146					     struct qmi_txn *txn,
   147					     const void *decoded)
   148	{
   149		const struct servreg_get_domain_list_req *req = decoded;
 > 150		struct servreg_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
   151		struct qcom_pdm_service *service;
   152		u32 offset;
   153		int ret;
   154	
   155		offset = req->domain_offset_valid ? req->domain_offset : 0;
   156	
   157		rsp->resp.result = QMI_RESULT_SUCCESS_V01;
   158		rsp->resp.error = QMI_ERR_NONE_V01;
   159	
   160		rsp->db_rev_count_valid = true;
   161		rsp->db_rev_count = 1;
   162	
   163		rsp->total_domains_valid = true;
   164		rsp->total_domains = 0;
   165	
   166		mutex_lock(&qcom_pdm_mutex);
   167	
   168		service = qcom_pdm_find(req->service_name);
   169		if (service) {
   170			struct qcom_pdm_domain *domain;
   171	
   172			rsp->domain_list_valid = true;
   173			rsp->domain_list_len = 0;
   174	
   175			list_for_each_entry(domain, &service->domains, list) {
   176				u32 i = rsp->total_domains++;
   177	
   178				if (i >= offset && i < SERVREG_DOMAIN_LIST_LENGTH) {
   179					u32 j = rsp->domain_list_len++;
   180	
   181					strscpy(rsp->domain_list[j].name, domain->name,
   182						sizeof(rsp->domain_list[i].name));
   183					rsp->domain_list[j].instance = domain->instance_id;
   184	
   185					pr_debug("PDM: found %s / %d\n", domain->name,
   186						 domain->instance_id);
   187				}
   188			}
   189		}
   190	
   191		pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->service_name,
   192			 req->domain_offset_valid ? req->domain_offset : -1, rsp->domain_list_len, rsp->total_domains);
   193	
   194		ret = qmi_send_response(qmi, sq, txn, SERVREG_GET_DOMAIN_LIST_REQ,
   195					SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
   196					servreg_get_domain_list_resp_ei, rsp);
   197		if (ret)
   198			pr_err("Error sending servreg response: %d\n", ret);
   199	
   200		mutex_unlock(&qcom_pdm_mutex);
   201	
   202		kfree(rsp);
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
