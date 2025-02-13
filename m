Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB71EA90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 05:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739424039; cv=none; b=SoI+k7/i0WV8lW0b8OnGvbdUaQZDTVBiJd/oaS4zZEFBxkWx4JT1am7otZNBEgpjx3tZpghg3FpZBcMok9yYeDFTZzvjE5aNk7SI8LnmW0qW/pXsRpDmSSqnMBWRr8/u/cPV43Lc4SRRaFWRm3s4X7Hlm2dLpcCPxnK7Pw3EW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739424039; c=relaxed/simple;
	bh=lI73kP56pM0Had5UzKlXtowmukrj9GyNLOnj11wgVfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWyv/HOg4h3rY3s7NYy/QfeRR5jfnViVj2AT0Sd+kOzu0iYDUdnXa2MCiqKTu2jQoATxsHCp9oZycZV5icyY7bKswrA0oABVD6jYa7RQVSGDKcG13k/qO3JlWf6QfsFN5grEsS+J9+rBYIsihSbUr5YAbrMccLVI8iZOgHQ0AMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iovXjVRt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iovXjVRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739424038; x=1770960038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lI73kP56pM0Had5UzKlXtowmukrj9GyNLOnj11wgVfs=;
  b=iovXjVRtFtyprDwKO2J+Vua+cqSCCr0S356+xe2dswLf9CpGrbuDUPVq
   44ohvGZYM2iRhrqhVk1ZYg7vTmqHg+oEJf5DeDsft7h5Br6p+lwHNIlYG
   EiKxT+9rxTnkcWlOzLpSsBRZ2mZBcD2F5hdok2Smw0tv+RdrIQvbsqd/f
   qmg/3iwAw335dacIDQyv73YaX/MRSsjO+RDlXsvA5+LRgxUWUSmgYjIn7
   c4rwYruVYANdwI2KTGIrUgIOvyCy3qvXNNo/UYTIwhjvPoATgr3V+AZbQ
   01ISfdpRUQ//+IDsuWvrFMnCZvJtL1VwjkxxsgI4m4DSkyKGAwxArgFMq
   g==;
X-CSE-ConnectionGUID: ygf8HAktQGqBkPjzRgjpjg==
X-CSE-MsgGUID: i5qQ0BTuSjKddvkeUz+dxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40262230"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40262230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:20:38 -0800
X-CSE-ConnectionGUID: mPAbgCc+T1ynjmZYBNKcng==
X-CSE-MsgGUID: 8xd9qQjrSzKDzLSoADHSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113936916"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Feb 2025 21:20:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiReL-0016Yx-37;
	Thu, 13 Feb 2025 05:20:33 +0000
Date: Thu, 13 Feb 2025 13:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
Message-ID: <202502131333.sRLxAfsk-lkp@intel.com>
References: <20250212103634.448437-3-kundan.kumar@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212103634.448437-3-kundan.kumar@samsung.com>

Hi Kundan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 57d357a7663c4025c68ae07974b679d84e2d5d1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-add-parallel-writeback-infrastructure/20250212-211021
base:   57d357a7663c4025c68ae07974b679d84e2d5d1a
patch link:    https://lore.kernel.org/r/20250212103634.448437-3-kundan.kumar%40samsung.com
patch subject: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
config: s390-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131333.sRLxAfsk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131333.sRLxAfsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131333.sRLxAfsk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/fs-writeback.c: In function 'inode_cgwb_move_to_attached':
>> fs/fs-writeback.c:1272:9: error: implicit declaration of function 'wb_io_lists_depopulated'; did you mean 'wb_ctx_io_lists_depopulated'? [-Wimplicit-function-declaration]
    1272 |         wb_io_lists_depopulated(wb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         wb_ctx_io_lists_depopulated
   fs/fs-writeback.c: In function 'bdi_split_work_to_wbs':
>> fs/fs-writeback.c:1309:17: error: implicit declaration of function 'wb_queue_work'; did you mean 'queue_work'? [-Wimplicit-function-declaration]
    1309 |                 wb_queue_work(&bdi->wb, base_work);
         |                 ^~~~~~~~~~~~~
         |                 queue_work
   fs/fs-writeback.c: In function 'requeue_inode_ctx':
>> fs/fs-writeback.c:1712:25: error: implicit declaration of function 'inode_cgwb_move_to_attached_ctx'; did you mean 'inode_cgwb_move_to_attached'? [-Wimplicit-function-declaration]
    1712 |                         inode_cgwb_move_to_attached_ctx(inode, wb, p_wb_ctx);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         inode_cgwb_move_to_attached
   fs/fs-writeback.c: At top level:
>> fs/fs-writeback.c:210:13: warning: 'wb_ctx_queue_work' defined but not used [-Wunused-function]
     210 | static void wb_ctx_queue_work(struct bdi_writeback *wb,
         |             ^~~~~~~~~~~~~~~~~


vim +1272 fs/fs-writeback.c

7fc5854f8c6efa Tejun Heo      2017-12-12  1262  
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1263  static void inode_cgwb_move_to_attached(struct inode *inode,
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1264  					struct bdi_writeback *wb)
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1265  {
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1266  	assert_spin_locked(&wb->list_lock);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1267  	assert_spin_locked(&inode->i_lock);
a9438b44bc7015 Jan Kara       2022-12-12  1268  	WARN_ON_ONCE(inode->i_state & I_FREEING);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1269  
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1270  	inode->i_state &= ~I_SYNC_QUEUED;
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1271  	list_del_init(&inode->i_io_list);
f3b6a6df38aa51 Roman Gushchin 2021-06-28 @1272  	wb_io_lists_depopulated(wb);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1273  }
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1274  
87e1d789bf55b1 Tejun Heo      2015-05-28  1275  static struct bdi_writeback *
87e1d789bf55b1 Tejun Heo      2015-05-28  1276  locked_inode_to_wb_and_lock_list(struct inode *inode)
87e1d789bf55b1 Tejun Heo      2015-05-28  1277  	__releases(&inode->i_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1278  	__acquires(&wb->list_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1279  {
87e1d789bf55b1 Tejun Heo      2015-05-28  1280  	struct bdi_writeback *wb = inode_to_wb(inode);
87e1d789bf55b1 Tejun Heo      2015-05-28  1281  
87e1d789bf55b1 Tejun Heo      2015-05-28  1282  	spin_unlock(&inode->i_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1283  	spin_lock(&wb->list_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1284  	return wb;
87e1d789bf55b1 Tejun Heo      2015-05-28  1285  }
87e1d789bf55b1 Tejun Heo      2015-05-28  1286  
87e1d789bf55b1 Tejun Heo      2015-05-28  1287  static struct bdi_writeback *inode_to_wb_and_lock_list(struct inode *inode)
87e1d789bf55b1 Tejun Heo      2015-05-28  1288  	__acquires(&wb->list_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1289  {
87e1d789bf55b1 Tejun Heo      2015-05-28  1290  	struct bdi_writeback *wb = inode_to_wb(inode);
87e1d789bf55b1 Tejun Heo      2015-05-28  1291  
87e1d789bf55b1 Tejun Heo      2015-05-28  1292  	spin_lock(&wb->list_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1293  	return wb;
87e1d789bf55b1 Tejun Heo      2015-05-28  1294  }
87e1d789bf55b1 Tejun Heo      2015-05-28  1295  
f2b65121607631 Tejun Heo      2015-05-22  1296  static long wb_split_bdi_pages(struct bdi_writeback *wb, long nr_pages)
f2b65121607631 Tejun Heo      2015-05-22  1297  {
f2b65121607631 Tejun Heo      2015-05-22  1298  	return nr_pages;
f2b65121607631 Tejun Heo      2015-05-22  1299  }
f2b65121607631 Tejun Heo      2015-05-22  1300  
db125360409fc3 Tejun Heo      2015-05-22  1301  static void bdi_split_work_to_wbs(struct backing_dev_info *bdi,
db125360409fc3 Tejun Heo      2015-05-22  1302  				  struct wb_writeback_work *base_work,
db125360409fc3 Tejun Heo      2015-05-22  1303  				  bool skip_if_busy)
db125360409fc3 Tejun Heo      2015-05-22  1304  {
db125360409fc3 Tejun Heo      2015-05-22  1305  	might_sleep();
db125360409fc3 Tejun Heo      2015-05-22  1306  
006a0973ed020a Tejun Heo      2015-08-25  1307  	if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
db125360409fc3 Tejun Heo      2015-05-22  1308  		base_work->auto_free = 0;
db125360409fc3 Tejun Heo      2015-05-22 @1309  		wb_queue_work(&bdi->wb, base_work);
db125360409fc3 Tejun Heo      2015-05-22  1310  	}
db125360409fc3 Tejun Heo      2015-05-22  1311  }
db125360409fc3 Tejun Heo      2015-05-22  1312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
