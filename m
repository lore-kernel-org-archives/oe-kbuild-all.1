Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346310F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745158554; cv=none; b=KPn54TfuZZr9fY5oCQQjCC3dRFW3TDZuxGBzu3XqpaQk/6LmQ8MzP+aDhG5sTUzHZpQsyc1u/vvEeTX8UQXTzuipN3aK3z+sbLnOc3e0AqxfOda3+FmMRktIuCVkhrd18deSjA8kGJmkw9QqETzcn75WgszE8CfnPRUimaWLxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745158554; c=relaxed/simple;
	bh=wInp7Wzy7ohqtinv7MePKSH8mDReqbst45MTzNg4Ve4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6fEkwNLonlrE9iZ+EhtAw0rAMhxvHVoKpP6aej1rjGHg52PHNpaWT9yelWVSMl4O8ThnD3Qm9cmxtuUCAKyyM9V9JIUgL3YN3Ds6MeBP9q+j0DQjb+XMF3UVJt9MPzyk++XZnneM0mHzCZzMZkDNREXQjvYn+ogsg3oeC0euDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QA1EEQcX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QA1EEQcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745158552; x=1776694552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wInp7Wzy7ohqtinv7MePKSH8mDReqbst45MTzNg4Ve4=;
  b=QA1EEQcXG+cbc+jHscm0NQ5mDkZ3jFJZMnZ5VgVS+unnnstqCOs1ydln
   W/ho/YCKNt/xbx2LW4C8o9DkiGDqqivcSDANokJMyozikL6ognsCo4lB5
   K6FiEjIsYEn4bjJQhpT0bOQUubD24SAKx5vxYnRn74fnWEEKlSrQUm50t
   pIgVEgQsfRlNQXjCpQw4IO8W5H6TEzntTXWRD8Gjf0k/cKW4SHUbEFqYE
   a8yOqHuo75N3r1iTYZn6iZKZ5N2dfQMkMYzsvVr7+U7wCVClVFxCE4hAk
   vbtgOtM9UyEBaTI/XEx6cYt1hbYJOla2qdn9hKDpINCIWHm0sOV5UKPl5
   A==;
X-CSE-ConnectionGUID: 6v88JJ9/QqaHwy36XiW4ow==
X-CSE-MsgGUID: +Z4KYl5YRlCuNNlRg/HwRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46722426"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46722426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 07:15:52 -0700
X-CSE-ConnectionGUID: uhQcSS4LRFm6wgaJ6fTDYw==
X-CSE-MsgGUID: 4K4hf22GTu6zsq2OZhBt3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136475450"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2025 07:15:51 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6VSW-0004gr-2G;
	Sun, 20 Apr 2025 14:15:48 +0000
Date: Sun, 20 Apr 2025 22:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination
 approach
Message-ID: <202504202116.gfxIZI0c-lkp@intel.com>
References: <20250420105524.2115690-5-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-5-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-5-rjsu26%40gmail.com
patch subject: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination approach
config: arc-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202116.gfxIZI0c-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202116.gfxIZI0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202116.gfxIZI0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_prog_load':
   kernel/bpf/syscall.c:2981:14: warning: variable 'have_termination_prog' set but not used [-Wunused-but-set-variable]
    2981 |         bool have_termination_prog = false;
         |              ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c: In function 'bpf_die':
   kernel/bpf/syscall.c:6077:29: error: storage size of 'state' isn't known
    6077 |         struct unwind_state state;
         |                             ^~~~~
   kernel/bpf/syscall.c:6094:9: error: implicit declaration of function 'unwind_start' [-Werror=implicit-function-declaration]
    6094 |         unwind_start(&state, current, regs, NULL);
         |         ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6095:16: error: implicit declaration of function 'unwind_get_return_address'; did you mean 'ftrace_return_address'? [-Werror=implicit-function-declaration]
    6095 |         addr = unwind_get_return_address(&state);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                ftrace_return_address
   kernel/bpf/syscall.c:6104:23: error: 'struct pt_regs' has no member named 'ip'; did you mean 'fp'?
    6104 |                 regs->ip = new_addr;
         |                       ^~
         |                       fp
   kernel/bpf/syscall.c:6132:17: error: implicit declaration of function 'unwind_next_frame' [-Werror=implicit-function-declaration]
    6132 |                 unwind_next_frame(&state);
         |                 ^~~~~~~~~~~~~~~~~
>> kernel/bpf/syscall.c:6077:29: warning: unused variable 'state' [-Wunused-variable]
    6077 |         struct unwind_state state;
         |                             ^~~~~
   cc1: some warnings being treated as errors


vim +/state +6077 kernel/bpf/syscall.c

  6073	
  6074	
  6075	void bpf_die(void *data)
  6076	{
> 6077		struct unwind_state state;
  6078		struct bpf_prog *prog, *patch_prog;
  6079		struct pt_regs *regs;
  6080		char str[KSYM_SYMBOL_LEN];
  6081		unsigned long addr, new_addr, bpf_loop_addr, bpf_loop_term_addr;
  6082		int cpu_id = raw_smp_processor_id();
  6083	
  6084		prog = (struct bpf_prog *)data;
  6085		patch_prog = prog->termination_states->patch_prog;
  6086	
  6087		if(!per_cpu_flag_is_true(prog->termination_states, cpu_id))
  6088			return;
  6089	
  6090		regs = &prog->termination_states->pre_execution_state[cpu_id];
  6091		bpf_loop_addr = (unsigned long)bpf_loop_proto.func;
  6092		bpf_loop_term_addr = (unsigned long)bpf_loop_termination_proto.func;
  6093	
  6094		unwind_start(&state, current, regs, NULL);
  6095		addr = unwind_get_return_address(&state);
  6096	
  6097		/* BPF programs RIP is in bpf program context when termination
  6098		 * signal raises an IPI
  6099		 */
  6100		if (is_bpf_address(prog, addr)) {
  6101			new_addr = find_offset_in_patch_prog(patch_prog, prog, addr);
  6102			if (new_addr < 0)
  6103				return;
  6104			regs->ip = new_addr;
  6105		}
  6106	
  6107		unsigned long stack_addr = regs->sp;
  6108		while (addr) {
  6109			if (is_bpf_address(prog, addr)) {
  6110				while (*(unsigned long *)stack_addr != addr) {
  6111					stack_addr += 1;
  6112				}
  6113				new_addr = find_offset_in_patch_prog(patch_prog, prog, addr);
  6114				if (new_addr < 0)
  6115					return;
  6116				*(unsigned long *)stack_addr = new_addr;
  6117			} else {
  6118				/* Handles termination non-inline bpf_loop scenario.
  6119				 * Could be modular and later extended to other iterators.
  6120				 */
  6121				const char *name = kallsyms_lookup(addr, NULL, NULL, NULL, str);
  6122				if (name) {
  6123					unsigned long lookup_addr = kallsyms_lookup_name(name);
  6124					if (lookup_addr && lookup_addr == bpf_loop_addr) {
  6125						while (*(unsigned long *)stack_addr != addr) {
  6126							stack_addr += 1;
  6127						}
  6128						*(unsigned long *)stack_addr = bpf_loop_term_addr;
  6129					}
  6130				}
  6131			}
  6132			unwind_next_frame(&state);
  6133			addr = unwind_get_return_address(&state);
  6134		}
  6135	
  6136		atomic64_dec(&prog->aux->refcnt);
  6137	
  6138		return;
  6139	}
  6140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
