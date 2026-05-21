Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA3349CD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377034; cv=none; b=k4a85fdwJKBj8GU7XRfvlvtjL5slZU3Eq6C34zGX54OG3F436kNQCmZ09AlW6Lfd94V9+6W04NfEV9dgYJoTXDI1DvMulWmAg8gKqNQOLDsXmm0pcanL0LGI7bMxaqfy4LAalaj0+LX2YEMrP8drh8kBWw9DK0xRjNR8wiqveVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377034; c=relaxed/simple;
	bh=7rIDSRZjaYJOZ6YUXb0D494HCMo2cYaOAVxpmFVORFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BrbkqtpcL8fNsaR5Sb+e/1GETAiHxbpf7O9QqP/TtEkyJhvRyg86135Guy/6w4ML3g7HHLu5AP+4297PWi4rmgc/cHFiDI6S5Vn8qb/HiyFvi+8NS0IZsFEmshyPA7AUVeKeaNxkk09LxPS3EVC5HJnWwngH/2mGzgHCADpb56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLKKN8GR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLKKN8GR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377032; x=1810913032;
  h=date:from:to:cc:subject:message-id;
  bh=7rIDSRZjaYJOZ6YUXb0D494HCMo2cYaOAVxpmFVORFw=;
  b=mLKKN8GRVIhMUSbuWRnZiGsoVsJtE/t35RVCPUPPhdSTcIipefDsjvj1
   y0yKdiAJXHtfHxqO1gdRnYIWdyaHtc6/lpIl86dMG+lJtOo+PI0QAjnd/
   uDxEdkCuKY4ut2Go4VH/pZmZKcb1T+ApXezKFyqTmr+FJOFvFiMHF99ND
   cs5EAtUyJXcuLJzcs0dqvvb7egtXMjjU3UmItB2LmhbrGoEuqwefn05Oe
   efK/1uje/xmSRYCUyS2tTkhQS9GFhgKGsedA2tmxUo+rNywdn/KYaeaXR
   o4TcU3d8hdqg0h/9D2IgGpenwUYe8SA5RiJ/mf6GnZ/om7kH0o3ZwqwY4
   A==;
X-CSE-ConnectionGUID: ANSQ+jRHTF+mh8un6UcQKw==
X-CSE-MsgGUID: K1CkF+iXS/qpYIv1Oj5b3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79447951"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="79447951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:23:51 -0700
X-CSE-ConnectionGUID: PqQ22nV/TbC3GNLcpGn78A==
X-CSE-MsgGUID: h6j+/UPzTdq5HfD/Zigw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="264076614"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2026 08:23:50 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5FT-000000000hB-2Z9F;
	Thu, 21 May 2026 15:23:47 +0000
Date: Thu, 21 May 2026 23:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 include/linux/percpu-defs.h:226:17: error: dereferencing pointer to
 incomplete type 'struct trace_user_buf'
Message-ID: <202605212348.ngg3sFeE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: s390-randconfig-001-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212348.ngg3sFeE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212348.ngg3sFeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212348.ngg3sFeE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'show_last_boot_header':
   kernel/trace/trace.c:5841:12: error: invalid storage class for function 'l_show'
    static int l_show(struct seq_file *m, void *v)
               ^~~~~~
   kernel/trace/trace.c:5859:11: error: initializer element is not constant
     .show  = l_show,
              ^~~~~~
   kernel/trace/trace.c:5859:11: note: (near initialization for 'last_boot_seq_ops.show')
   kernel/trace/trace.c:5862:12: error: invalid storage class for function 'tracing_last_boot_open'
    static int tracing_last_boot_open(struct inode *inode, struct file *file)
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:5884:12: error: invalid storage class for function 'tracing_buffer_meta_open'
    static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:5901:1: error: invalid storage class for function 'tracing_free_buffer_write'
    tracing_free_buffer_write(struct file *filp, const char __user *ubuf,
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:5915:1: error: invalid storage class for function 'tracing_free_buffer_release'
    tracing_free_buffer_release(struct inode *inode, struct file *filp)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:5932:16: error: invalid storage class for function 'write_marker_to_buffer'
    static ssize_t write_marker_to_buffer(struct trace_array *tr, const char *buf,
                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/s390/include/asm/percpu.h:193,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c: In function 'trace_user_fault_destroy':
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'struct trace_user_buf'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:239:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6016:9: note: in expansion of macro 'per_cpu_ptr'
      buf = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
            ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
>> include/linux/percpu-defs.h:226:17: error: dereferencing pointer to incomplete type 'struct trace_user_buf'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
                    ^~~~~~
   include/linux/compiler-gcc.h:34:34: note: in definition of macro 'RELOC_HIDE'
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));    \
                                     ^~~
   include/linux/percpu-defs.h:226:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:13: note: in expansion of macro 'PERCPU_PTR'
     RELOC_HIDE(PERCPU_PTR(__p), (__offset))
                ^~~~~~~~~~
   include/linux/percpu-defs.h:240:2: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));   \
     ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6016:9: note: in expansion of macro 'per_cpu_ptr'
      buf = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
            ^~~~~~~~~~~
   kernel/trace/trace.c: In function 'show_last_boot_header':
   kernel/trace/trace.c:6022:12: error: invalid storage class for function 'user_fault_buffer_enable'
    static int user_fault_buffer_enable(struct trace_user_buf_info *tinfo, size_t size)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'user_fault_buffer_enable':
   kernel/trace/trace.c:6029:14: error: assignment to 'struct trace_user_buf *' from incompatible pointer type 'struct trace_user_buf *' [-Werror=incompatible-pointer-types]
     tinfo->tbuf = alloc_percpu(struct trace_user_buf);
                 ^
   In file included from include/asm-generic/percpu.h:9,
                    from arch/s390/include/asm/percpu.h:193,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'struct trace_user_buf'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:239:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6038:3: note: in expansion of macro 'per_cpu_ptr'
      per_cpu_ptr(tinfo->tbuf, cpu)->buf = NULL;
      ^~~~~~~~~~~
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'struct trace_user_buf'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:239:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6046:3: note: in expansion of macro 'per_cpu_ptr'
      per_cpu_ptr(tinfo->tbuf, cpu)->buf = buf;
      ^~~~~~~~~~~
   kernel/trace/trace.c: In function 'show_last_boot_header':
   kernel/trace/trace.c:6053:13: error: invalid storage class for function 'user_buffer_free'
    static void user_buffer_free(struct trace_user_buf_info **tinfo)
                ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6063:12: error: invalid storage class for function 'user_buffer_init'
    static int user_buffer_init(struct trace_user_buf_info **tinfo, size_t size)
               ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6085:13: error: invalid storage class for function 'user_buffer_put'
    static void user_buffer_put(struct trace_user_buf_info **tinfo)
                ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/s390/include/asm/percpu.h:193,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c: In function 'trace_user_fault_read':
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'struct trace_user_buf'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:239:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6203:17: note: in expansion of macro 'per_cpu_ptr'
     char *buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'struct trace_user_buf'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:239:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6242:13: note: in expansion of macro 'per_cpu_ptr'
       buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
                ^~~~~~~~~~~
   kernel/trace/trace.c: In function 'show_last_boot_header':
   kernel/trace/trace.c:6300:1: error: invalid storage class for function 'tracing_mark_write'
    tracing_mark_write(struct file *filp, const char __user *ubuf,
    ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6345:16: error: invalid storage class for function 'write_raw_marker_to_buffer'
    static ssize_t write_raw_marker_to_buffer(struct trace_array *tr,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6381:1: error: invalid storage class for function 'tracing_mark_raw_write'
    tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
    ^~~~~~~~~~~~~~~~~~~~~~


vim +226 include/linux/percpu-defs.h

9c28278a24c01c Tejun Heo   2014-06-17  224  
001217defda86d Uros Bizjak 2024-10-21  225  #define PERCPU_PTR(__p)							\
6a39fe05ecaa39 Uros Bizjak 2025-01-27 @226  	(TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
001217defda86d Uros Bizjak 2024-10-21  227  

:::::: The code at line 226 was first introduced by commit
:::::: 6a39fe05ecaa3946ed0af9efd3e56689d519e420 percpu: use TYPEOF_UNQUAL() in *_cpu_ptr() accessors

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
