Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964412C484
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485215; cv=none; b=Q+IsvUHl4ZnXE0T1r58IY25kVa/IApcNdQCBQflLW4HSkjiohYDA8whN5+YNE2MvYsIQwVwUTpFpA1iwj59JJ7ePJNsUktctRmXTcTiryhgpqlFFOr+t5hJ2u/p8LSp4pJ8xRkp78U8AMc2rDRJmhfLvMTgw9uAJ1mRe/SiQ28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485215; c=relaxed/simple;
	bh=RiD8dQndNq3AY4jZhXsMUmn3M4vrkMFI5Jofxnpr4WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC5GZ0h+Izy2vQIOYdy6ik9QCiNtdzovHGord00nCVAYq4oyChyN0O/LSkgYE/f30uu/x0lGK1+HfJho7jx/UBSut3T3N6EvoEU115U0cEfqhYDT4Db9H8i8b8zW/hQbUXiV3y/zchM+Y+DZpAriGjDeYsCYJX0sRK14EiYeohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RY7LbcUD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RY7LbcUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731485214; x=1763021214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiD8dQndNq3AY4jZhXsMUmn3M4vrkMFI5Jofxnpr4WU=;
  b=RY7LbcUDPW8eJfQO0pF1JmWHPNu4VH8BKVOCLVgOm+ztc0ezyw3lZ1J7
   TFDtu0us1Xcs08NTsTctB4mZ5KL69t08AR2oAALRSj7rzkwLp9AIJ4EXl
   XE0XHEhwq1Kok1wNJl0w/DvoBAn155UY/OYL0hhTFys9qKc3ZBlJxS6Hb
   XICeusxmrTEdY+ATWsqiYvUXnUm5PrP8Z50mvzm8y2GB4/yeNb8WMvAJS
   xW3nYc904jdlhBAaeRuBH3S+FXVQHjVMA+dyhTm2CODskSB8Fuoqi4STd
   ExuTpWqnb5i9I5knjvHUwG8b9Kfd1TO1FoawjEt4EC9FgO98EWcdYEsbD
   A==;
X-CSE-ConnectionGUID: UiMzyUGKToSNcoKGvMn2YA==
X-CSE-MsgGUID: D/9rUoJXRoSk9bgyDCNyfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34236924"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="34236924"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:06:52 -0800
X-CSE-ConnectionGUID: vuhniYsJRoKDdYjnyp1JEw==
X-CSE-MsgGUID: sexT/PNFQsiPzlFMheG5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="91838873"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 00:06:38 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB8OZ-00007t-1z;
	Wed, 13 Nov 2024 08:06:35 +0000
Date: Wed, 13 Nov 2024 16:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1459/1459] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202411131622.7s9aYTiW-lkp@intel.com>
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
head:   15bd887bf6e95b9bf10a564c75e14dee327ed0bc
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1459/1459] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-003-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131622.7s9aYTiW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131622.7s9aYTiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131622.7s9aYTiW-lkp@intel.com/

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
