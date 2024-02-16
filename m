Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1AF9F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708057941; cv=none; b=QybYKekvBiwx2HWhiDTHUSlLDs46ZOiwlr50XlUJWtbngv9ny6tnlGRG0oByNVkVPUAOh2jIUCV77Re2blWbGRjILBJT5M20YMndLmD6KadUZ7F+6sj6Xtg5W7cz4Km6EVtqZjNrNjvqiCWAp23xDv/l465teZ8y0p9NUaS6n38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708057941; c=relaxed/simple;
	bh=E5mTkFshPFAjcQQgoI3tNQWvhNmnmYudlS2BytQ5aYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vow5gyp3oWC8NTICXXXraP88TEOYf/Ee3Lrvt/pkRno/0TlW1DE65jegtWytGYtlm26Ov+wv4PdLRfzVLFKPMQ4UXNVvsreW7/XvJMdQAE6FHLr7KM4dibbcc6eo9QBxhVXjVOFedUNKP6RMY8LLI1MEFvUlw+UYLty7G57LhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bX5se3HV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bX5se3HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708057939; x=1739593939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5mTkFshPFAjcQQgoI3tNQWvhNmnmYudlS2BytQ5aYc=;
  b=bX5se3HVtqVJ+21QQJkddOyQPoXZP9hj+RLIZ8KL/qWTA4urCAmAJJ3B
   QNncVFMTyB+eZpXgJDdWa6064pyTRcb+0/z0juK5J4phEtRpDqvAVdT85
   PzI9CHZ87ow8X/ajEO7GOedpPHCJkyaDTIUv1zOysIMOGJT+U+woUW4sZ
   JBb3JXtpWJ7t5SBNcVpK5Dhy7g7k3M/+WCV7cHb1Y/j6zWYC70beA3jiD
   X4DZPyPg1I5kfE0K1UTYW76hAf0cWUqBG9q6U27FxukcncfgeuAAgDV1a
   9FsZInB3AmEJb5OpluChmrFsp9/M/G//YrNQf/yQanaE2Pal7kVXx3P4N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5988792"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="5988792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 20:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8392638"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Feb 2024 20:32:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raptU-0000zu-30;
	Fri, 16 Feb 2024 04:32:12 +0000
Date: Fri, 16 Feb 2024 12:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 5/9]
 include/linux/fsnotify_backend.h:504:55: error: no member named
 's_fsnotify_marks' in 'struct super_block'
Message-ID: <202402161225.9h9QIh9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   7ca5d81f2ffa3303ed4c1d54af3248f38b5a1576
commit: d04bf34990abfcf261e74b40f7804b64a31f0a53 [5/9] fsnotify: attach sb connector for the lifetime of sb
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20240216/202402161225.9h9QIh9M-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 1c10821022f1799452065fb57474e894e2562b7f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161225.9h9QIh9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161225.9h9QIh9M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:402:10: note: expanded from macro '__native_word'
     402 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:402:39: note: expanded from macro '__native_word'
     402 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:403:10: note: expanded from macro '__native_word'
     403 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:403:38: note: expanded from macro '__native_word'
     403 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:391:13: note: expanded from macro '__unqual_scalar_typeof'
     391 |                 _Generic((x),                                           \
         |                           ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:398:15: note: expanded from macro '__unqual_scalar_typeof'
     398 |                          default: (x)))
         |                                    ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:34: error: initializing 'struct fsnotify_mark_connector *' with an expression of incompatible type 'void'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   6 warnings and 9 errors generated.
--
   In file included from fs/super.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/super.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/super.c:26:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:402:10: note: expanded from macro '__native_word'
     402 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:402:39: note: expanded from macro '__native_word'
     402 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:403:10: note: expanded from macro '__native_word'
     403 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:403:38: note: expanded from macro '__native_word'
     403 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:391:13: note: expanded from macro '__unqual_scalar_typeof'
     391 |                 _Generic((x),                                           \
         |                           ^
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:398:15: note: expanded from macro '__unqual_scalar_typeof'
     398 |                          default: (x)))
         |                                    ^
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:55: error: no member named 's_fsnotify_marks' in 'struct super_block'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from fs/super.c:35:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:504:34: error: initializing 'struct fsnotify_mark_connector *' with an expression of incompatible type 'void'
     504 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 9 errors generated.


vim +504 include/linux/fsnotify_backend.h

   500	
   501	static inline struct fsnotify_sb_connector *fsnotify_sb_connector(
   502								struct super_block *sb)
   503	{
 > 504		struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
   505	
   506		return conn ? FSNOTIFY_SB_CONN(conn) : NULL;
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
