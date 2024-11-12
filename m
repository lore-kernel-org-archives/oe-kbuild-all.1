Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E881F77A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731409314; cv=none; b=Qy1KPDRStdmz05mJv7xSFQxLqg/DuI7xf4jbVXSgvLWgS9qqVDOj/exCJdh5rdE5Te05jDWdlV/Xb869B+qMjmTp1u19K+k7aB7nHQVbRx2/i0EvFmrWg7PGTo3BxZKk9EqpBkgr/L69pv2MKaXRiF+UD+lUpMNEg+iqUyGMUGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731409314; c=relaxed/simple;
	bh=7E0NSXMIJz9HuAzLZ0FouCKApjmOcCmbkJjyv+pjarw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFX5wKQFT+/rd/3AwFIkGElr+h7thGxDXSl70KCtxscFLschdcdUEF1Ed/XjM0NKWbywqYIN7RKOXg3SQVIFSiNxHQ71RFsIn6eBT5Tla1g5m/NwBc6ttUpOWxr2epGWFKuqsCLIbKNiFgj9z22oX+3hyi1rgWkdRbixLPgjkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3eF3AqZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3eF3AqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731409312; x=1762945312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7E0NSXMIJz9HuAzLZ0FouCKApjmOcCmbkJjyv+pjarw=;
  b=M3eF3AqZb2eilpOCSUc/Q97VHQOyoKXJUH+HYn48FwrnTJ2RqTrVTvW+
   sIk8ax+nTVSPiQ6rhq0sWOUGZCzi9djLWgR9E2JDsGpWtCx05wTmwebS0
   MOIIpKo26lUksaM1gvF3fVKg8qTJ8COomCrEi27+d76d0C94dtT1ML9Sf
   J4HiHST1SOYLZ0QuM9itNqUKvXkiiRQXbJS6zIhxjiVVa4o04CAIGyh39
   DDdWs4YJGmEA0BEp7Nm4ZhIszraLgF/R/HyM0q9t0JXC1g6qCrtApgDVn
   ddfkbltp1iQF2QPZOs49VCHRtMWj3fe3RycF6zB7iBt4oALJqq27GxdYb
   A==;
X-CSE-ConnectionGUID: p/gnBe+3QMOTwEJMMBkHTw==
X-CSE-MsgGUID: t3mU+oJrQ3SDFTgSoSfPqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31003960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31003960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:01:52 -0800
X-CSE-ConnectionGUID: oQBSbn/FQZ6W5xptscsF7g==
X-CSE-MsgGUID: Qe2dkwpLQqOlwqw62eLlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87822409"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2024 03:01:38 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAoeO-000193-0B;
	Tue, 12 Nov 2024 11:01:36 +0000
Date: Tue, 12 Nov 2024 19:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 10/13] x86/um: nommu: signal handling
Message-ID: <202411121813.Hw3xdCby-lkp@intel.com>
References: <5a769da2dcc8e7f9b89fbdbc4bccd0b8a1660309.1731290567.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a769da2dcc8e7f9b89fbdbc4bccd0b8a1660309.1731290567.git.thehajime@gmail.com>

Hi Hajime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on next-20241112]
[cannot apply to kees/for-next/execve uml/fixes linus/master v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hajime-Tazaki/fs-binfmt_elf_efpic-add-architecture-hook-elf_arch_finalize_exec/20241111-182943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/5a769da2dcc8e7f9b89fbdbc4bccd0b8a1660309.1731290567.git.thehajime%40gmail.com
patch subject: [RFC PATCH v2 10/13] x86/um: nommu: signal handling
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411121813.Hw3xdCby-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121813.Hw3xdCby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121813.Hw3xdCby-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/um/os-Linux/signal.c: In function 'hard_handler':
>> arch/um/os-Linux/signal.c:202:13: warning: variable 'is_segv' set but not used [-Wunused-but-set-variable]
     202 |         int is_segv = 0;
         |             ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/is_segv +202 arch/um/os-Linux/signal.c

   196	
   197	static void hard_handler(int sig, siginfo_t *si, void *p)
   198	{
   199		ucontext_t *uc = p;
   200		mcontext_t *mc = &uc->uc_mcontext;
   201		unsigned long pending = 1UL << sig;
 > 202		int is_segv = 0;
   203	
   204		do {
   205			int nested, bail;
   206	
   207			/*
   208			 * pending comes back with one bit set for each
   209			 * interrupt that arrived while setting up the stack,
   210			 * plus a bit for this interrupt, plus the zero bit is
   211			 * set if this is a nested interrupt.
   212			 * If bail is true, then we interrupted another
   213			 * handler setting up the stack.  In this case, we
   214			 * have to return, and the upper handler will deal
   215			 * with this interrupt.
   216			 */
   217			bail = to_irq_stack(&pending);
   218			if (bail)
   219				return;
   220	
   221			nested = pending & 1;
   222			pending &= ~1;
   223	
   224			while ((sig = ffs(pending)) != 0){
   225				sig--;
   226				is_segv = (sig == SIGSEGV) ? 1 : 0;
   227				pending &= ~(1 << sig);
   228				(*handlers[sig])(sig, (struct siginfo *)si, mc);
   229			}
   230	
   231			/*
   232			 * Again, pending comes back with a mask of signals
   233			 * that arrived while tearing down the stack.  If this
   234			 * is non-zero, we just go back, set up the stack
   235			 * again, and handle the new interrupts.
   236			 */
   237			if (!nested)
   238				pending = from_irq_stack(nested);
   239		} while (pending);
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
