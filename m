Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804418026
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710581446; cv=none; b=BWooZjNsB/6H2/fUcAMzV9XR8VBYE6MuEGif5xc2ijZf7uuTzB9DjAnzios73NgR2KBQA1TzObEG1q4b5O2YQjdUqllSLyng/WJjV9OfrrRGwt7Ni5vIS9XqqBw39oQ7yP9v+oEgIKZz4J0hc4QojppLAsr0pRMA4Tvh1wqmy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710581446; c=relaxed/simple;
	bh=al5/yYl8BxHjo3xeZL9hHxNpvaoNV5J+iO1Mu7DtZJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB04CS19b3tDOKmEc5hujIWBHx9E2GJ9za6ZRnqGmsnWyv7v+9oymNYLfKDyiwY9Ri/pUGln1jtHEoYwV8QIRmFZOFjRvpQracL2Fq4NffGjMJspDMV10hKmlRuniC6Yy1gM75G3iEqV1PhJMV1WsSYd0yulbUJUfBPl22utfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSMc1a11; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSMc1a11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710581444; x=1742117444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=al5/yYl8BxHjo3xeZL9hHxNpvaoNV5J+iO1Mu7DtZJE=;
  b=WSMc1a11RrVjApcGuWdlopf0jKsQTvtvfudK5YduWEKucvJ+/N9IEEUF
   7C5loj4yYB6jRJYl7zn1wcsZsckN8U8thXTxzhBbk5nlXKl5xBavmQKZI
   Kn0C+ZrLYEDUq0b0t2jOE1AmdaAa5pWkdzxdF2neR4vSzq49W9CmyIP7i
   zMVvOQtRVvMSpIBo2wM+sAzKdglti4fk1cSMtkH1Bbyp2uhBUZbDoS5Gl
   3pErWCEznGbR9PYSIZpFS+FeogUyZlK0DWqb+T/rMI59ndFF5DPladgh0
   a4jtu68mMrUR/pTo3aL0vmSf3r5Us/KSADjiH1yF09h74SOmnhGGMFqVm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="22974920"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="22974920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 02:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="50369221"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Mar 2024 02:30:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlQND-000FHl-20;
	Sat, 16 Mar 2024 09:30:39 +0000
Date: Sat, 16 Mar 2024 17:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity()
 hook
Message-ID: <202403161753.7DhSSl57-lkp@intel.com>
References: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20240315]
[cannot apply to device-mapper-dm/for-next lwn/docs-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240316-114235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1710560151-28904-13-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity() hook
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240316/202403161753.7DhSSl57-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161753.7DhSSl57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161753.7DhSSl57-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from arch/alpha/kernel/osf_sys.c:23:
>> include/linux/security.h:1506:67: error: unknown type name 'type'; did you mean 'typeof'?
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^~~~
         |                                                                   typeof
--
   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from arch/alpha/kernel/signal.c:24:
>> include/linux/security.h:1506:67: error: unknown type name 'type'; did you mean 'typeof'?
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^~~~
         |                                                                   typeof
   arch/alpha/kernel/signal.c:205:1: warning: no previous prototype for 'do_sigreturn' [-Wmissing-prototypes]
     205 | do_sigreturn(struct sigcontext __user *sc)
         | ^~~~~~~~~~~~
   arch/alpha/kernel/signal.c:233:1: warning: no previous prototype for 'do_rt_sigreturn' [-Wmissing-prototypes]
     233 | do_rt_sigreturn(struct rt_sigframe __user *frame)
         | ^~~~~~~~~~~~~~~
   arch/alpha/kernel/signal.c:523:1: warning: no previous prototype for 'do_work_pending' [-Wmissing-prototypes]
     523 | do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
         | ^~~~~~~~~~~~~~~
--
   In file included from arch/alpha/kernel/ptrace.c:16:
>> include/linux/security.h:1506:67: error: unknown type name 'type'; did you mean 'typeof'?
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^~~~
         |                                                                   typeof
   arch/alpha/kernel/ptrace.c:322:26: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
     322 | asmlinkage unsigned long syscall_trace_enter(void)
         |                          ^~~~~~~~~~~~~~~~~~~
   arch/alpha/kernel/ptrace.c:334:1: warning: no previous prototype for 'syscall_trace_leave' [-Wmissing-prototypes]
     334 | syscall_trace_leave(void)
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from arch/alpha/kernel/pci.c:25:
>> include/linux/security.h:1506:67: error: unknown type name 'type'; did you mean 'typeof'?
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^~~~
         |                                                                   typeof
   arch/alpha/kernel/pci.c:285:1: warning: no previous prototype for 'pcibios_claim_one_bus' [-Wmissing-prototypes]
     285 | pcibios_claim_one_bus(struct pci_bus *b)
         | ^~~~~~~~~~~~~~~~~~~~~


vim +1506 include/linux/security.h

  1504	
  1505	static inline int security_bdev_setintegrity(struct block_device *bdev,
> 1506						     enum lsm_intgr_type, type,
  1507						     const void *value, size_t size)
  1508	{
  1509		return 0;
  1510	}
  1511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
