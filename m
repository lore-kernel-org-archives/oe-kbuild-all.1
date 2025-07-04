Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4E2F0022
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618733; cv=none; b=d3P2s+kvMYP6t6cdCzUTivG0ePmKgMcLpMDOEOSekHZY6TIoRB17Qa2wGs91oKJ2yUuyYAAyX0YZhQqj8eFNJhspx8oqasktoV8E3AcVS4tq7r0cgVAzoJnPCI6uO8DDZWnaKGXNKtXL4JnCxTV3kwnE8z4n4whMHxl26E5APSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618733; c=relaxed/simple;
	bh=ih7pinJCqMGSRW9l7/aev6EiCpoY5jX+w8hTQvrs4T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkKOTY/dPkMSGTe35UZBZU2ycLzBPU0OE8fGofjLKe0J7sbt4QZdxElDX0DdWWA+GP477hCiEopPhVGrpoU4rFN7Mj/95x/Dp6gAQtVyprQlb6IjYSEMfsheqmClj4odeaXwA9QsSad88odOYDyYnh7zDlVRdAZr4NNzcFQAYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DClIsoMR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DClIsoMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751618730; x=1783154730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ih7pinJCqMGSRW9l7/aev6EiCpoY5jX+w8hTQvrs4T4=;
  b=DClIsoMR4cq+rU6ap0NVOzAmVxDCwnx//0OVpSQCBxFLmBZisBKhIuTr
   /555chdBjYsYwmQ9W6X6cjrj+jJ7oL9/gxWafayeblqQ4qnOQf8XIROD2
   K8Lan5vc3l2dWKYW20tNuI1K4rR9RbS3UseS1m4+7RXbDdZcSxg+oDIA/
   qhc5y82begzijfJfPoLA3cvHU6EHPBUHhHFFFsyONGBiFj0wWYIbo78Oq
   IRWKuek4x8vYTD3r1Gc3tDfN7mT8gSHuFPnOdKwGPv7MCiJsnMC/Z846U
   XGm4bcuFLECOrB9QP+3RVLOEG5sWuUWjJX8TpHovJq34B3gtFvjVFByp7
   Q==;
X-CSE-ConnectionGUID: OwMRMW3hSqG3l1Dl0tOYTA==
X-CSE-MsgGUID: mug/vnLJQrOW/3cACKJG6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53673535"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53673535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:45:30 -0700
X-CSE-ConnectionGUID: OSQLJg2oR3WBvAZY29U4nA==
X-CSE-MsgGUID: 2BSyGrJxRbOcwhceWN9yeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158625086"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2025 01:45:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXc2w-0003Vf-0R;
	Fri, 04 Jul 2025 08:45:26 +0000
Date: Fri, 4 Jul 2025 16:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2459/2459] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202507041600.4d0iiWmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   673b27ee13cb811b3f418669e6826b95459c32f4
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [2459/2459] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041600.4d0iiWmN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041600.4d0iiWmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041600.4d0iiWmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
