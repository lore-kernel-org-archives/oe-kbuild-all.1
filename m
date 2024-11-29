Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743EA28371
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 04:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732854676; cv=none; b=en1VLktr5vb/Adj+H5a2npLYCpks1iy6nJwLa6g+MsVLSKnIIn5hL86flUUkUSTBVyTNskHE3FOwQojNUEwQR5/llwYQHDmxq0Az08Ha5eGNFsoz9srlnZkGoaAbYa1O39mF5zUPoUlXnyrskf1P887lAEMhDDIgXOVwldONJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732854676; c=relaxed/simple;
	bh=rvZTstGGGr5IVH8KzUhpQlvpFjxHJYWDMBJDQaKxa9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgJl6I5cVdqIIQ6NpUcCuwwzWhWU7fP9kuPyj2KHh788MRHd1ebhnkfaXdk5W7bo/qlhfx/EOOTpBLFRja9WOCe1nWQoeTW5OPFf7HOlAPIRfsm1vpyWPf+pAZzmpDefW1QfNsRBwApRg6SyPVch6ICQzXaXxh0zyzrCBSPPyh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQrzyPB3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQrzyPB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732854674; x=1764390674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvZTstGGGr5IVH8KzUhpQlvpFjxHJYWDMBJDQaKxa9w=;
  b=lQrzyPB3YNsv4PD4ialOrEbk9SoIPmKAGcf97bke9VK0utqxpLZafGsQ
   wdkm8kMsSv/xSZCO+MAOlTG3LvQz7epUR3w5x87+6HCo2iPHYCCK9ZSjw
   uG1LJj/5GwgAizLjDIXBVkCJ9iBI2lfpAxnNxXAWJp7JNoE1KK5C3KZRV
   Rw2t/XzcYnV3e7elXO60iT+Msq515qtW1FBjJLSn/rkN3guV2n9g6cIra
   cDomuBAJTNPo2WA0cx7NOwCtt9/NrCU3gYZYm6ygpKJWRa/UIm+zcVOEY
   l3MyP2qLUTMC39VL1VGbVAbefhAKd4Q8E1NysLg5atdATyCQt3saooi3n
   w==;
X-CSE-ConnectionGUID: eRyFG8PrSfCJyFZ8gzRTyA==
X-CSE-MsgGUID: vH9Ayow2RKGqR3MY0crZKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44470512"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="44470512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:31:11 -0800
X-CSE-ConnectionGUID: wMl+8x2nQeyBSV1Z7YRgGQ==
X-CSE-MsgGUID: XHp7UjcATyC0WHuFh5FUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92773940"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 20:31:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGseq-000ALE-04;
	Fri, 29 Nov 2024 04:31:08 +0000
Date: Fri, 29 Nov 2024 12:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] arch/x86/kvm/svm/sev.c:2200:18: error:
 no member named 'false' in 'struct hygon_kvm_hooks_table'
Message-ID: <202411291233.9CXb1cKX-lkp@intel.com>
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
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [1484/1484] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-073-20241119 (https://download.01.org/0day-ci/archive/20241129/202411291233.9CXb1cKX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291233.9CXb1cKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291233.9CXb1cKX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/sev.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   2 warnings and 2 errors generated.


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
