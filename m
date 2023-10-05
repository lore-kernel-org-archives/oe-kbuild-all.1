Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC063CD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZloD5H7J"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696494338; x=1728030338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKhLARZiUvJ+wpcP+I6HkxN/Ik9YTHL9KHhP3Epyxpo=;
  b=ZloD5H7J+ottw+wLzbtTMei2hDAde/NFzBWc4+/WPwhPptnKMaoIMniA
   TKk8lELJt0kd+9316kwwnyqFU9+dGNviqTmAHfAcZjk92dxQ0iCqdsJzk
   kAiBz4eXcNNd72b2KGIOskq7Usl/q/IqbPjOvXivK2zeYfWP0nALvZ+Ni
   TEn9D5cTEuGrg4j3RWZS0/8ns11QPdRT7f2YURmJGToI5rlF1M6FiqlSw
   M8zAvmjA0YmgkVCkz1NuFDBrmC0pU9rIcgYglR29DvkI73i8lBDRrjDJW
   GLvy/44/SbU8OPtigSfLLowyQPGI9POJxPDxna+cu7Ety/1whPHyA6217
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447623876"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="447623876"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 01:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817490701"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="817490701"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2023 01:25:35 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoJfp-000LCA-0N;
	Thu, 05 Oct 2023 08:25:33 +0000
Date: Thu, 5 Oct 2023 16:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v11 04/19] ipe: add LSM hooks on execution and kernel
 read
Message-ID: <202310051601.vuZh1VMf-lkp@intel.com>
References: <1696457386-3010-5-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696457386-3010-5-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20231005-061243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1696457386-3010-5-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v11 04/19] ipe: add LSM hooks on execution and kernel read
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051601.vuZh1VMf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051601.vuZh1VMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051601.vuZh1VMf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/hooks.c:51: warning: Function parameter or member '__always_unused' not described in 'ipe_mmap_file'
>> security/ipe/hooks.c:51: warning: Excess function parameter 'reqprot' description in 'ipe_mmap_file'
>> security/ipe/hooks.c:79: warning: Function parameter or member '__always_unused' not described in 'ipe_file_mprotect'
>> security/ipe/hooks.c:79: warning: Excess function parameter 'reqprot' description in 'ipe_file_mprotect'


vim +51 security/ipe/hooks.c

    33	
    34	/**
    35	 * ipe_mmap_file - ipe security hook function for mmap check.
    36	 * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
    37	 * @reqprot: The requested protection on the mmap, passed from usermode.
    38	 * @prot: The effective protection on the mmap, resolved from reqprot and
    39	 *	  system configuration.
    40	 * @flags: Unused.
    41	 *
    42	 * This hook is called when a file is loaded through the mmap
    43	 * family of system calls.
    44	 *
    45	 * Return:
    46	 * * 0	- OK
    47	 * * !0	- Error
    48	 */
    49	int ipe_mmap_file(struct file *f, unsigned long reqprot __always_unused,
    50			  unsigned long prot, unsigned long flags)
  > 51	{
    52		struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
    53	
    54		if (prot & PROT_EXEC) {
    55			build_eval_ctx(&ctx, f, IPE_OP_EXEC);
    56			return ipe_evaluate_event(&ctx);
    57		}
    58	
    59		return 0;
    60	}
    61	
    62	/**
    63	 * ipe_file_mprotect - ipe security hook function for mprotect check.
    64	 * @vma: Existing virtual memory area created by mmap or similar.
    65	 * @reqprot: The requested protection on the mmap, passed from usermode.
    66	 * @prot: The effective protection on the mmap, resolved from reqprot and
    67	 *	  system configuration.
    68	 *
    69	 * This LSM hook is called when a mmap'd region of memory is changing
    70	 * its protections via mprotect.
    71	 *
    72	 * Return:
    73	 * * 0	- OK
    74	 * * !0	- Error
    75	 */
    76	int ipe_file_mprotect(struct vm_area_struct *vma,
    77			      unsigned long reqprot __always_unused,
    78			      unsigned long prot)
  > 79	{
    80		struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
    81	
    82		/* Already Executable */
    83		if (vma->vm_flags & VM_EXEC)
    84			return 0;
    85	
    86		if (prot & PROT_EXEC) {
    87			build_eval_ctx(&ctx, vma->vm_file, IPE_OP_EXEC);
    88			return ipe_evaluate_event(&ctx);
    89		}
    90	
    91		return 0;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
