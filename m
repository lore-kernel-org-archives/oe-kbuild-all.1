Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD28200D3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714321720; cv=none; b=dC4gNWt8N9Q2zBzw4ZZmSc9OMd4ANQmTyIpLBbYHKmB+b9h0Azut3jfkt+U9Ldz08YxicuA/ZPriLt1OlHM1qokFrcpzp5xQKujxr+vY0RUGN0Sw7URCYZktgz9QBtObScepDeaMoMSPgM8zx7qIcub+pivHlAVVEhGl9ZIuub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714321720; c=relaxed/simple;
	bh=fTafaO7aSA25VxjBmmByp1I6bxoAtW4mdlbEcjVUhyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4CdTdQA+Wx5ztQdexrW/2cLTwEGM6atWkcRVH0UkfIy6zk1qxwCCvjDdG+fJHYTo8XshzJKtLKCZzZzlHSUGGqHIHCq2xyxVAznUK/dLLgNT/aEo5R90DupOktGfLBhB+mnCwhL8Xmz/sZoGrFFcrk2GAWgSXUoBhm9obDLS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGNs52Me; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGNs52Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714321718; x=1745857718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTafaO7aSA25VxjBmmByp1I6bxoAtW4mdlbEcjVUhyY=;
  b=GGNs52MezzSaMPQnJcks+WXoSA03W2ecbfBeUqLnozi9bdQ0G2HxBn+0
   Nl3HFSJcMsfQYP5fhYw/gxokMH2+/5XTfao8yC2yomG1WunQwT4YF73Xm
   n9LttnFrGkr+nn5axVtUyLT+pbK0ip7qSvj2qbjxoGLEqlc6pxuqhIwRt
   ZtEuwd14CNPsHIrTL8YVmdrCP/HdpSdgxLskUkZUz2j552kYWzW5Dmf+K
   JqLm99K/MuZifJgMdSQCGXFJRUvLX5XnuSdM3XobhS4uhVu4EC8nGjSla
   TMkVi9mFwa3Ka81UHfjaverG6C6z/gRNwnBI/hU8k7NN58oVzh5/WZNWZ
   w==;
X-CSE-ConnectionGUID: k74eN7ltSBaDjtr8GGjt+g==
X-CSE-MsgGUID: lW4C7MGPRyCz47mjSoK3Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9914857"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="9914857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 09:28:37 -0700
X-CSE-ConnectionGUID: dmYjU6X1S/ezsB/ugcoiOA==
X-CSE-MsgGUID: asyZz1JpSeqbqT/k09/W2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25890577"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2024 09:28:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s17OE-0006TO-0l;
	Sun, 28 Apr 2024 16:28:34 +0000
Date: Mon, 29 Apr 2024 00:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.8.y 102/104]
 drivers/soc/qcom/qcom_pd_mapper.c:78:27: error: implicit declaration of
 function 'kzalloc'
Message-ID: <202404290042.uXYS0hZQ-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404290042.uXYS0hZQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290042.uXYS0hZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290042.uXYS0hZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_add_service_domain':
>> drivers/soc/qcom/qcom_pd_mapper.c:78:27: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      78 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:78:25: warning: assignment to 'struct qcom_pdm_service *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      78 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^
   drivers/soc/qcom/qcom_pd_mapper.c:88:16: warning: assignment to 'struct qcom_pdm_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      88 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^
>> drivers/soc/qcom/qcom_pd_mapper.c:92:25: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      92 |                         kfree(service);
         |                         ^~~~~
         |                         kvfree
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_get_domain_list':
   drivers/soc/qcom/qcom_pd_mapper.c:150:52: warning: initialization of 'struct servreg_get_domain_list_resp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     150 |         struct servreg_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |                                                    ^~~~~~~
   cc1: some warnings being treated as errors


vim +/kzalloc +78 drivers/soc/qcom/qcom_pd_mapper.c

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
    88		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
    89		if (!domain) {
    90			if (list_empty(&service->domains)) {
    91				list_del(&service->list);
  > 92				kfree(service);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
