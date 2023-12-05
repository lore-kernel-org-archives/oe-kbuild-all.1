Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812566123
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bawbjAte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701752472; x=1733288472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDYlmYnLKRdATPhWimrdxlO0K8e2cH7ra4kVpN5fCMw=;
  b=bawbjAte+pglrfhYLuifxTCNxrPGQuK9KWLNckhPJg8etxDOgcV46Zv3
   3nfImt3VO+5t+maIL+No/Tch7ROsz4lwCLpGdsEyM7rpRfPCfkXc5qGfu
   DKRScE+krbVri1Ypnhk1jhXrmmkiisTITlvlUB3y4mXn9UGMq5EvAOGsG
   YHIsuYStRcr+dt0S8LZRpIDAUrWK5bsSDSc2U3rW3UXQpluYkngmQlfi1
   79//9hMQNYQesYHHYmaIMBJCyFNoyqkB8CJrNBVXz8RG15NrEqBZAYX1r
   1Wm5c3oyHvEkOk6M+ELV9S0QxcyuXqJHhx4yuBJdut0sDUzKdiQgy+1Bo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7132605"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7132605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861628415"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861628415"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 21:01:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rANYN-0008MI-0x;
	Tue, 05 Dec 2023 05:01:03 +0000
Date: Tue, 5 Dec 2023 13:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v2.1 9/26] include/linux/compiler-gcc.h:42:45: warning:
 variable '__UNIQUE_ID_ddebug372' set but not used
Message-ID: <202312051238.5Q19S5jk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v2.1
head:   20d113eb6f9ac604fce8e97eefae3b07e133d148
commit: 3516abb0d844ec4008ffa3dfc68b37cb6a6c64f6 [9/26] dyndbg: move flags field to a new structure
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051238.5Q19S5jk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051238.5Q19S5jk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051238.5Q19S5jk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cleanup.h:5,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg.h:15,
                    from ./arch/nios2/include/generated/asm/cmpxchg.h:1,
                    from include/asm-generic/atomic.h:12,
                    from ./arch/nios2/include/generated/asm/atomic.h:1,
                    from include/linux/atomic.h:7,
                    from include/crypto/hash.h:11,
                    from fs/btrfs/inode.c:6:
   fs/btrfs/inode.c: In function 'submit_one_async_extent':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1206:9: note: in expansion of macro 'btrfs_debug'
    1206 |         btrfs_debug(fs_info,
         |         ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/nios2/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/hash.h:12:
>> include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug372' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1206:9: note: in expansion of macro 'btrfs_debug'
    1206 |         btrfs_debug(fs_info,
         |         ^~~~~~~~~~~
   fs/btrfs/inode.c: In function 'btrfs_orphan_cleanup':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3601:25: note: in expansion of macro 'btrfs_debug'
    3601 |                         btrfs_debug(fs_info, "auto deleting %Lu",
         |                         ^~~~~~~~~~~
   include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug384' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3601:25: note: in expansion of macro 'btrfs_debug'
    3601 |                         btrfs_debug(fs_info, "auto deleting %Lu",
         |                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3626:17: note: in expansion of macro 'btrfs_debug'
    3626 |                 btrfs_debug(fs_info, "unlinked %d orphans", nr_unlink);
         |                 ^~~~~~~~~~~
>> include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug386' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3626:17: note: in expansion of macro 'btrfs_debug'
    3626 |                 btrfs_debug(fs_info, "unlinked %d orphans", nr_unlink);
         |                 ^~~~~~~~~~~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from fs/btrfs/extent_io.c:3:
   fs/btrfs/extent_io.c: In function 'end_bio_extent_readpage':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:608:17: note: in expansion of macro 'btrfs_debug'
     608 |                 btrfs_debug(fs_info,
         |                 ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/nios2/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/btrfs/extent_io.c:4:
>> include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug345' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:608:17: note: in expansion of macro 'btrfs_debug'
     608 |                 btrfs_debug(fs_info,
         |                 ^~~~~~~~~~~
--
   In file included from include/asm-generic/bug.h:5,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from fs/btrfs/volumes.c:6:
   fs/btrfs/volumes.c: In function 'gather_device_info':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5232:33: note: in expansion of macro 'btrfs_debug'
    5232 |                                 btrfs_debug(info,
         |                                 ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22:
   include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug343' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5232:33: note: in expansion of macro 'btrfs_debug'
    5232 |                                 btrfs_debug(info,
         |                                 ^~~~~~~~~~~
   fs/btrfs/volumes.c: In function 'decide_stripe_size':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5355:25: note: in expansion of macro 'btrfs_debug'
    5355 |                         btrfs_debug(info,
         |                         ^~~~~~~~~~~
>> include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug349' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5355:25: note: in expansion of macro 'btrfs_debug'
    5355 |                         btrfs_debug(info,
         |                         ^~~~~~~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_create_chunk':
   include/linux/dynamic_debug.h:213:28: error: 'struct _ddebug' has no member named 'flags'
     213 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:240:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     240 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5487:25: note: in expansion of macro 'btrfs_debug'
    5487 |                         btrfs_debug(info, "%s: no writable device", __func__);
         |                         ^~~~~~~~~~~
>> include/linux/compiler-gcc.h:42:45: warning: variable '__UNIQUE_ID_ddebug353' set but not used [-Wunused-but-set-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:173:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     173 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:266:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:266:41: note: in expansion of macro '__UNIQUE_ID'
     266 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     269 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5487:25: note: in expansion of macro 'btrfs_debug'
    5487 |                         btrfs_debug(info, "%s: no writable device", __func__);
         |                         ^~~~~~~~~~~
..


vim +/__UNIQUE_ID_ddebug372 +42 include/linux/compiler-gcc.h

87358710c1fb4f1 David Woodhouse 2018-02-19  41  
cb984d101b30eb7 Joe Perches     2015-06-25 @42  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
cb984d101b30eb7 Joe Perches     2015-06-25  43  

:::::: The code at line 42 was first introduced by commit
:::::: cb984d101b30eb7478d32df56a0023e4603cba7f compiler-gcc: integrate the various compiler-gcc[345].h files

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
