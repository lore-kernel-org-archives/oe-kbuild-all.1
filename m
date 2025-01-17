Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DD5188713
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737147576; cv=none; b=QydC7l3CXrPGq5p5No4GR6xDVH1tCdNrbyFcd1vw9mNr/zgUVd9h+ezTNyQf7SGofxCmehNDSE+KZa/BMkXYp3V7vtLgt9aGFnNM1rzWmsiHaqEgzlHkyWy97d3dh5JAk3ac4nbKHKfb66/5oatCZrjNpWtaSl2jGoFidssN8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737147576; c=relaxed/simple;
	bh=nESglF4/ekwAFqcbU/kO9oHJc2M6AXJ5uxX2OtQkEcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPnVD5CuBEe7HMFpTjlItxU0TEX3zlpIpbfNMobkL1P2AxWz76ctXzAAKA+ay2yV4mt+sZ5cRIyrggV7reoesB9UX6ajdsrD0kdgEMMlu7wZrjqYBP95kg3gP6hXu7UTNrOkBQcxhY3QNkc+1Eq2O1wpn+WUfE1vf8YzCvCORcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+l/kbmj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+l/kbmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737147575; x=1768683575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nESglF4/ekwAFqcbU/kO9oHJc2M6AXJ5uxX2OtQkEcg=;
  b=F+l/kbmjjcwNvKPOfxTAf9dBPK+ZYc5znYDa2mQFnOUnD2TfBKsO3ajR
   0ZyDBYii+PnYF8Wr3rHNqT0/lJcpjq7KQkARBiyJTbb/bVdtrQHhcOJN9
   bnv0JgJsBAFwSrNMtB0mWocviL4g/bl8KWsvOiOnkx/RoYfAxthw7xFJt
   CxcrNAPOuszdtua5UGv2lou9cvwivIMDcwuVPAOy7a/WzseTzKGDzd2g6
   jqpvcZKiwWD53/QiV6u23Ozl9ptRZl73xowAAVSU1lecSJWSUYvVnwzmH
   dMn9CVjif/FNuZfgwYzQn5oLH+Xa1fhZu1vWDugTondxtWUmXFumNr9d4
   Q==;
X-CSE-ConnectionGUID: 1h9t0Ub1RIumfDK4RgznjQ==
X-CSE-MsgGUID: sGngp6amTu6XvEDWCorxwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37504472"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37504472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:59:34 -0800
X-CSE-ConnectionGUID: H3buQ0yaS8+zQD6ZdsuIBw==
X-CSE-MsgGUID: tT5RfqQ1S5612W00B+8feg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="105756178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 12:59:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtRD-000ThL-05;
	Fri, 17 Jan 2025 20:59:31 +0000
Date: Sat, 18 Jan 2025 04:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 09/18] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <202501180432.hKycnSEY-lkp@intel.com>
References: <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/x86-vdso-Fix-latent-bug-in-vclock_pages-calculation/20250110-232649
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20250110-vdso-store-rng-v2-9-350c9179bbf1%40linutronix.de
patch subject: [PATCH v2 09/18] riscv: vdso: Switch to generic storage implementation
config: riscv-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180432.hKycnSEY-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180432.hKycnSEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180432.hKycnSEY-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: lib/vdso/datastore.o: in function `vvar_fault':
>> lib/vdso/datastore.c:81:(.text+0x92): undefined reference to `vmf_insert_pfn'
>> riscv32-linux-ld: lib/vdso/datastore.c:81:(.text+0xee): undefined reference to `_install_special_mapping'


vim +81 lib/vdso/datastore.c

fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  36  
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  37  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  38  			     struct vm_area_struct *vma, struct vm_fault *vmf)
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  39  {
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  40  	struct page *timens_page = find_timens_vvar_page(vma);
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  41  	unsigned long addr, pfn;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  42  	vm_fault_t err;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  43  
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  44  	switch (vmf->pgoff) {
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  45  	case VDSO_TIME_PAGE_OFFSET:
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  46  		if (!IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO))
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  47  			return VM_FAULT_SIGBUS;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  48  		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  49  		if (timens_page) {
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  50  			/*
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  51  			 * Fault in VVAR page too, since it will be accessed
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  52  			 * to get clock data anyway.
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  53  			 */
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  54  			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  55  			err = vmf_insert_pfn(vma, addr, pfn);
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  56  			if (unlikely(err & VM_FAULT_ERROR))
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  57  				return err;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  58  			pfn = page_to_pfn(timens_page);
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  59  		}
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  60  		break;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  61  	case VDSO_TIMENS_PAGE_OFFSET:
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  62  		/*
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  63  		 * If a task belongs to a time namespace then a namespace
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  64  		 * specific VVAR is mapped with the VVAR_DATA_PAGE_OFFSET and
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  65  		 * the real VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  66  		 * offset.
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  67  		 * See also the comment near timens_setup_vdso_data().
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  68  		 */
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  69  		if (!IS_ENABLED(CONFIG_TIME_NS) || !timens_page)
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  70  			return VM_FAULT_SIGBUS;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  71  		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  72  		break;
82bc8941df2de7 Thomas Weiﬂschuh 2025-01-10  73  	case VDSO_RNG_PAGE_OFFSET:
82bc8941df2de7 Thomas Weiﬂschuh 2025-01-10  74  		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
82bc8941df2de7 Thomas Weiﬂschuh 2025-01-10  75  			return VM_FAULT_SIGBUS;
82bc8941df2de7 Thomas Weiﬂschuh 2025-01-10  76  		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
82bc8941df2de7 Thomas Weiﬂschuh 2025-01-10  77  		break;
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  78  	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  79  		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  80  			return VM_FAULT_SIGBUS;
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10 @81  		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  82  			vmf->pgoff - VDSO_ARCH_PAGES_START;
fccebb200bf73b Thomas Weiﬂschuh 2025-01-10  83  		break;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  84  	default:
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  85  		return VM_FAULT_SIGBUS;
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  86  	}
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  87  
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  88  	return vmf_insert_pfn(vma, vmf->address, pfn);
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  89  }
0e0910cd328daf Thomas Weiﬂschuh 2025-01-10  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
