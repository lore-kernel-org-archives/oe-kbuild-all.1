Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BE71119
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 03:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbMq1ynM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702094156; x=1733630156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToOKcyzbi9vq3fn43pMX/Rf3LhxGWDivC79nWoOhgv0=;
  b=DbMq1ynMM3sAuRBdTwr//WNiepojo0qfoTjQEJeYHf/FOxkVB2FgOAXv
   D82gVm7B0PRLqppBsn3VXZ9mZAd8CsWvgKy1MRQ8X30EkZL+PIHQxpSUW
   m9+IlNR5GsxaVjXhKDidO45qTlHlGqEdsxbHRgFYb5g7dOpUPFiVEjGB8
   5SmL7THE+kLWV3kgtfBlVpJRHtB6d5DnvSqFQQwJG5q0OMllwJq70Id55
   rSLgGkT+luyWm0qKC+XTKAa65hjoUEraqdKk3YXvx1cGRUd4ZX7OaJ3PN
   Q1qS5+wzhGVxVVWX8NcA8TO8RPUAyYRheS+SQMCXM0ctzRawgqa2h4lTP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480687071"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="480687071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 19:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="838330437"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="838330437"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2023 19:55:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBoRS-000EmP-0I;
	Sat, 09 Dec 2023 03:55:50 +0000
Date: Sat, 9 Dec 2023 11:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [brauner-vfs:vfs.rw 21/24] include/linux/splice.h:97:58: error:
 'MAX_RW_COUNT' undeclared; did you mean 'VM_MAX_MAP_COUNT'?
Message-ID: <202312091134.8GTbNgos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.rw
head:   e5c56a33657bd9cc84d7562961b521bf6fe22e8f
commit: 4955c918c9e56c1f878359df6e71428d9d8ab2fa [21/24] fs: use splice_copy_file_range() inline helper
config: i386-buildonly-randconfig-005-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091134.8GTbNgos-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091134.8GTbNgos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091134.8GTbNgos-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from net/tls/tls_sw.c:38:
   include/linux/splice.h: In function 'splice_copy_file_range':
>> include/linux/splice.h:97:58: error: 'MAX_RW_COUNT' undeclared (first use in this function); did you mean 'VM_MAX_MAP_COUNT'?
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                                          ^~~~~~~~~~~~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   include/linux/splice.h:97:39: note: in expansion of macro 'min_t'
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                       ^~~~~
   include/linux/splice.h:97:58: note: each undeclared identifier is reported only once for each function it appears in
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                                          ^~~~~~~~~~~~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   include/linux/splice.h:97:39: note: in expansion of macro 'min_t'
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                       ^~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22:
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:28: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |                            ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   include/linux/splice.h:97:39: note: in expansion of macro 'min_t'
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                       ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:41: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                                         ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   include/linux/splice.h:97:39: note: in expansion of macro 'min_t'
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));
         |                                       ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:38: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                                      ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   include/linux/splice.h:97:39: note: in expansion of macro 'min_t'
      97 |                                       min_t(size_t, len, MAX_RW_COUNT));


vim +97 include/linux/splice.h

    65	
    66	typedef int (splice_actor)(struct pipe_inode_info *, struct pipe_buffer *,
    67				   struct splice_desc *);
    68	typedef int (splice_direct_actor)(struct pipe_inode_info *,
    69					  struct splice_desc *);
    70	
    71	extern ssize_t splice_from_pipe(struct pipe_inode_info *, struct file *,
    72					loff_t *, size_t, unsigned int,
    73					splice_actor *);
    74	extern ssize_t __splice_from_pipe(struct pipe_inode_info *,
    75					  struct splice_desc *, splice_actor *);
    76	extern ssize_t splice_to_pipe(struct pipe_inode_info *,
    77				      struct splice_pipe_desc *);
    78	extern ssize_t add_to_pipe(struct pipe_inode_info *,
    79				      struct pipe_buffer *);
    80	long vfs_splice_read(struct file *in, loff_t *ppos,
    81			     struct pipe_inode_info *pipe, size_t len,
    82			     unsigned int flags);
    83	ssize_t splice_direct_to_actor(struct file *file, struct splice_desc *sd,
    84				       splice_direct_actor *actor);
    85	long do_splice(struct file *in, loff_t *off_in, struct file *out,
    86		       loff_t *off_out, size_t len, unsigned int flags);
    87	long do_splice_direct(struct file *in, loff_t *ppos, struct file *out,
    88			      loff_t *opos, size_t len, unsigned int flags);
    89	long splice_file_range(struct file *in, loff_t *ppos, struct file *out,
    90			       loff_t *opos, size_t len);
    91	
    92	static inline long splice_copy_file_range(struct file *in, loff_t pos_in,
    93						  struct file *out, loff_t pos_out,
    94						  size_t len)
    95	{
    96		return splice_file_range(in, &pos_in, out, &pos_out,
  > 97					      min_t(size_t, len, MAX_RW_COUNT));
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
