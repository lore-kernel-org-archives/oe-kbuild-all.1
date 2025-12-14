Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B0285CB2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765696245; cv=none; b=vB9QoLUp/XrBLFcPDXdeTHxJY/Wffyqp90wvPRXCgOlng/yvCQPbDP6iHS1gWBaoQUiggLB9ktOKHPSpajosOw5NPKfYx3YkIol9cFZ+jF1hjksE3MFTMHZIDtR0NZs1dKwI7mOXFG0HgodesMyQeUL4sctYV3niHqHdESCwO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765696245; c=relaxed/simple;
	bh=OYPc9fJ1gZO/ZIi5lv4mS7D/PqJt+noRBMXrYQBXzDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsI4/Zhb5uiYILrOoEIXVHPXf3+U3RkjK6KvXf9ORsBubb/kuxdkegFLPQoxJMUYj1dpBy8/RbloKTqDl0CmJ77HQZVD9NdTrn3wv2UpetK8pNFdrc9bXroGFmJNZsMEoIhty3KsnNwyiwHfj4sNTUVX8p5CZGc07qFPHsp5W4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSWgcCCC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSWgcCCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765696244; x=1797232244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYPc9fJ1gZO/ZIi5lv4mS7D/PqJt+noRBMXrYQBXzDw=;
  b=FSWgcCCCfLhs7/xqZUe+/vMSLe/7JFknHdUcCh/xIq3A6ZWwHOY7iLUx
   zI5mvV/JOvftsvU1RgCtKriub3urbOi0bC/JGcaYcWMxYGHEeDvId8sPd
   XyDdIH5Aswghgq2RyIhZHLTn5pU8EGke0VaiZ63/7CJweqKVFj2QwY3tO
   CpA8QfGCP+HRQboBNWds+GxWvxtyAcgP15Ywoel+3USmhGT7MMzgDm1Zr
   Bvx1+kZYb8fJA62rWPfCh/UbEQVbzq9MKFxb6rrTH9rI4719O1DYnQJdl
   sqFO29isKciuGHH1NbJKvwZdvDGDmNcAngC6ti9wqATxt9FMsf2ZcFr+c
   Q==;
X-CSE-ConnectionGUID: 1VLMVxrjQRi0wUT51KOsmg==
X-CSE-MsgGUID: MxNIySUeRoCxcodieNRO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="55196653"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="55196653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:10:43 -0800
X-CSE-ConnectionGUID: HWRW+BoITreb/ybndlGBPQ==
X-CSE-MsgGUID: KoK3P7C8Sqi8hDWYBCCAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197217879"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 23:10:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgFb-000000002JE-2MJI;
	Sun, 14 Dec 2025 07:10:39 +0000
Date: Sun, 14 Dec 2025 08:10:21 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] fs/ext4/inode.c:2995:30:
 warning: unused variable 'sbi'
Message-ID: <202512140847.r9ez9W5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 7b208222f6845875c568d238aeb9db17a1c63d96 [1941/1941] ext4: avoid deadlock in fs reclaim with page writeback
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140847.r9ez9W5V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140847.r9ez9W5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140847.r9ez9W5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/inode.c: In function 'ext4_dax_writepages':
>> fs/ext4/inode.c:2995:30: warning: unused variable 'sbi' [-Wunused-variable]
    2995 |         struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
         |                              ^~~


vim +/sbi +2995 fs/ext4/inode.c

64769240bd07f4 Alex Tomas   2008-07-11  2988  
5f0663bb4a64f5 Dan Williams 2017-12-21  2989  static int ext4_dax_writepages(struct address_space *mapping,
5f0663bb4a64f5 Dan Williams 2017-12-21  2990  			       struct writeback_control *wbc)
5f0663bb4a64f5 Dan Williams 2017-12-21  2991  {
5f0663bb4a64f5 Dan Williams 2017-12-21  2992  	int ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  2993  	long nr_to_write = wbc->nr_to_write;
5f0663bb4a64f5 Dan Williams 2017-12-21  2994  	struct inode *inode = mapping->host;
5f0663bb4a64f5 Dan Williams 2017-12-21 @2995  	struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
7b208222f68458 Jan Kara     2024-06-11  2996  	int alloc_ctx;
5f0663bb4a64f5 Dan Williams 2017-12-21  2997  
5f0663bb4a64f5 Dan Williams 2017-12-21  2998  	if (unlikely(ext4_forced_shutdown(EXT4_SB(inode->i_sb))))
5f0663bb4a64f5 Dan Williams 2017-12-21  2999  		return -EIO;
5f0663bb4a64f5 Dan Williams 2017-12-21  3000  
7b208222f68458 Jan Kara     2024-06-11  3001  	alloc_ctx = ext4_writepages_down_read(inode->i_sb);
5f0663bb4a64f5 Dan Williams 2017-12-21  3002  	trace_ext4_writepages(inode, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3003  
5f0663bb4a64f5 Dan Williams 2017-12-21  3004  	ret = dax_writeback_mapping_range(mapping, inode->i_sb->s_bdev, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3005  	trace_ext4_writepages_result(inode, wbc, ret,
5f0663bb4a64f5 Dan Williams 2017-12-21  3006  				     nr_to_write - wbc->nr_to_write);
7b208222f68458 Jan Kara     2024-06-11  3007  	ext4_writepages_up_read(inode->i_sb, alloc_ctx);
5f0663bb4a64f5 Dan Williams 2017-12-21  3008  	return ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  3009  }
5f0663bb4a64f5 Dan Williams 2017-12-21  3010  

:::::: The code at line 2995 was first introduced by commit
:::::: 5f0663bb4a64f588f0a2dd6d1be68d40f9af0086 ext4, dax: introduce ext4_dax_aops

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
