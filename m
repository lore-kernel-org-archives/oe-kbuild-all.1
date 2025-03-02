Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DE78F52
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740916946; cv=none; b=cA7V/H/9wA90I0HTzgFEzVphmfBhtO0BwGfgQqXjxAqqQp6XqR+8FuISPaimzYD4nGayPZn7WFogMrGEjl86NMA0/acITucRZR4LlXEqbMoVGWeKuygtQcakg0v1I/gn99L1GWFZ9GsZ1WDwKcW5RmL7oOCWx5/Lugk45MJpUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740916946; c=relaxed/simple;
	bh=37WM6Z2mVMtulPp6MzNCmjXYgAVTDLKXbVg/H/b2WPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jv7Fl+Xzc7VGPYsPEu0ftgpckLqeIp1KRmUlRW50H+2zj0SD1xAvoxtB3Q0dbCjNZgNCh46IZxGFUc9WRbOg4lSdop2yFbVIYKkSXt+zNZ+SCqxyl4jp7pi4IYp0lqja7mc/sAPI5KT7dTsydU0731c6uaUkK6nT0JCR29c7dPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gI4R1ku9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gI4R1ku9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740916944; x=1772452944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37WM6Z2mVMtulPp6MzNCmjXYgAVTDLKXbVg/H/b2WPM=;
  b=gI4R1ku9BXnBocX68/aRTgUn6QLL/XiX/xsyPR+deQ7Uy4pKG1R2WwwL
   2gm/CB9dEEu/eIGDL22gOdhdxC+4HNdpt6tbXIi9qLVYjB+IUfcwiVZxY
   +Bgy7U+nF/8Kbzoou7uKyeJ5Vk6Gwyd+8sTux4PkRpC1gHW+wNnr6uliW
   fT2mrNVxeQyN2lg5WC1ARKB7/+GTGkJLen/lxxHFHWXuzWpIxOVnrrGGy
   nLMxJO6Tu7cpIMGjniIkkElOjJXzjJp3AtFrVdHS+0hzBohmlMlJcqeTj
   r32ip06GsKZLresTvKzWd7Zmhd1ijNHreOxtPnr2xVmrX8Fm/6RkolFTm
   Q==;
X-CSE-ConnectionGUID: YFMpiuSQQ7mTAz42yXqGCg==
X-CSE-MsgGUID: F0OVNb/IS76jpG4Mbr+dFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="40972355"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="40972355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 04:02:23 -0800
X-CSE-ConnectionGUID: YTyT9f/yTw+MgXOCdGfwjw==
X-CSE-MsgGUID: xpCzyotBRlyVBxhNxsrG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117512538"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 04:02:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toi1G-000HIu-14;
	Sun, 02 Mar 2025 12:02:09 +0000
Date: Sun, 2 Mar 2025 20:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/hwtracing/intel_th/msu.c:792:28:
 warning: unused variable 'i'
Message-ID: <202503021957.27nJN5n7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: ba39bd8306057fb343dfb75d93a76d824b625236 [1/1] intel_th: msu: Switch over to scatterlist
config: s390-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250302/202503021957.27nJN5n7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021957.27nJN5n7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021957.27nJN5n7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c: In function 'msc_buffer_win_alloc':
>> drivers/hwtracing/intel_th/msu.c:792:28: warning: unused variable 'i' [-Wunused-variable]
     792 |         int ret = -ENOMEM, i;
         |                            ^
   drivers/hwtracing/intel_th/msu.c: In function 'msc_buffer_win_free':
   drivers/hwtracing/intel_th/msu.c:871:13: warning: unused variable 'i' [-Wunused-variable]
     871 |         int i;
         |             ^


vim +/i +792 drivers/hwtracing/intel_th/msu.c

   778	
   779	/**
   780	 * msc_buffer_win_alloc() - alloc a window for a multiblock mode
   781	 * @msc:	MSC device
   782	 * @nr_blocks:	number of pages in this window
   783	 *
   784	 * This modifies msc::win_list and msc::base, which requires msc::buf_mutex
   785	 * to serialize, so the caller is expected to hold it.
   786	 *
   787	 * Return:	0 on success, -errno otherwise.
   788	 */
   789	static int msc_buffer_win_alloc(struct msc *msc, unsigned int nr_blocks)
   790	{
   791		struct msc_window *win;
 > 792		int ret = -ENOMEM, i;
   793	
   794		if (!nr_blocks)
   795			return 0;
   796	
   797		/*
   798		 * This limitation hold as long as we need random access to the
   799		 * block. When that changes, this can go away.
   800		 */
   801		if (nr_blocks > SG_MAX_SINGLE_ALLOC)
   802			return -EINVAL;
   803	
   804		win = kzalloc(sizeof(*win), GFP_KERNEL);
   805		if (!win)
   806			return -ENOMEM;
   807	
   808		win->msc = msc;
   809	
   810		if (!list_empty(&msc->win_list)) {
   811			struct msc_window *prev = list_last_entry(&msc->win_list,
   812								  struct msc_window,
   813								  entry);
   814	
   815			/* This works as long as blocks are page-sized */
   816			win->pgoff = prev->pgoff + prev->nr_blocks;
   817		}
   818	
   819		ret = __msc_buffer_win_alloc(win, nr_blocks);
   820		if (ret < 0)
   821			goto err_nomem;
   822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
