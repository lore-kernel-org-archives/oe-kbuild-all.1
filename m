Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D893E3176
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033271; cv=none; b=VgALlMHnGtKaNB1WIwR8DGU9yIwkRL/PpUqxIo62Sek/5EKuLDJ+Rg0+IlgYhoXqykx9OMjm4vgW0wmJGMWO/SWWL+TlLooI+Te9SWz/KO0lrLuy6inQNPOsxVkZhzm7O4/Wif9QnjwjE8V3RY0id3t2CZNk/jkdMNsAfahBH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033271; c=relaxed/simple;
	bh=KvS83adaWOdds+7QYPB51x2PUfexp547mWHSBwZudAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/Do61j4fzfxb/EmX36DCNaT0IzCU0vrZ5qn57097RDj6O+jXiTI/MnhOjnAmeOyQ4snA/5bJLvMVMGYjOXvRaM9r8J9J4an48OQ2vJx7sTxpVf+IAUNjd6Kr12kEoQkBlAuxCLMWcy9pApSSdG8DPPduVojZqm8lSXtxldBHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTF7u8uc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTF7u8uc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787033269; x=1818569269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KvS83adaWOdds+7QYPB51x2PUfexp547mWHSBwZudAw=;
  b=BTF7u8ucSjDTM9O3iB11QBGFfGgmqFMnzSNN+alU0WDkdErM91lWaOEx
   Q5SYjKSvGwQHGwd+8i1eZjP7fCwq8cZ4oiLLBla5XMIktCrIlkRphO8zm
   XeTe/6uvIv+laEmSy6lozAln/XZN26FdePcYtE9KZtkxB/wwglFzXGXj3
   kZaWoEWmSnT/Ace3r/R9lMBGCqC4eyDXP4nOg26RY21Wa3KXiAryriTpI
   9FcOFvz/v54SFHJ01v5AXQCwQ0DrvhR3zM6J83N2L8UgIxvGDWMVISFNw
   bz/8/3FFTPaYIEsjZUM0LoSdDLmThbamcIz4CpCndbnOEbZx30XWswfpV
   w==;
X-CSE-ConnectionGUID: DR8cMggBTBG+0Hb6NT6CAg==
X-CSE-MsgGUID: nqACCcJxRWuu6Qgk7gpfYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="97852783"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="97852783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 23:07:49 -0700
X-CSE-ConnectionGUID: dm+8t8jZSLOzanmXdpgtag==
X-CSE-MsgGUID: nqfAmaKgSWSH6T5Ju2Grvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303359965"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Aug 2026 23:07:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwCzA-00000000737-0Bo8;
	Tue, 18 Aug 2026 06:07:44 +0000
Date: Tue, 18 Aug 2026 08:06:47 +0200
From: kernel test robot <lkp@intel.com>
To: Jun Miao <jun.miao@intel.com>, jarkko@kernel.org,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, kai.huang@intel.com,
	challvy.tee@gmail.com, fan.du@intel.com, jun.miao@intel.com,
	linux-kernel@vger.kernel.org, qiang.zhang@linux.dev
Subject: Re: [PATCH v2] x86/sgx: Fix RCU Tasks stalls in EPC sanitization loop
Message-ID: <202608180846.b3eJmlOU-lkp@intel.com>
References: <20260623030329.2786571-1-jun.miao@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623030329.2786571-1-jun.miao@intel.com>

Hi Jun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on tip/x86/sgx v7.2 next-20260817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jun-Miao/x86-sgx-Fix-RCU-Tasks-stalls-in-EPC-sanitization-loop/20260815-121253
base:   linus/master
patch link:    https://lore.kernel.org/r/20260623030329.2786571-1-jun.miao%40intel.com
patch subject: [PATCH v2] x86/sgx: Fix RCU Tasks stalls in EPC sanitization loop
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260818/202608180846.b3eJmlOU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180846.b3eJmlOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180846.b3eJmlOU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/sgx/main.c: In function '__sgx_sanitize_pages':
>> arch/x86/kernel/cpu/sgx/main.c:109:17: error: implicit declaration of function 'cond_resched_rcu_qs'; did you mean 'cond_resched_lock'? [-Wimplicit-function-declaration]
     109 |                 cond_resched_rcu_qs();
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 cond_resched_lock


vim +109 arch/x86/kernel/cpu/sgx/main.c

    54	
    55	/*
    56	 * Reset post-kexec EPC pages to the uninitialized state. The pages are removed
    57	 * from the input list, and made available for the page allocator. SECS pages
    58	 * prepending their children in the input list are left intact.
    59	 *
    60	 * Return 0 when sanitization was successful or kthread was stopped, and the
    61	 * number of unsanitized pages otherwise.
    62	 */
    63	static unsigned long __sgx_sanitize_pages(struct list_head *dirty_page_list)
    64	{
    65		unsigned long left_dirty = 0;
    66		struct sgx_epc_page *page;
    67		LIST_HEAD(dirty);
    68		int ret;
    69	
    70		/* dirty_page_list is thread-local, no need for a lock: */
    71		while (!list_empty(dirty_page_list)) {
    72			if (kthread_should_stop())
    73				return 0;
    74	
    75			page = list_first_entry(dirty_page_list, struct sgx_epc_page, list);
    76	
    77			/*
    78			 * Checking page->poison without holding the node->lock
    79			 * is racy, but losing the race (i.e. poison is set just
    80			 * after the check) just means __eremove() will be uselessly
    81			 * called for a page that sgx_free_epc_page() will put onto
    82			 * the node->sgx_poison_page_list later.
    83			 */
    84			if (page->poison) {
    85				struct sgx_epc_section *section = &sgx_epc_sections[page->section];
    86				struct sgx_numa_node *node = section->node;
    87	
    88				spin_lock(&node->lock);
    89				list_move(&page->list, &node->sgx_poison_page_list);
    90				spin_unlock(&node->lock);
    91	
    92				continue;
    93			}
    94	
    95			ret = __eremove(sgx_get_epc_virt_addr(page));
    96			if (!ret) {
    97				/*
    98				 * page is now sanitized.  Make it available via the SGX
    99				 * page allocator:
   100				 */
   101				list_del(&page->list);
   102				sgx_free_epc_page(page);
   103			} else {
   104				/* The page is not yet clean - move to the dirty list. */
   105				list_move_tail(&page->list, &dirty);
   106				left_dirty++;
   107			}
   108	
 > 109			cond_resched_rcu_qs();
   110		}
   111	
   112		list_splice(&dirty, dirty_page_list);
   113		return left_dirty;
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
