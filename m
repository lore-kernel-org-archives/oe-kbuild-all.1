Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C343411610
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820753; cv=none; b=P9mbG/1Boas5ncTM+PtppmY48xIvWlm2aSlVqctcRkVnR+EJbMICa0zJtkq4TCF7U9i34y73ybZQOYYZizOjpc68S9/eb4sfkhSpZxVmx66+f0DKXHCUEVdb6LuXntotHXrjKuHxhaZTKD3lM2yBrOKHIVor+NkwyPrzB+sUMPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820753; c=relaxed/simple;
	bh=OzxxVLHNyg1eQLTNOJB+RsZO6ynKZFPFKs3EQ6oqjNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=liRB/hTSqTNG6xZNl9mHsBNvFfCZBYziYUjAov+H17CHhi142KvPT3/rzg/mrKbi8BAfggh4HzmB9u7GDJnqHFm7IvL8cEE+xfju0qDuKmKLn8NgLhr8lWI+gEcbG87LIwRQdnZ2IDhpBupAV9kxHidFZ4RIelUB31CNBNNZyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNGFK1dx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNGFK1dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772820751; x=1804356751;
  h=date:from:to:cc:subject:message-id;
  bh=OzxxVLHNyg1eQLTNOJB+RsZO6ynKZFPFKs3EQ6oqjNU=;
  b=WNGFK1dx6cYe8p89FazGallVZdbYBhF7Wvo2EuURjc2bJ0v0qXuuHXtY
   OXxYxwTiv6AyUs7TwZRYD5/eU7VRJwmtAsPtIczsIfrVIzHK8Otuf8vqJ
   DIaCW83AYbSDtYhxgF+Oak5IsWRcs69TpNL3l3m+BtBmNIxi43sLWGHYb
   cLNSaTPSDyDe6eU5GlsKdCfxMVMH0JRtoMPS7mb3LbmL5Jat1BYF71qQs
   Hs//4O1zUB+h9+lUEwIy6dq5YxZgX8dZnxTGEzGfN4L+3qnXRHSWOwBsv
   w62nBjx6x2jBij5bg5uWjKDbeaVM/BVEVnT74bXpwF/PtUsugx+4ioTeP
   g==;
X-CSE-ConnectionGUID: sOH7vCrOSdq25zlF7CgU0g==
X-CSE-MsgGUID: fa3jj2tUSR24EYtfOA/tNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84260311"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84260311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:12:29 -0800
X-CSE-ConnectionGUID: 0zCdjnqCR3OdnOOGDsmpRA==
X-CSE-MsgGUID: qsido6CvSLCAQdQrpRq71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="257005768"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 10:12:27 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyZez-000000001Bf-02Wx;
	Fri, 06 Mar 2026 18:12:25 +0000
Date: Sat, 07 Mar 2026 02:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 8/10] kernel/nscommon.c:139:36:
 error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
Message-ID: <202603070210.uxOfR4wS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: f47f26c89ec2f958b9f90f1fe8b4a011b7cb4224 [8/10] fanotify: add support for watching the namespaces tree
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603070210.uxOfR4wS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070210.uxOfR4wS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070210.uxOfR4wS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/nscommon.c: In function 'ns_common_notify':
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/linux/compiler_types.h:642:53: note: in definition of macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
   In file included from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:372,
                    from include/asm-generic/barrier.h:16,
                    from arch/alpha/include/asm/barrier.h:21,
                    from arch/alpha/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/ns/ns_common_types.h:5,
                    from include/linux/ns_common.h:5,
                    from kernel/nscommon.c:4:
>> kernel/nscommon.c:139:36: error: 'struct user_namespace' has no member named 'n_fsnotify_marks'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                                    ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/nscommon.c:139:14: note: in expansion of macro 'READ_ONCE'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |              ^~~~~~~~~
>> kernel/nscommon.c:142:9: error: implicit declaration of function 'fsnotify_ns'; did you mean 'fsnotify_mnt'? [-Wimplicit-function-declaration]
     142 |         fsnotify_ns(mask, owner_userns, ns->ns_id,
         |         ^~~~~~~~~~~
         |         fsnotify_mnt


vim +139 kernel/nscommon.c

   127	
   128	static void ns_common_notify(__u32 mask, struct ns_common *ns)
   129	{
   130		struct user_namespace *owner_userns;
   131	
   132		if (!IS_ENABLED(CONFIG_FSNOTIFY))
   133			return;
   134	
   135		owner_userns = ns_direct_owner(ns);
   136		if (!owner_userns)
   137			return;
   138	
 > 139		if (!READ_ONCE(owner_userns->n_fsnotify_marks))
   140			return;
   141	
 > 142		fsnotify_ns(mask, owner_userns, ns->ns_id,
   143			    to_ns_common(owner_userns)->ns_id);
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
