Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC013CB2FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710440; cv=none; b=IZa5BbeMG6it2r8eGgRO+iTWHUgrP+iPHx6NzJiftCimGuLKElNACdYGBtrrZaLrWv3Ae42h5w8gUifzzvgy/VqqHDcq2lXqNqI4jYzWOJNVqpWVyEMVZF96YfBMZmwsJ6K4kUB6QbkTZ/o2SxCYgMz47mZSQmjizdQ4dCVoh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710440; c=relaxed/simple;
	bh=Pqo5cbConrbJdj6+m9EoI5YIhrFi8ixtcF7TJLbWotM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uI87e5z9bg61Z3cvCwXbterktBS59dBiDcC0wGjCvhDYLE4XsH7T6nq/Uh3gs7EHr3W+mmyopo667warzj9dfSeNL1eGpbSZVR7jZT5MXqzjgW4zJAkWa1c6MJ5IZ/px1FpkgaknLbaSZicLvTaHdOXQo5dHOpYRXD/9YW0g1EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dxkgq6Ge; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dxkgq6Ge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778710421; x=1810246421;
  h=date:from:to:cc:subject:message-id;
  bh=Pqo5cbConrbJdj6+m9EoI5YIhrFi8ixtcF7TJLbWotM=;
  b=Dxkgq6Ged5o2I0Si1FUn1TJuDkwOTpSyNJw4sLO3mIgk++PMk4UtCVBQ
   WTL540ROG+WMqkG0wdNMhXFgjdVP/W8pMEW3/8yWv6mAsCJBTZjAarRtT
   91eurDW8BB7HMwIvBpM5gSGzpQhiQe9Ce+LtczAIArKexEjVPMKndVQ74
   c2wc4krIWdEgZk/9otpTA/HJn52/W2Pk+mbFe7JqurLN79lwELcEYEcxk
   G6HdW812R/lMeD4EKtaG/MIs1GIbgSCLYKQIppNUY6ThGkvpJHtxII0s/
   1i3O510tulQrB6F9lDaTC+s3Nhmt/za7lJlDyQ4kuLtD+YlixKStORSzb
   w==;
X-CSE-ConnectionGUID: bf3RgGXKSeuUOnBdTC5ixg==
X-CSE-MsgGUID: h5GQBJ4JSz2Rx/JWxKrCJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105106387"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105106387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 15:13:38 -0700
X-CSE-ConnectionGUID: Q8OMQa8QQ5iRlnRvn+Wk+w==
X-CSE-MsgGUID: GwCZ/wY3QF2YWu4/lKaFKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233938130"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 15:13:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNHpe-000000005DL-2Daa;
	Wed, 13 May 2026 22:13:34 +0000
Date: Thu, 14 May 2026 06:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202605140656.cUCHniuw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: 37b561d55936d0fcebd199d22180e595bb72b784 [2/2] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: arm-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140656.cUCHniuw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140656.cUCHniuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140656.cUCHniuw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
>> arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got restricted __be32 [usertype] * @@
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     got restricted __be32 [usertype] *
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast to restricted __be32

vim +62 arch/arm/kernel/machine_kexec.c

b23065313297e75 Per Fransson       2010-12-03  27  
c587e4a6a4d808f Richard Purdie     2007-02-06  28  /*
c587e4a6a4d808f Richard Purdie     2007-02-06  29   * Provide a dummy crash_notes definition while crash dump arrives to arm.
c587e4a6a4d808f Richard Purdie     2007-02-06  30   * This prevents breakage of crash_notes attribute in kernel/ksysfs.c.
c587e4a6a4d808f Richard Purdie     2007-02-06  31   */
c587e4a6a4d808f Richard Purdie     2007-02-06  32  
c587e4a6a4d808f Richard Purdie     2007-02-06  33  int machine_kexec_prepare(struct kimage *image)
c587e4a6a4d808f Richard Purdie     2007-02-06  34  {
4cabd1d9625c7d8 Matthew Leach      2012-09-21  35  	struct kexec_segment *current_segment;
4cabd1d9625c7d8 Matthew Leach      2012-09-21  36  	__be32 header;
4cabd1d9625c7d8 Matthew Leach      2012-09-21  37  	int i, err;
4cabd1d9625c7d8 Matthew Leach      2012-09-21  38  
0d70262a2d60886 Russell King       2017-07-19  39  	image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
0d70262a2d60886 Russell King       2017-07-19  40  				     + KEXEC_ARM_ATAGS_OFFSET;
0d70262a2d60886 Russell King       2017-07-19  41  
2103f6cba61a8b8 Stephen Warren     2013-08-02  42  	/*
2103f6cba61a8b8 Stephen Warren     2013-08-02  43  	 * Validate that if the current HW supports SMP, then the SW supports
2103f6cba61a8b8 Stephen Warren     2013-08-02  44  	 * and implements CPU hotplug for the current HW. If not, we won't be
2103f6cba61a8b8 Stephen Warren     2013-08-02  45  	 * able to kexec reliably, so fail the prepare operation.
2103f6cba61a8b8 Stephen Warren     2013-08-02  46  	 */
fee3fd4fd2ad136 Geert Uytterhoeven 2015-04-01  47  	if (num_possible_cpus() > 1 && platform_can_secondary_boot() &&
fee3fd4fd2ad136 Geert Uytterhoeven 2015-04-01  48  	    !platform_can_cpu_hotplug())
2103f6cba61a8b8 Stephen Warren     2013-08-02  49  		return -EINVAL;
2103f6cba61a8b8 Stephen Warren     2013-08-02  50  
4cabd1d9625c7d8 Matthew Leach      2012-09-21  51  	/*
4cabd1d9625c7d8 Matthew Leach      2012-09-21  52  	 * No segment at default ATAGs address. try to locate
4cabd1d9625c7d8 Matthew Leach      2012-09-21  53  	 * a dtb using magic.
4cabd1d9625c7d8 Matthew Leach      2012-09-21  54  	 */
4cabd1d9625c7d8 Matthew Leach      2012-09-21  55  	for (i = 0; i < image->nr_segments; i++) {
4cabd1d9625c7d8 Matthew Leach      2012-09-21  56  		current_segment = &image->segment[i];
4cabd1d9625c7d8 Matthew Leach      2012-09-21  57  
0719392a61a9dbc Russell King       2016-08-02  58  		if (!memblock_is_region_memory(idmap_to_phys(current_segment->mem),
2456f44dd7a9aaf Aaro Koskinen      2012-10-16  59  					       current_segment->memsz))
c564df4db85aac8 Matthew Leach      2012-09-21  60  			return -EINVAL;
c564df4db85aac8 Matthew Leach      2012-09-21  61  
4cabd1d9625c7d8 Matthew Leach      2012-09-21 @62  		err = get_user(header, (__be32*)current_segment->buf);
4cabd1d9625c7d8 Matthew Leach      2012-09-21  63  		if (err)
4cabd1d9625c7d8 Matthew Leach      2012-09-21  64  			return err;
4cabd1d9625c7d8 Matthew Leach      2012-09-21  65  
0d70262a2d60886 Russell King       2017-07-19  66  		if (header == cpu_to_be32(OF_DT_HEADER))
0d70262a2d60886 Russell King       2017-07-19  67  			image->arch.kernel_r2 = current_segment->mem;
4cabd1d9625c7d8 Matthew Leach      2012-09-21  68  	}
c587e4a6a4d808f Richard Purdie     2007-02-06  69  	return 0;
c587e4a6a4d808f Richard Purdie     2007-02-06  70  }
c587e4a6a4d808f Richard Purdie     2007-02-06  71  

:::::: The code at line 62 was first introduced by commit
:::::: 4cabd1d9625c7d88acd143f4021fbef75394f154 ARM: 7539/1: kexec: scan for dtb magic in segments

:::::: TO: Matthew Leach <matthew.leach@arm.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
