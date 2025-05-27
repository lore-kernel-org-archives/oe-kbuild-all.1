Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0125E126C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354848; cv=none; b=sIZVarumAWjI4mRhsNB6krPm3tmv/ZurPwhlIr4iSzmy+7AHg8UciBWlP/JgqB8In/+eGiXFdhBOccjsn/QS76NkrunsIiJPOd8q92uQZ54ANy+yZln5gY8bcezYw8sDRVeP3ggW/XkycH/ZOlE2WCAX6sgLfgaG1cXKfwSWNhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354848; c=relaxed/simple;
	bh=Q3JMHiBSvFN2Wu/oJnEsE+hx6qOypHPkrsjimx3CHEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWALN73s5TR7YLS50k4iogKgkvGQAt4omG9aUnr/UCT2IvcTI+3AXWHSbak+VCp37Vj91MNZSYMriBTpTVrGg9T8I+c5CPycjLUJpJfgqerzZZQ4eNPKaVBVJgOqZcSO5+txEwow/wOeUn1b92MoXLfADn9FFWjIi7AFXncA010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiPtSG4G; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiPtSG4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748354846; x=1779890846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q3JMHiBSvFN2Wu/oJnEsE+hx6qOypHPkrsjimx3CHEw=;
  b=iiPtSG4Gc5fEzEQSUM78vYzYBAtRNzSqPwaixjMezvHHPC08sMSbbz63
   Ao3r4FAhISOMo2BVACD4LBx5aYNBPqIMj4vilYg0AySh8JmUy++c9n07o
   SRbyjPu6Kratt3M6ly8nE2pVytkW+oYdWS13bkmm890OnK9Y6eyr8At9+
   GVgS5KCcLAwJUfAYIw1gvwJEkiJsmk6mZPIm5uPLv6wb1bRN76hGUuy66
   2MqLOtxdWeFdZuLiEUqoB3wnxLFSgMu/+F3ruk3mVeE0Kow63byC43veH
   ykGPwQ0aWow0LuRoxxcpxlnvqzFlid5wEVa1gDPDHh1kbp1gYTd7PYYmS
   A==;
X-CSE-ConnectionGUID: ZsarCdrJQiWOB/QunMdK+Q==
X-CSE-MsgGUID: iPBAodZeQLi4TOV0M1Y1fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49455550"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="49455550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 07:07:24 -0700
X-CSE-ConnectionGUID: NBpUO9E+TeOtXGEyWzNq3w==
X-CSE-MsgGUID: Dti4VB96SeWFr7SDgyZZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143281871"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 07:07:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJuxb-000TGO-34;
	Tue, 27 May 2025 14:07:19 +0000
Date: Tue, 27 May 2025 22:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/4] KVM: s390: refactor and split some gmap helpers
Message-ID: <202505272117.SLbzOWen-lkp@intel.com>
References: <20250523130348.247446-4-imbrenda@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523130348.247446-4-imbrenda@linux.ibm.com>

Hi Claudio,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvms390/next]
[also build test ERROR on s390/features kvm/queue kvm/next mst-vhost/linux-next linus/master v6.15]
[cannot apply to kvm/linux-next next-20250526]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudio-Imbrenda/s390-remove-unneeded-includes/20250523-210651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20250523130348.247446-4-imbrenda%40linux.ibm.com
patch subject: [PATCH v4 3/4] KVM: s390: refactor and split some gmap helpers
config: s390-randconfig-r051-20250527 (https://download.01.org/0day-ci/archive/20250527/202505272117.SLbzOWen-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272117.SLbzOWen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272117.SLbzOWen-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/gmap_helpers.c:11:
>> include/linux/swapops.h:90:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:90:49: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
      90 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                                                        ^
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:100:23: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     100 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
   include/linux/swapops.h:109:21: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     109 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MASK'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
>> include/linux/swapops.h:235:37: error: use of undeclared identifier 'SWP_MIGRATION_READ'
     235 |         return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
         |                                            ^
>> include/linux/swapops.h:236:23: error: use of undeclared identifier 'SWP_MIGRATION_READ_EXCLUSIVE'
     236 |                         swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
         |                                            ^
>> include/linux/swapops.h:237:23: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     237 |                         swp_type(entry) == SWP_MIGRATION_WRITE);
         |                                            ^
   include/linux/swapops.h:242:37: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     242 |         return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
         |                                            ^
   include/linux/swapops.h:247:37: error: use of undeclared identifier 'SWP_MIGRATION_READ'; did you mean 'THP_MIGRATION_FAIL'?
     247 |         return unlikely(swp_type(entry) == SWP_MIGRATION_READ);
         |                                            ^~~~~~~~~~~~~~~~~~
         |                                            THP_MIGRATION_FAIL
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/vm_event_item.h:73:3: note: 'THP_MIGRATION_FAIL' declared here
      73 |                 THP_MIGRATION_FAIL,
         |                 ^
   In file included from arch/s390/mm/gmap_helpers.c:11:
   include/linux/swapops.h:252:37: error: use of undeclared identifier 'SWP_MIGRATION_READ_EXCLUSIVE'
     252 |         return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE);
         |                                            ^
   include/linux/swapops.h:257:19: error: use of undeclared identifier 'SWP_MIGRATION_READ'; did you mean 'THP_MIGRATION_FAIL'?
     257 |         return swp_entry(SWP_MIGRATION_READ, offset);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_FAIL
   include/linux/vm_event_item.h:73:3: note: 'THP_MIGRATION_FAIL' declared here
      73 |                 THP_MIGRATION_FAIL,
         |                 ^
   In file included from arch/s390/mm/gmap_helpers.c:11:
   include/linux/swapops.h:262:19: error: use of undeclared identifier 'SWP_MIGRATION_READ_EXCLUSIVE'
     262 |         return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
         |                          ^
   include/linux/swapops.h:267:19: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     267 |         return swp_entry(SWP_MIGRATION_WRITE, offset);
         |                          ^
>> include/linux/swapops.h:426:19: error: use of undeclared identifier 'SWP_PTE_MARKER'
     426 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^
   include/linux/swapops.h:431:28: error: use of undeclared identifier 'SWP_PTE_MARKER'
     431 |         return swp_type(entry) == SWP_PTE_MARKER;
         |                                   ^
   include/linux/swapops.h:525:15: error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
     525 |         BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
         |                      ^
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^
>> include/linux/swapops.h:599:28: error: use of undeclared identifier 'MAX_SWAPFILES'
     599 |         return swp_type(entry) >= MAX_SWAPFILES;
         |                                   ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/gmap_helpers.c:13:
   In file included from include/linux/ksm.h:14:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:165:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> arch/s390/mm/gmap_helpers.c:31:2: error: call to undeclared function 'free_swap_and_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      31 |         free_swap_and_cache(entry);
         |         ^
   12 warnings and 18 errors generated.


vim +/MAX_SWAPFILES_SHIFT +90 include/linux/swapops.h

2e3468778dbe3e Peter Xu                       2022-08-11   14  
^1da177e4c3f41 Linus Torvalds                 2005-04-16   15  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16   16   * swapcache pages are stored in the swapper_space radix tree.  We want to
^1da177e4c3f41 Linus Torvalds                 2005-04-16   17   * get good packing density in that tree, so the index should be dense in
^1da177e4c3f41 Linus Torvalds                 2005-04-16   18   * the low-order bits.
^1da177e4c3f41 Linus Torvalds                 2005-04-16   19   *
a930c210c42dec Miaohe Lin                     2022-05-19   20   * We arrange the `type' and `offset' fields so that `type' is at the six
e83a9596712eb7 Paolo 'Blaisorblade' Giarrusso 2005-09-03   21   * high-order bits of the swp_entry_t and `offset' is right-aligned in the
9b15b817f3d624 Hugh Dickins                   2012-06-15   22   * remaining bits.  Although `type' itself needs only five bits, we allow for
a930c210c42dec Miaohe Lin                     2022-05-19   23   * shmem/tmpfs to shift it all up a further one bit: see swp_to_radix_entry().
^1da177e4c3f41 Linus Torvalds                 2005-04-16   24   *
^1da177e4c3f41 Linus Torvalds                 2005-04-16   25   * swp_entry_t's are *never* stored anywhere in their arch-dependent format.
^1da177e4c3f41 Linus Torvalds                 2005-04-16   26   */
3159f943aafdba Matthew Wilcox                 2017-11-03  @27  #define SWP_TYPE_SHIFT	(BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
3159f943aafdba Matthew Wilcox                 2017-11-03  @28  #define SWP_OFFSET_MASK	((1UL << SWP_TYPE_SHIFT) - 1)
^1da177e4c3f41 Linus Torvalds                 2005-04-16   29  
0d206b5d2e0d7d Peter Xu                       2022-08-11   30  /*
0d206b5d2e0d7d Peter Xu                       2022-08-11   31   * Definitions only for PFN swap entries (see is_pfn_swap_entry()).  To
0d206b5d2e0d7d Peter Xu                       2022-08-11   32   * store PFN, we only need SWP_PFN_BITS bits.  Each of the pfn swap entries
0d206b5d2e0d7d Peter Xu                       2022-08-11   33   * can use the extra bits to store other information besides PFN.
0d206b5d2e0d7d Peter Xu                       2022-08-11   34   */
0d206b5d2e0d7d Peter Xu                       2022-08-11   35  #ifdef MAX_PHYSMEM_BITS
0d206b5d2e0d7d Peter Xu                       2022-08-11   36  #define SWP_PFN_BITS		(MAX_PHYSMEM_BITS - PAGE_SHIFT)
0d206b5d2e0d7d Peter Xu                       2022-08-11   37  #else  /* MAX_PHYSMEM_BITS */
630dc25e43dacf David Hildenbrand              2022-12-05   38  #define SWP_PFN_BITS		min_t(int, \
630dc25e43dacf David Hildenbrand              2022-12-05   39  				      sizeof(phys_addr_t) * 8 - PAGE_SHIFT, \
630dc25e43dacf David Hildenbrand              2022-12-05   40  				      SWP_TYPE_SHIFT)
0d206b5d2e0d7d Peter Xu                       2022-08-11   41  #endif	/* MAX_PHYSMEM_BITS */
0d206b5d2e0d7d Peter Xu                       2022-08-11   42  #define SWP_PFN_MASK		(BIT(SWP_PFN_BITS) - 1)
0d206b5d2e0d7d Peter Xu                       2022-08-11   43  
2e3468778dbe3e Peter Xu                       2022-08-11   44  /**
2e3468778dbe3e Peter Xu                       2022-08-11   45   * Migration swap entry specific bitfield definitions.  Layout:
2e3468778dbe3e Peter Xu                       2022-08-11   46   *
2e3468778dbe3e Peter Xu                       2022-08-11   47   *   |----------+--------------------|
2e3468778dbe3e Peter Xu                       2022-08-11   48   *   | swp_type | swp_offset         |
2e3468778dbe3e Peter Xu                       2022-08-11   49   *   |----------+--------+-+-+-------|
2e3468778dbe3e Peter Xu                       2022-08-11   50   *   |          | resv   |D|A|  PFN  |
2e3468778dbe3e Peter Xu                       2022-08-11   51   *   |----------+--------+-+-+-------|
2e3468778dbe3e Peter Xu                       2022-08-11   52   *
2e3468778dbe3e Peter Xu                       2022-08-11   53   * @SWP_MIG_YOUNG_BIT: Whether the page used to have young bit set (bit A)
2e3468778dbe3e Peter Xu                       2022-08-11   54   * @SWP_MIG_DIRTY_BIT: Whether the page used to have dirty bit set (bit D)
2e3468778dbe3e Peter Xu                       2022-08-11   55   *
2e3468778dbe3e Peter Xu                       2022-08-11   56   * Note: A/D bits will be stored in migration entries iff there're enough
2e3468778dbe3e Peter Xu                       2022-08-11   57   * free bits in arch specific swp offset.  By default we'll ignore A/D bits
2e3468778dbe3e Peter Xu                       2022-08-11   58   * when migrating a page.  Please refer to migration_entry_supports_ad()
2e3468778dbe3e Peter Xu                       2022-08-11   59   * for more information.  If there're more bits besides PFN and A/D bits,
2e3468778dbe3e Peter Xu                       2022-08-11   60   * they should be reserved and always be zeros.
2e3468778dbe3e Peter Xu                       2022-08-11   61   */
2e3468778dbe3e Peter Xu                       2022-08-11   62  #define SWP_MIG_YOUNG_BIT		(SWP_PFN_BITS)
2e3468778dbe3e Peter Xu                       2022-08-11   63  #define SWP_MIG_DIRTY_BIT		(SWP_PFN_BITS + 1)
2e3468778dbe3e Peter Xu                       2022-08-11   64  #define SWP_MIG_TOTAL_BITS		(SWP_PFN_BITS + 2)
2e3468778dbe3e Peter Xu                       2022-08-11   65  
2e3468778dbe3e Peter Xu                       2022-08-11   66  #define SWP_MIG_YOUNG			BIT(SWP_MIG_YOUNG_BIT)
2e3468778dbe3e Peter Xu                       2022-08-11   67  #define SWP_MIG_DIRTY			BIT(SWP_MIG_DIRTY_BIT)
2e3468778dbe3e Peter Xu                       2022-08-11   68  
0d206b5d2e0d7d Peter Xu                       2022-08-11   69  static inline bool is_pfn_swap_entry(swp_entry_t entry);
0d206b5d2e0d7d Peter Xu                       2022-08-11   70  
099dd6878b9b12 Peter Xu                       2021-06-15   71  /* Clear all flags but only keep swp_entry_t related information */
099dd6878b9b12 Peter Xu                       2021-06-15   72  static inline pte_t pte_swp_clear_flags(pte_t pte)
099dd6878b9b12 Peter Xu                       2021-06-15   73  {
1493a1913e34b0 David Hildenbrand              2022-05-09   74  	if (pte_swp_exclusive(pte))
1493a1913e34b0 David Hildenbrand              2022-05-09   75  		pte = pte_swp_clear_exclusive(pte);
099dd6878b9b12 Peter Xu                       2021-06-15   76  	if (pte_swp_soft_dirty(pte))
099dd6878b9b12 Peter Xu                       2021-06-15   77  		pte = pte_swp_clear_soft_dirty(pte);
099dd6878b9b12 Peter Xu                       2021-06-15   78  	if (pte_swp_uffd_wp(pte))
099dd6878b9b12 Peter Xu                       2021-06-15   79  		pte = pte_swp_clear_uffd_wp(pte);
099dd6878b9b12 Peter Xu                       2021-06-15   80  	return pte;
099dd6878b9b12 Peter Xu                       2021-06-15   81  }
099dd6878b9b12 Peter Xu                       2021-06-15   82  
^1da177e4c3f41 Linus Torvalds                 2005-04-16   83  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16   84   * Store a type+offset into a swp_entry_t in an arch-independent format
^1da177e4c3f41 Linus Torvalds                 2005-04-16   85   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16   86  static inline swp_entry_t swp_entry(unsigned long type, pgoff_t offset)
^1da177e4c3f41 Linus Torvalds                 2005-04-16   87  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16   88  	swp_entry_t ret;
^1da177e4c3f41 Linus Torvalds                 2005-04-16   89  
3159f943aafdba Matthew Wilcox                 2017-11-03  @90  	ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
^1da177e4c3f41 Linus Torvalds                 2005-04-16   91  	return ret;
^1da177e4c3f41 Linus Torvalds                 2005-04-16   92  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16   93  
^1da177e4c3f41 Linus Torvalds                 2005-04-16   94  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16   95   * Extract the `type' field from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds                 2005-04-16   96   * arch-independent format
^1da177e4c3f41 Linus Torvalds                 2005-04-16   97   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16   98  static inline unsigned swp_type(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds                 2005-04-16   99  {
3159f943aafdba Matthew Wilcox                 2017-11-03  100  	return (entry.val >> SWP_TYPE_SHIFT);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  101  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  102  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  103  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16  104   * Extract the `offset' field from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds                 2005-04-16  105   * arch-independent format
^1da177e4c3f41 Linus Torvalds                 2005-04-16  106   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  107  static inline pgoff_t swp_offset(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  108  {
3159f943aafdba Matthew Wilcox                 2017-11-03 @109  	return entry.val & SWP_OFFSET_MASK;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  110  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  111  
0d206b5d2e0d7d Peter Xu                       2022-08-11  112  /*
0d206b5d2e0d7d Peter Xu                       2022-08-11  113   * This should only be called upon a pfn swap entry to get the PFN stored
0d206b5d2e0d7d Peter Xu                       2022-08-11  114   * in the swap entry.  Please refers to is_pfn_swap_entry() for definition
0d206b5d2e0d7d Peter Xu                       2022-08-11  115   * of pfn swap entry.
0d206b5d2e0d7d Peter Xu                       2022-08-11  116   */
0d206b5d2e0d7d Peter Xu                       2022-08-11  117  static inline unsigned long swp_offset_pfn(swp_entry_t entry)
0d206b5d2e0d7d Peter Xu                       2022-08-11  118  {
0d206b5d2e0d7d Peter Xu                       2022-08-11  119  	VM_BUG_ON(!is_pfn_swap_entry(entry));
0d206b5d2e0d7d Peter Xu                       2022-08-11  120  	return swp_offset(entry) & SWP_PFN_MASK;
0d206b5d2e0d7d Peter Xu                       2022-08-11  121  }
0d206b5d2e0d7d Peter Xu                       2022-08-11  122  
698dd4ba6b12e3 Matt Mackall                   2008-02-04  123  /* check whether a pte points to a swap entry */
698dd4ba6b12e3 Matt Mackall                   2008-02-04  124  static inline int is_swap_pte(pte_t pte)
698dd4ba6b12e3 Matt Mackall                   2008-02-04  125  {
21d9ee3eda7792 Mel Gorman                     2015-02-12  126  	return !pte_none(pte) && !pte_present(pte);
698dd4ba6b12e3 Matt Mackall                   2008-02-04  127  }
698dd4ba6b12e3 Matt Mackall                   2008-02-04  128  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  129  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16  130   * Convert the arch-dependent pte representation of a swp_entry_t into an
^1da177e4c3f41 Linus Torvalds                 2005-04-16  131   * arch-independent swp_entry_t.
^1da177e4c3f41 Linus Torvalds                 2005-04-16  132   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  133  static inline swp_entry_t pte_to_swp_entry(pte_t pte)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  134  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  135  	swp_entry_t arch_entry;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  136  
099dd6878b9b12 Peter Xu                       2021-06-15  137  	pte = pte_swp_clear_flags(pte);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  138  	arch_entry = __pte_to_swp_entry(pte);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  139  	return swp_entry(__swp_type(arch_entry), __swp_offset(arch_entry));
^1da177e4c3f41 Linus Torvalds                 2005-04-16  140  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  141  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  142  /*
^1da177e4c3f41 Linus Torvalds                 2005-04-16  143   * Convert the arch-independent representation of a swp_entry_t into the
^1da177e4c3f41 Linus Torvalds                 2005-04-16  144   * arch-dependent pte representation.
^1da177e4c3f41 Linus Torvalds                 2005-04-16  145   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  146  static inline pte_t swp_entry_to_pte(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  147  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  148  	swp_entry_t arch_entry;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  149  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  150  	arch_entry = __swp_entry(swp_type(entry), swp_offset(entry));
^1da177e4c3f41 Linus Torvalds                 2005-04-16  151  	return __swp_entry_to_pte(arch_entry);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  152  }
0697212a411c1d Christoph Lameter              2006-06-23  153  
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  154  static inline swp_entry_t radix_to_swp_entry(void *arg)
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  155  {
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  156  	swp_entry_t entry;
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  157  
3159f943aafdba Matthew Wilcox                 2017-11-03  158  	entry.val = xa_to_value(arg);
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  159  	return entry;
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  160  }
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  161  
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  162  static inline void *swp_to_radix_entry(swp_entry_t entry)
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  163  {
3159f943aafdba Matthew Wilcox                 2017-11-03  164  	return xa_mk_value(entry.val);
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  165  }
a2c16d6cb0e478 Hugh Dickins                   2011-08-03  166  
5042db43cc26f5 Jérôme Glisse                  2017-09-08  167  #if IS_ENABLED(CONFIG_DEVICE_PRIVATE)
4dd845b5a3e57a Alistair Popple                2021-06-30  168  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  169  {
4dd845b5a3e57a Alistair Popple                2021-06-30  170  	return swp_entry(SWP_DEVICE_READ, offset);
5042db43cc26f5 Jérôme Glisse                  2017-09-08  171  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  172  
4dd845b5a3e57a Alistair Popple                2021-06-30  173  static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  174  {
4dd845b5a3e57a Alistair Popple                2021-06-30  175  	return swp_entry(SWP_DEVICE_WRITE, offset);
5042db43cc26f5 Jérôme Glisse                  2017-09-08  176  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  177  
4dd845b5a3e57a Alistair Popple                2021-06-30  178  static inline bool is_device_private_entry(swp_entry_t entry)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  179  {
4dd845b5a3e57a Alistair Popple                2021-06-30  180  	int type = swp_type(entry);
4dd845b5a3e57a Alistair Popple                2021-06-30  181  	return type == SWP_DEVICE_READ || type == SWP_DEVICE_WRITE;
5042db43cc26f5 Jérôme Glisse                  2017-09-08  182  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  183  
4dd845b5a3e57a Alistair Popple                2021-06-30  184  static inline bool is_writable_device_private_entry(swp_entry_t entry)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  185  {
5042db43cc26f5 Jérôme Glisse                  2017-09-08  186  	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
5042db43cc26f5 Jérôme Glisse                  2017-09-08  187  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  188  
c25465eb7630ff David Hildenbrand              2025-02-10  189  static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
b756a3b5e7ead8 Alistair Popple                2021-06-30  190  {
c25465eb7630ff David Hildenbrand              2025-02-10  191  	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
b756a3b5e7ead8 Alistair Popple                2021-06-30  192  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  193  
b756a3b5e7ead8 Alistair Popple                2021-06-30  194  static inline bool is_device_exclusive_entry(swp_entry_t entry)
b756a3b5e7ead8 Alistair Popple                2021-06-30  195  {
c25465eb7630ff David Hildenbrand              2025-02-10  196  	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
b756a3b5e7ead8 Alistair Popple                2021-06-30  197  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  198  
5042db43cc26f5 Jérôme Glisse                  2017-09-08  199  #else /* CONFIG_DEVICE_PRIVATE */
4dd845b5a3e57a Alistair Popple                2021-06-30  200  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  201  {
5042db43cc26f5 Jérôme Glisse                  2017-09-08  202  	return swp_entry(0, 0);
5042db43cc26f5 Jérôme Glisse                  2017-09-08  203  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  204  
4dd845b5a3e57a Alistair Popple                2021-06-30  205  static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  206  {
4dd845b5a3e57a Alistair Popple                2021-06-30  207  	return swp_entry(0, 0);
5042db43cc26f5 Jérôme Glisse                  2017-09-08  208  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  209  
5042db43cc26f5 Jérôme Glisse                  2017-09-08  210  static inline bool is_device_private_entry(swp_entry_t entry)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  211  {
5042db43cc26f5 Jérôme Glisse                  2017-09-08  212  	return false;
5042db43cc26f5 Jérôme Glisse                  2017-09-08  213  }
5042db43cc26f5 Jérôme Glisse                  2017-09-08  214  
4dd845b5a3e57a Alistair Popple                2021-06-30  215  static inline bool is_writable_device_private_entry(swp_entry_t entry)
5042db43cc26f5 Jérôme Glisse                  2017-09-08  216  {
5042db43cc26f5 Jérôme Glisse                  2017-09-08  217  	return false;
5042db43cc26f5 Jérôme Glisse                  2017-09-08  218  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  219  
c25465eb7630ff David Hildenbrand              2025-02-10  220  static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
b756a3b5e7ead8 Alistair Popple                2021-06-30  221  {
b756a3b5e7ead8 Alistair Popple                2021-06-30  222  	return swp_entry(0, 0);
b756a3b5e7ead8 Alistair Popple                2021-06-30  223  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  224  
b756a3b5e7ead8 Alistair Popple                2021-06-30  225  static inline bool is_device_exclusive_entry(swp_entry_t entry)
b756a3b5e7ead8 Alistair Popple                2021-06-30  226  {
b756a3b5e7ead8 Alistair Popple                2021-06-30  227  	return false;
b756a3b5e7ead8 Alistair Popple                2021-06-30  228  }
b756a3b5e7ead8 Alistair Popple                2021-06-30  229  
5042db43cc26f5 Jérôme Glisse                  2017-09-08  230  #endif /* CONFIG_DEVICE_PRIVATE */
5042db43cc26f5 Jérôme Glisse                  2017-09-08  231  
0697212a411c1d Christoph Lameter              2006-06-23  232  #ifdef CONFIG_MIGRATION
0697212a411c1d Christoph Lameter              2006-06-23  233  static inline int is_migration_entry(swp_entry_t entry)
0697212a411c1d Christoph Lameter              2006-06-23  234  {
0697212a411c1d Christoph Lameter              2006-06-23 @235  	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
6c287605fd5646 David Hildenbrand              2022-05-09 @236  			swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
0697212a411c1d Christoph Lameter              2006-06-23 @237  			swp_type(entry) == SWP_MIGRATION_WRITE);
0697212a411c1d Christoph Lameter              2006-06-23  238  }
0697212a411c1d Christoph Lameter              2006-06-23  239  
4dd845b5a3e57a Alistair Popple                2021-06-30  240  static inline int is_writable_migration_entry(swp_entry_t entry)
0697212a411c1d Christoph Lameter              2006-06-23  241  {
0697212a411c1d Christoph Lameter              2006-06-23  242  	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
0697212a411c1d Christoph Lameter              2006-06-23  243  }
0697212a411c1d Christoph Lameter              2006-06-23  244  
6c287605fd5646 David Hildenbrand              2022-05-09  245  static inline int is_readable_migration_entry(swp_entry_t entry)
6c287605fd5646 David Hildenbrand              2022-05-09  246  {
6c287605fd5646 David Hildenbrand              2022-05-09  247  	return unlikely(swp_type(entry) == SWP_MIGRATION_READ);
6c287605fd5646 David Hildenbrand              2022-05-09  248  }
6c287605fd5646 David Hildenbrand              2022-05-09  249  
6c287605fd5646 David Hildenbrand              2022-05-09  250  static inline int is_readable_exclusive_migration_entry(swp_entry_t entry)
6c287605fd5646 David Hildenbrand              2022-05-09  251  {
6c287605fd5646 David Hildenbrand              2022-05-09  252  	return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE);
6c287605fd5646 David Hildenbrand              2022-05-09  253  }
6c287605fd5646 David Hildenbrand              2022-05-09  254  
4dd845b5a3e57a Alistair Popple                2021-06-30  255  static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
0697212a411c1d Christoph Lameter              2006-06-23  256  {
4dd845b5a3e57a Alistair Popple                2021-06-30  257  	return swp_entry(SWP_MIGRATION_READ, offset);
4dd845b5a3e57a Alistair Popple                2021-06-30  258  }
4dd845b5a3e57a Alistair Popple                2021-06-30  259  
6c287605fd5646 David Hildenbrand              2022-05-09  260  static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
6c287605fd5646 David Hildenbrand              2022-05-09  261  {
6c287605fd5646 David Hildenbrand              2022-05-09 @262  	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
6c287605fd5646 David Hildenbrand              2022-05-09  263  }
6c287605fd5646 David Hildenbrand              2022-05-09  264  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
