Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920C748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711827482; cv=none; b=cb0mHWdMQQPG8DuO6ooc66EnSfX2gSRsXuMAEXsKkqiM4+NMN5lTJHFL5YHaVej+nnfhF/xM8kCHrlYansTd+hYx84uzqRrygjfHJvH9SzUJPPhoAzds8anMrDiFWPAbyFmuwXWYD0CAbY6By3psJ7OWWVFtMK3hpWW6Z3VQJDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711827482; c=relaxed/simple;
	bh=IuUM5GVHMtE3O7qslIgUyTwiYbCc2IBt3a9+Qx/o8tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trGuDpG1YhpjcI+Hnl7ic9TgQRUMkCYo4fvX9skmuyu6g1DdvM7rW0D2dWC3YIk3d9UiPHti4ivdOmAjpgy/2KKfjF3CNzSEhK4vWFycERpyquNDrm0HbIffob7BOouudUcVcSqGEZBIO3h/CJpdjNLJj5mqI08jFv5zzJ4YdYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPgmvlZw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPgmvlZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711827480; x=1743363480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuUM5GVHMtE3O7qslIgUyTwiYbCc2IBt3a9+Qx/o8tY=;
  b=nPgmvlZwOhf4bsyYA895BJEjsfkWHfG55NWLNWMKVLznWhEWyI1C+vGR
   q4wlCn+0LNqWdycdhdGG9PbepSEtjURKZYWYqwJ9MOOJZ3v7tqStMMKLx
   Piw8jehPpT5qoxOp9dqZze+0nWneN0CMswf6JtkigGVsJf9qMRlEtLs+z
   /PldrcQVpeMwP/YU85pXoDs9fD5mNDIE3sKeBWRRa6nQ21MsMiC8tJ8UN
   HbHtXHGH0cEd62GWitY8M7TU+VlcnAFlgiK+SgGX+guWv63BiZd5+0TEu
   3HLMesytAWyUOY8H0V7jkYuo8+QC19wlPPnkMISWeteY/Wb/KMchhzUgW
   w==;
X-CSE-ConnectionGUID: nWx3hXLYTYWnbvGCatkSNQ==
X-CSE-MsgGUID: AlkV1wUARzeYaWvPN99Kow==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="9940723"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="9940723"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 12:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="17269724"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2024 12:37:57 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqeWY-0000Kq-0s;
	Sat, 30 Mar 2024 19:37:54 +0000
Date: Sun, 31 Mar 2024 03:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace-1a 64/64]
 include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug973'
 set but not used
Message-ID: <202403310353.XuiKEfUx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace-1a
head:   9cf8914e3a113c16ba8cd3da48422401f20cfc33
commit: 9cf8914e3a113c16ba8cd3da48422401f20cfc33 [64/64] dyndbg: grind out ctrl
config: x86_64-randconfig-073-20240330 (https://download.01.org/0day-ci/archive/20240331/202403310353.XuiKEfUx-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310353.XuiKEfUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310353.XuiKEfUx-lkp@intel.com/

All warnings (new ones prefixed by >>):

     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1216:2: note: in expansion of macro 'btrfs_debug'
    1216 |  btrfs_debug(fs_info,
         |  ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/hash.h:12,
                    from fs/btrfs/inode.c:6:
   include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug961' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1216:2: note: in expansion of macro 'btrfs_debug'
    1216 |  btrfs_debug(fs_info,
         |  ^~~~~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/crypto/hash.h:11,
                    from fs/btrfs/inode.c:6:
   fs/btrfs/inode.c: In function 'btrfs_orphan_cleanup':
   include/linux/dynamic_debug.h:271:21: error: 'struct _ddebug' has no member named 'ctrl'
     271 |  unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                     ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/dynamic_debug.h:298:6: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |  if (DYNAMIC_DEBUG_BRANCH(id))     \
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3633:4: note: in expansion of macro 'btrfs_debug'
    3633 |    btrfs_debug(fs_info, "auto deleting %Lu",
         |    ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/hash.h:12,
                    from fs/btrfs/inode.c:6:
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug973' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3633:4: note: in expansion of macro 'btrfs_debug'
    3633 |    btrfs_debug(fs_info, "auto deleting %Lu",
         |    ^~~~~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/crypto/hash.h:11,
                    from fs/btrfs/inode.c:6:
   include/linux/dynamic_debug.h:271:21: error: 'struct _ddebug' has no member named 'ctrl'
     271 |  unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                     ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/dynamic_debug.h:298:6: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |  if (DYNAMIC_DEBUG_BRANCH(id))     \
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3658:3: note: in expansion of macro 'btrfs_debug'
    3658 |   btrfs_debug(fs_info, "unlinked %d orphans", nr_unlink);
         |   ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/hash.h:12,
                    from fs/btrfs/inode.c:6:
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug975' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:3658:3: note: in expansion of macro 'btrfs_debug'
    3658 |   btrfs_debug(fs_info, "unlinked %d orphans", nr_unlink);
         |   ^~~~~~~~~~~
--
   In file included from include/linux/build_bug.h:5,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from fs/btrfs/extent-tree.c:6:
   fs/btrfs/extent-tree.c: In function 'cleanup_ref_head':
   include/linux/dynamic_debug.h:271:21: error: 'struct _ddebug' has no member named 'ctrl'
     271 |  unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                     ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/dynamic_debug.h:298:6: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |  if (DYNAMIC_DEBUG_BRANCH(id))     \
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1929:3: note: in expansion of macro 'btrfs_debug'
    1929 |   btrfs_debug(fs_info, "run_delayed_extent_op returned %d", ret);
         |   ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from fs/btrfs/extent-tree.c:6:
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug933' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1929:3: note: in expansion of macro 'btrfs_debug'
    1929 |   btrfs_debug(fs_info, "run_delayed_extent_op returned %d", ret);
         |   ^~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from fs/btrfs/extent-tree.c:6:
   fs/btrfs/extent-tree.c: In function 'btrfs_drop_snapshot':
   include/linux/dynamic_debug.h:271:21: error: 'struct _ddebug' has no member named 'ctrl'
     271 |  unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                     ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/dynamic_debug.h:298:6: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |  if (DYNAMIC_DEBUG_BRANCH(id))     \
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:5855:2: note: in expansion of macro 'btrfs_debug'
    5855 |  btrfs_debug(fs_info, "Drop subvolume %llu", root->root_key.objectid);
         |  ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from fs/btrfs/extent-tree.c:6:
   include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug961' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:5855:2: note: in expansion of macro 'btrfs_debug'
    5855 |  btrfs_debug(fs_info, "Drop subvolume %llu", root->root_key.objectid);
         |  ^~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from fs/btrfs/extent-tree.c:6:
   include/linux/dynamic_debug.h:271:21: error: 'struct _ddebug' has no member named 'ctrl'
     271 |  unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                     ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/dynamic_debug.h:298:6: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |  if (DYNAMIC_DEBUG_BRANCH(id))     \
         |      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:6008:5: note: in expansion of macro 'btrfs_debug'
    6008 |     btrfs_debug(fs_info,
         |     ^~~~~~~~~~~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from fs/btrfs/extent-tree.c:6:
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug963' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:24: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |  __section("__dyndbg") name = {    \
         |                        ^~~~
   include/linux/dynamic_debug.h:324:2: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:29: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:180:37: note: in expansion of macro '__PASTE'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/dynamic_debug.h:324:34: note: in expansion of macro '__UNIQUE_ID'
     324 |  __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt, \
         |                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:2: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |  _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt, \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:2: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |  _dynamic_func_call_no_desc(fmt, btrfs_printk,   \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:6008:5: note: in expansion of macro 'btrfs_debug'
    6008 |     btrfs_debug(fs_info,
         |     ^~~~~~~~~~~
..


vim +/__UNIQUE_ID_ddebug973 +180 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  179  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @180  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  181  

:::::: The code at line 180 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
