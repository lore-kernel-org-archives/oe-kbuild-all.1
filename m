Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB411194
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAeDaS+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703851622; x=1735387622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bzKH5GxTvPV00Fi6wVxiM2CWoz50VAql1IUtrVnvKaM=;
  b=EAeDaS+W6K5JbfdLUbCD9g8wIUgpcil2jD9giwEorxY5MYprFXlv0QHo
   V/9aEa2s4M62ZDBskMiELN5NDSh/dIRaMC489CKuU+Zq+5MjFuCh35+Ow
   h+ebzeEwcYwCyHnQPcxPamkOpb/iOWxwFe0rxWsPOk9y6k7CXq1VYKz9p
   d4DZq+j1nC5hQa1sC6g2x0LMffOfRJXABSC42pUROarWW18LU+LrDNpaP
   PLcoBT9x3vWFdOrmQrS9PeBINLYpahMpQppI7ut2NnZC4W88XHGYBjECR
   av07856+MWDUIsK5iO0tl0B5Y4XoKMHhfKzcCQLqWak1jTXIsUbZETsmA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="399422504"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="399422504"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 04:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="952067128"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="952067128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Dec 2023 04:06:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJBdg-000HQ9-2K;
	Fri, 29 Dec 2023 12:06:56 +0000
Date: Fri, 29 Dec 2023 20:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.7.0-rc7 139/146]
 drivers/soc/qcom/qcom_pdm.c:56:25: error: implicit declaration of function
 'kfree'; did you mean 'kvfree'?
Message-ID: <202312292047.jesXAGb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7.0-rc7
head:   98581f1b8caa68dee7a2dcd0714d845f7cb9eac2
commit: c1951a2f73f60891e16801cd7b26646f289a3453 [139/146] soc: qcom: add pd-mapper implementation
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231229/202312292047.jesXAGb6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312292047.jesXAGb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292047.jesXAGb6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pdm.c: In function 'qcom_pdm_del_service_domain_locked':
>> drivers/soc/qcom/qcom_pdm.c:56:25: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      56 |                         kfree(domain);
         |                         ^~~~~
         |                         kvfree
   drivers/soc/qcom/qcom_pdm.c: In function 'qcom_pdm_add_service_domain_locked':
>> drivers/soc/qcom/qcom_pdm.c:85:27: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      85 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^~~~~~~
>> drivers/soc/qcom/qcom_pdm.c:85:25: warning: assignment to 'struct qcom_pdm_service *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      85 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^
>> drivers/soc/qcom/qcom_pdm.c:95:16: warning: assignment to 'struct qcom_pdm_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      95 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^
   drivers/soc/qcom/qcom_pdm.c: In function 'qcom_pdm_get_domain_list':
>> drivers/soc/qcom/qcom_pdm.c:173:56: warning: initialization of 'struct servreg_loc_get_domain_list_resp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     173 |         struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |                                                        ^~~~~~~
   cc1: some warnings being treated as errors


vim +56 drivers/soc/qcom/qcom_pdm.c

    43	
    44	static void qcom_pdm_del_service_domain_locked(const char *service_name, const char *domain_name)
    45	{
    46		struct qcom_pdm_service *service;
    47		struct qcom_pdm_domain *domain, *temp;
    48	
    49		service = qcom_pdm_find_locked(service_name);
    50		if (WARN_ON(!service))
    51			return;
    52	
    53		list_for_each_entry_safe(domain, temp, &service->domains, list) {
    54			if (!strcmp(domain->name, domain_name)) {
    55				list_del(&domain->list);
  > 56				kfree(domain);
    57	
    58				if (list_empty(&service->domains)) {
    59					list_del(&service->list);
    60					kfree(service->name);
    61					kfree(service);
    62				}
    63	
    64				return;
    65			}
    66		}
    67	
    68		WARN(1, "domain not found");
    69	}
    70	
    71	static int qcom_pdm_add_service_domain_locked(const char *service_name,
    72						      const char *domain_name,
    73						      u32 instance_id)
    74	{
    75		struct qcom_pdm_service *service;
    76		struct qcom_pdm_domain *domain;
    77	
    78		service = qcom_pdm_find_locked(service_name);
    79		if (service) {
    80			list_for_each_entry(domain, &service->domains, list) {
    81				if (!strcmp(domain->name, domain_name))
    82					return -EBUSY;
    83			}
    84		} else {
  > 85			service = kzalloc(sizeof(*service), GFP_KERNEL);
    86			if (!service)
    87				return -ENOMEM;
    88	
    89			INIT_LIST_HEAD(&service->domains);
    90			service->name = kstrdup(service_name, GFP_KERNEL);
    91	
    92			list_add_tail(&service->list, &qcom_pdm_services);
    93		}
    94	
  > 95		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
    96		if (!domain) {
    97			if (list_empty(&service->domains)) {
    98				list_del(&service->list);
    99				kfree(service->name);
   100				kfree(service);
   101			}
   102	
   103			return -ENOMEM;
   104		}
   105	
   106		/*
   107		 * service name can outlive calling module and so it should be strdup'ed.
   108		 * domain name can not outlive the module, so there is no need to strdup it.
   109		 */
   110		domain->name = domain_name;
   111		domain->instance_id = instance_id;
   112		list_add(&domain->list, &service->domains);
   113	
   114		return 0;
   115	}
   116	
   117	int qcom_pdm_add_domain(const struct qcom_pdm_domain_data *data)
   118	{
   119		int ret;
   120		int i;
   121	
   122		mutex_lock(&qcom_pdm_mutex);
   123	
   124		ret = qcom_pdm_add_service_domain_locked(TMS_SERVREG_SERVICE,
   125							 data->domain,
   126							 data->instance_id);
   127	
   128		for (i = 0; data->services[i]; i++) {
   129			ret = qcom_pdm_add_service_domain_locked(data->services[i],
   130								 data->domain,
   131								 data->instance_id);
   132			if (ret)
   133				goto err;
   134		}
   135	
   136		mutex_unlock(&qcom_pdm_mutex);
   137	
   138		return 0;
   139	
   140	err:
   141		while (--i >= 0)
   142			qcom_pdm_del_service_domain_locked(data->services[i], data->domain);
   143	
   144		qcom_pdm_del_service_domain_locked(TMS_SERVREG_SERVICE, data->domain);
   145	
   146		mutex_unlock(&qcom_pdm_mutex);
   147	
   148		return ret;
   149	}
   150	EXPORT_SYMBOL_GPL(qcom_pdm_add_domain);
   151	
   152	void qcom_pdm_del_domain(const struct qcom_pdm_domain_data *data)
   153	{
   154		int i;
   155	
   156		mutex_lock(&qcom_pdm_mutex);
   157	
   158		for (i = 0; data->services[i]; i++)
   159			qcom_pdm_del_service_domain_locked(data->services[i], data->domain);
   160	
   161		qcom_pdm_del_service_domain_locked(TMS_SERVREG_SERVICE, data->domain);
   162	
   163		mutex_unlock(&qcom_pdm_mutex);
   164	}
   165	EXPORT_SYMBOL_GPL(qcom_pdm_del_domain);
   166	
   167	static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
   168					     struct sockaddr_qrtr *sq,
   169					     struct qmi_txn *txn,
   170					     const void *decoded)
   171	{
   172		const struct servreg_loc_get_domain_list_req *req = decoded;
 > 173		struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
   174		struct qcom_pdm_service *service;
   175		u32 offset;
   176		int ret;
   177	
   178		pr_info("PDM: service '%s' offset %d\n", req->name, req->offset_valid ? req->offset : -1);
   179	
   180		offset = req->offset_valid ? req->offset : 0;
   181	
   182		rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
   183		rsp->rsp.error = QMI_ERR_NONE_V01;
   184	
   185		rsp->db_revision_valid = true;
   186		rsp->db_revision = 1;
   187	
   188		rsp->total_domains_valid = 1;
   189		rsp->total_domains = 0;
   190	
   191		mutex_lock(&qcom_pdm_mutex);
   192	
   193		service = qcom_pdm_find_locked(req->name);
   194		if (service) {
   195			struct qcom_pdm_domain *domain;
   196	
   197			rsp->domain_list_valid = 1;
   198			rsp->domain_list_len = 0;
   199	
   200			list_for_each_entry(domain, &service->domains, list) {
   201				u32 i = rsp->total_domains++;
   202	
   203				if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
   204					u32 j = rsp->domain_list_len++;
   205	
   206					strlcpy(rsp->domain_list[j].name, domain->name,
   207						sizeof(rsp->domain_list[i].name));
   208					rsp->domain_list[j].instance_id = domain->instance_id;
   209	
   210					pr_info("PDM: returning %s / %d\n", domain->name,
   211						domain->instance_id);
   212				}
   213			}
   214	
   215		}
   216	
   217		mutex_unlock(&qcom_pdm_mutex);
   218	
   219		pr_info("PDM: service '%s' %d domains (of %d)\n", req->name, rsp->domain_list_len, rsp->total_domains);
   220	
   221		ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
   222					2658,
   223					servreg_loc_get_domain_list_resp_ei, rsp);
   224		if (ret)
   225			pr_err("Error sending servreg response: %d\n", ret);
   226	
   227		kfree(rsp);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
