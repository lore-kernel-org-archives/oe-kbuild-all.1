Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F4286280
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740091546; cv=none; b=MuWE4mHy4N4Z25ePy5ChqIdOzqeSfVzkN4pZM/NKfk4E61tk6hlGOwTwb7ZT7uGIQPUJiO7ulNnvhkA7Fzls0ayifBiQs89fOxxXdEuT88TDa+15A1OEeQpJi62HH/2I6P9gv5/4loQsIHHWF9mHWCojt7r+Bq0Dh1Q07VUlb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740091546; c=relaxed/simple;
	bh=SemKyAAiODfMQVcvqwLewBKnhF0svz1EYYII06VzdHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2o+9Zjw5W1rzt1YG6T3PzCSUNYzrJtT0WCeWZyR7zMuqRb+x8EVtNc05+fm+w8GexcfRyFBJ7hF2SDE0Mb3CbCkUDLXcgDBPGrZOUrsfc6JugJ6G/dDb3yAOU+LV+y6VIVky95HT8PWYnx+v3WMDhXHhBDuoTnQX5MEefFuU2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYoLvRtR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYoLvRtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740091545; x=1771627545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SemKyAAiODfMQVcvqwLewBKnhF0svz1EYYII06VzdHo=;
  b=bYoLvRtReEQJWcuL/bMd7enXBOAJBoUQ1AaDZMeY08NoELRwXERDNpYb
   +U3Vzea48I/fonPMuS+29nlp5HW1ImlJNQUmKP3swnXB1PmBXFS44FP4X
   dLH4Xp0hOERIkC/eXhNBFOODLnumCHrLzmzwbe5aooBrRVq/v/fSk6RwU
   Jz6Jgfgdix4z2V7yaSdNqi2KiWog0BdVrVTkdlqIjy/ayCcdtaQXOe9iy
   396BHUK8nhv3kpO2IRCytOsVcaSdcuakTWYuhekd/npK0I1zQx2cSDbaq
   VXzM8zPEk3V2uIghr35syduZBoo2ExQ/Ti/v6A825MufyOZ6Lb1FzJYOQ
   Q==;
X-CSE-ConnectionGUID: jZ49IiifQj68xTCnbM9oJw==
X-CSE-MsgGUID: lFcDUgXfQz2I/YsjkxFEUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58304524"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="58304524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 14:45:33 -0800
X-CSE-ConnectionGUID: FfoDIsdYQMiqKc9GOF80Mw==
X-CSE-MsgGUID: tqxp0pBYQRm8mB3kNoE+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115390315"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 14:45:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlFIF-0004pf-2w;
	Thu, 20 Feb 2025 22:45:29 +0000
Date: Fri, 21 Feb 2025 06:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 5/32]
 include/linux/device.h:381:16: error: implicit declaration of function
 'IOMEM_ERR_PTR'
Message-ID: <202502210658.mLwakFLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   820252db26434126c85a78027a1bcbe9c0903204
commit: cd29796e495160c05a672f3098dffe0fb6ae9daf [5/32] driver core: device.h: fix incorrect type in return expression
config: s390-randconfig-002-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210658.mLwakFLV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210658.mLwakFLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210658.mLwakFLV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:94,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:14:
   include/linux/device.h: In function 'devm_ioremap_resource':
>> include/linux/device.h:381:16: error: implicit declaration of function 'IOMEM_ERR_PTR' [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~
>> include/linux/device.h:381:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_ioremap_resource_wc':
   include/linux/device.h:388:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_of_iomap':
   include/linux/device.h:396:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/sched/build_policy.c:33:
   include/linux/device.h: In function 'devm_ioremap_resource':
>> include/linux/device.h:381:16: error: implicit declaration of function 'IOMEM_ERR_PTR' [-Wimplicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~
>> include/linux/device.h:381:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_ioremap_resource_wc':
   include/linux/device.h:388:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_of_iomap':
   include/linux/device.h:396:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/IOMEM_ERR_PTR +381 include/linux/device.h

   376	
   377	static inline
   378	void __iomem *devm_ioremap_resource(struct device *dev,
   379					    const struct resource *res)
   380	{
 > 381		return IOMEM_ERR_PTR(-EINVAL);
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
