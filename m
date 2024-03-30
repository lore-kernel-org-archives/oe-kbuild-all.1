Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7741E865
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711823147; cv=none; b=HKM6dokJChQZJ9brxqVVVQBYPnRI20VcG6qNTo6JBYAymXqKh+Sza8SiS3+z1XyZbbs1SwdK5s/EDbqfEUIKa+Dww8Ar3aLAFzFa0yIS6j2OWzgYxF+PkeMVa9CvBZzRwBDD8vtDiMRlMTyMf9hxwb8O9wahtSWxoPn+O5L/ugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711823147; c=relaxed/simple;
	bh=UpC9LOwijLAkNteIVbVZ7JNrQ4EU962yXdCf4g89TJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uq48EML0smyi6kAOtESR6a3hWRIhTALqeXcRXDAHcx5PwhFuN5fs3q7QnoghEK2orWAsoRzw6dmqixRsB++TtePZ0Y6NiI1JCu7g0XlKazUYFOqbnsqcbWbvBpYdZ0v10eyxE/Y5LKbpI8TFmKBKz2xoEZ3Ky9hamaptZLB7h7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyueTBQ5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyueTBQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711823143; x=1743359143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpC9LOwijLAkNteIVbVZ7JNrQ4EU962yXdCf4g89TJI=;
  b=fyueTBQ5Eoz/bgZb9lvz/aB6/CN0k685ZGmXG+xawO+TGArOkSaYpXID
   3jEl6ZpCgMb9pfysn1ypQjARKJI4XhgrHtzQ4GwTNQQXbPF3nRSN9A7t1
   C777m20Bv899sJ4ZVRZE7ccAzsf6fg7Q9k+YxkOgEGFSTYbzbqiZU/dsF
   rHEUQqcn+43DQFMcVVRm9ty7rXmNw4jrm5b3ILbMKNdgJZJH+NCvu9WJE
   EWN/2hgz+p5kUFwSBmeaCL0oEf15tvAiz6asRIw0Q5LcZDst1+WbT+P4R
   340d5CotaB52TDbvvl+rriC+Nr0jvQOf48fuQeAk4gRCFIgU7B+UaKH3A
   A==;
X-CSE-ConnectionGUID: Fu0w/ndORxOJLCx799ELRw==
X-CSE-MsgGUID: OXQGuX5dTVekrre2JtFoKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="10775607"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="10775607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 11:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="17359180"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2024 11:25:40 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqdOb-0000He-2r;
	Sat, 30 Mar 2024 18:25:37 +0000
Date: Sun, 31 Mar 2024 02:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace-1a 64/64]
 include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug918'
 set but not used
Message-ID: <202403310233.x4StToBC-lkp@intel.com>
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
config: x86_64-randconfig-016-20240330 (https://download.01.org/0day-ci/archive/20240331/202403310233.x4StToBC-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310233.x4StToBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310233.x4StToBC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from fs/btrfs/send.c:7:
   fs/btrfs/send.c: In function 'send_rename':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:820:9: note: in expansion of macro 'btrfs_debug'
     820 |         btrfs_debug(fs_info, "send_rename %s -> %s", from->start, to->start);
         |         ^~~~~~~~~~~
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
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6:
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug918' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:820:9: note: in expansion of macro 'btrfs_debug'
     820 |         btrfs_debug(fs_info, "send_rename %s -> %s", from->start, to->start);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_link':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:845:9: note: in expansion of macro 'btrfs_debug'
     845 |         btrfs_debug(fs_info, "send_link %s -> %s", path->start, lnk->start);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug920' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:845:9: note: in expansion of macro 'btrfs_debug'
     845 |         btrfs_debug(fs_info, "send_link %s -> %s", path->start, lnk->start);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_unlink':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:869:9: note: in expansion of macro 'btrfs_debug'
     869 |         btrfs_debug(fs_info, "send_unlink %s", path->start);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug922' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:869:9: note: in expansion of macro 'btrfs_debug'
     869 |         btrfs_debug(fs_info, "send_unlink %s", path->start);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_rmdir':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:892:9: note: in expansion of macro 'btrfs_debug'
     892 |         btrfs_debug(fs_info, "send_rmdir %s", path->start);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug924' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:892:9: note: in expansion of macro 'btrfs_debug'
     892 |         btrfs_debug(fs_info, "send_rmdir %s", path->start);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'find_extent_clone':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:1691:9: note: in expansion of macro 'btrfs_debug'
    1691 |         btrfs_debug(fs_info,
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug926' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:1691:9: note: in expansion of macro 'btrfs_debug'
    1691 |         btrfs_debug(fs_info,
         |         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:1696:17: note: in expansion of macro 'btrfs_debug'
    1696 |                 btrfs_debug(fs_info, "no clones found");
         |                 ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug928' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:1696:17: note: in expansion of macro 'btrfs_debug'
    1696 |                 btrfs_debug(fs_info, "no clones found");
         |                 ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_truncate':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2595:9: note: in expansion of macro 'btrfs_debug'
    2595 |         btrfs_debug(fs_info, "send_truncate %llu size=%llu", ino, size);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug930' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2595:9: note: in expansion of macro 'btrfs_debug'
    2595 |         btrfs_debug(fs_info, "send_truncate %llu size=%llu", ino, size);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_chmod':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2625:9: note: in expansion of macro 'btrfs_debug'
    2625 |         btrfs_debug(fs_info, "send_chmod %llu mode=%llu", ino, mode);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug932' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2625:9: note: in expansion of macro 'btrfs_debug'
    2625 |         btrfs_debug(fs_info, "send_chmod %llu mode=%llu", ino, mode);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_fileattr':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2658:9: note: in expansion of macro 'btrfs_debug'
    2658 |         btrfs_debug(fs_info, "send_fileattr %llu fileattr=%llu", ino, fileattr);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug934' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2658:9: note: in expansion of macro 'btrfs_debug'
    2658 |         btrfs_debug(fs_info, "send_fileattr %llu fileattr=%llu", ino, fileattr);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_chown':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2688:9: note: in expansion of macro 'btrfs_debug'
    2688 |         btrfs_debug(fs_info, "send_chown %llu uid=%llu, gid=%llu",
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug936' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2688:9: note: in expansion of macro 'btrfs_debug'
    2688 |         btrfs_debug(fs_info, "send_chown %llu uid=%llu, gid=%llu",
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_utimes':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2725:9: note: in expansion of macro 'btrfs_debug'
    2725 |         btrfs_debug(fs_info, "send_utimes %llu", ino);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug938' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2725:9: note: in expansion of macro 'btrfs_debug'
    2725 |         btrfs_debug(fs_info, "send_utimes %llu", ino);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_create_inode':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2846:9: note: in expansion of macro 'btrfs_debug'
    2846 |         btrfs_debug(fs_info, "send_create_inode %llu", ino);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug940' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:2846:9: note: in expansion of macro 'btrfs_debug'
    2846 |         btrfs_debug(fs_info, "send_create_inode %llu", ino);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'process_recorded_refs':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:4179:9: note: in expansion of macro 'btrfs_debug'
    4179 |         btrfs_debug(fs_info, "process_recorded_refs %llu", sctx->cur_ino);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug947' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:4179:9: note: in expansion of macro 'btrfs_debug'
    4179 |         btrfs_debug(fs_info, "process_recorded_refs %llu", sctx->cur_ino);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_write':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:5337:9: note: in expansion of macro 'btrfs_debug'
    5337 |         btrfs_debug(fs_info, "send_write offset=%llu, len=%d", offset, len);
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug951' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:5337:9: note: in expansion of macro 'btrfs_debug'
    5337 |         btrfs_debug(fs_info, "send_write offset=%llu, len=%d", offset, len);
         |         ^~~~~~~~~~~
   fs/btrfs/send.c: In function 'send_clone':
   include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:298:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     298 |         if (DYNAMIC_DEBUG_BRANCH(id))                                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:5372:9: note: in expansion of macro 'btrfs_debug'
    5372 |         btrfs_debug(sctx->send_root->fs_info,
         |         ^~~~~~~~~~~
>> include/linux/compiler.h:180:45: warning: variable '__UNIQUE_ID_ddebug953' set but not used [-Wunused-but-set-variable]
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/dynamic_debug.h:230:31: note: in definition of macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     230 |         __section("__dyndbg") name = {                          \
         |                               ^~~~
   include/linux/dynamic_debug.h:324:9: note: in expansion of macro '__dynamic_func_call_cls_no_desc'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dynamic_debug.h:324:41: note: in expansion of macro '__UNIQUE_ID'
     324 |         __dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,  \
         |                                         ^~~~~~~~~~~
   include/linux/dynamic_debug.h:327:9: note: in expansion of macro '_dynamic_func_call_cls_no_desc'
     327 |         _dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/messages.h:110:9: note: in expansion of macro '_dynamic_func_call_no_desc'
     110 |         _dynamic_func_call_no_desc(fmt, btrfs_printk,                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/send.c:5372:9: note: in expansion of macro 'btrfs_debug'
    5372 |         btrfs_debug(sctx->send_root->fs_info,
         |         ^~~~~~~~~~~
..


vim +/__UNIQUE_ID_ddebug918 +180 include/linux/compiler.h

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
