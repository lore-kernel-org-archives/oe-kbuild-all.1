Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF7DDA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742926753; cv=none; b=qDU6O0lBjXdALCZT5JEitGkG456ahzACa6NSFYT25qGTKIlQIYphzdT1zK7LEAhuJP2q3aSSfjqfs4N5ahoTGz158C+kPdb7vxLqx54MpAx9OKK4oM8SIbukHYS7m22cazE6wZbz2YTeQrTsTIGEwq+ugsTgrwtqOd+FwnjcGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742926753; c=relaxed/simple;
	bh=v1qffiMFKFFR125k6W3nuMgsPGJkbfvMw/fq6Bd1Quo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfIrScTsFRtBwBlVLKhMBqywwxRekFI8PeAvLVpTBbV6brhf9YkhhNdHM40k9hXCO0EOD68V9VgXJaCV48MW9kiG3EnLo8j9rLHYkewrzux3IwsvjNyjr3quelRkxdbcvabtAGLhtuQfhm/G5GtV9CCFoUbpKJUi+QI0ZjHDFVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NktdwYDC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NktdwYDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742926751; x=1774462751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1qffiMFKFFR125k6W3nuMgsPGJkbfvMw/fq6Bd1Quo=;
  b=NktdwYDCFfPx8F+XCuv3nmAT8hBlrwxAFP+Gs0Tx5C8MqMENjEryRFVw
   44W1tIhtN0o4Fvh0TQSs04NU3G9remC6zWx1AwquGFta6cYEuFIer5Mgd
   9G/SFH+cO9zA6ig14ifDP9LGroQHS7QUsPBfnc54hc9ZxrACplS0FIDrI
   tZz3GVupOviyP4bf1SHyWefLXkaagee9sxwL4D9M6FUAI4kRDmss42/Me
   b9gVUew2mMiv39MxCmJIe6S0ZrVcwpFbQhxtglT0U6A+9SjlZPAMdXR4L
   1MMBQP7+sxdnb21yCCZFTzAmgMlfMeXdM4K4OGQTI5odreSGZdUlMq8Md
   g==;
X-CSE-ConnectionGUID: jSaaop2eSGC53pqria4SMg==
X-CSE-MsgGUID: GZLgLDfGTxu4A5uM+/+3Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44066782"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44066782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 11:19:11 -0700
X-CSE-ConnectionGUID: Blv2I9APRbCwLhWn0WF6Yg==
X-CSE-MsgGUID: /HmWC3OTTgyfTDsufTLBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="155474006"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 11:19:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx8rj-00055P-1T;
	Tue, 25 Mar 2025 18:19:07 +0000
Date: Wed, 26 Mar 2025 02:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 67/68] lib/dynamic_debug.c:295:38: error: 'const struct
 _ddebug' has no member named 'self_idx'; did you mean 'fl_idx'?
Message-ID: <202503260216.ImuOjQgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   b3403e5381a816d5b97a5ab4095621b108118049
commit: 3190fcdfbff3873a896edd7bc1fdcf7fe2f41403 [67/68] stuff
config: x86_64-randconfig-161-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260216.ImuOjQgq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260216.ImuOjQgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260216.ImuOjQgq-lkp@intel.com/

Note: the jimc/_r8 HEAD b3403e5381a816d5b97a5ab4095621b108118049 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:22,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'get_ddebug_header':
>> lib/dynamic_debug.c:295:38: error: 'const struct _ddebug' has no member named 'self_idx'; did you mean 'fl_idx'?
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |                                      ^~~~~~~~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   In file included from include/linux/container_of.h:5:
>> lib/dynamic_debug.c:295:38: error: 'const struct _ddebug' has no member named 'self_idx'; did you mean 'fl_idx'?
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |                                      ^~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   lib/dynamic_debug.c:295:15: note: in expansion of macro 'container_of'
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |               ^~~~~~~~~~~~
>> lib/dynamic_debug.c:295:38: error: 'const struct _ddebug' has no member named 'self_idx'; did you mean 'fl_idx'?
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |                                      ^~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   lib/dynamic_debug.c:295:15: note: in expansion of macro 'container_of'
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |               ^~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   lib/dynamic_debug.c:295:15: note: in expansion of macro 'container_of'
     295 |         box = container_of(&dp[-(dp->self_idx)],
         |               ^~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:226:13: warning: 'codetree_scan' defined but not used [-Wunused-function]
     226 | static void codetree_scan(const struct _ddebug_codetree *tree, char *id)
         |             ^~~~~~~~~~~~~


vim +295 lib/dynamic_debug.c

   222	
   223	/*
   224	 * validate codetree construction manual helpers
   225	 */
 > 226	static void codetree_scan(const struct _ddebug_codetree *tree, char *id)
   227	{
   228		const char **p;
   229		int i;
   230	
   231		v4pr_info("scan: %s\n", id);
   232	
   233		for (i = 0, p = tree->mods.start; i < tree->mods.len; i++, p++)
   234			v4pr_info("mods: %d %s\n", i, *p);
   235	
   236		for (i = 0, p = tree->files.start; i < tree->files.len; i++, p++)
   237			v4pr_info("files: %d %s\n", i, *p);
   238	
   239		for (i = 0, p = tree->funcs.start; i < tree->funcs.len; i++, p++)
   240			v4pr_info("funcs: %d %s\n", i, *p);
   241	
   242		for (i = 0, p = tree->_impl.start; i < tree->_impl.len; i++, p++)
   243			v4pr_info("impl: %d %s\n", i, *p);
   244	}
   245	
   246	static int codetree_sanity_check_namevec(const struct _ddebug_codetree *tree,
   247						 const struct _ddebug_namevec *vec,
   248						 const char *vec_name, const char *id,
   249						 int stor_len, int max_len)
   250	{
   251		if (vec->len < 0) {
   252			pr_err("chk:%s %s.len is negative\n", id, vec_name);
   253			return 1;
   254		} else if (vec->len > max_len) {
   255			pr_err("chk:%s %s.len %d exceeds max length\n", id, vec_name, vec->len);
   256			return 2;
   257		}
   258		if (!vec->start) {
   259			pr_err(":%s %s.start is NULL\n", id, vec_name);
   260			return 3;
   261		} else if (vec->start < &tree->_storage[0]) {
   262			pr_err(":%s %s.start below _storage\n", id, vec_name);
   263			return 4;
   264		} else if (&vec->start[vec->len] >= &tree->_storage[stor_len]) {
   265			v2pr_info(":%s %s %d is past _storage\n",
   266				  id, vec_name, vec->len);
   267			return 5;
   268		}
   269		return 0;
   270	}
   271	
   272	static inline void codetree_sanity_check(const struct _ddebug_codetree *tree,
   273						 unsigned long stor_len, char *id)
   274	{
   275		if (!tree) {
   276			pr_err("codetree_sanity_check: tree is NULL\n");
   277			return;
   278		}
   279		/* XXX: hardcoded limits from squeeze output */
   280		codetree_sanity_check_namevec(tree, &tree->funcs, "funcs", id, stor_len, 2384);
   281		codetree_sanity_check_namevec(tree, &tree->files, "files", id, stor_len, 540);
   282		codetree_sanity_check_namevec(tree, &tree->mods, "mods",   id, stor_len, 236);
   283		codetree_sanity_check_namevec(tree, &tree->_impl, "_impl", id, stor_len, 3160);
   284	}
   285	
   286	/* WIP 5000 is enough 3160 is not */
   287	#define CODETREE_SANITY_CHECK(tree, str)  codetree_sanity_check(tree, 5000, str)
   288	
   289	static __inline struct _ddebug_header *get_ddebug_header(const struct _ddebug *dp)
   290	{
   291		struct _ddebug_descriptors_vector *box;
   292		/*
   293		 * BIG-RED-FLAG: we are negative indexing from dp[N] back to dp[0]
   294		 */
 > 295		box = container_of(&dp[-(dp->self_idx)],
   296				   struct _ddebug_descriptors_vector,
   297				   descriptors[0]);
   298	
   299		return &box->header;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
