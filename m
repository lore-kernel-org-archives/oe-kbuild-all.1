Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7FF2153F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701489; cv=none; b=a72taiE0HxopH7cgEhpwIILFxhUpr15NEZ+gdJEMazZF/5wZzXE4PoOyJoMf9FAXnmmWlA1LmMFFS+4Wge06UPFauVV062WoR0+duXqfuoEFx97Tb8jMf9aOM+q9U90ZspZn/PPY7XjH6OjBv9pz8vybUcwE5Fy82MPFhAd3Ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701489; c=relaxed/simple;
	bh=kbm4obwbEUfjLX/YvlcqG7pXwN7DQoJTuwlgZn7OiAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uoa0aezRmE1JfbpiPvLfXJoQZAYzhOV2gZK1YSmnh0a/twWLKLskiphIpqFCb6nFqiAFhXI74spHoQ4wPe1ivpwbY9O2/iXSTyJSsHmQ+To7BGc8fc+DS2xm4aVDHO4N+q4ReY1e9fe3goF4opuIPVE6oKketmoiE1ByzFhUkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9huniUV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9huniUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701489; x=1766237489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbm4obwbEUfjLX/YvlcqG7pXwN7DQoJTuwlgZn7OiAI=;
  b=V9huniUVeKQ213tR05TawU22ulgtF1TtkNxO2FN6nsSsK0rb3anmwzb6
   Wq6QyQcLIlR4LIon9K27DYJThtwPY+Ii4KwQatA4zuGMJMoDqq6Ej12mN
   bvDHgmkvYXpkFXUfoiy9PCUsZUEnf9dFKSQR4iJDiBUgMW1avvt9ZJy2l
   ifNGTPgBv6G9l2uUmLFsofHOds3sKhCIO4NzAEo6TRJ9Us/5L65L1cyGE
   Az4p3LKYDZDdSNlFSg9v0E0+AAa3+XaXCoFwvtKNcOhnzK5Gjbc7bK9HE
   TE09JOOBtrpe3S+TeI+NKjHr/g4t87kiNcPa6zo6uli1milQ2l9Vruf1o
   g==;
X-CSE-ConnectionGUID: kMPbg2HgT+Sv3KNmBeIzbw==
X-CSE-MsgGUID: iHilONlsSOKt3lJV4k1Cxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45740731"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45740731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:31:27 -0800
X-CSE-ConnectionGUID: sPiU42OGR9qtxom0zCRASw==
X-CSE-MsgGUID: B5MiCPtuR9aSaMzt8hmrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103502793"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 05:31:24 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOd6A-0001BR-1k;
	Fri, 20 Dec 2024 13:31:22 +0000
Date: Fri, 20 Dec 2024 21:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lee <chullee@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 15/15] fs/f2fs/dir.c:339:1: warning: label
 'start_find_entry' defined but not used
Message-ID: <202412202124.DeiZjaVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   3f1a145b84bcf0fae986212590bfeeaf165d22d6
commit: 3f1a145b84bcf0fae986212590bfeeaf165d22d6 [15/15] f2fs: Introduce linear search for dentries
config: arc-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202124.DeiZjaVi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202124.DeiZjaVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202124.DeiZjaVi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/dir.c: In function '__f2fs_find_entry':
>> fs/f2fs/dir.c:339:1: warning: label 'start_find_entry' defined but not used [-Wunused-label]
     339 | start_find_entry:
         | ^~~~~~~~~~~~~~~~


vim +/start_find_entry +339 fs/f2fs/dir.c

   326	
   327	struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   328						 const struct f2fs_filename *fname,
   329						 struct page **res_page)
   330	{
   331		unsigned long npages = dir_blocks(dir);
   332		struct f2fs_dir_entry *de = NULL;
   333		unsigned int max_depth;
   334		unsigned int level;
   335		bool use_hash = true;
   336	
   337		*res_page = NULL;
   338	
 > 339	start_find_entry:
   340		if (f2fs_has_inline_dentry(dir)) {
   341			de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
   342			goto out;
   343		}
   344	
   345		if (npages == 0)
   346			goto out;
   347	
   348		max_depth = F2FS_I(dir)->i_current_depth;
   349		if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   350			f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   351				  dir->i_ino, max_depth);
   352			max_depth = MAX_DIR_HASH_DEPTH;
   353			f2fs_i_depth_write(dir, max_depth);
   354		}
   355	
   356		for (level = 0; level < max_depth; level++) {
   357			de = find_in_level(dir, level, fname, res_page, use_hash);
   358			if (de || IS_ERR(*res_page))
   359				break;
   360		}
   361	
   362	out:
   363	#if IS_ENABLED(CONFIG_UNICODE)
   364		if (IS_CASEFOLDED(dir) && !de && use_hash) {
   365			use_hash = false;
   366			goto start_find_entry;
   367		}
   368	#endif
   369		/* This is to increase the speed of f2fs_create */
   370		if (!de)
   371			F2FS_I(dir)->task = current;
   372		return de;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
