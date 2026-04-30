Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E539C01B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532943; cv=none; b=Be3ea8GdUSoZyN6hruQ5EyUjHx6dmQ91EebF8ypIZvOMmLyWQHm+LRdCmyf9rjFGr2bE+1jWuUPrVFMoxpQgSnytsG9+P3NU7uWdfEKEjbfxrPM9hMJB4XT9w2PTLmFWn7XL0670JPCO/ERtNIaY55SgiBgxkrlqlm6BqX7pWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532943; c=relaxed/simple;
	bh=O07nwx0CCbxeIhHCLA8Eqr+YrmbLjb4FYz0EfIL1jM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UOcx4j4iTHET7flZ2gRdZk88GJZm1Ae9q1YKgSzcCw+5ZBIEZVzR3VJ8J7xDUwioCw+GOxN2IAwc1qpvdHefmKYQDqO246DB+cVmh3z0zdPgeburY7zxBYJheqxTNvWpUmNZF94l2mU59Ykez2YGPurIjhPOzKO04bKAECpdMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPvLOzqB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPvLOzqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777532941; x=1809068941;
  h=date:from:to:cc:subject:message-id;
  bh=O07nwx0CCbxeIhHCLA8Eqr+YrmbLjb4FYz0EfIL1jM8=;
  b=EPvLOzqB0D+xRonmhPgZT/6X4EeJipg9ew1p1PFLrDr8uE1ob9rwYuS3
   lkWTo2MMnih3Oa4n0dRxK/irbZtmEFRFDl3JMNsGUpip2QhI9RbVvKvU5
   O+PQsHYte4VtfWVfsXbDYoei/fbgz0skbDCesVe2jaIvU0SUUJg3vDsNK
   dA1zsR0Oaor/FZDXTC3xH6RXEYQhoVQ1IixcwkxXwcVlsgZPG5eIKQr9L
   v8VhiXXtcsCDFuAAVMrbmiUsYPvt13QG981KfmKV5bVy/7sbyVlDolML4
   LQv3iCb5ydH49D6Kezz8NFUDNw8rE87B6vjGSoI7RQCAfd6e6qbHwUabR
   Q==;
X-CSE-ConnectionGUID: EEA/vgiTR2GGbpWpqz4kNw==
X-CSE-MsgGUID: KfWXOKpbQTysV9MOPwJl0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82330954"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82330954"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 00:09:00 -0700
X-CSE-ConnectionGUID: 3DZh0Q+gR7ije+E4lIi2Kg==
X-CSE-MsgGUID: c/akGJ1YT4aeqj1abBGd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229897830"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2026 00:08:58 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wILW4-00000000C5c-0CXE;
	Thu, 30 Apr 2026 07:08:56 +0000
Date: Thu, 30 Apr 2026 15:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Kuo <rkuo@quicinc.com>
Subject: [bcain:bcain/glink 12/56]
 arch/hexagon/kernel/irq_cpu.c:17:1: sparse: sparse: symbol
 '__pcpu_scope_ie_cached' was not declared. Should it be static?
Message-ID: <202604301511.3N5B6ccf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: 4dc36a691cfa14a11aced4bedaaf9b35283aa781 [12/56] hexagon: update IRQ and trap handling
config: hexagon-randconfig-r121-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301511.3N5B6ccf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301511.3N5B6ccf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301511.3N5B6ccf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/irq_cpu.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/irq_cpu.c:17:1: sparse: sparse: symbol '__pcpu_scope_ie_cached' was not declared. Should it be static?

vim +/__pcpu_scope_ie_cached +17 arch/hexagon/kernel/irq_cpu.c

    16	
  > 17	DEFINE_PER_CPU(long, ie_cached);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
