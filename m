Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D067A7DA95
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729412310; cv=none; b=r1ZoHCU+eLjgSnGv8aNxVbSSNG7t7yy1DLP6lR8ESgLyDv/cFUJJHkFVxXXoX/FbiL8Md2q2LuR6n6XEzOHdyUPKxuozWMAC1INcGqpM9hqg+x5oVcUGdwKp+yODdhJH5vafqmG9NTU/ZJxrIjBzEF/V4TB3oh+yEx4vpK2vBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729412310; c=relaxed/simple;
	bh=+4GEsOd1GGY1fhV0/mvnTbC/Y5CqpLwYSe2LpSY/gCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHK0OQZCPVWFx3XOSpWjnBxJRckmkeDzHXNo2YOxZ/5sPPbSin0iDb2l5S8vdgtuFRb+yhWsJAjE7mQtbxTn0nrDztC79jYDqfmjRtA3MrNVI1dH3im986JigdYh4WjHw1D8ZwNDRdy1ygcs9abATcN5QKgLhBjyixMYaENTaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpAvnsKB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpAvnsKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729412308; x=1760948308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4GEsOd1GGY1fhV0/mvnTbC/Y5CqpLwYSe2LpSY/gCc=;
  b=LpAvnsKBcULiUltvwwLHA/KN2Ri3IosFdrOufLAzaLbkF4EcV2Fpzk1Z
   xSFhsbDYOElNvLen4gRD35rpDGSH8Cfvpllz5jQ47Rw048qYheEt/AarE
   oJ55npVM2JyAK8rdxNWPPZdnGhBxZNwDny1Sz9HFADYH11sykuFHC4LAB
   DmAE1D8MAFO2i0c/ZtmaiMxR/1ipbF2W1QL4nKBdLapjdLI42dgUsYOnH
   G4NdZbO+UFvcn0FXaeLYwOUAj9AzhbvUpcGPgZ7jL8+F0b2QfnrffLBc7
   YDi4huxWx4j1yM5vwjsnKkwD7I2q7QxCRmguVnHaUAjAjUc0CImxjZ8tG
   g==;
X-CSE-ConnectionGUID: LlZJxmctQ/m7Vg68AhYq4w==
X-CSE-MsgGUID: Tx5K5EK8Q6SKhMB/kcezWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28361616"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="28361616"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 01:18:26 -0700
X-CSE-ConnectionGUID: Iz6rc3wCT+uO5beXt3OEYQ==
X-CSE-MsgGUID: Q2Yj7Z8VS4SGpmimg0d21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="116712261"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 01:18:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2R8o-000Q4h-2D;
	Sun, 20 Oct 2024 08:18:22 +0000
Date: Sun, 20 Oct 2024 16:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 39/39] fs/nfsd/nfs4state.c:5493:13: error: 'mask'
 redeclared as different kind of symbol
Message-ID: <202410201645.Db3PJaxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   380a610024a1525d57e7d65bb495f7ecb87cb5ff
commit: 380a610024a1525d57e7d65bb495f7ecb87cb5ff [39/39] nfsd: add notification handlers for dir events
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241020/202410201645.Db3PJaxx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201645.Db3PJaxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201645.Db3PJaxx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:5488:5: warning: no previous prototype for 'nfsd_handle_dir_event' [-Wmissing-prototypes]
    5488 | int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
         |     ^~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c: In function 'nfsd_handle_dir_event':
>> fs/nfsd/nfs4state.c:5493:13: error: 'mask' redeclared as different kind of symbol
    5493 |         u32 mask = 0;
         |             ^~~~
   fs/nfsd/nfs4state.c:5488:31: note: previous definition of 'mask' with type 'u32' {aka 'unsigned int'}
    5488 | int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
         |                           ~~~~^~~~
   In file included from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/nfsd/nfs4state.c:36:
>> include/linux/container_of.h:19:37: error: expected expression before ';' token
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                     ^
   fs/nfsd/nfs4state.c:5501:41: note: in expansion of macro 'container_of'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
>> include/linux/compiler_types.h:458:64: error: expected expression before ')' token
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   fs/nfsd/nfs4state.c:5501:41: note: in expansion of macro 'container_of'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: 'struct file_lease' has no member named 'flc_list'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   fs/nfsd/nfs4state.c:5501:41: note: in expansion of macro 'container_of'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^~~~~~~~~~~~
>> include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   fs/nfsd/nfs4state.c:5501:41: note: in expansion of macro 'container_of'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from include/linux/file.h:9,
                    from fs/nfsd/nfs4state.c:35:
>> include/linux/stddef.h:16:33: error: 'struct file_lease' has no member named 'flc_list'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   fs/nfsd/nfs4state.c:5501:41: note: in expansion of macro 'container_of'
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                         ^~~~~~~~~~~~
>> fs/nfsd/nfs4state.c:5505:24: error: 'struct file_lock_core' has no member named 'fl_lmops'
    5505 |                 if (flc->fl_lmops != &nfsd_dir_lease_mng_ops)
         |                        ^~
>> fs/nfsd/nfs4state.c:5510:49: error: 'component4' {aka 'opaque'} has no member named 'count'
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                 ^~~~~
>> fs/nfsd/nfs4state.c:5510:61: error: 'name' is a pointer; did you mean to use '->'?
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                             ^
         |                                                             ->
>> fs/nfsd/nfs4state.c:5510:68: error: 'component4' {aka 'opaque'} has no member named 'element'
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                                    ^~~~~~~
   fs/nfsd/nfs4state.c:5510:82: error: 'name' is a pointer; did you mean to use '->'?
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                                                                  ^
         |                                                                                  ->
>> fs/nfsd/nfs4state.c:5511:25: error: expected ',' or ';' before 'struct'
    5511 |                         struct notify_remove4 nr = { };
         |                         ^~~~~~
>> fs/nfsd/nfs4state.c:5513:25: error: 'nr' undeclared (first use in this function)
    5513 |                         nr.nrm_old_entry.ne_file.count = name.len;
         |                         ^~
   fs/nfsd/nfs4state.c:5513:25: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfsd/nfs4state.c:5513:62: error: 'name' is a pointer; did you mean to use '->'?
    5513 |                         nr.nrm_old_entry.ne_file.count = name.len;
         |                                                              ^
         |                                                              ->
   fs/nfsd/nfs4state.c:5514:64: error: 'name' is a pointer; did you mean to use '->'?
    5514 |                         nr.nrm_old_entry.ne_file.element = name.name;
         |                                                                ^
         |                                                                ->
>> fs/nfsd/nfs4state.c:5516:47: warning: unused variable 'nr' [-Wunused-variable]
    5516 |                         struct notify_remove4 nr;
         |                                               ^~
>> fs/nfsd/nfs4state.c:5510:36: warning: unused variable 'oldname' [-Wunused-variable]
    5510 |                         component4 oldname = { .count = name.len, .element = name.name }
         |                                    ^~~~~~~
>> fs/nfsd/nfs4state.c:5503:41: warning: unused variable 'dp' [-Wunused-variable]
    5503 |                 struct nfs4_delegation *dp = flc->flc_owner;
         |                                         ^~
>> fs/nfsd/nfs4state.c:5501:36: warning: unused variable 'fl' [-Wunused-variable]
    5501 |                 struct file_lease *fl = container_of(struct file_lock_core,
         |                                    ^~
>> fs/nfsd/nfs4state.c:5489:46: warning: parameter 'name' set but not used [-Wunused-but-set-parameter]
    5489 |                           const struct qstr *name)
         |                           ~~~~~~~~~~~~~~~~~~~^~~~
>> fs/nfsd/nfs4state.c:5524:1: warning: control reaches end of non-void function [-Wreturn-type]
    5524 | }
         | ^


vim +/mask +5493 fs/nfsd/nfs4state.c

  5487	
> 5488	int nfsd_handle_dir_event(u32 mask, const struct inode *inode, const struct inode *dir,
> 5489				  const struct qstr *name)
  5490	{
  5491		struct file_lock_context *ctx;
  5492		struct file_lock_core *flc;
> 5493		u32 mask = 0;
  5494	
  5495		ctx = locks_inode_context(inode);
  5496		if (!ctx)
  5497			return 0;
  5498	
  5499		spin_lock(&ctx->flc_lock);
  5500		list_for_each_entry(flc, &ctx->flc_lease, flc_list) {
> 5501			struct file_lease *fl = container_of(struct file_lock_core,
  5502							     struct file_lease, flc_list);
> 5503			struct nfs4_delegation *dp = flc->flc_owner;
  5504	
> 5505			if (flc->fl_lmops != &nfsd_dir_lease_mng_ops)
  5506				continue;
  5507	
  5508			/* find delegation, check IGN bits, marshal notify if they match */
  5509			if (mask & FS_DELETE) {
> 5510				component4 oldname = { .count = name.len, .element = name.name }
> 5511				struct notify_remove4 nr = { };
  5512	
> 5513				nr.nrm_old_entry.ne_file.count = name.len;
  5514				nr.nrm_old_entry.ne_file.element = name.name;
  5515	
> 5516				struct notify_remove4 nr;
  5517	
  5518				if (!(flc->flc_flags & FL_IGN_DIR_DELETE))
  5519					continue;
  5520			}
  5521	
  5522		}
  5523		spin_unlock(&ctx->flc_lock);
> 5524	}
  5525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
