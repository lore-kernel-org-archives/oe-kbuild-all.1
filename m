Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE9199236
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 02:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327141; cv=none; b=oZ9oMuMVpreEZk8MpzpZmTXKqKFiYVGXOKYMa9g4I4cdTJdeeNhgFFCVrnIk4Tt9hxqsKHJKmzEAL01VDRhrqFSt9oesWULz2dkUtq3Nrra7B1bLyiQPrPyOMrGsACSUZc3Tdxf1PahVNk1sfvVrWVR13iq3PqkRHYMqhnTNLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327141; c=relaxed/simple;
	bh=NVbYCk+1XaLMa2Cz7EaiYJaCrym7WjkEWNQN9vsG0KU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPXMozPE5c/tz6YYFdyoC7WwCwHyIpgaiGE0AhoVXeq0IXNBv/qY7iwsZgrULyyJNZYH0kTYIr8rKrlxT8SNHvHKVpTULHdzxqcZeMOTRKW9I7L7VCQWuV14sbWqT0HAKUeXCL7VnglsoecVY46c4y98BVDCpt6S30vki0GAeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG72TRh8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG72TRh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739327139; x=1770863139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVbYCk+1XaLMa2Cz7EaiYJaCrym7WjkEWNQN9vsG0KU=;
  b=NG72TRh8M425QxG00U6nCELjI5uSS8N+HnSBupvDLWf3DyYqnq3chfxU
   4gEnYQ2uDEccWDYu9kApJC0HbQVliXRlExeWBiljCxK7FoGJ6uz/VVkOO
   TTZFlXH8f+H6FwB4ZuZAdEey5/OHiT70yc0AIDJ4wmZKbgzJH7dch9TNz
   d6GtKvLTKELUzpmukwiLiGon5edtFKK0nMgWTpJbtAtThEwivvY1aVgch
   bYiYp+Z5pG5xarOI1ft3iH4eW766ZqjRucNKsqPmaVmEjBKW85ntiSRig
   y9jxM9Aowt5nKVul9but2gTyaRHBKhx4or1QuFpFV1jfkkk6YM+35HLfF
   Q==;
X-CSE-ConnectionGUID: 4nRprb/WTEOZmqRPesln2A==
X-CSE-MsgGUID: UIsUKSpIRHih8TQUmlAujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65324679"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="65324679"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 18:25:38 -0800
X-CSE-ConnectionGUID: RBbSDLLXS2GVS556ghi8RA==
X-CSE-MsgGUID: Zf7A1ubcS1OOC5MXcGM/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112675431"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2025 18:25:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti2RT-0014zx-0t;
	Wed, 12 Feb 2025 02:25:35 +0000
Date: Wed, 12 Feb 2025 10:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:pmem-on-reserve-mem-fail 9/10]
 kernel/trace/trace.c:6057:22: warning: variable 'size' set but not used
Message-ID: <202502121018.b3B9Co7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git pmem-on-reserve-mem-fail
head:   d877ee1b587be39c141df16a6f92efb0e90b30fd
commit: 521bc0e5286c93eb4be981d22a6c05043a78b555 [9/10] tracing: Update modules to persistent instances when removed
config: i386-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121018.b3B9Co7p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121018.b3B9Co7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121018.b3B9Co7p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'save_mod':
   kernel/trace/trace.c:6034:45: error: invalid use of undefined type 'struct module'
    6034 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                             ^~
   kernel/trace/trace.c:6034:51: error: 'MOD_TEXT' undeclared (first use in this function)
    6034 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                                   ^~~~~~~~
   kernel/trace/trace.c:6034:51: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c:6035:37: error: invalid use of undefined type 'struct module'
    6035 |         strscpy(entry->mod_name, mod->name);
         |                                     ^~
   include/linux/string.h:80:28: note: in definition of macro '__strscpy0'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                            ^~~
   kernel/trace/trace.c:6035:9: note: in expansion of macro 'strscpy'
    6035 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   kernel/trace/trace.c:6035:37: error: invalid use of undefined type 'struct module'
    6035 |         strscpy(entry->mod_name, mod->name);
         |                                     ^~
   include/linux/compiler.h:237:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     237 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:245:33: note: in expansion of macro '__annotated'
     245 |         __BUILD_BUG_ON_ZERO_MSG(__annotated(p, nonstring), "must be cstr (NUL-terminated)")
         |                                 ^~~~~~~~~~~
   include/linux/string.h:81:55: note: in expansion of macro '__must_be_cstr'
      81 |                                 __must_be_cstr(dst) + __must_be_cstr(src))
         |                                                       ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   kernel/trace/trace.c:6035:9: note: in expansion of macro 'strscpy'
    6035 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~
   kernel/trace/trace.c: In function 'remove_mod':
   kernel/trace/trace.c:6068:58: error: invalid use of undefined type 'struct module'
    6068 |                 if (entry->mod_addr == (unsigned long)mod->mem[MOD_TEXT].base)
         |                                                          ^~
   kernel/trace/trace.c:6068:64: error: 'MOD_TEXT' undeclared (first use in this function)
    6068 |                 if (entry->mod_addr == (unsigned long)mod->mem[MOD_TEXT].base)
         |                                                                ^~~~~~~~
>> kernel/trace/trace.c:6057:22: warning: variable 'size' set but not used [-Wunused-but-set-variable]
    6057 |         unsigned int size;
         |                      ^~~~
   kernel/trace/trace.c: At top level:
>> kernel/trace/trace.c:6051:12: warning: 'remove_mod' defined but not used [-Wunused-function]
    6051 | static int remove_mod(struct module *mod, void *data)
         |            ^~~~~~~~~~


vim +/size +6057 kernel/trace/trace.c

  6050	
> 6051	static int remove_mod(struct module *mod, void *data)
  6052	{
  6053		struct trace_array *tr = data;
  6054		struct trace_scratch *tscratch;
  6055		struct trace_mod_entry *entry;
  6056		unsigned int idx;
> 6057		unsigned int size;
  6058	
  6059		guard(mutex)(&scratch_mutex);
  6060	
  6061		tscratch = tr->scratch;
  6062		if (!tscratch)
  6063			return -1;
  6064		size = tr->scratch_size;
  6065	
  6066		for (idx = 0; idx < tscratch->nr_entries; idx++) {
  6067			entry = &tscratch->entries[idx];
> 6068			if (entry->mod_addr == (unsigned long)mod->mem[MOD_TEXT].base)
  6069				break;
  6070		}
  6071		if (idx == tscratch->nr_entries)
  6072			return -1;
  6073	
  6074		if (idx < tscratch->first_free_slot)
  6075			tscratch->first_free_slot = idx;
  6076	
  6077		entry->mod_addr = 0;
  6078		entry->mod_name[0] = '\0';
  6079	
  6080		return 0;
  6081	}
  6082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
