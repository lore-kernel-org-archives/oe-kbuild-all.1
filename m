Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319C13D881
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 22:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726957033; cv=none; b=Zznsiuyrvq+R1o/N/v8Tv7kpAnnYKwbKe7IJjB4Of5V/vYWJb6iSVE24LFyf72kskEQiDEdPElbH8mVj4yznz83uPyfi96bfZusYbvgBHJV5TY/H/ABEudntoxqF8gRKxiH8l8wUEBlO+TJvk4vb9+wEcK8EipV9Nm8yEhlBuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726957033; c=relaxed/simple;
	bh=u6W6KoshL/FuKW2NZ4CPjJ1UWNXxFTq3H8ZAnfxryGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Q/1ukIe+oZah5u3chLTx26VZNkwVWbr5+AcbkuKwUWu8u3s61LIv8oWeXAoG28WjjRQse3NDHVPItuEQ9j1We4zwfxnfrOYY46BeTwgH1m1OIQP9yXV188lmuDhI2Qx0EUtg8BUqiBmLzve2rG9Z1HdY3ZrdXFkpviUp43Id0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vlc00hO4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vlc00hO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726957032; x=1758493032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6W6KoshL/FuKW2NZ4CPjJ1UWNXxFTq3H8ZAnfxryGk=;
  b=Vlc00hO4obKOv6HUt18ud6mlFuL0dZLzDPan7d8NQDvHxBRRJnt2J8sb
   Xkjr4/TSDnhZpsNXb+PKp1xpSftuFzyoNOxCf2MmCbq7qurPycewbqJgC
   Mmx7XV7gSGIJ5Nx3TL1WewJVhnIcc+TIU59U+Jb83nulriNcnTCKuZL7e
   JedgHA1qGw17dZ+rvp4FX/KSLGSRjYlfvAwMkRrVyJ0CndjS+OhsvrRGh
   olZbM9YTgzzhgPF5wMLZuyX8cKZsTnpTjQWBz1/RH2pFU5xoZWF+g4mEW
   VAIPGclVzxuDNIeLt4rrYK7Tf0f6sj3Hfu87gBufZIugvAXzQa3YWJtxR
   Q==;
X-CSE-ConnectionGUID: 5NwXG6ECTgmN/vJcLwL+jQ==
X-CSE-MsgGUID: eKVw4XEvTNKL6r8dwDls2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25814074"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25814074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 15:17:09 -0700
X-CSE-ConnectionGUID: 1aTw4Ah2TBWt8PVaoWyUSQ==
X-CSE-MsgGUID: crVLOACDRiCg6n5fwXfk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75614608"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Sep 2024 15:17:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss8PZ-000Fpm-1x;
	Sat, 21 Sep 2024 22:17:05 +0000
Date: Sun, 22 Sep 2024 06:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10552/14021] arch/x86/kvm/svm/sev.c:2200:18:
 error: no member named 'false' in 'struct hygon_kvm_hooks_table'
Message-ID: <202409220656.VVoQSbav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi fangbaoshun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   70522ace7844a6fe96f8b19325c878ff23701ee7
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [10552/14021] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-001-20240921 (https://download.01.org/0day-ci/archive/20240922/202409220656.VVoQSbav-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220656.VVoQSbav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220656.VVoQSbav-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:2200:18: error: no member named 'false' in 'struct hygon_kvm_hooks_table'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |         ~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/svm/sev.c:66:21: note: expanded from macro 'sev_enabled'
      66 | #define sev_enabled false
         |                     ^
>> arch/x86/kvm/svm/sev.c:2200:32: error: cannot take the address of an rvalue of type 'int'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                                       ^~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for function 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^
   arch/x86/kvm/svm/sev.c:2198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2198 | void sev_install_hooks(void)
         | ^
         | static 
   1 warning and 2 errors generated.


vim +2200 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
  2198	void sev_install_hooks(void)
  2199	{
> 2200		hygon_kvm_hooks.sev_enabled = &sev_enabled;
  2201		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2202		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2203		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2204		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2205	
  2206		hygon_kvm_hooks.sev_hooks_installed = true;
  2207	}
  2208	#endif
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
