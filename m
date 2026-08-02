Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D252AE76
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 21:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704841; cv=none; b=CRuUj/a0CYmY9fLJdZ5IbEYfkmOgVjHKnqmVfZBhrvWvf7gFOJmOmvmWWGj2N0YJnh6jCX3YpwUmO6oQ9z9Xi3az+iHK+SOfled/0/OTNpGPlEwJZY3w5jrPFRxuBe+As1ABDPCd1i18G7L7caOfbfXoy2WZZIppyeAwqOVWgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704841; c=relaxed/simple;
	bh=46aNJD/mlIlgKok5hQ/LJ/ltlkF0C+U38DLNJRAUbn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b+lt3FBM/Cyu4MZ+RJQB9SieanRwjYEo21Tz020lMDggGgWXkWnDivaK+4gjEuSihOuNzIxrjpkUVMcxiiq3HfCRxPKfxEer5HkNTpbf8gqQ/NrxVn8ZSQ7UjC4eZfUL72wcljRK0sU6gMP2P+++TZ5MvaGNxZBlAvxrH/1l67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu3IQ8qC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu3IQ8qC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785704840; x=1817240840;
  h=date:from:to:cc:subject:message-id;
  bh=46aNJD/mlIlgKok5hQ/LJ/ltlkF0C+U38DLNJRAUbn8=;
  b=Vu3IQ8qCbN+tCTx5TOzRWOYLFe6SBOxx7z5boavmloP6hUxMeubCWOJz
   D7sMs0bvvHfDgWbpx54qkQTzKfcRhe6ASB1oyfDBZQgT8vwpFyHN/GVe9
   ezP3GzDxXVI2tNjPQ7EdAQ7RXWG9yPa2PfQGtekOTJtRka9sArbNGvDnX
   DYtBN08VFFVQdLKFWk/xJBeb/LsVtZHDJ5bHLmhKMq0/nagsst00+nBqj
   dD7xN4/JF0kVGlL7228a9WK20HEpBcPhNJbrMM/hiVb4Su+/OLGLvOcFc
   ZL8rsWEl19UpJqXSnhMdT/1IwdqVoVYX4+wrcJOJD8g5xcIxD04uSP8DT
   g==;
X-CSE-ConnectionGUID: cpBBPlGDTKapM/CKS+bdwQ==
X-CSE-MsgGUID: i+KeU5iaSIKZ4nVqkgzUVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96907539"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="96907539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 14:07:19 -0700
X-CSE-ConnectionGUID: FntQnKfCQq2vUQODmwQ35w==
X-CSE-MsgGUID: moKSpB0HRcmkQxzp6tH1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="259817857"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2026 14:07:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqdOt-000000005XR-1fNX;
	Sun, 02 Aug 2026 21:07:15 +0000
Date: Mon, 03 Aug 2026 05:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/wprobe-v2 8/11]
 kernel/trace/trace_wprobe.c:230:16: error: assignment from pointer to
 non-enclosed address space
Message-ID: <202608030531.NHDXx42Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/wprobe-v2
head:   a4397d5c0abf35acc79a3324139364deaf5883ec
commit: d83c23ec2a39f1ae346bbce351cb004be5c58c1e [8/11] tracing: wprobe: Add wprobe event trigger
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608030531.NHDXx42Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030531.NHDXx42Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608030531.NHDXx42Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_wprobe.c: In function 'trace_wprobe_update_local':
>> kernel/trace/trace_wprobe.c:230:16: error: assignment from pointer to non-enclosed address space
     230 |         pevent = READ_ONCE(tw->bp_event);
         |                ^
   kernel/trace/trace_wprobe.c:230:16: note: expected 'struct perf_event **' but pointer is of type 'struct perf_event * __seg_fs*'
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:593,
                    from arch/x86/include/asm/current.h:11,
                    from include/linux/sched.h:12,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from include/linux/hw_breakpoint.h:5,
                    from kernel/trace/trace_wprobe.c:12:
>> include/linux/percpu-defs.h:221:45: error: initialization from pointer to non-enclosed address space
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                             ^
   include/linux/percpu-defs.h:252:9: note: in expansion of macro '__verify_pcpu_ptr'
     252 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_wprobe.c:234:15: note: in expansion of macro 'this_cpu_ptr'
     234 |         bp = *this_cpu_ptr(pevent);
         |               ^~~~~~~~~~~~
   include/linux/percpu-defs.h:221:45: note: expected 'const __seg_fs void *' but pointer is of type 'struct perf_event **'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                             ^
   include/linux/percpu-defs.h:252:9: note: in expansion of macro '__verify_pcpu_ptr'
     252 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_wprobe.c:234:15: note: in expansion of macro 'this_cpu_ptr'
     234 |         bp = *this_cpu_ptr(pevent);
         |               ^~~~~~~~~~~~


vim +230 kernel/trace/trace_wprobe.c

   225	
   226	static int trace_wprobe_update_local(struct trace_wprobe *tw, unsigned long addr)
   227	{
   228		struct perf_event **pevent, *bp;
   229	
 > 230		pevent = READ_ONCE(tw->bp_event);
   231		if (!pevent)
   232			return -EINVAL;
   233	
   234		bp = *this_cpu_ptr(pevent);
   235		if (!bp)
   236			return -EINVAL;
   237	
   238		return modify_local_hw_breakpoint_addr(bp, addr);
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
