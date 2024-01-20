Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F53210B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705762847; cv=none; b=Mz8n1RspqaFnsKP36ERCi4+ZSzXwGgo6hJvs8GgijSPqQN7mFKpNYFpLPiqYxIUdgbytlkaoMd56iiLOdrFLzO4qMPLLtSCsYV1M3XdyST0KrLHZzrpAm6NpzgeXxK5fMhG8wb8NdNRCX2y6G3EQ6LVAApyqyVBMhdWcW9Jw1hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705762847; c=relaxed/simple;
	bh=2wMHTfNMmoMow4xQe5Y5qJeOsz0cWBlJMvawS9Pd5EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMpYvnbEz7dQHqo3+/vUoyzmvstPHRzZRokQHSuH+6ksaWuDFmTskZzi6w0VSLUot0+Uwj4+ivM/6SLe57Q1XxG894AV5bk7IfmUtlhmJiukG3IA8dtyCdubZ5R0uxWvq/juxJtlM/rUyD+YGTJTZ62+rTJ/gbZPyEK8mgrXloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T90YlhCZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T90YlhCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705762845; x=1737298845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wMHTfNMmoMow4xQe5Y5qJeOsz0cWBlJMvawS9Pd5EM=;
  b=T90YlhCZQ+eYGe9sBmxdtaEWU9B6tzDQa0/+c6ILU8n/vrc3SNTV2sRc
   Hn4Yq+bD8T18L7MlF0h/GJOXCGSeWJykvJRnm5Z6z2y4zQK0JOFkGLTrq
   B2QN00cyBvO129M1oTwOlb3cZtEFqqqHHCtN60arQnJvx6Vg4jOaMsVCk
   9d0NWKIGph0rjPOBQxS/RlFQw/hAMVIC/6juvArHzQYHbeDlUmUe3kyRu
   e242v5fRK+WmLCuHv9XFRN2Vf5sk4fYOFr4XambWfwDfDjxHVGjT/6v1b
   rkEjOoY1R8GkR+6HXH0ZLxaLWOIVr/RlNR7o9eCGE1kNYph5SkANf9SMW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="7636536"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="7636536"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 07:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="761363626"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="761363626"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2024 07:00:42 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRCpr-0005BO-2v;
	Sat, 20 Jan 2024 15:00:39 +0000
Date: Sat, 20 Jan 2024 23:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:c630-linux-6.7.y 140/172] drivers/soc/qcom/qcom_pdm.c:56:4:
 error: call to undeclared function 'kfree'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202401202205.dYve9KNj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-linux-6.7.y
head:   39a217c94e52774dd6abf3251a6c999edee2aa76
commit: 983c9e9eb9686ca3f28ad71a52dc1f3d1444ecae [140/172] soc: qcom: add pd-mapper implementation
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401202205.dYve9KNj-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202205.dYve9KNj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202205.dYve9KNj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/qcom_pdm.c:56:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |                         kfree(domain);
         |                         ^
>> drivers/soc/qcom/qcom_pdm.c:85:13: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^
>> drivers/soc/qcom/qcom_pdm.c:85:11: error: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_service *' from 'int' [-Wint-conversion]
      85 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pdm.c:95:11: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                  ^
>> drivers/soc/qcom/qcom_pdm.c:95:9: error: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_domain *' from 'int' [-Wint-conversion]
      95 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pdm.c:99:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |                         kfree(service->name);
         |                         ^
   drivers/soc/qcom/qcom_pdm.c:173:49: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |                                                        ^
>> drivers/soc/qcom/qcom_pdm.c:173:43: error: incompatible integer to pointer conversion initializing 'struct servreg_loc_get_domain_list_resp *' with an expression of type 'int' [-Wint-conversion]
     173 |         struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |                                                  ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pdm.c:227:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     227 |         kfree(rsp);
         |         ^
   9 errors generated.


vim +/kfree +56 drivers/soc/qcom/qcom_pdm.c

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
