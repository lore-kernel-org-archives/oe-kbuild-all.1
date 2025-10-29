Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A247313E0B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771714; cv=none; b=sQxZ8OATq3aGXbTHI/43mJWX0p/BtKSLyQbB6grZfuH7Mr2nqPOuwvS1oc5489WCyf804p2xml/LJYYG7H8hJw615qjVwvlFPLgyjBxaOV9PElKyl0eEWpcx7Kjd0ZYVdTUBELDD0BMUwqR4Xf/TQL+zI3AH+cTktiT7b+Bu2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771714; c=relaxed/simple;
	bh=6E8/e9Q7+PpIiWuYpAdcUau2makbeVfY3ASL6q6nqgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBcYjEYyfsfVZvIIOWRWIfC+8mW4x4szu4USdauJ6p0VelVPrvREJGUJ7059ZVQWspFOLsv8HEZejtPGhunkOdHAhdpqk+5Dp6++LaQ8QMnzA3NJd1wLuP0jGr5iM6ntJAtJ5CDy1Dz8d/wn7xRGmhD2wDuYFVDG+qUBi/LBAfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNulZcg3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNulZcg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761771712; x=1793307712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6E8/e9Q7+PpIiWuYpAdcUau2makbeVfY3ASL6q6nqgU=;
  b=jNulZcg3WjCIhu8pl0O46cBNQFpHGrZI3MOLFg0pSop50TdYyGRuECwE
   ezd9C7oP437h3a90ZPcWyjrLzLYagTUaotJ6eLUPTi0f+tiznQq9etT38
   iDOoF8u1c95N9I/hGIbu9NeDaI7IKgz1h3qbfYcXaAvtNNvvEilAsubBa
   iQcEvJeKKB/2SvSrjDi5n3/qpCf3QEsoEGdupd7OYTRvPory5VKKFCSMa
   qgUM6TDBl8jbAA5E94NccebAse1rnODsU15n05+vttVRQbMWkyBLr2FXW
   1wBNYsCqtF2wCVOMAu9T7YUXch7eeYW582hylULi5fXgFqA/0yiWTd3HA
   g==;
X-CSE-ConnectionGUID: F+TrU71DRt6VR2WDrKjfNA==
X-CSE-MsgGUID: 8DM3cW3+QO2k+Tw0W8lCKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63815769"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63815769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:01:51 -0700
X-CSE-ConnectionGUID: 4uMyERBiT3ehKe6Uwuzgog==
X-CSE-MsgGUID: 27hlGQrsRrKr18Sl13LWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="209357472"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2025 14:01:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDIU-000L9w-2A;
	Wed, 29 Oct 2025 21:01:34 +0000
Date: Thu, 30 Oct 2025 05:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.19.misc 5/5] include/linux/pipe_fs_i.h:214:1:
 warning: control reaches end of non-void function
Message-ID: <202510300423.1PcGtHK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.misc
head:   ade24f8214fe3fdfe20233584bca932ab00b752d
commit: ade24f8214fe3fdfe20233584bca932ab00b752d [5/5] fs/pipe: stop duplicating union pipe_index declaration
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300423.1PcGtHK0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300423.1PcGtHK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300423.1PcGtHK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c:685:39: error: 'struct pipe_inode_info' has no member named 'head_tail'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                                       ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c:685:39: error: 'struct pipe_inode_info' has no member named 'head_tail'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                                       ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c:685:39: error: 'struct pipe_inode_info' has no member named 'head_tail'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                                       ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c:685:39: error: 'struct pipe_inode_info' has no member named 'head_tail'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                                       ^~
   include/linux/compiler_types.h:547:27: note: in definition of macro '__unqual_scalar_typeof'
     547 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c:685:39: error: 'struct pipe_inode_info' has no member named 'head_tail'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                                       ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   fs/pipe.c:685:25: note: in expansion of macro 'READ_ONCE'
     685 |         idx.head_tail = READ_ONCE(pipe->head_tail);
         |                         ^~~~~~~~~
   fs/pipe.c: In function 'pipe_resize_ring':
   fs/pipe.c:1307:20: error: 'struct pipe_inode_info' has no member named 'head'
    1307 |         head = pipe->head;
         |                    ^~
   fs/pipe.c:1308:20: error: 'struct pipe_inode_info' has no member named 'tail'
    1308 |         tail = pipe->tail;
         |                    ^~
   fs/pipe.c:1345:13: error: 'struct pipe_inode_info' has no member named 'tail'
    1345 |         pipe->tail = tail;
         |             ^~
   fs/pipe.c:1346:13: error: 'struct pipe_inode_info' has no member named 'head'
    1346 |         pipe->head = head;
         |             ^~
   include/linux/pipe_fs_i.h: In function 'pipe_is_empty':
>> include/linux/pipe_fs_i.h:214:1: warning: control reaches end of non-void function [-Wreturn-type]
     214 | }
         | ^
   include/linux/pipe_fs_i.h: In function 'pipe_is_full':
   include/linux/pipe_fs_i.h:205:1: warning: control reaches end of non-void function [-Wreturn-type]
     205 | }
         | ^
--
     226 |                 pipe->head = head;
         |                     ^~
   fs/splice.c: In function 'add_to_pipe':
   fs/splice.c:247:33: error: 'struct pipe_inode_info' has no member named 'head'
     247 |         unsigned int head = pipe->head;
         |                                 ^~
   fs/splice.c:248:33: error: 'struct pipe_inode_info' has no member named 'tail'
     248 |         unsigned int tail = pipe->tail;
         |                                 ^~
   fs/splice.c:258:21: error: 'struct pipe_inode_info' has no member named 'head'
     258 |                 pipe->head = head + 1;
         |                     ^~
   fs/splice.c: In function 'copy_splice_read':
   fs/splice.c:393:21: error: 'struct pipe_inode_info' has no member named 'head'
     393 |                 pipe->head++;
         |                     ^~
   fs/splice.c: In function 'splice_from_pipe_feed':
   fs/splice.c:446:33: error: 'struct pipe_inode_info' has no member named 'head'
     446 |         unsigned int head = pipe->head;
         |                                 ^~
   fs/splice.c:447:33: error: 'struct pipe_inode_info' has no member named 'tail'
     447 |         unsigned int tail = pipe->tail;
         |                                 ^~
   fs/splice.c:479:29: error: 'struct pipe_inode_info' has no member named 'tail'
     479 |                         pipe->tail = tail;
         |                             ^~
   fs/splice.c: In function 'eat_empty_buffer':
   fs/splice.c:494:33: error: 'struct pipe_inode_info' has no member named 'tail'
     494 |         unsigned int tail = pipe->tail;
         |                                 ^~
   fs/splice.c:499:21: error: 'struct pipe_inode_info' has no member named 'tail'
     499 |                 pipe->tail = tail+1;
         |                     ^~
   fs/splice.c: In function 'iter_file_splice_write':
   fs/splice.c:708:28: error: 'struct pipe_inode_info' has no member named 'head'
     708 |                 head = pipe->head;
         |                            ^~
   fs/splice.c:709:28: error: 'struct pipe_inode_info' has no member named 'tail'
     709 |                 tail = pipe->tail;
         |                            ^~
   fs/splice.c:751:28: error: 'struct pipe_inode_info' has no member named 'tail'
     751 |                 tail = pipe->tail;
         |                            ^~
   fs/splice.c:759:37: error: 'struct pipe_inode_info' has no member named 'tail'
     759 |                                 pipe->tail = tail;
         |                                     ^~
   fs/splice.c: In function 'splice_direct_to_actor':
   fs/splice.c:1122:13: error: 'struct pipe_inode_info' has no member named 'tail'
    1122 |         pipe->tail = pipe->head = 0;
         |             ^~
   fs/splice.c:1122:26: error: 'struct pipe_inode_info' has no member named 'head'
    1122 |         pipe->tail = pipe->head = 0;
         |                          ^~
   fs/splice.c: In function 'splice_pipe_to_pipe':
   fs/splice.c:1745:23: error: 'struct pipe_inode_info' has no member named 'tail'
    1745 |         i_tail = ipipe->tail;
         |                       ^~
   fs/splice.c:1746:23: error: 'struct pipe_inode_info' has no member named 'head'
    1746 |         o_head = opipe->head;
         |                       ^~
   fs/splice.c:1758:31: error: 'struct pipe_inode_info' has no member named 'head'
    1758 |                 i_head = ipipe->head;
         |                               ^~
   fs/splice.c:1759:31: error: 'struct pipe_inode_info' has no member named 'tail'
    1759 |                 o_tail = opipe->tail;
         |                               ^~
   fs/splice.c:1799:30: error: 'struct pipe_inode_info' has no member named 'tail'
    1799 |                         ipipe->tail = i_tail;
         |                              ^~
   fs/splice.c:1803:30: error: 'struct pipe_inode_info' has no member named 'head'
    1803 |                         opipe->head = o_head;
         |                              ^~
   fs/splice.c:1828:30: error: 'struct pipe_inode_info' has no member named 'head'
    1828 |                         opipe->head = o_head;
         |                              ^~
   fs/splice.c: In function 'link_pipe':
   fs/splice.c:1868:23: error: 'struct pipe_inode_info' has no member named 'tail'
    1868 |         i_tail = ipipe->tail;
         |                       ^~
   fs/splice.c:1869:23: error: 'struct pipe_inode_info' has no member named 'head'
    1869 |         o_head = opipe->head;
         |                       ^~
   fs/splice.c:1879:31: error: 'struct pipe_inode_info' has no member named 'head'
    1879 |                 i_head = ipipe->head;
         |                               ^~
   fs/splice.c:1880:31: error: 'struct pipe_inode_info' has no member named 'tail'
    1880 |                 o_tail = opipe->tail;
         |                               ^~
   fs/splice.c:1918:22: error: 'struct pipe_inode_info' has no member named 'head'
    1918 |                 opipe->head = o_head;
         |                      ^~
   include/linux/pipe_fs_i.h: In function 'pipe_buf_usage':
   include/linux/pipe_fs_i.h:223:1: warning: control reaches end of non-void function [-Wreturn-type]
     223 | }
         | ^
   include/linux/pipe_fs_i.h: In function 'pipe_head_buf':
   include/linux/pipe_fs_i.h:243:1: warning: control reaches end of non-void function [-Wreturn-type]
     243 | }
         | ^
   include/linux/pipe_fs_i.h: In function 'pipe_is_empty':
>> include/linux/pipe_fs_i.h:214:1: warning: control reaches end of non-void function [-Wreturn-type]
     214 | }
         | ^
   include/linux/pipe_fs_i.h: In function 'pipe_is_full':
   include/linux/pipe_fs_i.h:205:1: warning: control reaches end of non-void function [-Wreturn-type]
     205 | }
         | ^


vim +214 include/linux/pipe_fs_i.h

00a7d39898c8010 Linus Torvalds 2025-03-06  206  
00a7d39898c8010 Linus Torvalds 2025-03-06  207  /**
00a7d39898c8010 Linus Torvalds 2025-03-06  208   * pipe_is_empty - Return true if the pipe is empty
00a7d39898c8010 Linus Torvalds 2025-03-06  209   * @pipe: the pipe
00a7d39898c8010 Linus Torvalds 2025-03-06  210   */
00a7d39898c8010 Linus Torvalds 2025-03-06  211  static inline bool pipe_is_empty(const struct pipe_inode_info *pipe)
00a7d39898c8010 Linus Torvalds 2025-03-06  212  {
00a7d39898c8010 Linus Torvalds 2025-03-06  213  	return pipe_empty(pipe->head, pipe->tail);
00a7d39898c8010 Linus Torvalds 2025-03-06 @214  }
00a7d39898c8010 Linus Torvalds 2025-03-06  215  

:::::: The code at line 214 was first introduced by commit
:::::: 00a7d39898c8010bfd5ff62af31ca5db34421b38 fs/pipe: add simpler helpers for common cases

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
