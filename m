Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274E168C3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245327; cv=none; b=tHNvzJt4uDwwrO4pULt4GQ749Lg+8kQRlPZ7V7u8m2xNXDlvUWIk42xOwr78Cn2qWYQ3T7O1d0YxfEQ6JIzc4MLtsPzVLE4JTcf1szyAhYiZrexs9jJU3W6sv7vp4mmRLmaeJ1WiFaauKkp6UwD9IoxxK1s47CbW76RLMsul0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245327; c=relaxed/simple;
	bh=NN6JhByam8kFSm9C5Ff83WZbDN1cGdoI0lB11U4pxUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrC1zhClhUCpOnZr457jGvELhyuyBcBgf7IwK3FNMIA/uK723+1ViaLy49hN3zOYxYn36lPnANlkz30430opZyXz9K+lp3uDa1BfKf5rYoab30jHzDKt/gGf5i0qlRisKjNPRF1VDy9vbwuFi4qyJtSs5pwu04C9B9hcLbg05J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBM3/ozL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBM3/ozL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729245326; x=1760781326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NN6JhByam8kFSm9C5Ff83WZbDN1cGdoI0lB11U4pxUk=;
  b=cBM3/ozLDzPOdQZQzDJOd8gA/K26GYynRilX7DJEtGrYH+5MaBKBzmPx
   WjiNh0444KIC0kZC/V3np25mgNRX1XGePo5MmtcctLUYy+O69yeaRQxkP
   XG+QjSN2kI8kg91ECk39jwNf0ph0vR3r33JJbYWDlZEIwTv60+mwlCZdG
   y2T98CpM5to2sQWmuHpOSIPuhR0fspT+oN+ipuxPMpnMidsDGMZcV4XxS
   XLoySZTvFFIxcNcO1+Ma5gCesbpGoyWS6BAT/K5o6PDa0wGCo7si/KxWh
   ulveiz57RlqxkRkkAF242Cqw81zr9JXsQw/50Wn5KRvNqyZszQacIOQOs
   Q==;
X-CSE-ConnectionGUID: zxtc6HxeTeeSkrEhddDP5g==
X-CSE-MsgGUID: wb7OyjXER6Wi19l2h1Tpiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40131109"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="40131109"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 02:55:25 -0700
X-CSE-ConnectionGUID: kj8kygkdT5KsoQedYBXAig==
X-CSE-MsgGUID: JLHVJcoGSGaJah5r2nxkoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78734836"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2024 02:55:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1jhZ-000Na7-0i;
	Fri, 18 Oct 2024 09:55:21 +0000
Date: Fri, 18 Oct 2024 17:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] f2fs: zone: don't block IO if there is remained open
 zone
Message-ID: <202410181756.J4ldjRr4-lkp@intel.com>
References: <20241017081421.2213743-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017081421.2213743-1-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-zone-don-t-block-IO-if-there-is-remained-open-zone/20241017-162658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241017081421.2213743-1-chao%40kernel.org
patch subject: [PATCH v7] f2fs: zone: don't block IO if there is remained open zone
config: x86_64-buildonly-randconfig-004-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181756.J4ldjRr4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181756.J4ldjRr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181756.J4ldjRr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_blkzoned_submit_merged_write':
>> fs/f2fs/data.c:666:69: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
     666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
         |                                                                     ^~~
         |                                                                     |
         |                                                                     struct f2fs_sb_info *
   In file included from fs/f2fs/data.c:24:
   fs/f2fs/f2fs.h:3762:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3762 | int f2fs_get_segment_temp(int seg_type);
         |                           ~~~~^~~~~~~~
   fs/f2fs/data.c:666:47: error: too many arguments to function 'f2fs_get_segment_temp'
     666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3762:5: note: declared here
    3762 | int f2fs_get_segment_temp(int seg_type);
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   fs/f2fs/segment.c: In function 'restore_curseg_summaries':
>> fs/f2fs/segment.c:4324:54: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
    4324 |                         temp = f2fs_get_segment_temp(sbi, type);
         |                                                      ^~~
         |                                                      |
         |                                                      struct f2fs_sb_info *
   fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3610 | int f2fs_get_segment_temp(int seg_type)
         |                           ~~~~^~~~~~~~
   fs/f2fs/segment.c:4324:32: error: too many arguments to function 'f2fs_get_segment_temp'
    4324 |                         temp = f2fs_get_segment_temp(sbi, type);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:3610:5: note: declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c: In function 'destroy_curseg':
   fs/f2fs/segment.c:5666:69: warning: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
    5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
         |                                                                     ^~~
         |                                                                     |
         |                                                                     struct f2fs_sb_info *
   fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3610 | int f2fs_get_segment_temp(int seg_type)
         |                           ~~~~^~~~~~~~
   fs/f2fs/segment.c:5666:47: error: too many arguments to function 'f2fs_get_segment_temp'
    5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:3610:5: note: declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/f2fs_get_segment_temp +666 fs/f2fs/data.c

   657	
   658	void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
   659	{
   660	#ifdef CONFIG_BLK_DEV_ZONED
   661		struct f2fs_bio_info *io;
   662	
   663		if (!f2fs_sb_has_blkzoned(sbi))
   664			return;
   665	
 > 666		io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
   667	
   668		f2fs_down_write(&io->io_rwsem);
   669		if (io->zone_opened) {
   670			if (io->bio) {
   671				io->close_zone = true;
   672				__submit_merged_bio(io);
   673			} else {
   674				up(&sbi->available_open_zones);
   675				io->zone_opened = false;
   676			}
   677		}
   678		f2fs_up_write(&io->io_rwsem);
   679	#endif
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
