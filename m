Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FB1E50B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955607; cv=none; b=aCkxzcXdL7EqIFJEWee+thcdnx914i752jD3O8a1UPKHLj8KOJUrKTa+/PGRPJ2koONSTRVHipymbB9v1EsEmmwih6TlypTcHcfLnq2l5Qo7dC01icyA+MTTUUnhxcOwMNBE1XA3ZU6iIUYNY70ppKMoznWdU563MevnYPJ8MGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955607; c=relaxed/simple;
	bh=KEK1Z52SiWZrOxl42rxvjDTgNUd0J84nJdugQ1G4TS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OHrH+tQhGlK5UFbsndTWY9TE1kb7Ki3SAI5k5EYi/d9mWO7KaqGi+TT1HnwiVIg/8MwgQyTCa+e5CBiUkN5CPBnNFX+CVvgc7nzMfsmFTSqEz3YsGgcPKA1MLC6OrEQC2FtfY1qMxniSteLxOkkeZcuXNcQGvdFu6ltHH2wLm7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd809DFS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd809DFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741955606; x=1773491606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEK1Z52SiWZrOxl42rxvjDTgNUd0J84nJdugQ1G4TS0=;
  b=Sd809DFS6eYMmWY2wfuAU2+qlwR6uUQAz4QBTKGStMujfa681EXZs/8h
   6srvnbJh1TI5SujeVWy77UGU76mcBkNFa4caunwArlPReKGKIi78cZ+mf
   nembddvMBj3xtFlrhiDiJgx5Z79hn0Yl8HH5VEK6T+ttjw2PC6OULWP1L
   YEoMmeunsmITnszcO8XF+2BupMRAW/ob0Kz0voJ0pmz/LkkJAk0Xey0yY
   mTPNXNi/vLSk/D59sheeY6msPDLJWVRMQdvTOEhdSSj7jnWMi0kEJvASl
   j9NOCkPX4R/DqAK8kll2+dWEkX1MB2UHZJEXkXyg6ODVP56m3PWRgFAxe
   Q==;
X-CSE-ConnectionGUID: U8eSdMnXQx6mDcZGFl9gVA==
X-CSE-MsgGUID: Aw9NeUjST+mXhTehaeFAJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42834413"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="42834413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 05:33:26 -0700
X-CSE-ConnectionGUID: mASA2L/TRA2Os9kUacX/8Q==
X-CSE-MsgGUID: i3Th/ILGToWa5w4sxOyxbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121317003"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Mar 2025 05:33:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4Dx-000ARo-30;
	Fri, 14 Mar 2025 12:33:16 +0000
Date: Fri, 14 Mar 2025 20:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 7927/11207] kernel/trace/trace.c:6021:45: error:
 invalid use of undefined type 'struct module'
Message-ID: <202503142045.0sE1neLa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: dca91c1c54686914dec4dabea8bae4f365c02007 [7927/11207] tracing: Have persistent trace instances save module addresses
config: arm-randconfig-004-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142045.0sE1neLa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142045.0sE1neLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142045.0sE1neLa-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'save_mod':
>> kernel/trace/trace.c:6021:45: error: invalid use of undefined type 'struct module'
    6021 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                             ^~
>> kernel/trace/trace.c:6021:51: error: 'MOD_TEXT' undeclared (first use in this function)
    6021 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                                   ^~~~~~~~
   kernel/trace/trace.c:6021:51: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c:6022:37: error: invalid use of undefined type 'struct module'
    6022 |         strscpy(entry->mod_name, mod->name);
         |                                     ^~
   include/linux/string.h:80:28: note: in definition of macro '__strscpy0'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                            ^~~
   kernel/trace/trace.c:6022:9: note: in expansion of macro 'strscpy'
    6022 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/arm/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   kernel/trace/trace.c:6022:37: error: invalid use of undefined type 'struct module'
    6022 |         strscpy(entry->mod_name, mod->name);
         |                                     ^~
   include/linux/compiler.h:197:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:211:33: note: in expansion of macro '__annotated'
     211 |         __BUILD_BUG_ON_ZERO_MSG(__annotated(p, nonstring), "must be cstr (NUL-terminated)")
         |                                 ^~~~~~~~~~~
   include/linux/string.h:81:55: note: in expansion of macro '__must_be_cstr'
      81 |                                 __must_be_cstr(dst) + __must_be_cstr(src))
         |                                                       ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   kernel/trace/trace.c:6022:9: note: in expansion of macro 'strscpy'
    6022 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~
   In file included from kernel/trace/trace.c:8747:
   kernel/trace/trace_selftest.c: In function 'trace_selftest_function_regs':
   kernel/trace/trace_selftest.c:606:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     606 |         int len;
         |             ^~~


vim +6021 kernel/trace/trace.c

  6001	
  6002	static int save_mod(struct module *mod, void *data)
  6003	{
  6004		struct trace_array *tr = data;
  6005		struct trace_scratch *tscratch;
  6006		struct trace_mod_entry *entry;
  6007		unsigned int size;
  6008	
  6009		tscratch = tr->scratch;
  6010		if (!tscratch)
  6011			return -1;
  6012		size = tr->scratch_size;
  6013	
  6014		if (struct_size(tscratch, entries, tscratch->nr_entries + 1) > size)
  6015			return -1;
  6016	
  6017		entry = &tscratch->entries[tscratch->nr_entries];
  6018	
  6019		tscratch->nr_entries++;
  6020	
> 6021		entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
  6022		strscpy(entry->mod_name, mod->name);
  6023	
  6024		return 0;
  6025	}
  6026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
