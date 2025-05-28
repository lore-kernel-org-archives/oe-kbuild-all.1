Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377772868B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437811; cv=none; b=oHWMrZ8GVnekCdQJur2esTDuzOTl0B3KT+RnaebduaPeBDDsn9bzErPMNx/nqAEVwT+EC5p6didFCBh5q1pfimRhqVemc0AZvuVNzXXiKRlVqV0UK9m5GWnOu7KGVuP74GTGA6chbe87GlRt5POyT8F/YNJQX5YunbH8b8QJdZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437811; c=relaxed/simple;
	bh=wjcHGo564Ptj0r6/+jTj+DwlaUmlgRY+WixEYY/0sU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2pOGxA272aNxfnJ6jeXrE73f4BV2oXnzrJLgZUNapv969wRvnz+8tkz34GZ67kVXwCR+/Q2+FxoBgQ9+7L7E3/ccp0HJ9JF7/yCNPyQ5HkL9jS2NNennELcwuir7WXgYPJ9ZGo5BBsOe2SWSem/VmUF3N4hi5Yo8+jOwC69f1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwNYsOId; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwNYsOId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748437810; x=1779973810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wjcHGo564Ptj0r6/+jTj+DwlaUmlgRY+WixEYY/0sU0=;
  b=BwNYsOIdhNk4TDccHp5XgCHoUz5MA5t3zErStQNIumwJpS+l0MX5l7Ut
   eJ8/3s5vIHjuZCind/7Rt+ABwtkSRTDKPG8q5F0QjeNQNQIWuhKCuqEaG
   fYqXmPGfCOSvk86R/Y2nz6sXyUWcSkxgkCEElvwLNKrfygeKCA+OYNbn5
   VLxABOa+iOrztgdLnLXB5VyXm73yf4LR9IT8LtsEKbiCzoUJrbt7ULWky
   kOoKoS0rSZAhrgYkgTy4Nbv8rBoUCSw4OU3N6FQWPLPv8DWV+V1sGceeW
   EwgF0JgbZf5uWsDhuJExz4vXyRf3vIksVdoOYw0nkNZsR2+AAUSwsL2/i
   g==;
X-CSE-ConnectionGUID: gFWIc9iFQDWVz+uMlvI48w==
X-CSE-MsgGUID: xEFJnRnpT7+oSNHwO8fPiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61122021"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61122021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:10:08 -0700
X-CSE-ConnectionGUID: ijZpI7Y9SbmsDUK80ODSaQ==
X-CSE-MsgGUID: 4ePgGhacSQy8XAZndmIboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148276477"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2025 06:10:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKGXk-000VgA-14;
	Wed, 28 May 2025 13:10:04 +0000
Date: Wed, 28 May 2025 21:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>,
	linux-fsdevel@vger.kernel.org, Johannes.Thumshirn@wdc.com
Cc: oe-kbuild-all@lists.linux.dev,
	Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: Re: [PATCH v5] block: support mtd:<name> syntax for block devices
Message-ID: <202505282035.6vfhJHYl-lkp@intel.com>
References: <20250527151134.566571-1-joakim.tjernlund@infinera.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527151134.566571-1-joakim.tjernlund@infinera.com>

Hi Joakim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joakim-Tjernlund/block-support-mtd-name-syntax-for-block-devices/20250527-231359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250527151134.566571-1-joakim.tjernlund%40infinera.com
patch subject: [PATCH v5] block: support mtd:<name> syntax for block devices
config: i386-randconfig-141-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282035.6vfhJHYl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282035.6vfhJHYl-lkp@intel.com/

smatch warnings:
block/bdev.c:1097 bdev_file_open_by_path() warn: inconsistent indenting

vim +1097 block/bdev.c

f3a608827d1f8d Christian Brauner 2024-02-08  1070  
f3a608827d1f8d Christian Brauner 2024-02-08  1071  struct file *bdev_file_open_by_path(const char *path, blk_mode_t mode,
f3a608827d1f8d Christian Brauner 2024-02-08  1072  				    void *holder,
f3a608827d1f8d Christian Brauner 2024-02-08  1073  				    const struct blk_holder_ops *hops)
f3a608827d1f8d Christian Brauner 2024-02-08  1074  {
7c09a4ed6156c6 Christian Brauner 2024-01-23  1075  	struct file *file;
f3a608827d1f8d Christian Brauner 2024-02-08  1076  	dev_t dev;
f3a608827d1f8d Christian Brauner 2024-02-08  1077  	int error;
f3a608827d1f8d Christian Brauner 2024-02-08  1078  
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1079  #ifdef CONFIG_MTD_BLOCK
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1080         if (!strncmp(path, "mtd:", 4)) {
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1081                 struct mtd_info *mtd;
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1082  
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1083                 /* mount by MTD device name */
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1084                 pr_debug("path name \"%s\"\n", path);
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1085                 mtd = get_mtd_device_nm(path + 4);
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1086                 if (IS_ERR(mtd))
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1087                         return ERR_PTR(-EINVAL);
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1088                 dev = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1089         } else
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1090  #endif
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1091         {
f3a608827d1f8d Christian Brauner 2024-02-08  1092  	       error = lookup_bdev(path, &dev);
f3a608827d1f8d Christian Brauner 2024-02-08  1093  	       if (error)
f3a608827d1f8d Christian Brauner 2024-02-08  1094  		       return ERR_PTR(error);
e02c700b2107f3 Joakim Tjernlund  2025-05-27  1095         }
f3a608827d1f8d Christian Brauner 2024-02-08  1096  
7c09a4ed6156c6 Christian Brauner 2024-01-23 @1097  	file = bdev_file_open_by_dev(dev, mode, holder, hops);
7c09a4ed6156c6 Christian Brauner 2024-01-23  1098  	if (!IS_ERR(file) && (mode & BLK_OPEN_WRITE)) {
7c09a4ed6156c6 Christian Brauner 2024-01-23  1099  		if (bdev_read_only(file_bdev(file))) {
7c09a4ed6156c6 Christian Brauner 2024-01-23  1100  			fput(file);
7c09a4ed6156c6 Christian Brauner 2024-01-23  1101  			file = ERR_PTR(-EACCES);
f3a608827d1f8d Christian Brauner 2024-02-08  1102  		}
f3a608827d1f8d Christian Brauner 2024-02-08  1103  	}
f3a608827d1f8d Christian Brauner 2024-02-08  1104  
7c09a4ed6156c6 Christian Brauner 2024-01-23  1105  	return file;
f3a608827d1f8d Christian Brauner 2024-02-08  1106  }
f3a608827d1f8d Christian Brauner 2024-02-08  1107  EXPORT_SYMBOL(bdev_file_open_by_path);
f3a608827d1f8d Christian Brauner 2024-02-08  1108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
