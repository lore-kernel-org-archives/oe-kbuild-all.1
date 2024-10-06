Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78E9A920
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 00:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728175295; cv=none; b=Pn7JWPeC96B9d6GuJnxbwEn6bQoWLUdH2sPCBCP4YxaeOAPi+VDvtDbXtxzsgWiumGXPCn5hQ0LQtBjtBz3JGzN/dgH8g4g7zq2QyS/So36LzEE5z8K0pJVFh886j3IsTi36XsVCg4ijIgZYq55sFn3zZ2fuGVKGPh/IQsmadGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728175295; c=relaxed/simple;
	bh=GOZ893qCXjLIiSzwzZVk+JV053kjwR0YUK00/M4MkrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwlAtwmC4gfcR2NP/HnniIRp4Iv1l65jbxmub5cKFSdiYaPF/dC1bs6MejO/BwJ/tnyoJmwkhfmQ9VDHERMEZ6hqNX6e2spPC4BGjuCgiWm29js6ON/JjHQUnheB9QIBZ97vUyIwWwwDEX71FWpPnjbx0khyP6cRhvJggq1MizA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/V7q4mT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/V7q4mT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728175294; x=1759711294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOZ893qCXjLIiSzwzZVk+JV053kjwR0YUK00/M4MkrA=;
  b=X/V7q4mTo5cTjVwqtNLCI7BlVugP0YKfNKgGCeXx61a+FXK6SzBinj+P
   +eUekbokhtYDBBa+ztgsK+P4N/CKPVm44vj2Jd0mTaQuGa8QQs1UIWIx5
   6tWm2Ogel/it6M1pPyd9mqkPWo9R/1dvl5sR/9uvBbDq1yBt+TmJCHUQh
   ZLGS8nC285D9a8D0ZmYk8QWTZOje8qB7GLvLLkKOozqQpR/8jpEfuPDWP
   uKY3IJ+3qz1Igw+jFWf1gEXTXndT6ThGr52maJ3tr6bnA4ggwChwLlE5c
   gvE1ZFXVf89aP2p78Y4HC5EK8VRRarSGafyeeOfmxBtxKGmxl1AMO8GVP
   A==;
X-CSE-ConnectionGUID: KT5gKBa8S6qrtXbCMcyfyA==
X-CSE-MsgGUID: XjKhwGKWShuwl+4X8R1DPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27304657"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27304657"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 17:41:33 -0700
X-CSE-ConnectionGUID: qo5ITPliSUatXebdEoHC3w==
X-CSE-MsgGUID: jt62GBq/Tq+TMxJRvPRFKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79909860"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Oct 2024 17:41:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxFKz-0003UU-2G;
	Sun, 06 Oct 2024 00:41:29 +0000
Date: Sun, 6 Oct 2024 08:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_real_file 2/4] fs/overlayfs/file.c:139:23: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202410060829.UTwmlmcr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_real_file
head:   2e6c8d603136baf0de510ba069ad78a449012807
commit: e37f0a8ea49c2287a7c722abb1d4d97619bc7271 [2/4] ovl: stash upper real file in backing_file struct
config: hexagon-randconfig-r113-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060829.UTwmlmcr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241006/202410060829.UTwmlmcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060829.UTwmlmcr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/file.c:139:23: sparse: sparse: Using plain integer as NULL pointer

vim +139 fs/overlayfs/file.c

    93	
    94	static int ovl_real_fdget_meta(const struct file *file, struct fd *real,
    95				       bool upper_meta)
    96	{
    97		struct dentry *dentry = file_dentry(file);
    98		struct file *realfile = file->private_data;
    99		struct file *upperfile = backing_file_private(realfile);
   100		struct path realpath;
   101		int err;
   102	
   103		real->word = 0;
   104	
   105		if (upper_meta) {
   106			ovl_path_upper(dentry, &realpath);
   107			if (!realpath.dentry)
   108				return 0;
   109		} else {
   110			/* lazy lookup and verify of lowerdata */
   111			err = ovl_verify_lowerdata(dentry);
   112			if (err)
   113				return err;
   114	
   115			ovl_path_realdata(dentry, &realpath);
   116		}
   117		if (!realpath.dentry)
   118			return -EIO;
   119	
   120	stashed_upper:
   121		if (upperfile && file_inode(upperfile) == d_inode(realpath.dentry))
   122			realfile = upperfile;
   123	
   124		/*
   125		 * If realfile is lower and has been copied up since we'd opened it,
   126		 * open the real upper file and stash it in backing_file_private().
   127		 */
   128		if (unlikely(file_inode(realfile) != d_inode(realpath.dentry))) {
   129			struct file *old;
   130	
   131			/* Stashed upperfile has a mismatched inode */
   132			if (unlikely(upperfile))
   133				return -EIO;
   134	
   135			upperfile = ovl_open_realfile(file, &realpath);
   136			if (IS_ERR(upperfile))
   137				return PTR_ERR(upperfile);
   138	
 > 139			old = cmpxchg_release(backing_file_private_ptr(realfile), NULL,
   140					      upperfile);
   141			if (old) {
   142				fput(upperfile);
   143				upperfile = old;
   144			}
   145	
   146			goto stashed_upper;
   147		}
   148	
   149		real->word = (unsigned long)realfile;
   150	
   151		/* Did the flags change since open? */
   152		if (unlikely((file->f_flags ^ realfile->f_flags) & ~OVL_OPEN_FLAGS))
   153			return ovl_change_flags(realfile, file->f_flags);
   154	
   155		return 0;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
