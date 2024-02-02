Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F77E102
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706885311; cv=none; b=BCIHgpNw21MqGJ05/j9WbUkYtJHZfV4maBx2AMmqgzXnh5LN8n+igtUR4kOAfP0RwkarfeeehCq64rx24eTqV27caLsBy3g6FQkewAy2dvFmtk1JbzP4vRWveZTlBjS+w9l4CfNzXbLYAh/QiFIMVE69hiK6/r3jT6cqpLIE/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706885311; c=relaxed/simple;
	bh=RBEe6zgdBiEclgiZlXWug4HT58kpehNG/ck8cKHtp1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzclVwtnQxs/PC7XIJ6CoW3DWFm22A/MrRlmQ5rnPFdBsVmolIjENhTXDHngEwRNiA9QY3CGo0Ohuc36VRfUrel5RbJ/4Xe1hXDniT/fROukxX2f0Ro7fpvzxqWXP02rYprNztJyb4nmEpG/rsVRwZCnsJw8P6Q4QI17XBvVxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8d4Pote; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8d4Pote"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706885310; x=1738421310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBEe6zgdBiEclgiZlXWug4HT58kpehNG/ck8cKHtp1w=;
  b=a8d4PotejLG3k7OFOpBsuJEvOWIkQscp3gEJ8A5H4qnWph0MVn3qCX1J
   OgLonXpnjW5pLfv24phcbwXmBSL7jx2QUTrGbZHIsgyDk0B0Z4+N/LBfC
   0hOAmRJtZjR/k9yhsUeuW1nb9V/5iNXrN7Qtjj6ZuW8JDvksLpa5GQUmA
   rHM4smXey4Y5bpH8ANBjzJVxS+7nnxrakU/Gm679+NNznWABchYaxEP1L
   BQgY5XJrKRURL+5KooknG1Sz2BJ2f+HR0REVyp6xpg3Tm6/ZSABX43W3H
   AXLnIZruDqqcgyHTPbUjcavOpKdzITqPm/MEBpW0svaIyvnFQcJbI87mV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="332014"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="332014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 06:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="297255"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2024 06:48:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVuq9-0003xf-39;
	Fri, 02 Feb 2024 14:48:25 +0000
Date: Fri, 2 Feb 2024 22:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v12 04/20] ipe: add LSM hooks on execution and kernel
 read
Message-ID: <202402022217.BvClYUqt-lkp@intel.com>
References: <1706654228-17180-5-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1706654228-17180-5-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on lwn/docs-next linus/master v6.8-rc2 next-20240202]
[cannot apply to device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240131-064224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1706654228-17180-5-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v12 04/20] ipe: add LSM hooks on execution and kernel read
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240202/202402022217.BvClYUqt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022217.BvClYUqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022217.BvClYUqt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/hooks.c:51: warning: Function parameter or struct member '__always_unused' not described in 'ipe_mmap_file'
   security/ipe/hooks.c:51: warning: Excess function parameter 'reqprot' description in 'ipe_mmap_file'
>> security/ipe/hooks.c:79: warning: Function parameter or struct member '__always_unused' not described in 'ipe_file_mprotect'
   security/ipe/hooks.c:79: warning: Excess function parameter 'reqprot' description in 'ipe_file_mprotect'


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
