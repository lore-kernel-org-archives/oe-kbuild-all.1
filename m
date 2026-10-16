Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FF2EEE69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 01:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112918; cv=none; b=MLCh5W/7YG3HFU29VyeDoO/REQw4Tk/USqxYiGeTrJKDRb+fHvEkQPlH7Rxag5VP59B5+YHUCthcjF1PawlwdeoANO625c+6IS7mg+zOEAGjUJezg5IK2eiiM4AIwDhkcoCKG2v0DtwP+wBGKVzd3yUTPD09+blZ5NqXqZgBzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112918; c=relaxed/simple;
	bh=kTOrrozozUwTMLvCszb57kgpLTi97280UMYQ7mO8tW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EtbPC6zN5cjYBOPNZsjODpGlk4jKKTTUGUSRGj2SQW5kByprcjFZ07MfnpA2G1H2Gz2iSuP9mLFvxQQ4MkkGz7QkQK6wmL575kvRcH0652wbJCPrXCwYkxHLZfsCTjoJJ4yk+mLreIuqadRmb6rFR7/Y0wK5CliTxSUEjPNYi7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAvsYuS8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAvsYuS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792112916; x=1823648916;
  h=date:from:to:cc:subject:message-id;
  bh=kTOrrozozUwTMLvCszb57kgpLTi97280UMYQ7mO8tW0=;
  b=HAvsYuS8qD7yN+CBM0e3SmH+e2q68gJSs0RdkpM3b2sgjEZXHN1b5qJu
   aaSzW6E82v4pvjtHM/RM2Sxtn0fHPG1TjES6JUtYg2uTye68WwzkxIBOA
   X6+ejwK5XOhKTAomMOaCTJC9nAEqmPZ9FC+EKwgmdUELKS/CBPUaaSt9V
   5ykCs9eCSwyygjUa3jC996Ebh3h6EkWODevL0EnkdYKapmnA4X4FqxvJR
   NPbxhapDYvQC1KDtE7QnKKuOrPax+BqMXoVMZsqK4RlG3HrBAPjrRsv+8
   D2JSsz0QuFtvjrsuXJ1Uz4veHvyMbWBEU2K5HGSyn4p3Hf057OQ9yfAmj
   w==;
X-CSE-ConnectionGUID: qK0psH8SRWWWJ3i2bl4PYQ==
X-CSE-MsgGUID: DvRz5dw7TyKKKK7HZG2JDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="786314"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="786314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 18:08:35 -0700
X-CSE-ConnectionGUID: mwsKMiaYTXuFvRhKI78iHg==
X-CSE-MsgGUID: /b2OK+a8TM2u5QTfqlBREA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2075899"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2026 18:08:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHWQx-00000000ByB-1BON;
	Fri, 16 Oct 2026 01:08:31 +0000
Date: Fri, 16 Oct 2026 03:07:40 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 25/25]
 include/linux/p3s_user_pages.h:11:2: error: #error "Must not include
 <linux/p3s_user_pages.h> from header files"
Message-ID: <202610160351.9uqvfLV8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   ae088f30248526d1cf2beb802bbe815ac808e950
commit: 856798080ed545d2fa2ac46a8fc3608e077337e1 [25/25] ANDROID: P3S: binfmt_elf: Support 4KB process page geometry on ELF exec
config: x86_64-randconfig-r2201-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160351.9uqvfLV8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160351.9uqvfLV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160351.9uqvfLV8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/binfmt_elf.c:52,
                    from fs/compat_binfmt_elf.c:154:
>> include/linux/p3s_user_pages.h:11:2: error: #error "Must not include <linux/p3s_user_pages.h> from header files"
      11 | #error "Must not include <linux/p3s_user_pages.h> from header files"
         |  ^~~~~
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
   fs/binfmt_elf.c:2136:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2136 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +11 include/linux/p3s_user_pages.h

a2f18a09888311 Kalesh Singh 2026-09-21   4  
a2f18a09888311 Kalesh Singh 2026-09-21   5  /*
a2f18a09888311 Kalesh Singh 2026-09-21   6   * <linux/p3s_user_pages.h> must ONLY be included as the last header in
a2f18a09888311 Kalesh Singh 2026-09-21   7   * C source files (.c) that opt into dynamic PAGE_SIZE for user address
a2f18a09888311 Kalesh Singh 2026-09-21   8   * spaces. It must NEVER be included in header files (.h).
a2f18a09888311 Kalesh Singh 2026-09-21   9   */
a2f18a09888311 Kalesh Singh 2026-09-21  10  #if defined(__INCLUDE_LEVEL__) && __INCLUDE_LEVEL__ > 1
a2f18a09888311 Kalesh Singh 2026-09-21 @11  #error "Must not include <linux/p3s_user_pages.h> from header files"
a2f18a09888311 Kalesh Singh 2026-09-21  12  #endif
a2f18a09888311 Kalesh Singh 2026-09-21  13  

:::::: The code at line 11 was first introduced by commit
:::::: a2f18a09888311a25f609f1ac52a922b8d6f0725 ANDROID: P3S: mm: Add dynamic PAGE_SIZE macro redirection header

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: android-test-infra-autosubmit@system.gserviceaccount.com <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
