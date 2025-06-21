Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5492F24
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 03:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750477682; cv=none; b=OFGfQLal0go+PjDM535jmOR45CDDnKZA3pSsY6Da9JW4AHgY7hJhdv5LTpExem3eJERfV+rmmAkphhiROY24N3oIyOyxK0Ro4oyl+kJnFFZ022z9mU+aXMGqOKuTZ3bqMO6W5H39Ga3vM5e963HQadU7yG6DMnXWL+JJFxapNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750477682; c=relaxed/simple;
	bh=AsMwQXXv2ZAUHRlRoPgG7B5iNuniNjXpdcSeW8Vq2nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVR8R8Tv7uBQbBUbddCukHIyCrlyBPTM2eMOKyAiyYoW9gtGGhZHcq1TsK54fLKiXAeKhqPsZG8m591GZIJunT6Yy63mmHY13BvtEaWzzo5Yp9VH4W3tDGA8YucwKFbzBq4QDmtH34pwwhpUSzfSWyApIT5h1JgViSMCTCglG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZ7im2uy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZ7im2uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750477680; x=1782013680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsMwQXXv2ZAUHRlRoPgG7B5iNuniNjXpdcSeW8Vq2nk=;
  b=IZ7im2uyzQpzZcHsUi89ghraYb+IAQeD8RnpiqeZOpfpQD/48+q3LxX8
   6bGTwf1CdAYTBMObo+gA55Cx1YaAjWGbomEBb9uEJ+IPVe5zes1vWgXmW
   sHHtFUvH3ikjdU4yBRu8+NdsQfeDlTtDRf44NaSHap9nXIO2V+AoNeqbF
   5tnMVlvvvnlZwLRJnhfFkn59Yk9hKJSbyid4sZVbktvkDE6FOkKo++FHR
   qXhlD0miaQIKkTTWfDAta4WJrCmXB0+sUtgksM+ZyVw6bropzQUlsh0Jz
   YaMgUlS83SgE/cqzIPBNZsn2xUfqT+VSTka8WEphZIMsZw9rzO/LtUXoK
   Q==;
X-CSE-ConnectionGUID: Bcaj+Y24Txqb6QG8CyO00Q==
X-CSE-MsgGUID: UNtYV3TKT66c/ha1XQfViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63793682"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="63793682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 20:48:00 -0700
X-CSE-ConnectionGUID: s6wcaGf4TbSiqx9zFlh+dw==
X-CSE-MsgGUID: lnNyrdmCT5K/XZkmUgeMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="151608295"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2025 20:47:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSpCu-000MLB-32;
	Sat, 21 Jun 2025 03:47:56 +0000
Date: Sat, 21 Jun 2025 11:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 9/9] kernel/bpf/trampoline.c:174:50:
 error: 'struct bpf_trampoline' has no member named 'fops'
Message-ID: <202506211156.flFZaLkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   35d06af545c69978148f7e43479a888892de1ed1
commit: 35d06af545c69978148f7e43479a888892de1ed1 [9/9] bpf: Remove ftrace_ops from bpf_trampoline object
config: arm-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250621/202506211156.flFZaLkB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211156.flFZaLkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506211156.flFZaLkB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/trampoline.c:6:
   include/linux/ftrace.h:567:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     567 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:572:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     572 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:577:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     577 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c: In function 'unregister_fentry':
>> kernel/bpf/trampoline.c:174:50: error: 'struct bpf_trampoline' has no member named 'fops'
     174 |                 ret = unregister_ftrace_direct(tr->fops, (unsigned long) ip, (long)old_addr, false);
         |                                                  ^~
   kernel/bpf/trampoline.c: In function 'modify_fentry':
   kernel/bpf/trampoline.c:188:46: error: 'struct bpf_trampoline' has no member named 'fops'
     188 |                 ret = modify_ftrace_direct(tr->fops, (unsigned long) ip, (long)new_addr, lock_direct_mutex);
         |                                              ^~
   kernel/bpf/trampoline.c: In function 'register_fentry':
   kernel/bpf/trampoline.c:207:48: error: 'struct bpf_trampoline' has no member named 'fops'
     207 |                 ret = register_ftrace_direct(tr->fops, (unsigned long)ip, (long)new_addr);
         |                                                ^~


vim +174 kernel/bpf/trampoline.c

fec56f5890d93fc Alexei Starovoitov 2019-11-14  167  
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  168  static int unregister_fentry(struct bpf_trampoline *tr, void *old_addr)
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  169  {
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  170  	void *ip = tr->func.addr;
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  171  	int ret;
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  172  
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  173  	if (tr->func.ftrace_managed)
6f127a5412dfe20 Jiri Olsa          2025-06-12 @174  		ret = unregister_ftrace_direct(tr->fops, (unsigned long) ip, (long)old_addr, false);
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  175  	else
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  176  		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, NULL);
861de02e5f3f2a1 Jiri Olsa          2021-03-26  177  
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  178  	return ret;
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  179  }
b91e014f078e2e4 Alexei Starovoitov 2019-12-08  180  

:::::: The code at line 174 was first introduced by commit
:::::: 6f127a5412dfe2099c442ff9ed197cbfa778c4a0 hash followups

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Jiri Olsa <jolsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
