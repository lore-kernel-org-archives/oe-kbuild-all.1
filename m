Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D1474BED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739324617; cv=none; b=BSjSQlmgq97CeSAI1TDkh5R/LGakRGqZMN6Kzq6IJNITs47j43shtLqmcNfrnJASjcrUVDGaUNVRAArIJ4Om1l0Cm2z4h2BwhAXsRWNMpm1rboCsru6jHoPqrGF5BIE3iDYXl4dLnxgGT88pvgnZtDKK37AoG658sjGb6NmpaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739324617; c=relaxed/simple;
	bh=8NBghPlRja4inMT9Uw66h0twdpn4WC39sIUdmybBzRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILjzNVpuQmNuFZakIUuCKVezAbl4lh0g/Y7jqgLrGe+UWWvt+twmOEtyeEc8H4UptMQvv/JqI8qlNIkVel1VS05BkqGygB4N1iaoVanrHAiyICgyXkPkuQ4r8/dyWDX9ijfkMNoKrGVYtEvam8nBxEogjUQchMeoQ8I836ZCC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXx93bYd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXx93bYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739324616; x=1770860616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NBghPlRja4inMT9Uw66h0twdpn4WC39sIUdmybBzRg=;
  b=eXx93bYd2yffZ9BWjlIEKROrYXYM4Jme7NtPbLUyhZUsp2kuAtanz8cw
   QF93k5gyDRmPlo4yxjLi7Lw0Gj2zhYn0Kwz5Ciro8NUKFQlvxyOenbLDb
   diszotKCYjLzRf/mvxhqYBx+/uAeqb215A9Ll+9by0L5Up9jRP2qvwXTi
   w8eii1Y0novOTPpCxnFf9x6v7e0qhmlphbNXZyvkwH+I8GrwSHcVZbSBY
   efhYzkanVyYB0JpR/TrbRmPZifFKBe8MdVN+j31cwVIjzCPpA3GLVnRBN
   s2Hw2uEFzUvLoWtRbyDKAS+b7fwOGA31wIdakJfHIY59rFPqrpjQgVHNR
   w==;
X-CSE-ConnectionGUID: lYZtbCTqQoG8/1WAiSyKLg==
X-CSE-MsgGUID: 6ABoH1kdQVaBLlYWcl+0Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50951378"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50951378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:43:35 -0800
X-CSE-ConnectionGUID: DmCV5SbLSk+RadIc1Famww==
X-CSE-MsgGUID: oJ8UAsDNSoiw9zVutEooNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117302766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 17:43:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1mk-0014x4-2y;
	Wed, 12 Feb 2025 01:43:30 +0000
Date: Wed, 12 Feb 2025 09:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:pmem-on-reserve-mem-fail 6/10]
 kernel/trace/trace.c:6027:45: error: invalid use of undefined type 'struct
 module'
Message-ID: <202502120949.IROrt3s0-lkp@intel.com>
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
commit: 2619aa2c2e2767ba8b87e26deac031e4f44d49cc [6/10] tracing: Have persistent trace instances save module addresses
config: i386-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120949.IROrt3s0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120949.IROrt3s0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120949.IROrt3s0-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'save_mod':
>> kernel/trace/trace.c:6027:45: error: invalid use of undefined type 'struct module'
    6027 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                             ^~
>> kernel/trace/trace.c:6027:51: error: 'MOD_TEXT' undeclared (first use in this function)
    6027 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                                   ^~~~~~~~
   kernel/trace/trace.c:6027:51: note: each undeclared identifier is reported only once for each function it appears in
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
   kernel/trace/trace.c:6028:37: error: invalid use of undefined type 'struct module'
    6028 |         strscpy(entry->mod_name, mod->name);
         |                                     ^~
   include/linux/string.h:80:28: note: in definition of macro '__strscpy0'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                            ^~~
   kernel/trace/trace.c:6028:9: note: in expansion of macro 'strscpy'
    6028 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   kernel/trace/trace.c:6028:37: error: invalid use of undefined type 'struct module'
    6028 |         strscpy(entry->mod_name, mod->name);
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
   kernel/trace/trace.c:6028:9: note: in expansion of macro 'strscpy'
    6028 |         strscpy(entry->mod_name, mod->name);
         |         ^~~~~~~


vim +6027 kernel/trace/trace.c

  6007	
  6008	static int save_mod(struct module *mod, void *data)
  6009	{
  6010		struct trace_array *tr = data;
  6011		struct trace_scratch *tscratch;
  6012		struct trace_mod_entry *entry;
  6013		unsigned int size;
  6014	
  6015		tscratch = tr->scratch;
  6016		if (!tscratch)
  6017			return -1;
  6018		size = tr->scratch_size;
  6019	
  6020		if (struct_size(tscratch, entries, tscratch->nr_entries + 1) > size)
  6021			return -1;
  6022	
  6023		entry = &tscratch->entries[tscratch->nr_entries];
  6024	
  6025		tscratch->nr_entries++;
  6026	
> 6027		entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
  6028		strscpy(entry->mod_name, mod->name);
  6029	
  6030		return 0;
  6031	}
  6032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
