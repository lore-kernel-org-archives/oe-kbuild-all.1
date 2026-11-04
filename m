Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831403;
	b=oBnb413guEtyUsK9285RmWNOL2chYEZuZU8tnGPK14JOh9YozudbzFm9TtxzcI/HK4iW
	 FlLwuh1WjklIznOFqLo7/F5oXnfPd6ezY6WcWQc2Gt73YB8/o3lDg/4a2B+UQ3H5TD+pi
	 fmAJsDGdNB32EnYDtg+3SYO6NgRa94A5xe+OueAK2E517WI3IlbcVmSErCFYuVfd/QpJ2
	 gDiztWpdFItT0qBy543nl7UyjbQq6KWHwswdk7OkZL8NqVAllTYb2bYgSwkS6yICHNGDQ
	 5RoE8RXxb7Jn1uC02qhGRu4CW2lawe8P0NzM7DCKb6qeg1b98LcNlsm4IMWuheEhT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JZxM1FXcUKSCjJHm8wzqXh29Cw3oF/aV0CgKHYMQiN4=;
	b=0dHsMJKL1g6Nj8TITv4IHlEzHsSmx6MKvwuKoRZkmDBjagzX18AN0yVQ0y/my+cbTG+2
	 aHVjog9KYxMspzyoSZr6HNxRhuMnjH63w5tEFc/UJJeAQ3tqWdAB74jbaTA4sd85ENp2L
	 7bt8kmbDFFusPfLq/BGEvh5enz9WVLyYQejSIma4eAX876TFY/x+MVbhoIHnCJUxNqzuI
	 LbSWKKDWNQSYbeGGB4Ig5iwgVFbArkz+0vxiTS+hcEXEa80AY6lzII2Gd2/pc/KwW85H8
	 B1HUhl5O/1H97hfLz5/dYYICiGn2iNOLbYV5ssd2+S2xE707T2TZoDKSg5CmMmJlpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyFobMCu;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0556606AB1E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 22:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0556606AB1E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyFobMCu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793831402; x=1825367402;
  h=date:from:to:cc:subject:message-id;
  bh=HGNjv9LNtwHAJ6fg2kA2v9DRwwllbktOhf+BPzC2QKw=;
  b=EyFobMCulij+yTba+QV8xZ5Mvb57P6Vslt1up1IA8pWtJDyMPUfzgjFe
   PobV4iHMIXcBbTmrSMCvuSTnrZd+8GC/vR5yV72MHDm98ZyTrfxIZ3m8Q
   zthoxH8UJoJ9rpM7NoKinVu5bSn/YA/NXYJpMizqkpDfxXt5NVhMcM+td
   xX0KNRAV4Kf5xtyP7TXDMGdTyUyZplCg8DqWhBBfh2bEKoOjty5pw1C/2
   lVByi4DY6XxKB2SNvY3+TqiNmUcMDfktzWL+tlK2Z7s83THwaX3P/QxBZ
   0drCvH+jhX4MQC6PhHfS6YF1/CnXoQBxI0bIv8kZqmSqpnZYJ6nDZAya4
   Q==;
X-CSE-ConnectionGUID: DxAv1YZtSAmhRMfq23D0gg==
X-CSE-MsgGUID: 7Een2QCJTCGsIQRwWbUpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2599531"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2599531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:30:01 -0800
X-CSE-ConnectionGUID: u15jB+NSSSe2S/wdo28Z2w==
X-CSE-MsgGUID: xz2Kb1bmSGKwS4EM4Qov3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7236581"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2026 14:30:00 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOjUU-000000009Hn-0taa;
	Wed, 04 Nov 2026 22:29:58 +0000
Date: Wed, 04 Nov 2026 23:29:19 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202611042322.6V0eAmew-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   22bd9e8ce82a136999e6209dc0601c995d978feb
commit: 398bbc0409f7586f909b17195dc4a1268d855277 [1/1] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm64-randconfig-r2306-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042322.6V0eAmew-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611042322.6V0eAmew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611042322.6V0eAmew-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem-legacy.c: note: in included file:
>> drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long

vim +19 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
