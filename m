Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88C13E021
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711496889; cv=none; b=o/Zev+SyhQ4wJSw7ZiIbpct6rWqHIpZA4x2aupDQA0nI8LkfKf6mZFp2BPoxtxr5Q3418ugTECwhgZYHBlAIeKX1sSV3OmjuF6bwTgYRCdi29/dU6Jl0VxhSFu5Fq7OJWaEVTChf/OxSsjtNN4C1fbJ7x4K6OI95G4ZySMfx/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711496889; c=relaxed/simple;
	bh=LmSk92sa97yJt2wAwBUahWqVMYh8LqDXLUnXKgl4xh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km/gz4v/+ZC1YBQtbMUpIwq/Ukc7w+nYo/QAji8b61TRpdT9aSEexS5/LXo6vVyDS++WI2bBYZfRw70kSVYSF2rNhFt2v4oamv49ULcRfpMNGeeKVd4nJwFxG8pCzILvQ47A8V8QdSlWAr7Vnu6chFDhGze8ZaHrPFT+518JOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtWiDxmJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtWiDxmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711496887; x=1743032887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LmSk92sa97yJt2wAwBUahWqVMYh8LqDXLUnXKgl4xh8=;
  b=XtWiDxmJhxoC+lEQSn/+ueO50/9W8g7qoy3Kz28NAQLsXhqXrA/mcYRs
   ILlvh8ra7UqJx9x/4MohFL/EpqcU6eHbTlPpNpFl9G/eyzgDZGLOm25rx
   Yd2pIHbbc+vmw8syxIw4FhOCw+wzNgX3viafeYKS8F+7ojHRR553DyEZJ
   8JHRoHMLcrdFM7eAwxpYH5Z3n8ecjvmBlaeUtEzSNJQZAxgSYjYv1Oeam
   DZe3TbttGSoeKZvtGg6kQn9o6dE6eMYfuGoGzILvjFI55TAzXgYcttKzN
   NH9j+ukxNXTiTQrXHE8Cg+MNOphY+q9kmr1h5XPP8ShIyP6gYVhHtAlyo
   Q==;
X-CSE-ConnectionGUID: k4w+T7HgRAK9GAOdpgiuOw==
X-CSE-MsgGUID: bLW/Hh0mSRi+8OqIpOjoEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6442249"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6442249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 16:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="15962272"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2024 16:48:05 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpGWR-0000Y2-00;
	Tue, 26 Mar 2024 23:48:03 +0000
Date: Wed, 27 Mar 2024 07:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/1] x86/pkeys: update PKRU to enable pkey 0
 before XSAVE
Message-ID: <202403270713.CDQA9ROT-lkp@intel.com>
References: <20240321215622.3396410-2-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321215622.3396410-2-aruna.ramakrishna@oracle.com>

Hi Aruna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master tip/auto-latest linus/master v6.9-rc1 next-20240326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aruna-Ramakrishna/x86-pkeys-update-PKRU-to-enable-pkey-0-before-XSAVE/20240322-055950
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240321215622.3396410-2-aruna.ramakrishna%40oracle.com
patch subject: [RFC PATCH v2 1/1] x86/pkeys: update PKRU to enable pkey 0 before XSAVE
config: x86_64-randconfig-123-20240326 (https://download.01.org/0day-ci/archive/20240327/202403270713.CDQA9ROT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270713.CDQA9ROT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270713.CDQA9ROT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/fpu/signal.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:85:24: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/kernel/fpu/signal.c:80:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct xregs_state *xsave @@     got struct xregs_state [noderef] __user *buf @@
   arch/x86/kernel/fpu/signal.c:80:34: sparse:     expected struct xregs_state *xsave
   arch/x86/kernel/fpu/signal.c:80:34: sparse:     got struct xregs_state [noderef] __user *buf
   arch/x86/include/asm/uaccess_64.h:85:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:85:24: sparse: sparse: cast removes address space '__user' of expression

vim +80 arch/x86/kernel/fpu/signal.c

    65	
    66	/*
    67	 * Update the value of PKRU register that was already pushed
    68	 * onto the signal frame.
    69	 */
    70	static inline int
    71	__update_pkru_in_sigframe(struct xregs_state __user *buf, u32 pkru)
    72	{
    73		int err = -EFAULT;
    74		struct _fpx_sw_bytes fx_sw;
    75		struct pkru_state *pk = NULL;
    76	
    77		if (unlikely(!check_xstate_in_sigframe((void __user *) buf, &fx_sw)))
    78			goto out;
    79	
  > 80		pk = get_xsave_addr_user(buf, XFEATURE_PKRU);
    81		if (!pk || !user_write_access_begin(buf, sizeof(struct xregs_state)))
    82			goto out;
    83		unsafe_put_user(pkru, (unsigned int __user *) pk, uaccess_end);
    84	
    85		err = 0;
    86	uaccess_end:
    87		user_access_end();
    88	out:
    89		return err;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
