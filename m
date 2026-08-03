Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083403A453F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787134; cv=none; b=E5qB/ncJYlTSIoIRBOt7lyd0ibh+DlPjxOCRmmDoIhukL/GketNoRF/Fojtjbqfa21dRp0IcMF9zbTuPwRBveOSJseeWKVr+lGnvjLPf7sDfuSbM57VoLqwTeYQMQKNugxFJApS0+MYWY6EUV0iLJbKEu2Zh1zufLx4dtaRGusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787134; c=relaxed/simple;
	bh=EDIid9sh/Gk94ENRccyhjaWjLZOfMYwXckyUQhkjXqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/Yo1IK2tr2PBa16qsqWKG53DiwKIfMNcjp+/f2NeJhJnDHYhnOSalg6XDJL1Pvq4zJX1lP80CkNWS3U7F1jnpgO+T0oiRLW8JP56YJDlGZb3r2NH7rrY8mNb21vy3DF6euf8D7cM8FsfwxJtdeW78kOmh55nQ4h3EzvhbuY0T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/DZx16T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/DZx16T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785787133; x=1817323133;
  h=date:from:to:cc:subject:message-id;
  bh=EDIid9sh/Gk94ENRccyhjaWjLZOfMYwXckyUQhkjXqw=;
  b=m/DZx16Tv31lCqvX3865SztufFvKLEnITEZ6q7hIPasfAVdr+KmLzciK
   z+j9KJNEpEYBAL2H5Q478jVUnPiF4kJr+aSO2kIdAMgqb+z+fB2Vjes25
   RdSqWr/6l2H7VdqigCpJdBNgFdsyBPYgJH/RpnyqYsXQ10E1RmD14EXeE
   bItwTzveetNLc1DCToaNdKYIovAHdLqO/wuRkdUlSaMCTRvJqJ12rlDyi
   wLJqvgHD+yGxuK+v5fphc2gRkiKbNtjS4Cj8NB1MR2Z/zRbW5CY5wXCvx
   U8sz/KOCDgAWwhAV0TZooeRE81Eb/WbE/fhnEDNeQBMesx176uc0G7ouP
   g==;
X-CSE-ConnectionGUID: al4K2V5EQvW67e9u2JbIEA==
X-CSE-MsgGUID: Regu30fHSl6SXYCkkSFUBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111888544"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="111888544"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:58:52 -0700
X-CSE-ConnectionGUID: 4768zNuoQ+CAF9jgw0x1ow==
X-CSE-MsgGUID: PYcLcDPeQVS8ne8JHdkd8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="299531639"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2026 12:58:51 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqyoC-0000000040O-34De;
	Mon, 03 Aug 2026 19:58:48 +0000
Date: Mon, 03 Aug 2026 21:58:10 +0200
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 11606/12137]
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dtb: /i2c@fe5b0000/imu@68:
 failed to match any schema with compatible: ['invensense,icm42607p']
Message-ID: <202608032147.AcElFYvh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
commit: 264429dfe5294b76c7c3b4ed2c9e6cea1042255c [11606/12137] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
config: arm64-randconfig-2054-20260802 (https://download.01.org/0day-ci/archive/20260803/202608032147.AcElFYvh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608032147.AcElFYvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608032147.AcElFYvh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dtb: /i2c@fe5b0000/imu@68: failed to match any schema with compatible: ['invensense,icm42607p']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
