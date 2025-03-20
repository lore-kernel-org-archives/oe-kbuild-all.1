Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41A154457
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742431263; cv=none; b=YNf348tpU6zWVBkfY/reQoknDYTo78e1Nmxk+WqqXVOdJfVlWexzJRN2pYVwroJYGlNgZLXVLTGQeX3V6/kNyl8kjAo1JqVqqzTKntqt7IS2aJrfWDjdhmwiRX3b9TwYovicb7QGzmrZswOLuoexWvRHtW1QaN7yycnyKEAokF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742431263; c=relaxed/simple;
	bh=ysQw320U92fcc9RGXquOyxSNTHhFjedhAcF++YjZQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfBrl1YRJGj7wZe14kFiRfhPbXItoJK8qWSREe9olpU8j25X2hx+cFZ2XJazCEqS/tlkRVcehtUh/jGkmo4eC34XWNXbnFsI393eLDAHHgrpiZhVmCXfXCbxIYs8lasgUMJpmuE7AanNrH54cPf0XGuOE1opSZm11BqVQ5DFqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C833fhWT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C833fhWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742431261; x=1773967261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ysQw320U92fcc9RGXquOyxSNTHhFjedhAcF++YjZQNQ=;
  b=C833fhWTpg8IuodyxRx0d9cP9I+vIW9lI2YCr7ylyAN1IGXq7/j4h0v2
   6bjKr05TN1ud2keiDF56ff41c4JV7MYQfE5yi9C+kG7pXWkarK8vMQYsY
   bpRSBRomDKXYaiuP22Wi7wtcS9fG3hhqCJ5XzxdxBIpEqT3VLzOhIhMh/
   2mEF8GIsYSlcSicOptBgQOFKtzqYOhXKIiX6uUFlf9+nLvDcJu2UNnKaU
   AYB91eAwjqGSkjRTPgJ1GAPBLClfweCWiX6D0XhOUH1StodXeM3Gy0SD2
   ep4SdOQgQQGe3rC4dLe3NYvuYgXFEo+tvwws5ifaqSpF4Pd8N/joCy5+i
   Q==;
X-CSE-ConnectionGUID: 9LRuIS3mSaGZuNleByNeSg==
X-CSE-MsgGUID: N2Ttv0gTRxOwai6T5rqiLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43567465"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="43567465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 17:41:00 -0700
X-CSE-ConnectionGUID: nRCKdlVxQK6/bP3tctZMtg==
X-CSE-MsgGUID: KoJlZznZRXam17ka+IpQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="160069288"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2025 17:40:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv3xw-000031-2t;
	Thu, 20 Mar 2025 00:40:56 +0000
Date: Thu, 20 Mar 2025 08:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [linux-next:master 11820/12094]
 include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
Message-ID: <202503200847.LbkIJIXa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: 0c4c159b80695260bf24d51dd27f61188bbd919c [11820/12094] s390: add support for suppressing warning backtraces
config: s390-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200847.LbkIJIXa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200847.LbkIJIXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200847.LbkIJIXa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   include/linux/mm.h: In function 'folio_put':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/linux/mmdebug.h:26:4: note: in expansion of macro 'BUG'
       BUG();      \
       ^~~
   include/linux/mm.h:1153:2: note: in expansion of macro 'VM_BUG_ON_PAGE'
     VM_BUG_ON_PAGE(page_ref_count(page) == 0, page);
     ^~~~~~~~~~~~~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/linux/mmdebug.h:26:4: note: in expansion of macro 'BUG'
       BUG();      \
       ^~~
   include/linux/mm.h:1153:2: note: in expansion of macro 'VM_BUG_ON_PAGE'
     VM_BUG_ON_PAGE(page_ref_count(page) == 0, page);
     ^~~~~~~~~~~~~~
   fs/btrfs/file.c: In function 'btrfs_drop_folio':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:50:2: note: in expansion of macro 'ASSERT'
     ASSERT(block_len <= U32_MAX);
     ^~~~~~
   include/linux/page-flags.h: In function 'const_folio_flags.constprop':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/linux/mmdebug.h:26:4: note: in expansion of macro 'BUG'
       BUG();      \
       ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
    #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
                                          ^~~~~~~~~~~~~~
   include/linux/page-flags.h:347:2: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
     ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'folio_lock':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/linux/mmdebug.h:26:4: note: in expansion of macro 'BUG'
       BUG();      \
       ^~~
   include/linux/mmdebug.h:136:39: note: in expansion of macro 'VM_BUG_ON_PAGE'
    #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
                                          ^~~~~~~~~~~~~~
   include/linux/page-flags.h:356:2: note: in expansion of macro 'VM_BUG_ON_PGFLAGS'
     VM_BUG_ON_PGFLAGS(page->compound_head & 1, page);
     ^~~~~~~~~~~~~~~~~
   fs/btrfs/file.c: In function 'prepare_one_folio.constprop':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:879:2: note: in expansion of macro 'ASSERT'
     ASSERT(folio_order(folio) == 0);
     ^~~~~~
   fs/btrfs/file.c: In function 'lock_and_cleanup_extent_if_need':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   fs/btrfs/file.c:962:2: note: in expansion of macro 'WARN_ON'
     WARN_ON(!folio_test_locked(folio));
     ^~~~~~~
   fs/btrfs/file.c: In function 'btrfs_insert_replace_extent':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:2174:2: note: in expansion of macro 'ASSERT'
     ASSERT(btrfs_file_extent_type(leaf, extent) != BTRFS_FILE_EXTENT_INLINE);
     ^~~~~~
   fs/btrfs/file.c: In function 'btrfs_page_mkwrite':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:1794:2: note: in expansion of macro 'ASSERT'
     ASSERT(folio_order(folio) == 0);
     ^~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   include/linux/highmem.h:275:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(end1 > page_size(page) || end2 > page_size(page));
     ^~~~~~
   fs/btrfs/file.c: In function 'btrfs_dirty_folio':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:91:2: note: in expansion of macro 'ASSERT'
     ASSERT(num_bytes <= U32_MAX);
     ^~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:92:2: note: in expansion of macro 'ASSERT'
     ASSERT(folio_pos(folio) <= pos &&
     ^~~~~~
   fs/btrfs/file.c: In function 'btrfs_drop_extents':
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:169:2: note: in expansion of macro 'ASSERT'
     ASSERT(!(args->replace_extent && !args->path));
     ^~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   fs/btrfs/file.c:203:8: note: in expansion of macro 'WARN_ON'
       if (WARN_ON(del_nr > 0)) {
           ^~~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:123:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS(BUGFLAG_ONCE |   \
      ^~~~~~~~~~~~
   fs/btrfs/file.c:223:7: note: in expansion of macro 'WARN_ON_ONCE'
      if (WARN_ON_ONCE(key.objectid < ino) ||
          ^~~~~~~~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/messages.h:175:2: note: in expansion of macro 'BUG'
     BUG();        \
     ^~~
   fs/btrfs/messages.h:179:28: note: in expansion of macro 'btrfs_assertfail'
     (likely(expr) ? (void)0 : btrfs_assertfail(#expr, __FILE__, __LINE__))
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/file.c:225:4: note: in expansion of macro 'ASSERT'
       ASSERT(del_nr == 0);
       ^~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/file.c:248:4: note: in expansion of macro 'BUG'
       BUG();
       ^~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   fs/btrfs/file.c:283:8: note: in expansion of macro 'WARN_ON'
       if (WARN_ON(del_nr > 0)) {
           ^~~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:116:4: note: in expansion of macro '__WARN_FLAGS'
       __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
       ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:3: note: in expansion of macro '__WARN_printf'
      __WARN_printf(TAINT_WARN, format);   \
      ^~~~~~~~~~~~~
   fs/btrfs/transaction.h:257:7: note: in expansion of macro 'WARN'
      if (WARN(btrfs_abort_should_print_stack(error), \
          ^~~~
   fs/btrfs/file.c:332:6: note: in expansion of macro 'btrfs_abort_transaction'
         btrfs_abort_transaction(trans, ret);
         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   fs/btrfs/file.c:373:8: note: in expansion of macro 'WARN_ON'
       if (WARN_ON(del_nr > 0)) {
           ^~~~~~~
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   fs/btrfs/file.c:404:9: note: in expansion of macro 'WARN_ON'
        if (WARN_ON(del_slot + del_nr != path->slots[0])) {
            ^~~~~~~
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:116:4: note: in expansion of macro '__WARN_FLAGS'
       __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
       ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:3: note: in expansion of macro '__WARN_printf'
      __WARN_printf(TAINT_WARN, format);   \
      ^~~~~~~~~~~~~
   fs/btrfs/transaction.h:257:7: note: in expansion of macro 'WARN'
      if (WARN(btrfs_abort_should_print_stack(error), \
          ^~~~
   fs/btrfs/file.c:431:6: note: in expansion of macro 'btrfs_abort_transaction'
         btrfs_abort_transaction(trans, ret);
         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:116:4: note: in expansion of macro '__WARN_FLAGS'
       __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
       ^~~~~~~~~~~~
   include/asm-generic/bug.h:144:3: note: in expansion of macro '__WARN_printf'
      __WARN_printf(TAINT_WARN, format);   \
      ^~~~~~~~~~~~~
   fs/btrfs/transaction.h:257:7: note: in expansion of macro 'WARN'
      if (WARN(btrfs_abort_should_print_stack(error), \
          ^~~~
   fs/btrfs/file.c:448:5: note: in expansion of macro 'btrfs_abort_transaction'
        btrfs_abort_transaction(trans, ret);
        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   fs/btrfs/file.c:459:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:116:4: note: in expansion of macro '__WARN_FLAGS'
       __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
..


vim +/asm +477 include/linux/compiler_types.h

dbaaabd60e1662 Linus Torvalds   2024-04-08  475  
eb111869301e15 Rasmus Villemoes 2019-09-13  476  #ifdef CONFIG_CC_HAS_ASM_INLINE
eb111869301e15 Rasmus Villemoes 2019-09-13 @477  #define asm_inline asm __inline
eb111869301e15 Rasmus Villemoes 2019-09-13  478  #else
eb111869301e15 Rasmus Villemoes 2019-09-13  479  #define asm_inline asm
eb111869301e15 Rasmus Villemoes 2019-09-13  480  #endif
eb111869301e15 Rasmus Villemoes 2019-09-13  481  

:::::: The code at line 477 was first introduced by commit
:::::: eb111869301e15b737315a46c913ae82bd19eb9d compiler-types.h: add asm_inline definition

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
