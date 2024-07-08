Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972712582
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 03:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720410470; cv=none; b=W09dQK+Y9BhXum7PHSNfTQsfTSuiNubiN/AEVyAR6+xSkU7uHPzv9AVVMKsMp8942jhD+WvAOOUBgOAOJCmCFdVjefsKM1UlboStBTF0m7yCGe1ASu4Rm8+fj/Q5CcfOL+ghS34FsH9fIHD5oWk9tpqPnCzgHS7V7JTUrXCuZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720410470; c=relaxed/simple;
	bh=8dd5cK5AsFYWKWdJa9gcHKZUXqPf4RTzpoJww/t+Kzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAp5iDTTWn4DeTzUVqEyA8BKOT89/MMrcMIcZ4vSI2AHNkBflyUZJrMWVpu40sQ7FwN+/U5aI3T6AjhrNDwU2zz/zPi+EvDit8kc0CB0/8os1U6W6aoMjZkGljqreiiBoK4bBsgR6KUh6caaji17OI0i/CKmtxan2s9nVC7sy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQhzBUZK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQhzBUZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720410469; x=1751946469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dd5cK5AsFYWKWdJa9gcHKZUXqPf4RTzpoJww/t+Kzk=;
  b=lQhzBUZKTAQonExRAKlW//8ybYM82XPsl8Avw/jHJDSq3B79c88xxRg2
   2xlj4yd4TgxupWKVjar2l9B8hZf3ja/K3mTUfD2OvTq+s6ZH5Xj3W0CD7
   jZuTvyvkVk4ot8l/EQmrHzW+/qNDgoA6euUMvVZOFQdP5A41XI5LaUMAa
   C5EDi+UIK3pqwXNAcSD+P8Va1tVDLeOtcCZTgjfoDKNGuGE/iBqeGHDtf
   YxRk6hnNwiPdq5GhaJxWzS1b7uxH7c1Ptr0vKQisDQcFKLx+RhPNY43/2
   wHiKywo2WBAejMstXD4x2COIkwym8mHAmnsTT3AKs7IlvnPY3YS4DisJe
   Q==;
X-CSE-ConnectionGUID: pTd3i++hSeyiy7M5BK6oRw==
X-CSE-MsgGUID: XBJDCehOSrmRkRT8atOd3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21407759"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21407759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 20:47:48 -0700
X-CSE-ConnectionGUID: wrhUEzjGT1CLYQv8INdKgA==
X-CSE-MsgGUID: lUkKx6/OSHW4ozTDFCQXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="78116677"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2024 20:47:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQfLs-000VUe-2m;
	Mon, 08 Jul 2024 03:47:44 +0000
Date: Mon, 8 Jul 2024 11:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.9.y 94/98]
 drivers/soc/qcom/qcom_pd_mapper.c:160:6: error: incompatible integer to
 pointer conversion assigning to 'struct servreg_get_domain_list_resp *' from
 'int'
Message-ID: <202407081127.6ZtttgaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.9.y
head:   1bf5cfad6ed9289682bfd255ca6a931bad2b6dee
commit: dea5860e8cc39a242675ac67daf815c3eb5738c7 [94/98] soc: qcom: add pd-mapper implementation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240708/202407081127.6ZtttgaO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081127.6ZtttgaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081127.6ZtttgaO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pd_mapper.c:79:13: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^
   drivers/soc/qcom/qcom_pd_mapper.c:79:11: error: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_service *' from 'int' [-Wint-conversion]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:89:11: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                  ^
   drivers/soc/qcom/qcom_pd_mapper.c:89:9: error: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_domain *' from 'int' [-Wint-conversion]
      89 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:93:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      93 |                         kfree(service);
         |                         ^
   drivers/soc/qcom/qcom_pd_mapper.c:140:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                         kfree(domain);
         |                         ^
   drivers/soc/qcom/qcom_pd_mapper.c:144:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |                 kfree(service);
         |                 ^
   drivers/soc/qcom/qcom_pd_mapper.c:160:8: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |         rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |               ^
>> drivers/soc/qcom/qcom_pd_mapper.c:160:6: error: incompatible integer to pointer conversion assigning to 'struct servreg_get_domain_list_resp *' from 'int' [-Wint-conversion]
     160 |         rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:211:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     211 |         kfree(rsp);
         |         ^
   drivers/soc/qcom/qcom_pd_mapper.c:557:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     557 |         kfree(data);
         |         ^
   drivers/soc/qcom/qcom_pd_mapper.c:585:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     585 |         data = kzalloc(sizeof(*data), GFP_KERNEL);
         |                ^
>> drivers/soc/qcom/qcom_pd_mapper.c:585:7: error: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_data *' from 'int' [-Wint-conversion]
     585 |         data = kzalloc(sizeof(*data), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:594:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     594 |                 kfree(data);
         |                 ^
   14 errors generated.


vim +160 drivers/soc/qcom/qcom_pd_mapper.c

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
