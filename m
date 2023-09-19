Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144F28DDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 21:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695159399; x=1726695399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2a9Q0CqHuF+KokNsbLBpDUcUw1le2RTcFG+HI5Deyck=;
  b=VZ1cjuDwd7G7KPi7dBn28zPURSbhXCzr/kJubmtnDEw6K8+UOIz8wX8z
   WZ08D7/oUEAWlqV2wJtB/JXmvjX8Mnw2gBLVQOLHdHA8FV5hSWJ8U876t
   Mcz/MkiZ1SIAN7OWVa9F2OCnura21dbb0J3YcfKUyWhzpWK8XOxNfEydY
   jn0juIdXjCBeC9nd2aZXJD+xr8xuf8M+RZbNoMI8LkgiPAWL8ZlLY/zwQ
   byEFQjZpV/ZptovGXW6pnkwM8zclDa0WXbxJrUOwqr6l50qPLtXbCsd03
   HRaeRdgpvEEZjUMiFUsTbHurEYjuaxe87Zysno4qhHsH/EwOosQJzUznd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382807368"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="382807368"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 14:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816599498"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816599498"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 14:36:37 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiiOQ-0007x2-32;
	Tue, 19 Sep 2023 21:36:32 +0000
Date: Wed, 20 Sep 2023 05:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5228/6333] arch/x86/net/bpf_jit_comp.c:2957:72:
 error: 'struct unwind_state' has no member named 'sp'; did you mean 'bp'?
Message-ID: <202309200500.jcqrmwKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: fd5d27b70188379bb441d404c29a0afb111e1753 [5228/6333] arch/x86: Implement arch_bpf_stack_walk
config: x86_64-randconfig-161-20230919 (https://download.01.org/0day-ci/archive/20230920/202309200500.jcqrmwKs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200500.jcqrmwKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200500.jcqrmwKs-lkp@intel.com/

Note: the linux-next/master HEAD 29e400e3ea486bf942b214769fc9778098114113 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/x86/net/bpf_jit_comp.c: In function 'arch_bpf_stack_walk':
>> arch/x86/net/bpf_jit_comp.c:2957:72: error: 'struct unwind_state' has no member named 'sp'; did you mean 'bp'?
    2957 |                 if (!addr || !consume_fn(cookie, (u64)addr, (u64)state.sp, (u64)state.bp))
         |                                                                        ^~
         |                                                                        bp


vim +2957 arch/x86/net/bpf_jit_comp.c

  2947	
  2948	void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
  2949	{
  2950	#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_FRAME_POINTER)
  2951		struct unwind_state state;
  2952		unsigned long addr;
  2953	
  2954		for (unwind_start(&state, current, NULL, NULL); !unwind_done(&state);
  2955		     unwind_next_frame(&state)) {
  2956			addr = unwind_get_return_address(&state);
> 2957			if (!addr || !consume_fn(cookie, (u64)addr, (u64)state.sp, (u64)state.bp))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
