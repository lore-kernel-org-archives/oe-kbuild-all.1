Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864542A97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743155851; cv=none; b=fM2e1Cg6JeGXSVkHHTFUNFP5ZPU4JyJCgYQdjRtFZfqgIGsM8FVq84NVmVA/TFAXor45E7SKfKbHqdb+3zFa6C0K5eLmYCDG2F55iIoCRYRVZts2opSL7Fjq/m/WiZRgqek/a6ARc1NKxWMP/jdQtYVq8Y5qXy6QzkWmVehPZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743155851; c=relaxed/simple;
	bh=K8gxjDw0WhvBk/ycGdKwFKgnlnc56MRvEZKw6PQdCuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTYiXrXAJzmfwiGG8hiBhXEliWWY9IqpzO4Ole3DS5TvVYP4xLAAj602vfYzeV3LPlNhxRH//upl2TWEBShUXRd5VLUvSCiF8mWHsUAt+05lw1O7x3Rv+2Fx7TotwuCdPInRG8TfkPrPwL3GOttF+5p52NKh2QjzxfBIP40hObI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agakUqUw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agakUqUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743155850; x=1774691850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8gxjDw0WhvBk/ycGdKwFKgnlnc56MRvEZKw6PQdCuc=;
  b=agakUqUwQ0dirv6gQPRbiydx7gFUlZIKlJe/5QJQIWQS+F1Ao+0uIUaK
   MwaebvPy9BxdJUiDl4sJZE982K2BVYzRbITNMeaJa30kIeoqppBP+zDOu
   JfvqIcj7by15+4YochtSkE6TOAf93K3MoXlFWMGBAC3+g8jvMetQT2YTW
   03EYwJ043HxRVy4wnR+HEcj4lQhjmpfwc73CsHRZKH9fNyYx4zTsT7jRd
   q8GF3/8Bb5zxBEvapoys1eRUKKCRntdLvE7vkFJRLq7muxEiulIoFhQX3
   QlO9O0JNbdS1NiBokSDvmNv9WPjS9CpaDaZLeds0IQCI5Mgsp3rfyHK3L
   w==;
X-CSE-ConnectionGUID: Ye+UsA/7SgWP9b8JkcYDYw==
X-CSE-MsgGUID: YLltBuIBRI+PPrTgUUaDkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55886697"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55886697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:57:29 -0700
X-CSE-ConnectionGUID: 9W7lOXmFR4WqJH3x9httkQ==
X-CSE-MsgGUID: o9QkT99UQ5iYrv+GkzizHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125214752"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2025 02:57:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty6SM-0007L2-38;
	Fri, 28 Mar 2025 09:57:05 +0000
Date: Fri, 28 Mar 2025 17:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/5] fs/f2fs/dir.c:370:35: error: 'inode'
 undeclared
Message-ID: <202503281731.XvnfbHIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   221d9fea44a3b5a03030a89853dfb5e78a1cdc9f
commit: 221d9fea44a3b5a03030a89853dfb5e78a1cdc9f [5/5] f2fs: support to disable linear lookup fallback
config: riscv-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281731.XvnfbHIk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281731.XvnfbHIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281731.XvnfbHIk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:9:
   fs/f2fs/dir.c: In function '__f2fs_find_entry':
>> fs/f2fs/dir.c:370:35: error: 'inode' undeclared (first use in this function)
      !sb_no_casefold_compat_fallback(inode->i_sb)) {
                                      ^~~~~
   include/linux/fs.h:1259:3: note: in definition of macro 'sb_no_casefold_compat_fallback'
     (sb->s_encoding_flags & SB_ENC_NO_COMPAT_FALLBACK_FL)
      ^~
   fs/f2fs/dir.c:370:35: note: each undeclared identifier is reported only once for each function it appears in
      !sb_no_casefold_compat_fallback(inode->i_sb)) {
                                      ^~~~~
   include/linux/fs.h:1259:3: note: in definition of macro 'sb_no_casefold_compat_fallback'
     (sb->s_encoding_flags & SB_ENC_NO_COMPAT_FALLBACK_FL)
      ^~


vim +/inode +370 fs/f2fs/dir.c

   329	
   330	struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   331						 const struct f2fs_filename *fname,
   332						 struct page **res_page)
   333	{
   334		unsigned long npages = dir_blocks(dir);
   335		struct f2fs_dir_entry *de = NULL;
   336		unsigned int max_depth;
   337		unsigned int level;
   338		bool use_hash = true;
   339	
   340		*res_page = NULL;
   341	
   342	#if IS_ENABLED(CONFIG_UNICODE)
   343	start_find_entry:
   344	#endif
   345		if (f2fs_has_inline_dentry(dir)) {
   346			de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
   347			goto out;
   348		}
   349	
   350		if (npages == 0)
   351			goto out;
   352	
   353		max_depth = F2FS_I(dir)->i_current_depth;
   354		if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   355			f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   356				  dir->i_ino, max_depth);
   357			max_depth = MAX_DIR_HASH_DEPTH;
   358			f2fs_i_depth_write(dir, max_depth);
   359		}
   360	
   361		for (level = 0; level < max_depth; level++) {
   362			de = find_in_level(dir, level, fname, res_page, use_hash);
   363			if (de || IS_ERR(*res_page))
   364				break;
   365		}
   366	
   367	out:
   368	#if IS_ENABLED(CONFIG_UNICODE)
   369		if (IS_CASEFOLDED(dir) && !de && use_hash &&
 > 370			!sb_no_casefold_compat_fallback(inode->i_sb)) {
   371			use_hash = false;
   372			goto start_find_entry;
   373		}
   374	#endif
   375		/* This is to increase the speed of f2fs_create */
   376		if (!de)
   377			F2FS_I(dir)->task = current;
   378		return de;
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
