Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B30512B79
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jccDtaqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699522575; x=1731058575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lj9MMzqpQTvTTZzqBJc36VT7RGs28b/2PZ/HuDRkf+U=;
  b=jccDtaqYMcbNmemhN1ovYgHbYYbiiHYVLwo3xC3OJPhvhLJdJtLruA/Y
   RGloTrwCnLNhLXYChky/x93j6e11or80/C2WrBnmclXUn2YzS/p6W2Vwk
   IpJVBqawpJHEo/slcUEGjkdOnG1AkGql2zONjfVpw8tQ0QUYsxEKnwjQ3
   YWUPD3jujguDMVatZo72MVEkJIKMCIb9EKAHCzi840ckU9WCpMFeoAqIT
   sxKr6Z9cFK3FvpSAKAWFkrQLCgTb8owvu9KgaUkFdKfAD4JlTq5dvL6aA
   c3xKvJBzXVmEXyevKBmdkzfhUUl+vf+6Ihm+f3UY/D/IhNmXkksE7/5Dm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11502704"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11502704"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:36:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="798280879"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="798280879"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Nov 2023 01:36:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r11SM-0008cm-22;
	Thu, 09 Nov 2023 09:36:10 +0000
Date: Thu, 9 Nov 2023 17:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 133/321] arch/x86/kvm/vmx/tdx.c:480:25:
 error: too many arguments to function 'tdx_unpin'
Message-ID: <202311091744.8wju4cYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   b6ce7ab288890b0d531d7be9e01dad957ae6857d
commit: 6a477bd89cd9237134793387c68ccbfc86720fc6 [133/321] KVM: TDX: TDP MMU TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231109/202311091744.8wju4cYf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091744.8wju4cYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091744.8wju4cYf-lkp@intel.com/

Note: the intel-tdx/kvm-upstream-next HEAD b6ce7ab288890b0d531d7be9e01dad957ae6857d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/tdx.c: In function 'tdx_sept_page_aug':
>> arch/x86/kvm/vmx/tdx.c:480:25: error: too many arguments to function 'tdx_unpin'
     480 |                         tdx_unpin(kvm, gfn, pfn, level);
         |                         ^~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:450:13: note: declared here
     450 | static void tdx_unpin(struct kvm *kvm, kvm_pfn_t pfn)
         |             ^~~~~~~~~


vim +/tdx_unpin +480 arch/x86/kvm/vmx/tdx.c

   456	
   457	static int tdx_sept_page_aug(struct kvm *kvm, gfn_t gfn,
   458				     enum pg_level level, kvm_pfn_t pfn)
   459	{
   460		int tdx_level = pg_level_to_tdx_sept_level(level);
   461		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
   462		union tdx_sept_level_state level_state;
   463		hpa_t hpa = pfn_to_hpa(pfn);
   464		gpa_t gpa = gfn_to_gpa(gfn);
   465		struct tdx_module_args out;
   466		union tdx_sept_entry entry;
   467		u64 err;
   468	
   469		err = tdh_mem_page_aug(kvm_tdx->tdr_pa, gpa, hpa, &out);
   470		if (unlikely(err == TDX_ERROR_SEPT_BUSY)) {
   471			tdx_unpin(kvm, pfn);
   472			return -EAGAIN;
   473		}
   474		if (unlikely(err == (TDX_EPT_ENTRY_STATE_INCORRECT | TDX_OPERAND_ID_RCX))) {
   475			entry.raw = out.rcx;
   476			level_state.raw = out.rdx;
   477			if (level_state.level == tdx_level &&
   478			    level_state.state == TDX_SEPT_PENDING &&
   479			    entry.leaf && entry.pfn == pfn && entry.sve) {
 > 480				tdx_unpin(kvm, gfn, pfn, level);
   481				WARN_ON_ONCE(!(to_kvm_tdx(kvm)->attributes &
   482					       TDX_TD_ATTR_SEPT_VE_DISABLE));
   483				return -EAGAIN;
   484			}
   485		}
   486		if (KVM_BUG_ON(err, kvm)) {
   487			pr_tdx_error(TDH_MEM_PAGE_AUG, err, &out);
   488			tdx_unpin(kvm, pfn);
   489			return -EIO;
   490		}
   491	
   492		return 0;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
