Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648F3EDAB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948564; cv=none; b=u0bQyizwLg4e17oHEgoGg/ayJapN0Pjq3xkom7cyfQpYcczOfehwD2N/3hbW9ob6shy89ibYkxzwMER+62k8pmFsPlfPX/eB5Wo2kD9pdj7xkqqi+VysPfL1lXE4mcEQZKJEymODERBTsiUC/VbG/Gy9uBApMfET0tVQI5CMFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948564; c=relaxed/simple;
	bh=KkSgXN4ToRZCJikechmmBesmdu8C30aRVyeJLp1Ftpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qW+DozDgUlfGyWyIObMRIhD7Lb3rEVlqlCsgLfHoyGDbOYfmBgIC5MkNnhi/vtr32hU1bBYvebczXGWl5YSHv151y5Hy6bOpdFP/iDllh+zDvtSYGPTxYyvRXsHALoemqFroV8HZDDPTCnCLyUPW9dwHE1ppocGVo/VI+/8mtxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLCD1dbU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLCD1dbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768948562; x=1800484562;
  h=date:from:to:cc:subject:message-id;
  bh=KkSgXN4ToRZCJikechmmBesmdu8C30aRVyeJLp1Ftpc=;
  b=QLCD1dbUPKk5eI9sMqaY+rv9Te9JYqCJxNXeldR+tMTRX/08+Lbl88KL
   rOjwj0t6z5i25o9Sg9YCxhva5y9cYHSj6w9EkjvbQj0Geray67n0PHr1O
   JykeCoNSHD45W3Zocwm84JVhOKWP6Ny9v4puSa4FbnmxozQTFCIjptCfA
   JBB1H9TwF2QXvA9nqZKDZXf0420kH42/mYkap1hr+qOJ1N2xMJuYkZmTM
   QtebjiaLlXZL5fRO1goNZr+cuN4uESGpFlvwLSkdll+HQBuBbb1M179FV
   KgCMZHK7dF5RVWGp2XqwHN1QsjKluw7511DDdJ7Nh7g3lFPOvsJrjKvjc
   A==;
X-CSE-ConnectionGUID: y5T3oKghTeu7t0R3r1qi+g==
X-CSE-MsgGUID: dFYWWrVnSX+sMaiZDtahPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87748852"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="87748852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 14:35:59 -0800
X-CSE-ConnectionGUID: CzeomvjYTPyxWrXV3YwD/Q==
X-CSE-MsgGUID: Uyf+SJIRSBOYOeyVRRIoTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="211266010"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2026 14:35:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viKKJ-00000000Pdd-3Caj;
	Tue, 20 Jan 2026 22:35:55 +0000
Date: Wed, 21 Jan 2026 06:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 0/1]
 drivers/staging/android/debug_kinfo.c:164:34: warning: unused variable
 'debug_kinfo_of_match'
Message-ID: <202601210615.8TF02Ad4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   25161a557b2071d0e66ebe098bbc46d2b860ed55
commit: e7be908f88dbde1df94db83d6c7a23b117de0f36 [0/1] ANDROID: staging: add debug-kinfo driver
config: x86_64-randconfig-104-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210615.8TF02Ad4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210615.8TF02Ad4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210615.8TF02Ad4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/staging/android/debug_kinfo.c:164:34: warning: unused variable 'debug_kinfo_of_match' [-Wunused-const-variable]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
