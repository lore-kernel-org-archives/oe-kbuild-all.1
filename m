Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F6282E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809201; cv=none; b=jDwHfRqtWYXTJblRaTSwklVI4r4seYjPv6b8saMilSX2aMQ9RHPWiDtqIPdU1VRjwNLwNUTI1EnuiAnQEgR6nnrEou5nfQGr0R36jQtqNfRDgleSj74Va644Mw4x67LsVhFcDf4/ARnzlsAT1ch9aYWtmppDgvVl+fWh8e3yiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809201; c=relaxed/simple;
	bh=l9GGzaeFCCNWFk7XpwMAwbqxPzawuyPL3HXoH7g1w1E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFDtlEhksIRI8s5gCNpmH0hR5eSC6hLdbRXmJ34PcBQHdW9P34zZWBHNOwe1V8qIJYgA6YyIQJYgty/sDIutUQZUwHtj57+vlv8kZEx4Y3G/a44B6+tEYzfhiYpHrm/+rUfgUjNIMtLA0Ei24Rcn2+9xkNlx6eGND6XDIO8YmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGo7jOcu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGo7jOcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739809199; x=1771345199;
  h=date:from:cc:subject:message-id:mime-version;
  bh=l9GGzaeFCCNWFk7XpwMAwbqxPzawuyPL3HXoH7g1w1E=;
  b=YGo7jOcuIW5moM91u/lgt6KcqscaKjvBLqrhZu2lVhtZYfYTmW1PQWX4
   8HVRnZvOogYkyiHnDKW0inCSUaU0AiRjbpiNOR56Tuxh4rzQmy01hmQrj
   ddBSFCLnqNaMSVVvuIbjEagC4JTJ44u/wjn9sbjWli1MRe+SQswZFvehW
   MhNrXoZE0YZZSZaJSBhsjSEwFu8KbFhwUhjX1t7wNstmQpi9UZU0yi5I8
   TvM3g3GS0M0LElYDhSVKBXXfrKubm5ZRCji86Rih1nrRujv2E5NH9FotB
   yKBzPSt2/vdLv0pTjNptg1UeTaYrX324cxLhyzs692p+6mP0RNm3CUawv
   A==;
X-CSE-ConnectionGUID: JeqBWOE8Sv6c5O+y5Y7myw==
X-CSE-MsgGUID: IkdhjKcoSDi4hVZu8hqfqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65850096"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="65850096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 08:19:58 -0800
X-CSE-ConnectionGUID: /x/xm/+rQte3dNLUlSoJoQ==
X-CSE-MsgGUID: d0uwwJaYR92yrjLKhyDaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="113901708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2025 08:19:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk3qd-001DKZ-0a
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 16:19:55 +0000
Date: Tue, 18 Feb 2025 00:19:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:255:15: warning: array
 subscript idx is outside array bounds of 'struct etnaviv_gem_submit_bo[0]'
Message-ID: <202502180032.M2H2fGjh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: a20ca6744ba7e683a772bb5f1715e4662342be58 [1/1] Build etnaviv on non-ARM architectures
config: sparc64-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180032.M2H2fGjh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180032.M2H2fGjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180032.M2H2fGjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:274:17: note: in expansion of macro 'if'
     274 |                 if (unlikely(r->flags)) {
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:274:21: note: in expansion of macro 'unlikely'
     274 |                 if (unlikely(r->flags)) {
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:274:17: note: in expansion of macro 'if'
     274 |                 if (unlikely(r->flags)) {
         |                 ^~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_unlock_object':
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:110:24: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     110 |         if (submit->bos[i].flags & BO_LOCKED) {
         |             ~~~~~~~~~~~^~~
   include/linux/compiler.h:58:37: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                     ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:110:9: note: in expansion of macro 'if'
     110 |         if (submit->bos[i].flags & BO_LOCKED) {
         |         ^~
   In file included from drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:23:
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:111:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     111 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:114:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     114 |                 submit->bos[i].flags &= ~BO_LOCKED;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:114:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     114 |                 submit->bos[i].flags &= ~BO_LOCKED;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_cleanup':
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:370:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     370 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:373:32: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     373 |                 if (submit->bos[i].flags & BO_PINNED) {
         |                     ~~~~~~~~~~~^~~
   include/linux/compiler.h:58:37: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                     ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:373:17: note: in expansion of macro 'if'
     373 |                 if (submit->bos[i].flags & BO_PINNED) {
         |                 ^~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:374:68: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     374 |                         etnaviv_gem_mapping_unreference(submit->bos[i].mapping);
         |                                                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:376:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     376 |                         submit->bos[i].mapping = NULL;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:377:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     377 |                         submit->bos[i].flags &= ~BO_PINNED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:377:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     377 |                         submit->bos[i].flags &= ~BO_PINNED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_bo':
>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:255:15: warning: array subscript idx is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     255 |         *bo = &submit->bos[idx];
         |               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_lock_objects':
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:125:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     125 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:132:34: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     132 |                 if (!(submit->bos[i].flags & BO_LOCKED)) {
         |                       ~~~~~~~~~~~^~~
   include/linux/compiler.h:58:37: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                     ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:132:17: note: in expansion of macro 'if'
     132 |                 if (!(submit->bos[i].flags & BO_LOCKED)) {
         |                 ^~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:140:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     140 |                         submit->bos[i].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:140:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     140 |                         submit->bos[i].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:158:42: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     158 |                 etnaviv_obj = submit->bos[contended].obj;
         |                               ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:164:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     164 |                         submit->bos[contended].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:164:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     164 |                         submit->bos[contended].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_fence_sync':
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     191 |                         ret = reservation_object_get_fences_rcu(robj, &bo->excl,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                                                                 &bo->nr_shared,
         |                                                                 ~~~~~~~~~~~~~~~
     193 |                                                                 &bo->shared);
         |                                                                 ~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     191 |                         ret = reservation_object_get_fences_rcu(robj, &bo->excl,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                                                                 &bo->nr_shared,
         |                                                                 ~~~~~~~~~~~~~~~
     193 |                                                                 &bo->shared);
         |                                                                 ~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +255 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c

a8c21a5451d831 The etnaviv authors 2015-12-03  245  
a8c21a5451d831 The etnaviv authors 2015-12-03  246  static int submit_bo(struct etnaviv_gem_submit *submit, u32 idx,
8779aa8f8b7fa3 Russell King        2016-01-21  247  	struct etnaviv_gem_submit_bo **bo)
a8c21a5451d831 The etnaviv authors 2015-12-03  248  {
a8c21a5451d831 The etnaviv authors 2015-12-03  249  	if (idx >= submit->nr_bos) {
a8c21a5451d831 The etnaviv authors 2015-12-03  250  		DRM_ERROR("invalid buffer index: %u (out of %u)\n",
a8c21a5451d831 The etnaviv authors 2015-12-03  251  				idx, submit->nr_bos);
a8c21a5451d831 The etnaviv authors 2015-12-03  252  		return -EINVAL;
a8c21a5451d831 The etnaviv authors 2015-12-03  253  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  254  
8779aa8f8b7fa3 Russell King        2016-01-21 @255  	*bo = &submit->bos[idx];
a8c21a5451d831 The etnaviv authors 2015-12-03  256  
a8c21a5451d831 The etnaviv authors 2015-12-03  257  	return 0;
a8c21a5451d831 The etnaviv authors 2015-12-03  258  }
a8c21a5451d831 The etnaviv authors 2015-12-03  259  

:::::: The code at line 255 was first introduced by commit
:::::: 8779aa8f8b7fa397a0abe9e6af3334ea41e15836 drm: etnaviv: clean up submit_bo()

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
