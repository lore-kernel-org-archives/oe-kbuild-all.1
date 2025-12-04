Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A82D5936
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764825113; cv=none; b=MsH32Xanp2SxAu7zwwjX/hzyb0V61HTSeaSmgbY4Wu5zfSMnSFXavo6UAee00frXP2cy8XGNvzq0AW05yU2RpGp+iWRQIVHBZwyvJjUt0Hei1Dz3Fh0CO/uy8QUvlN6yXKr5XwsiFqqhh8cEqKrE9v4UWH570zKARj/ujZldjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764825113; c=relaxed/simple;
	bh=+5LCpyYTUF5MTkNWolD+1i7lQv19DS4MdO6ALpA45e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KL+r3fnbnpMGPbhjioL+TUooP/FfOOt61ps2o+h7xKnNYWG7kWgEOhDxrkWTtTmFx6tO0sDkOnLDoxsnc8woIGJe8lBBFj7qlAI7MYKT1rSvbQXZ/JpRj+aMu8AbAf7nr6GpAJuOUSdc6heF/vQ2zelOOmUhKTdPHg5tJ7RFpQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlF4s/yB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlF4s/yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764825111; x=1796361111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5LCpyYTUF5MTkNWolD+1i7lQv19DS4MdO6ALpA45e8=;
  b=jlF4s/yBhrE+wEclTu249NKhJTCKSzup+0MrQ0PitT3H7LBefOQ3ktTO
   +SuTFppvLPBje/ih0TQ5TuxgWb6fMscjOEZDzoonvJgwXyDfdfRFCHfii
   tk/2tax4q+ODi/zR5HwXzXAJtCrMrxCX6b4x43tGvJ4XJN0fK+l8Wwxf4
   MfQdqmueNlGQOpc2kyc3kUXRRhXABdztGQK7E6SsZXrgHR8PKw4DLEPl9
   bIiWf4iW06xtSgWL3kEgomoizXRrhGFiuqDb4Tb9eCK6Z9T7v8kEO4XT3
   XJKt+VkoIk7YuqEWTJKWEv8EW+WNfCQUkQN6YRXbvIJ2xxN60u6YeIj2U
   A==;
X-CSE-ConnectionGUID: GyPCN79EQyakOcC5z/iVeQ==
X-CSE-MsgGUID: NCR00kIaRjy1LZ9R/Uw/ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77517408"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77517408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:11:51 -0800
X-CSE-ConnectionGUID: glL04P53SyC1tfvjjzxTiw==
X-CSE-MsgGUID: P+5ecQlmTz22KK5NXawtEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199058974"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Dec 2025 21:11:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR1d5-00000000DT3-2Dhy;
	Thu, 04 Dec 2025 05:11:47 +0000
Date: Thu, 4 Dec 2025 13:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/2] WARNING: modpost: EXPORT symbol
 "tcp_syn_ack_timeout" [vmlinux] version generation failed, symbol will not
 be versioned.
Message-ID: <202512041342.VJReQUwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ef2f661f7812939553f0ae21dbc880750b09a1c8
commit: ef98638eeeb04f0b360a4319803827112a0af6c3 [1/2] ANDROID: GKI: net: add vendor hook for TCP parameter adjustment
config: x86_64-randconfig-003-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041342.VJReQUwB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041342.VJReQUwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041342.VJReQUwB-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol will not be versioned.
Is "cpufreq_frequency_table_verify" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "tcp_syn_ack_timeout" [vmlinux] version generation failed, symbol will not be versioned.
Is "tcp_syn_ack_timeout" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "tcp_syn_ack_timeout" [net/ipv6/ipv6.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
