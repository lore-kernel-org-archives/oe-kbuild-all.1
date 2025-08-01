Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F3221FC9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040110; cv=none; b=tCVlmbbtAZzKddWatHbr0ygYhk5LH0Z22DhYtdXrDyVWhQWGBlxPSd2FYepIRVxJvX9OlvrJQ4j4O4o2EK2MuIUcCFmqvPDyZAsfYlE53rITQsHdnfLgsRlEfsVjiduW+RqevlUz4FMIBhUBelRsFgBCwuees5eO/vgkunl8qpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040110; c=relaxed/simple;
	bh=1umXIIIOhSDq3NCqnllWGF4udXgo+LT4pNGM2c7o5C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbvT5izo/oReowx22fwzmxLoqcCH4NIrMwVmgO8t6bgkWCzJhxuZczUHbbGUBV+QYPMtNW2IatsxpnTsC5VNLCof2zcrtJmdsHbtLQCMqdT1b3daqEqJM7JKqSYfpxjmtw4ZizqPvLjkeGTMPE5+eZTqTcnFAhh/9S5DEN35McE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gC7nnRhm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gC7nnRhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754040108; x=1785576108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1umXIIIOhSDq3NCqnllWGF4udXgo+LT4pNGM2c7o5C8=;
  b=gC7nnRhmY1pRqynyjXNGxgzzP6to1wqV3SkuPY2paC9+YfRWgAemrY1f
   4n9W3onqFzxQae2u06zWuQ+HF9vzpykgjOokXEvd2S2FPx/BDdRYaCvgu
   7c9wwTzm1NgEyrj6QBXiGinPF7t9YrNptX7DsAq+btlFn918GfIKHyaQU
   EFNuuxPnRERuyOEJHbo1diosa7uGtA2l4zWL8iapqjQu0xZLEkkYv6Mfu
   Phu8VmJC6uFV4bTRDrpNqAgx27/cr1HqPzUWz77METKCuHfkkkkYJc2IG
   MFaBvX0Tn4cxwFxTVZQdN/duGMbNEveVIORgy6o09M8PUpkWBIby8Wn40
   Q==;
X-CSE-ConnectionGUID: I8iJI3zpRpiv8GorQnVOqQ==
X-CSE-MsgGUID: o6Gyx9HvQVm3pxdva3M2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81835539"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="81835539"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 02:21:48 -0700
X-CSE-ConnectionGUID: sBKLPz27Sq6EfBPMMDdCsg==
X-CSE-MsgGUID: Vq0X40tyQwicFClCo2Isng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163225517"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Aug 2025 02:21:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhlxQ-0004UQ-0I;
	Fri, 01 Aug 2025 09:21:44 +0000
Date: Fri, 1 Aug 2025 17:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 10/10] fs/f2fs/compress.c:1245:40: warning:
 suggest parentheses around '-' inside '<<'
Message-ID: <202508011723.hopSkVCa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   4aa8c9b233e491f55b9608d4212b5eb7c6f3338a
commit: 4aa8c9b233e491f55b9608d4212b5eb7c6f3338a [10/10] f2fs: clean up f2fs_truncate_partial_cluster()
config: arc-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011723.hopSkVCa-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011723.hopSkVCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011723.hopSkVCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/compress.c: In function 'f2fs_truncate_partial_cluster':
>> fs/f2fs/compress.c:1245:40: warning: suggest parentheses around '-' inside '<<' [-Wparentheses]
    1245 |         for (i = 1 << log_cluster_size - 1; i >= 0; i--) {
         |                       ~~~~~~~~~~~~~~~~~^~~


vim +1245 fs/f2fs/compress.c

  1213	
  1214	int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
  1215	{
  1216		void *fsdata = NULL;
  1217		struct page *pagep;
  1218		struct page **rpages;
  1219		int log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
  1220		pgoff_t start_idx = from >> (PAGE_SHIFT + log_cluster_size) <<
  1221								log_cluster_size;
  1222		int i;
  1223		int err;
  1224	
  1225		err = f2fs_is_compressed_cluster(inode, start_idx);
  1226		if (err < 0)
  1227			return err;
  1228	
  1229		/* truncate normal cluster */
  1230		if (!err)
  1231			return f2fs_do_truncate_blocks(inode, from, lock);
  1232	
  1233		/* truncate compressed cluster */
  1234		err = f2fs_prepare_compress_overwrite(inode, &pagep,
  1235							start_idx, &fsdata);
  1236	
  1237		/* should not be a normal cluster */
  1238		f2fs_bug_on(F2FS_I_SB(inode), err == 0);
  1239	
  1240		if (err <= 0)
  1241			return err;
  1242	
  1243		rpages = fsdata;
  1244	
> 1245		for (i = 1 << log_cluster_size - 1; i >= 0; i--) {
  1246			struct folio *folio = page_folio(rpages[i]);
  1247			loff_t start = (loff_t)folio->index << PAGE_SHIFT;
  1248	
  1249			if (from > start) {
  1250				folio_zero_segment(folio, from - start,
  1251						folio_size(folio));
  1252				break;
  1253			}
  1254			folio_zero_segment(folio, 0, folio_size(folio));
  1255		}
  1256	
  1257		f2fs_compress_write_end(inode, fsdata, start_idx, true);
  1258		return 0;
  1259	}
  1260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
