Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21FFC1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 06:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713593731; cv=none; b=mY3w3cn1RsgGHnhdTRSEzzDk/UuG1nc0c7VlRjTlCJqtLtMrzg0L8iOkkb8n9eEcBslY37MGiV9cNZEId3hI7Dl5ZJmajdd6JazdvC3T8HMjtwENYjwc7Cmh7WetXFkM5JIydU2mzihwhgnKI7TJyISspWm+YfzMbVk3Rxhgjxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713593731; c=relaxed/simple;
	bh=pcuvJJRc2aUqxdECCik83OZm3xi5XiBidllyCJWBAJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+PffYWaIIIAT2tpHO9TjXlu8I7hUoxHlYL0dDiVVheyPHu96ib5zZin5dKzDVxS4MhPaf9d8YmraHIPPyi+w3KbC1SmdNGPOTDtxNaNmtf1sQaSzl1m19SOqMIi5RbXXOkn3V4IXNvrgHWqPGCnNuUT4ZYsWJGyDMRii1hzOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3pRCt1J; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3pRCt1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713593730; x=1745129730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcuvJJRc2aUqxdECCik83OZm3xi5XiBidllyCJWBAJ0=;
  b=h3pRCt1JBCNAlm7OBVNSn8zBrvn6Dkv0peQ1OkTakl43vRCr/WR82GC3
   WPpnpKZU8zHPhDJep/5kOfGadfWewAxfyN8nYq411RNm0mrahkhzuShu9
   WV11OCdUDJheWklMvZ6xtxFC8y0lYVq28jHdj86sOBo8XKlUDbRP7yinU
   UCSAg/zJEZuEVnl+k9Unlwc0CDm2q7aBhnzT5J6dsQWKBYCEKd1T4N80a
   M6ezUBz4MGugPmXzBpbLEF2T+O2Gjo57fpw62Gn0sH3ibJpmEVZ7bpuX4
   HorVxiZdbI1fc0yKMFDwgL/L94181oMv5yiy/RRtOfBBTerHDwVQ53tXx
   A==;
X-CSE-ConnectionGUID: 0bCxk1KvRlarxAkwjQuoWA==
X-CSE-MsgGUID: 4vD7JOp+RK6/snMbMFI0dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9068365"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9068365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 23:15:29 -0700
X-CSE-ConnectionGUID: pm70KXcBSR2QXDvVtQczPg==
X-CSE-MsgGUID: mVI9Fb2QQkSMTNZEcsskgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="60976881"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2024 23:15:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry40S-000AmO-2Y;
	Sat, 20 Apr 2024 06:15:24 +0000
Date: Sat, 20 Apr 2024 14:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>, Daeho Jeong <daehojeong@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [chao:wip 9/9] fs/f2fs/data.c:664:47: error: implicit declaration of
 function 'type_to_temp'
Message-ID: <202404201410.zsuiIJTK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   481efcf0aff1cf41eb2a7a5f48b1b3afe290cbbb
commit: 481efcf0aff1cf41eb2a7a5f48b1b3afe290cbbb [9/9] f2fs: zone: don't block IO if there is remained open zone
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404201410.zsuiIJTK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201410.zsuiIJTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201410.zsuiIJTK-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_blkzoned_submit_merged_write':
>> fs/f2fs/data.c:664:47: error: implicit declaration of function 'type_to_temp' [-Werror=implicit-function-declaration]
     664 |         io = sbi->write_io[PAGE_TYPE(type)] + type_to_temp(type);
         |                                               ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/f2fs/segment.c: In function 'restore_curseg_summaries':
>> fs/f2fs/segment.c:4226:32: error: implicit declaration of function 'type_to_temp' [-Werror=implicit-function-declaration]
    4226 |                         temp = type_to_temp(type);
         |                                ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/type_to_temp +664 fs/f2fs/data.c

   655	
   656	void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
   657	{
   658	#ifdef CONFIG_BLK_DEV_ZONED
   659		struct f2fs_bio_info *io;
   660	
   661		if (!f2fs_sb_has_blkzoned(sbi))
   662			return;
   663	
 > 664		io = sbi->write_io[PAGE_TYPE(type)] + type_to_temp(type);
   665	
   666		f2fs_down_write(&io->io_rwsem);
   667		if (io->zone_openned) {
   668			if (io->bio) {
   669				io->close_zone = true;
   670				__submit_merged_bio(io);
   671			} else {
   672				up(&sbi->available_open_zones);
   673				io->zone_openned = false;
   674			}
   675		}
   676		f2fs_up_write(&io->io_rwsem);
   677	#endif
   678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
