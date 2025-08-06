Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD21B21BD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754447725; cv=none; b=CKwmOoi8K/xctqcQemYoAR1TheaoN3YVmDz4K0vWoYC7MnKVip7DA2rT8YdG1fzVpbiLj+1eq/l3Y+ldu/UFagP0nnp5NfbL6Jg5SWH/tcc8W1KomtSvVA494avKvwHZOwQgGgcM9i9xxblaj0rniVljdRHFheZxKFsupcy+Mcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754447725; c=relaxed/simple;
	bh=uexFuthHOlw1NzrPpdL41bGuJJD5CrMHieuxu7wTmWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkozrG5B//qP9MIvczlQCOq3bITjv+40OGKJYswB26YWSWql0XI2wjhxX6hYwGHTMUUZUtJZ8tB2Uw7P3Jbt4Go7hixnghshK+bKKnHTrI/jQzXO8hUT5eYhYL9qaRRYtsg2BmHiuDNi9YadoFw8hAPd8Nud2jSyPENdBoKS5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbLBvguc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbLBvguc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754447724; x=1785983724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uexFuthHOlw1NzrPpdL41bGuJJD5CrMHieuxu7wTmWI=;
  b=EbLBvgucxtjk98F5zn1xTJR6uQirkpdRhqHD25C/EuVnKvwIFjeY75Ti
   loFT59NiDiL0e9D8teCYf4FYHY0hXSx+kyvyoYSXoHwtsRfklxrvQldjU
   OjRyyrkeOiGr5KujmtW/RXqdTjOfSo6FlkiLSzv5WDEvp9/iCXzVlTzLA
   6HubSZoTHNieXHWGw0o5HyfWkdF6AnFiHUxOFNGHPj61tx7v0YGfF2cmc
   hEExDRnqWYeSGljxkrmENPdPv6Nc/WjMll2zjZflAVXloNM1aXi+FHawt
   6N41Kn6ElhI33u30R7bAgxK4djQ7XXRM/81nkprUnp+r+E5ABa6rhzBA0
   A==;
X-CSE-ConnectionGUID: 79NHQJqRRuupErWtmeCYeg==
X-CSE-MsgGUID: QB8JNyRPSNqADRn5McPOhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56672021"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56672021"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 19:35:23 -0700
X-CSE-ConnectionGUID: 4g3WZ018TMe6edWefm1w1Q==
X-CSE-MsgGUID: RgcUDRXATHC//i/4ZVCJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="170027039"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2025 19:35:22 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujTzr-00027L-0W;
	Wed, 06 Aug 2025 02:35:19 +0000
Date: Wed, 6 Aug 2025 04:34:50 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/tdx_post_populate 13/13]
 arch/x86/kvm/svm/sev.c:2253:29: error: too many arguments to function
 'copy_page'
Message-ID: <202508060435.nbfgp0Uh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/tdx_post_populate
head:   f11b520b45d3ae669d6687e82638cea99f40c1fd
commit: 8ba436efdc31a881025f4ed679f22d96ec5ef245 [13/13] tmp
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250806/202508060435.nbfgp0Uh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060435.nbfgp0Uh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060435.nbfgp0Uh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/sev.c: In function 'sev_gmem_post_populate':
>> arch/x86/kvm/svm/sev.c:2253:29: error: too many arguments to function 'copy_page'
    2253 |                         if (copy_page(vaddr, src + i * PAGE_SIZE, PAGE_SIZE)) {
         |                             ^~~~~~~~~
   In file included from arch/x86/include/asm/page.h:12,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/smp.h:118,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kvm_types.h:23,
                    from arch/x86/kvm/svm/sev.c:11:
   arch/x86/include/asm/page_64.h:62:6: note: declared here
      62 | void copy_page(void *to, void *from);
         |      ^~~~~~~~~
>> arch/x86/kvm/svm/sev.c:2253:29: error: void value not ignored as it ought to be
    2253 |                         if (copy_page(vaddr, src + i * PAGE_SIZE, PAGE_SIZE)) {
         |                             ^~~~~~~~~


vim +/copy_page +2253 arch/x86/kvm/svm/sev.c

  2224	
  2225	static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn_start, kvm_pfn_t pfn,
  2226					  struct page *src, int order, void *opaque)
  2227	{
  2228		struct sev_gmem_populate_args *sev_populate_args = opaque;
  2229		struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
  2230		int n_private = 0, ret, i;
  2231		int npages = (1 << order);
  2232		gfn_t gfn;
  2233	
  2234		if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src))
  2235			return -EINVAL;
  2236	
  2237		for (gfn = gfn_start, i = 0; gfn < gfn_start + npages; gfn++, i++) {
  2238			struct sev_data_snp_launch_update fw_args = {0};
  2239			bool assigned = false;
  2240			int level;
  2241	
  2242			ret = snp_lookup_rmpentry((u64)pfn + i, &assigned, &level);
  2243			if (ret || assigned) {
  2244				pr_debug("%s: Failed to ensure GFN 0x%llx RMP entry is initial shared state, ret: %d assigned: %d\n",
  2245					 __func__, gfn, ret, assigned);
  2246				ret = ret ? -EINVAL : -EEXIST;
  2247				goto err;
  2248			}
  2249	
  2250			if (src) {
  2251				void *vaddr = kmap_local_pfn(pfn + i);
  2252	
> 2253				if (copy_page(vaddr, src + i * PAGE_SIZE, PAGE_SIZE)) {
  2254					ret = -EFAULT;
  2255					goto err;
  2256				}
  2257				kunmap_local(vaddr);
  2258			}
  2259	
  2260			ret = rmp_make_private(pfn + i, gfn << PAGE_SHIFT, PG_LEVEL_4K,
  2261					       sev_get_asid(kvm), true);
  2262			if (ret)
  2263				goto err;
  2264	
  2265			n_private++;
  2266	
  2267			fw_args.gctx_paddr = __psp_pa(sev->snp_context);
  2268			fw_args.address = __sme_set(pfn_to_hpa(pfn + i));
  2269			fw_args.page_size = PG_LEVEL_TO_RMP(PG_LEVEL_4K);
  2270			fw_args.page_type = sev_populate_args->type;
  2271	
  2272			ret = __sev_issue_cmd(sev_populate_args->sev_fd, SEV_CMD_SNP_LAUNCH_UPDATE,
  2273					      &fw_args, &sev_populate_args->fw_error);
  2274			if (ret)
  2275				goto fw_err;
  2276		}
  2277	
  2278		return 0;
  2279	
  2280	fw_err:
  2281		/*
  2282		 * If the firmware command failed handle the reclaim and cleanup of that
  2283		 * PFN specially vs. prior pages which can be cleaned up below without
  2284		 * needing to reclaim in advance.
  2285		 *
  2286		 * Additionally, when invalid CPUID function entries are detected,
  2287		 * firmware writes the expected values into the page and leaves it
  2288		 * unencrypted so it can be used for debugging and error-reporting.
  2289		 *
  2290		 * Copy this page back into the source buffer so userspace can use this
  2291		 * information to provide information on which CPUID leaves/fields
  2292		 * failed CPUID validation.
  2293		 */
  2294		if (!snp_page_reclaim(kvm, pfn + i) &&
  2295		    sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
  2296		    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
  2297			void *vaddr = kmap_local_pfn(pfn + i);
  2298	
  2299			if (copy_to_user(src + i * PAGE_SIZE, vaddr, PAGE_SIZE))
  2300				pr_debug("Failed to write CPUID page back to userspace\n");
  2301	
  2302			kunmap_local(vaddr);
  2303		}
  2304	
  2305		/* pfn + i is hypervisor-owned now, so skip below cleanup for it. */
  2306		n_private--;
  2307	
  2308	err:
  2309		pr_debug("%s: exiting with error ret %d (fw_error %d), restoring %d gmem PFNs to shared.\n",
  2310			 __func__, ret, sev_populate_args->fw_error, n_private);
  2311		for (i = 0; i < n_private; i++)
  2312			kvm_rmp_make_shared(kvm, pfn + i, PG_LEVEL_4K);
  2313	
  2314		return ret;
  2315	}
  2316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
