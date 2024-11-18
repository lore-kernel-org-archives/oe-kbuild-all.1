Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994DC183CD1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970297; cv=none; b=czK/vhBXO64c3B09nDma24L1mgIVbURsO+6chlIKHYgsmm1PoNBpJ+Ejb8aIqifOTYiFaG2ktDj7/DBt6noLq+fdIutg1YnMlyaZx5bhJTODNaymefGNAKaVhnpL/ZvlJNkC2JscVtBm9pkKoBkkBGdip/vKDtq6y5K3Xl3Tw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970297; c=relaxed/simple;
	bh=DV++OkNUozjSt7H8RUxOcHUBMJQ1yRvqo5IFIRLEQOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4evnWqPE5dB4YvbWcfVl/k447Mry2bzEuJVqdnG/eXGCMq8ITuRRWrzFJcO8WcBNZnaMmccMP03Ga5Du2jIY874aSReUotnoDRVcHdgz6judUJoNDCbvr5K4FVyLUlhJPkhshtcshFgBuZ2wic8G0OREsSk9NiCDJPh60/QtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xoho+gEh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xoho+gEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731970296; x=1763506296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DV++OkNUozjSt7H8RUxOcHUBMJQ1yRvqo5IFIRLEQOY=;
  b=Xoho+gEhw2xUyIefRvUz85KNSuGRMI20Wagk3wrePaDVfxCc7qTDNi5r
   OFwIaOtaunIFTPmqDoKXjT1v1s4dW6KebCSDctRoBj36vT9HylYMU+LPB
   24+EKshDBT4KtNONtfaaI05MuoWnLes1F29d0qlZXp5v+jz/ALF4sUvGN
   hF3FMDXN7jlMzhq1aKX7t7gE2wJnGP/PWx8k08zxCEDoN6hyGQCbTc1p6
   ZmYcG0FnWA3fP1CqxA8z+Y9heTSsaRE/id5zrLtOtM4t6FRZA3zSNs4Dj
   8O7T65zQJdpLhFdnjtEYvXh+tfam+oX/hCczZUS+nNQ1+xIJjXFisuKtk
   Q==;
X-CSE-ConnectionGUID: z6QiNa3eRt2yN81zNMpVqg==
X-CSE-MsgGUID: oMta83/dTuOwwdBkpSTWPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43348133"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="43348133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 14:51:35 -0800
X-CSE-ConnectionGUID: AMx/osdYQBm1YjOJTriz3w==
X-CSE-MsgGUID: 0qjXvKhcT+6VPEI+It55TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="120311390"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 14:51:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDAah-0002gJ-1E;
	Mon, 18 Nov 2024 22:51:31 +0000
Date: Tue, 19 Nov 2024 06:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] arch/x86/kvm/svm/sev.c:2200:18: error:
 no member named 'false' in 'struct hygon_kvm_hooks_table'
Message-ID: <202411190617.6rJdyaze-lkp@intel.com>
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
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [1484/1484] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-073-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190617.6rJdyaze-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190617.6rJdyaze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190617.6rJdyaze-lkp@intel.com/

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
