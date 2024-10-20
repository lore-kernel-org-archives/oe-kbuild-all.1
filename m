Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110938FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729417361; cv=none; b=UNoAy6FcBADiRx+CR8ffaE5Q0YlKZuxZOsss8Hd2A/1xf1XXF04gWHSNWbJ9b5JeTNXsqvHBkwPJvJxVuiTwP0s7+k4sD8HN68+JTG7JdHMWDe+B39FjZN1o1xb/JYRiNzVOtPvmd+EX/BmNbeiOojsmi/DhB4VdSroLovHit0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729417361; c=relaxed/simple;
	bh=DEGaI0K/J8GLHSxP0ZMtufzqNlUUH9Yn1Jowr54WFc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErtjHjZxe4gSJ/ici5LbOrrLsOECwcXp+IL7URy6w2lFCwBCp80m156hqyIuealIrfrGfcySjkXR2s7g+F9mfNiFIk+oAYltNXGLJWVLBUXYhAZtVZo/u5sRW1t2oO4cgNmSMlJWDpUZ5c37PC9nhzbaqf0i40v0Z5ERSnAPvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+DkxQtc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+DkxQtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729417358; x=1760953358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEGaI0K/J8GLHSxP0ZMtufzqNlUUH9Yn1Jowr54WFc4=;
  b=P+DkxQtcu+Cn6LwNz+RPw/6DzNpoYQ0pHcSlTBBzsMOc0aBljp+SCatU
   TfAsXld1dVM+/z55IK46ZVS9y9gq/xTIB+htj5MWgsD61VtNnpcGOXrUg
   4tCUMHmln90rsNLZx+zzlqdCFP0EFYF6ZeMr6//p2sXQtGFNp2rBx7vd5
   RTP78jZNz6e0OO67ZM5MB/3bxadssnekuzTF5t1OB2dHNmHGMhx4NcrgF
   peCjHsQ5ldeUKhwlhcc4VISlbJm1g3zqQxgeRSw0N5ZpinMRtiA8mvnHb
   dPfl8P+VeokPePP7sDQF2yiZ9fszMcJir/Whdj3D6O553JXQwYf1F4FXn
   w==;
X-CSE-ConnectionGUID: Ci90wH0wSMKvIWTcC7NMQQ==
X-CSE-MsgGUID: 5ID+lN9qQSSrysHSARBzIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29022674"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29022674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 02:42:38 -0700
X-CSE-ConnectionGUID: u3DlkxyoSsGhFJfeUgOjdA==
X-CSE-MsgGUID: r3c35khZSPO+Gp+FlNJExg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79593031"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2024 02:42:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2SSI-000QAa-0R;
	Sun, 20 Oct 2024 09:42:34 +0000
Date: Sun, 20 Oct 2024 17:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202410201716.n8f4T911-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 59cbd4eea48fdbc68fc17a29ad71188fea74b28b KVM: Remove HIGH_RES_TIMERS dependency
date:   6 weeks ago
config: x86_64-randconfig-123-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201716.n8f4T911-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201716.n8f4T911-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201716.n8f4T911-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted vm_fault_t @@
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     expected int [assigned] ret
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     got restricted vm_fault_t
>> arch/x86/kernel/cpu/sgx/virt.c:60:20: sparse: sparse: restricted vm_fault_t degrades to integer
>> arch/x86/kernel/cpu/sgx/virt.c:354:36: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/cpu/sgx/virt.c:385:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/cpu/sgx/virt.c:385:43: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/cpu/sgx/virt.c:385:58: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/cpu/sgx/virt.c: note: in included file (through include/linux/miscdevice.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +59 arch/x86/kernel/cpu/sgx/virt.c

540745ddbc70ea Sean Christopherson 2021-03-19  32  
540745ddbc70ea Sean Christopherson 2021-03-19  33  static int __sgx_vepc_fault(struct sgx_vepc *vepc,
540745ddbc70ea Sean Christopherson 2021-03-19  34  			    struct vm_area_struct *vma, unsigned long addr)
540745ddbc70ea Sean Christopherson 2021-03-19  35  {
540745ddbc70ea Sean Christopherson 2021-03-19  36  	struct sgx_epc_page *epc_page;
540745ddbc70ea Sean Christopherson 2021-03-19  37  	unsigned long index, pfn;
540745ddbc70ea Sean Christopherson 2021-03-19  38  	int ret;
540745ddbc70ea Sean Christopherson 2021-03-19  39  
540745ddbc70ea Sean Christopherson 2021-03-19  40  	WARN_ON(!mutex_is_locked(&vepc->lock));
540745ddbc70ea Sean Christopherson 2021-03-19  41  
540745ddbc70ea Sean Christopherson 2021-03-19  42  	/* Calculate index of EPC page in virtual EPC's page_array */
540745ddbc70ea Sean Christopherson 2021-03-19  43  	index = vma->vm_pgoff + PFN_DOWN(addr - vma->vm_start);
540745ddbc70ea Sean Christopherson 2021-03-19  44  
540745ddbc70ea Sean Christopherson 2021-03-19  45  	epc_page = xa_load(&vepc->page_array, index);
540745ddbc70ea Sean Christopherson 2021-03-19  46  	if (epc_page)
540745ddbc70ea Sean Christopherson 2021-03-19  47  		return 0;
540745ddbc70ea Sean Christopherson 2021-03-19  48  
540745ddbc70ea Sean Christopherson 2021-03-19  49  	epc_page = sgx_alloc_epc_page(vepc, false);
540745ddbc70ea Sean Christopherson 2021-03-19  50  	if (IS_ERR(epc_page))
540745ddbc70ea Sean Christopherson 2021-03-19  51  		return PTR_ERR(epc_page);
540745ddbc70ea Sean Christopherson 2021-03-19  52  
540745ddbc70ea Sean Christopherson 2021-03-19  53  	ret = xa_err(xa_store(&vepc->page_array, index, epc_page, GFP_KERNEL));
540745ddbc70ea Sean Christopherson 2021-03-19  54  	if (ret)
540745ddbc70ea Sean Christopherson 2021-03-19  55  		goto err_free;
540745ddbc70ea Sean Christopherson 2021-03-19  56  
540745ddbc70ea Sean Christopherson 2021-03-19  57  	pfn = PFN_DOWN(sgx_get_epc_phys_addr(epc_page));
540745ddbc70ea Sean Christopherson 2021-03-19  58  
540745ddbc70ea Sean Christopherson 2021-03-19 @59  	ret = vmf_insert_pfn(vma, addr, pfn);
540745ddbc70ea Sean Christopherson 2021-03-19 @60  	if (ret != VM_FAULT_NOPAGE) {
540745ddbc70ea Sean Christopherson 2021-03-19  61  		ret = -EFAULT;
540745ddbc70ea Sean Christopherson 2021-03-19  62  		goto err_delete;
540745ddbc70ea Sean Christopherson 2021-03-19  63  	}
540745ddbc70ea Sean Christopherson 2021-03-19  64  
540745ddbc70ea Sean Christopherson 2021-03-19  65  	return 0;
540745ddbc70ea Sean Christopherson 2021-03-19  66  
540745ddbc70ea Sean Christopherson 2021-03-19  67  err_delete:
540745ddbc70ea Sean Christopherson 2021-03-19  68  	xa_erase(&vepc->page_array, index);
540745ddbc70ea Sean Christopherson 2021-03-19  69  err_free:
540745ddbc70ea Sean Christopherson 2021-03-19  70  	sgx_free_epc_page(epc_page);
540745ddbc70ea Sean Christopherson 2021-03-19  71  	return ret;
540745ddbc70ea Sean Christopherson 2021-03-19  72  }
540745ddbc70ea Sean Christopherson 2021-03-19  73  

:::::: The code at line 59 was first introduced by commit
:::::: 540745ddbc70eabdc7dbd3fcc00fe4fb17cd59ba x86/sgx: Introduce virtual EPC for use by KVM guests

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
