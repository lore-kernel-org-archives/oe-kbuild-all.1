Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BEE3A2556
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142268; cv=none; b=uIXgCk3i7x40272bCLCkebpTdffZL3qBxjoByPwUq+uvKF/3rg4U/Ylf3JP9gbXn7RZRm/dzM3Mc1QNyo7VV19L9uiuCrElq7VDrVQKohevjBw0IxorY2g+NQsXxScbMje5p05Sj7YkW7etZDexeLIJF5JPkP0PawXlh+4l8eoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142268; c=relaxed/simple;
	bh=eo35sQOjt5T33LMjtJ21dZ0di3M2QHMydDd7gAD24zg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KAOyfJUiNQTADOKsGzP6K1yDDLzXe6qDfR6Cuh7utdAC4OvYE8JRYsN1OXYDcmrbnp1b/zEx08ckOB1beEZHzHj7HY0lNuq8y+Yj6DSdovsQXHM1eQ7s9b94RWp8hV9KNjHnW67aN81dMVJDiCP+DZNnadln+YupubUlbD2AP2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjBevffx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjBevffx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779142266; x=1810678266;
  h=date:from:to:cc:subject:message-id;
  bh=eo35sQOjt5T33LMjtJ21dZ0di3M2QHMydDd7gAD24zg=;
  b=PjBevffxmtMT/6Pb/TsPsJNzTU6IylWCQjH3LdvYIcazkBz+hvlPENoy
   fm6nXNVRAoXYF7+rY3ea4e1iXt2lO9QhESMewvPTpPqTwB7M7rjXRhZyR
   t3GER8cgd+4/vETsds2wMi2JYHvcZkNFjX0D8vRKTqTVkT73CeyMCQz1s
   YfLEJ+yexEQoLPlwHXk9+yGA/5JE024TxwqzNE25kI0LJ/n6P07rfX65A
   +gIp2SdgAwflOwx48T10WSzk+coeH8Gq4nNq61AWMtXZdUx84xz4wiTlV
   n8KO8xBj7GMvx6mvkD5ZsYR0oKUf4Cxi47J5EmgLcfgp/DHct4YxdSJK/
   Q==;
X-CSE-ConnectionGUID: jPAQFJ4lTVOsYTivlJJGog==
X-CSE-MsgGUID: aHnsvlrrReSsDNasH135Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80128705"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80128705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 15:11:05 -0700
X-CSE-ConnectionGUID: cngJ0tUVRKO3OMxIwpB70g==
X-CSE-MsgGUID: jtG7bm+/TtOkTjOZGIZAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235321424"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2026 15:11:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP6Aw-000000009y9-3fHh;
	Mon, 18 May 2026 22:11:02 +0000
Date: Tue, 19 May 2026 00:10:56 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 76/238]
 arch/x86/kvm/vmx/sgx.c:4:9: warning: "pr_fmt" redefined
Message-ID: <202605190023.pM7weHSv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 9f39e5e1674188b92a32f709a9c3225553110dc0 [76/238] KVM: VMX: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260519/202605190023.pM7weHSv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190023.pM7weHSv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190023.pM7weHSv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/sgx.c:4:9: warning: "pr_fmt" redefined
       4 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from arch/x86/kvm/vmx/sgx.c:1:
   include/linux/printk.h:401:9: note: this is the location of the previous definition
     401 | #define pr_fmt(fmt) fmt
         |         ^~~~~~


vim +/pr_fmt +4 arch/x86/kvm/vmx/sgx.c

8d20bd63816703 Sean Christopherson 2022-11-30 @4  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
9798adbc04cf1b Sean Christopherson 2021-04-12  5  

:::::: The code at line 4 was first introduced by commit
:::::: 8d20bd6381670382669d9bb39b5fd566a84cdbef KVM: x86: Unify pr_fmt to use module name for all KVM modules

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
