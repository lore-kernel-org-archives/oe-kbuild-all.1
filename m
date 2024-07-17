Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F614B07B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220436; cv=none; b=Or8X5Gr/96F6KHoyGVgGkazlTHfMeBjDk79MTIBDz2MDNtbMPEVzmZxZxSBrc/Eidgowme2j0gT90DOfs1FzrTxNLxjp8Qe3aG1/UNUp29Ib/dD0/WQ1jrVj07t03RIDk/MYSUbVZEka9Y/YccX8I5/KXNzf5qnJEkMQKi7OZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220436; c=relaxed/simple;
	bh=3Y5AqXrGgNBqZtVhM4oW9M1HqZi9CZHbR1CYrb4ShZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAvGQ4NI06GHAFWvfEKgJB9y0KB7AIxpr7nvtXOHJlZXLsBU5FpTBxUpC2nIm/azMRz/XJT8D/lxFYub4zQZdp6/1nY0hQCBN6PkEWFj6f/Ny+KmpEQ0c5XiB6oJLJwbDF90AFpWrTRUjHICHBzpwt/OCBb93+RzV0ny42Qx/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5crjZce; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5crjZce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721220434; x=1752756434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Y5AqXrGgNBqZtVhM4oW9M1HqZi9CZHbR1CYrb4ShZg=;
  b=F5crjZceIb44qeBCje8J2JQocNwTTvI78c55xcUbmy4GcM4NGkjuZ0SB
   622mv3tExwwlyTQPzoGKiFriGVoST5eJQbujbCCBRCMZr+A5HyUbxRYTq
   eaKzvoSA/AGydJ6g4mstRiBtZN3HONzJBoNHl2LuAb/Q4xNzbmzEVsQYS
   6/tORGxXFRIVLgUy76+Jxp4pJjVSi1ownfxq0Wi0+N2MVp+/7VsQZz0rg
   sZDaBXmyWKJZKlVw5hAFnK3YPqqTdiQb8F1d6t76B9zJqr0lfgcXHsTw7
   2kxwxSA8pp/pWF1hDkB2XjcoGeevyTFjePHtSSIgb+cbbzc4fQu2Vq7N/
   A==;
X-CSE-ConnectionGUID: V2t1FP2oSomK30JJXrFZcw==
X-CSE-MsgGUID: oBNQ74n1SluIZVvqdLVFrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29330996"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="29330996"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 05:47:13 -0700
X-CSE-ConnectionGUID: swMzUMLOTtehbdbJUWNPgA==
X-CSE-MsgGUID: uZvgpT7ATD66Vyj1sOjTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50328118"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 05:47:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU43q-000gKz-17;
	Wed, 17 Jul 2024 12:47:10 +0000
Date: Wed, 17 Jul 2024 20:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10525/10732] arch/x86/kvm/svm/sev.c:2200:18:
 error: no member named 'false' in 'struct hygon_kvm_hooks_table'
Message-ID: <202407172057.dzF7FxYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e027f52d2f7ae70761b12813f5875bfbc255036f
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [10525/10732] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-161-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172057.dzF7FxYB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172057.dzF7FxYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172057.dzF7FxYB-lkp@intel.com/

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
