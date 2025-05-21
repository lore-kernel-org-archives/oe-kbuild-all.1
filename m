Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7EB1D89E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797794; cv=none; b=ml3II18aunY/uj0r5BHxgBTlv5Jk/hhOP63nQA2MXWOc2BD0EW+9hAJB33PImDWnnW175FG+4Nc9YoWOYswnn9JdeAAqB3e/YKG856Hy1w8Hl4IwL/BSr5+foCmQOfUoHULkJ3YDdgPk8kW5QP6nw6g+0h/WluXm1YkNQBtS6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797794; c=relaxed/simple;
	bh=+YEFzKaq9psK2JzVF99fnivsUq5RoK1qnhfPh9Gmews=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+sev/flUDT/0GfL5AYeJpy+zfAEqdEj2YwSVvdoqFllw+x4bcgNnkrA+zNeoalkyaeBHbEoFjByVLxQ25qCEYFqgbcpjhGIkN1EB/7YRTj8HR7g3zo1rI8UDv0gSCMqpJnP3cUio/+xKwFZcTSm3r0rO3/BXXI5uZQdjVSBoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLKpdH42; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLKpdH42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747797792; x=1779333792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YEFzKaq9psK2JzVF99fnivsUq5RoK1qnhfPh9Gmews=;
  b=iLKpdH42A1MetlkLZPa8dJ/HJy7blq9plBQct4okJsRBKLvdvZyd//uU
   oTMB8TNpGslAUI4Uv7hLStbLQYDpvol5h1/N54eWFCpMyH15xPcRwdokb
   BWIdWNpm0S/7tYEMYbQQLyNRw5dctS0imH0hTbk/mthQD3l9H1ZxGb4Jz
   d3hHkdKqZSmIpyQoKy4kqHlnF07l/y/cqMYUlC19x0QFvgTwlBoiMY/Pb
   Abv2MbZ3fqx5Da5NV333dzy1jRs4f7PU72ziWpg5cryTSoVhqLPifI1h0
   Tb4Ns00kPx3fEag3m6TkBB973p87jJeT+yHevXKdzknde/6aGtIkdVXMs
   Q==;
X-CSE-ConnectionGUID: Wy8fe0yyTZKoKYXcD3QjwA==
X-CSE-MsgGUID: 1hpWFtv4TKiEdllLNhVqig==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61157292"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61157292"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:23:10 -0700
X-CSE-ConnectionGUID: kv5aJe2zRFSIgcK6+BH+Fw==
X-CSE-MsgGUID: i0Y3QJAsQs2f5CauknD2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144623290"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 20:23:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHa2s-000NpC-2C;
	Wed, 21 May 2025 03:23:06 +0000
Date: Wed, 21 May 2025 11:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 253/257] fs/dcache.c:3279:
 warning: Function parameter or struct member 'rename' not described in
 'd_casefold_enable'
Message-ID: <202505211103.Got6s4Fx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   e4be9413b049e0e7d219b061645621e995713a40
commit: 3435ad1cfa6dd84d4d501f702156c14437926b1b [253/257] fixup! fs: dcache locking for exlusion between overlayfs, casefolding
config: arc-randconfig-001-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211103.Got6s4Fx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211103.Got6s4Fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211103.Got6s4Fx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/dcache.c:3225: warning: Function parameter or struct member 'dentry' not described in 'd_casefold_disabled_put'
   fs/dcache.c:3247: warning: Function parameter or struct member 'dentry' not described in 'd_casefold_disabled_get'
   fs/dcache.c:3279: warning: Function parameter or struct member 'dentry' not described in 'd_casefold_enable'
   fs/dcache.c:3279: warning: Function parameter or struct member 'e' not described in 'd_casefold_enable'
>> fs/dcache.c:3279: warning: Function parameter or struct member 'rename' not described in 'd_casefold_enable'


vim +3279 fs/dcache.c

42b436b4f7bbf1 Kent Overstreet 2025-05-19  3218  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3219  /**
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3220   * d_casefold_disabled_put - drop a "casefold disabled" ref
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3221   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3222   * Only for overlayfs.
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3223   */
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3224  void d_casefold_disabled_put(struct dentry *dentry)
42b436b4f7bbf1 Kent Overstreet 2025-05-19 @3225  {
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3226  	if (!(dentry->d_sb->s_flags & SB_CASEFOLD))
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3227  		return;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3228  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3229  	guard(mutex)(&no_casefold_dentries_lock);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3230  	no_casefold_dentry_put(dentry, ref_casefold_disable);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3231  }
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3232  EXPORT_SYMBOL_GPL(d_casefold_disabled_put);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3233  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3234  /**
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3235   * d_casefold_disabled_get - attempt to disable casefold on a tree
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3236   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3237   * Only for overlayfs.
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3238   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3239   * Returns -EINVAL if casefolding is in use on any subdirectory; this must be
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3240   * tracked by the filesystem.
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3241   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3242   * On success, returns with a reference held that must be released by
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3243   * d_casefold_disabled_put(); this ref blocks casefold from being enabled
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3244   * by d_casefold_enable().
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3245   */
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3246  int d_casefold_disabled_get(struct dentry *dentry)
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3247  {
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3248  	if (!(dentry->d_sb->s_flags & SB_CASEFOLD))
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3249  		return 0;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3250  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3251  	guard(mutex)(&no_casefold_dentries_lock);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3252  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3253  	if (!(dentry->d_inode->i_flags & S_NO_CASEFOLD))
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3254  		return -EINVAL;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3255  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3256  	return no_casefold_dentry_get(dentry, ref_casefold_disable);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3257  }
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3258  EXPORT_SYMBOL_GPL(d_casefold_disabled_get);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3259  
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3260  static struct dentry *dget_parent_this_sb(struct dentry *dentry)
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3261  {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3262  	struct dentry *parent = dentry != dentry->d_sb->s_root
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3263  		? dget_parent(dentry)
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3264  		: NULL;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3265  	dput(dentry);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3266  	return parent;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3267  }
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3268  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3269  /**
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3270   * d_casefold_enable - check if casefolding may be enabled on a dentry
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3271   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3272   * Returns -EINVAL if casefolding has been disabled on any parent directory (by
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3273   * overlayfs).
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3274   *
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3275   * On success the inode will hase S_NO_CASEFOLD cleared.
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3276   */
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3277  int d_casefold_enable(struct dentry *dentry, struct d_casefold_enable *e,
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3278  		      bool rename)
42b436b4f7bbf1 Kent Overstreet 2025-05-19 @3279  {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3280  	struct super_block *sb = dentry->d_sb;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3281  	int ret = 0;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3282  
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3283  	if (rename) {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3284  		lockdep_assert_held(&sb->s_vfs_rename_mutex);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3285  		e->rename_mutex_held = NULL;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3286  	} else {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3287  		mutex_lock(&sb->s_vfs_rename_mutex);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3288  		e->rename_mutex_held = sb;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3289  	}
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3290  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3291  	guard(mutex)(&no_casefold_dentries_lock);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3292  
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3293  	dget(dentry);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3294  
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3295  	for (struct dentry *i = dentry; i; i = dget_parent_this_sb(i)) {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3296  		if (!(i->d_inode->i_flags & S_NO_CASEFOLD)) {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3297  			dput(i);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3298  			break;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3299  		}
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3300  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3301  		ret = darray_push(&e->refs, i);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3302  		if (ret) {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3303  			dput(i);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3304  			goto err;
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3305  		}
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3306  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3307  		ret = no_casefold_dentry_get(i, ref_casefold_enable);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3308  		if (ret) {
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3309  			dput(i);
3435ad1cfa6dd8 Kent Overstreet 2025-05-20  3310  			--e->refs.nr;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3311  			goto err;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3312  		}
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3313  	}
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3314  
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3315  	return 0;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3316  err:
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3317  	darray_for_each(e->refs, i)
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3318  		no_casefold_dentry_put(*i, ref_casefold_enable);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3319  	darray_exit(&e->refs);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3320  	return ret;
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3321  }
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3322  EXPORT_SYMBOL_GPL(d_casefold_enable);
42b436b4f7bbf1 Kent Overstreet 2025-05-19  3323  

:::::: The code at line 3279 was first introduced by commit
:::::: 42b436b4f7bbf1584485cfa3a64bd4a42f3ba6dc fs: dcache locking for exlusion between overlayfs, casefolding

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
