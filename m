Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CD17C990
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540960; cv=none; b=Nz9e7sR+HA62PYDQdR8NWBBoh2YmP9hNOMIzWENJY271YDJOeG6H/QG4+Ibo/K1kt8Bex9N6A/WSmVdP9HPojfVQ++vQP9AcxwrhZWoypIZ/PWNoRdOb0+mXFGMPCLYTWAc23QSE96WcB7WoH6M84U0ZR4DtWy/NKfyuFvK7oGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540960; c=relaxed/simple;
	bh=FPvI/9vmhkX1mqCwvaWbdHjP5j8cwz/MfqmAVbHDRk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSzgvFnuzDLDjMXABc3iUwqXugqGKz0xgsbadkLPWElyq8gcCT+CWjEuRFSDw/Le5ep07dWVIX4GxnrWfwRwcZu2K7cN0wILUxzw6yBq/0JoTdxoO8BTCXdHE+ukB+BKd8Tjio5enGJpGb+pzMIbYOEkK+tt4yRP8VMgmTWedqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft21FmZo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft21FmZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725540960; x=1757076960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FPvI/9vmhkX1mqCwvaWbdHjP5j8cwz/MfqmAVbHDRk4=;
  b=Ft21FmZoqfFLeN4L6FnHRYzPhHo3M1Bu+dMDW5zZjAFJAarz/cNZ9yWr
   3D/xsB4bF1KGoOTwPP/j1snq4+MyCrNmnituky1+4pYfIRFipnZyEB5Fs
   bL1lWJV+K5fg+Bj1BdqyeyO1xiB22kmIYwomuk1AOm2EioYSvdt2TQrgy
   doFVOt2pmo5vN1ZP7yQPWsfuI2uAnCLooTP/N0QbcDWnhXcmyPZQwSh3q
   5ld354QZ548Iwuuwxw/5/bQY80GL5nxVCgLN9rLZF6ht2hHGUYLmbEo5b
   xGIiQXPRMTf7AywS+BrfUbQPOniWgYQS1eX8CY91nRgeDQxNbMb504btN
   Q==;
X-CSE-ConnectionGUID: ZAiDwSZhQFOIRJcHUMtTxw==
X-CSE-MsgGUID: Ok7b+ENNRCyLuWTwcRApBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="28044414"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="28044414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:55:59 -0700
X-CSE-ConnectionGUID: Sn2ejwqkRfufrYedInaFsw==
X-CSE-MsgGUID: /ANcakotTzOV0MSSgwcnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70408754"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Sep 2024 05:55:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smC1j-0009tZ-1A;
	Thu, 05 Sep 2024 12:55:55 +0000
Date: Thu, 5 Sep 2024 20:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 2/4] erofs: introduce page cache share feature
Message-ID: <202409052057.eYgM1Zoj-lkp@intel.com>
References: <20240902110620.2202586-3-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902110620.2202586-3-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/fixes]
[also build test WARNING on linus/master v6.11-rc6]
[cannot apply to xiang-erofs/dev-test xiang-erofs/dev next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20240902-204137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes
patch link:    https://lore.kernel.org/r/20240902110620.2202586-3-hongzhen%40linux.alibaba.com
patch subject: [PATCH RFC v4 2/4] erofs: introduce page cache share feature
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240905/202409052057.eYgM1Zoj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409052057.eYgM1Zoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052057.eYgM1Zoj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/pagecache_share.c: In function 'erofs_pcs_file_read_iter':
>> fs/erofs/pagecache_share.c:127:23: warning: unused variable 'inode' [-Wunused-variable]
     127 |         struct inode *inode = file_inode(iocb->ki_filp);
         |                       ^~~~~


vim +/inode +127 fs/erofs/pagecache_share.c

   123	
   124	static ssize_t erofs_pcs_file_read_iter(struct kiocb *iocb,
   125						struct iov_iter *to)
   126	{
 > 127		struct inode *inode = file_inode(iocb->ki_filp);
   128		struct file *file, *ano_file;
   129		struct kiocb ano_iocb;
   130		ssize_t res;
   131	
   132		if (!iov_iter_count(to))
   133			return 0;
   134	#ifdef CONFIG_FS_DAX
   135		if (IS_DAX(inode))
   136			return erofs_file_fops.read_iter(iocb, to);
   137	#endif
   138		if (iocb->ki_flags & IOCB_DIRECT)
   139			return erofs_file_fops.read_iter(iocb, to);
   140	
   141		memcpy(&ano_iocb, iocb, sizeof(struct kiocb));
   142		file = iocb->ki_filp;
   143		ano_file = file->private_data;
   144		if (!ano_file)
   145			return -EINVAL;
   146		ano_iocb.ki_filp = ano_file;
   147		res = filemap_read(&ano_iocb, to, 0);
   148		memcpy(iocb, &ano_iocb, sizeof(struct kiocb));
   149		iocb->ki_filp = file;
   150		file_accessed(file);
   151		return res;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
