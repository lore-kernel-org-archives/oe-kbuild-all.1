Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB3EDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715986075; cv=none; b=OiK+9SvmL373VYGdJri/74ng0cVydnRi/cgSrlz2xp+jxTSUrU56H6cGpnpQakmqNyySnk0yDuXrFtsWF8wmyJ0FacttDQ8XJFtV02Is+gpossNser9A9m6HNiIEeTl/U0lZl+EJ4ghgIVzg7vUQaAsY4PSxgMIVOsPUgdOnWlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715986075; c=relaxed/simple;
	bh=I71rZecL4ytyoE+7BIwuoQJyYMOjg34Mc/ydpp2E7Os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEa+p4UTf1VKUZQMJ1E0p02oNzQ5ORUm+ACXbS8auI/NMjNZO17BqQ49kLBTdKuEuw/7iTmAgbnHma5JGP7fFzV5sEjGBR0cQPQKEMS322DUMfcHz52huolZOuRyowB64tyeXW2o0u1jOUGraSqmjAOKqenPVTTK0Ba6svBKu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlfeCyt3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlfeCyt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715986073; x=1747522073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I71rZecL4ytyoE+7BIwuoQJyYMOjg34Mc/ydpp2E7Os=;
  b=hlfeCyt3RdG5nVYxcG8H/SArBMbT+dNi6GXhdzJuJ6UNqp7kKxdJXvoA
   5KC3D6kqJOChEKA83OeOY1wn5+gufuUfAZhnl6IMuCl8IydkfnZk2ACIT
   QNQIG6h6lkOlHvCuX/BSS9hxVaZt3f7kOeaq+pdMNQtMGWzcO0CEj2ZIZ
   c3Dzj3eqeH1LAAJGo2r8ToyFohhojVQjyPM6hOS6CFWzAta+jr9QVk6PT
   i3BHwbRnM6816QU2lxaLdS+FQl5AWhjqKLryahRn6PpCxvwyyuF7ew2Zf
   h1+97ADe6qO1pjjBmxx9qRfATyP/NYOrvOEMt0A/QT/KPS7tz9i5ZkTnC
   Q==;
X-CSE-ConnectionGUID: H8i3uHqfTQW4cscq+t+VQw==
X-CSE-MsgGUID: Nbm923EwSOmnZy5NJnoEzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15978774"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="15978774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 15:47:53 -0700
X-CSE-ConnectionGUID: T3eexK7+TjmTm4CAGFSqKw==
X-CSE-MsgGUID: MFbxOOf1T8e2d/5yGz+RHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="36739547"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 May 2024 15:47:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s86Lu-0001CS-0J;
	Fri, 17 May 2024 22:47:33 +0000
Date: Sat, 18 May 2024 06:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.9.y 74/86]
 drivers/soc/qcom/qcom_pd_mapper.c:79:13: error: implicit declaration of
 function 'kzalloc' is invalid in C99
Message-ID: <202405180640.9di7eR6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.9.y
head:   d2cbbcdb54dc35e72def8df1311248acac66dcf5
commit: 83fda874747a0dac3fd062f335ec541d9caec2b2 [74/86] soc: qcom: add pd-mapper implementation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240518/202405180640.9di7eR6y-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180640.9di7eR6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180640.9di7eR6y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/qcom/qcom_pd_mapper.c:79:13: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   service = kzalloc(sizeof(*service), GFP_KERNEL);
                             ^
>> drivers/soc/qcom/qcom_pd_mapper.c:79:11: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_service *' from 'int' [-Wint-conversion]
                   service = kzalloc(sizeof(*service), GFP_KERNEL);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:89:11: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           domain = kzalloc(sizeof(*domain), GFP_KERNEL);
                    ^
>> drivers/soc/qcom/qcom_pd_mapper.c:89:9: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_domain *' from 'int' [-Wint-conversion]
           domain = kzalloc(sizeof(*domain), GFP_KERNEL);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/qcom_pd_mapper.c:93:4: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           kfree(service);
                           ^
   drivers/soc/qcom/qcom_pd_mapper.c:140:4: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           kfree(domain);
                           ^
   drivers/soc/qcom/qcom_pd_mapper.c:144:3: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kfree(service);
                   ^
   drivers/soc/qcom/qcom_pd_mapper.c:160:8: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
                 ^
>> drivers/soc/qcom/qcom_pd_mapper.c:160:6: warning: incompatible integer to pointer conversion assigning to 'struct servreg_get_domain_list_resp *' from 'int' [-Wint-conversion]
           rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:211:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(rsp);
           ^
   drivers/soc/qcom/qcom_pd_mapper.c:557:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(data);
           ^
   drivers/soc/qcom/qcom_pd_mapper.c:585:9: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           data = kzalloc(sizeof(*data), GFP_KERNEL);
                  ^
>> drivers/soc/qcom/qcom_pd_mapper.c:585:7: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_data *' from 'int' [-Wint-conversion]
           data = kzalloc(sizeof(*data), GFP_KERNEL);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:594:3: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kfree(data);
                   ^
   4 warnings and 10 errors generated.


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
  > 89		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
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
