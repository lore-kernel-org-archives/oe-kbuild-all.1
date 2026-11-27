Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821777;
	b=RS2/1aLKmIGUUvff6yfkoFOI+q+v97+j8GNChnlYEAT/xlujSifmCCRNtitfquFfaSr6
	 uA0A27hIoZPUJRLk1OTpTrOAd4nlNbehiQGwRRVGiZZeiV8tVg1KLn3c1ZM06tXtVlF3A
	 U2T2iAJcl4EUrxR2ysYi/6ERfQ0crXrr860dkGv+uC961hQQrLKiZGf9Dm+LnbCEO6BkJ
	 8/tiEE0GHXCSnNthEbu5wPCcxUWNrxAwdGod6PoUW0S3y7ax6hjd1KSAgdfPY7wB7sV25
	 skQqo5hC4D2UpEj1S3rExLh3rhAvY4pxE3Xp45+OUP1QfjAK9lrP5HjCndADhZP8ipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821777;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bYG5Uz1ZRB5aNOJG8EZQd5Pk+4Aeokkk5enihZOvm5M=;
	b=LvdFQSlolxX/0Ecb7mdAZS8Li/HwM42Sch7JWzcvVmGudVkTavNn+2ZXpSm9Ik2PQs3O
	 aB/TtPXsOCAekdkUTJcCBlWFz5qb8cSQesKtC/s3I9YGUS8eF1d23ot9vMTXgVfVyPIrS
	 Jpd79oYlkAcbjatCwFiJVsss4xBKeh4PMm6r9aR/CU3tuUXBWEY4WJp2t7w4Aqz70KAwV
	 O2A/D3pESfxgAz+GlhFFMmMehuKIyEXrfl9KBNtTsu6+fO8TIEw6Mn0txC5B7xQt4BQ8e
	 8R/96Ex+UlVIH4Y47xli9bFGwuRPV0jljslHQC65d6gqGuN4SnVMKi1w4At6c+AV+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="LUK7/FJ2";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46379606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 23:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46379606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUK7/FJ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795821776; x=1827357776;
  h=date:from:to:cc:subject:message-id;
  bh=TcUbWS5oU5qTs2mST6Z9zKWFh2GZLhzKwpnUOTEPg1I=;
  b=LUK7/FJ2qVfoG/5jL542l1nD0nuX7+ei0lon7p8X+nm325iulisaWNvd
   R5F41Q4J41NeEBIz0YAHCe/t3wRQyZQmuSBSNkFyLLzeWAUh4wrJZrvJR
   LeBnd66YCDruNs4j6cHG6+Mkggl1d55HNgEIER92xs/XAN7Ruw37iGcmW
   g/ZXvLjD4rbiv+VMkluBzgITY8aMtGDiVh/0dt6iuumuxxP6Hd4lSDO66
   Kn8NXfmm91OQVD6ZOCtR8drmDc/yEy/D62xfPovrP8MfwgU5QtcW3DtYT
   TZm8t/UnBCwDrGfPd8gTUjc/Ec3SKxiKNhdb8+NOQdTUN2R56ihjdJWIn
   w==;
X-CSE-ConnectionGUID: D281bxogTdSC0NDh9kvVTg==
X-CSE-MsgGUID: WjtUqBZ2TeODIYKc/1npHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4696965"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4696965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 15:22:55 -0800
X-CSE-ConnectionGUID: PA8GYO3tR/6N7NT77MyS2Q==
X-CSE-MsgGUID: 1Ikx+Il2T8ScaMyMjdTILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12802357"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 15:22:54 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX5HI-000000000Oq-1u8Q;
	Fri, 27 Nov 2026 23:22:52 +0000
Date: Sat, 28 Nov 2026 00:22:11 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 7/50] error[E0433]: cannot find
 module or crate `std` in this scope
Message-ID: <20261128001356.LkyvrYDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: cf701c5eec7a0ee9e9f6b28a60be6dfb2d6d9b16 [7/50] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-randconfig-2103-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128001356.LkyvrYDA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128001356.LkyvrYDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128001356.LkyvrYDA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: cannot find module or crate `std` in this scope
   --> rust/doctests_kernel_generated.rs:1037:11
   |
   1037 | let iter: std::vec::Drain<'_, _> = v.drain(..);
   |           ^^^ use of unresolved module or unlinked crate `std`
   |
   = help: you might be missing a crate named `std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
