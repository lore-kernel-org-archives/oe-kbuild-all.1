Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1097154C15
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736217042; cv=none; b=bf1Plmw6FXtxX/CiHqlLEZxPoO9MQ9Y26Is3U8zz4Bur9iHZw/6Ts9pwcIFVon0bpVR7w7ou3rQI97Hq29AsH3csMc0v7fPm18tDTuR+UdpdQfHrz9UXMisVIQR82WP4/n9Y0DTz3q1zj3IjzlnmNsGtbBZrfg1noPJbXeg+o9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736217042; c=relaxed/simple;
	bh=GZ4c+Ins0kh1OdWXb9QGBnb6IIXvK3T5LCHf/TJNJIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4FCKrW2Yu0bYGbqwoznnpCGvk1oqIuVlwL8VFh2dRGjITHmdtlpY4sgRFvet5y6/jX+dKI1HoTkhQriH/DUXRwY2efYIiWsigvxtIghAiLcNujtbK/ybfR9zgwVigC2PtxprJARQ+zgV6qlN6iU7jlb5619bskrj2Udm17pEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJqzX+eQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJqzX+eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736217039; x=1767753039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ4c+Ins0kh1OdWXb9QGBnb6IIXvK3T5LCHf/TJNJIw=;
  b=AJqzX+eQHItViwYnU0miCOecXdfS2FFUq31NxyfM5nDQrdsFNm6dTz3Y
   VWAq05U3NQbTPJnJoyATILmxtKriidZ1U2oPSnWdR88UmezmNETDryes3
   Uo0II6omM0zgEHhom698RRQ8VKsAhOH8s1bxL/xdVo4DPz36uIC6mMwlF
   xj9r4KQDqn+TREuiOjLLrkqLKngWtSNpGExJhbnZs0RVkPmA4XCuccC1i
   uL8VQcD0FmwH1OOyJ993dluflwxE6y06CM8Q2cpy0o+7aeSeGLd3BWpti
   7o3TvBt4Cm2seAUJCUERineOHtzP6kjXtDk9KovhtH01nz9bN0EhH87iT
   Q==;
X-CSE-ConnectionGUID: vNgUfXq4T82+xTt/2LwOVw==
X-CSE-MsgGUID: NiCRroJfRCqRHnHkMxJsew==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46961312"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="46961312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 18:30:37 -0800
X-CSE-ConnectionGUID: 0RMbL8ccSOi28XG6E63k4A==
X-CSE-MsgGUID: suNrKZyGTk6yowIuB8fB4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="103145204"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 18:30:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUzMX-000E8N-2j;
	Tue, 07 Jan 2025 02:30:33 +0000
Date: Tue, 7 Jan 2025 10:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] fs/btrfs/inode.c:1956:16-18:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <202501071039.4eNvxDr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: d0fdafa8fcf30e0cfbe44349563b847a1b759ba0 [1347/1347] btrfs: check for relocation inodes on zoned btrfs in should_nocow
config: x86_64-randconfig-104-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071039.4eNvxDr6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071039.4eNvxDr6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/inode.c:1956:16-18: WARNING !A || A && B is equivalent to !A || B

vim +1956 fs/btrfs/inode.c

  1935	
  1936	/*
  1937	 * Function to process delayed allocation (create CoW) for ranges which are
  1938	 * being touched for the first time.
  1939	 */
  1940	int btrfs_run_delalloc_range(struct btrfs_inode *inode, struct page *locked_page,
  1941			u64 start, u64 end, int *page_started, unsigned long *nr_written,
  1942			struct writeback_control *wbc)
  1943	{
  1944		int ret;
  1945		const bool zoned = btrfs_is_zoned(inode->root->fs_info);
  1946	
  1947		if (should_nocow(inode, start, end)) {
  1948			/*
  1949			 * Normally on a zoned device we're only doing COW writes, but
  1950			 * in case of relocation on a zoned filesystem we have taken
  1951			 * precaution, that we're only writing sequentially. It's safe
  1952			 * to use run_delalloc_nocow() here, like for  regular
  1953			 * preallocated inodes.
  1954			 */
  1955			ASSERT(!zoned ||
> 1956			       (zoned && btrfs_is_data_reloc_root(inode->root)));
  1957			ret = run_delalloc_nocow(inode, locked_page, start, end,
  1958						 page_started, nr_written);
  1959		} else if (!inode_can_compress(inode) ||
  1960			   !inode_need_compress(inode, start, end)) {
  1961			if (zoned)
  1962				ret = run_delalloc_zoned(inode, locked_page, start, end,
  1963							 page_started, nr_written);
  1964			else
  1965				ret = cow_file_range(inode, locked_page, start, end,
  1966						     page_started, nr_written, 1);
  1967		} else {
  1968			set_bit(BTRFS_INODE_HAS_ASYNC_EXTENT, &inode->runtime_flags);
  1969			ret = cow_file_range_async(inode, wbc, locked_page, start, end,
  1970						   page_started, nr_written);
  1971		}
  1972		ASSERT(ret <= 0);
  1973		if (ret)
  1974			btrfs_cleanup_ordered_extents(inode, locked_page, start,
  1975						      end - start + 1);
  1976		return ret;
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
