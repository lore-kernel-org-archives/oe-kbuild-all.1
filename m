Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D217B421
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877160; cv=none; b=hzyvzZsc2fu5XX1dRDdBbV/Eow5tN8OlDQPahwyZ9TWVXzvOoJaji70C/MHvKMJtfKoyRraF4S9iqGTjEoHfz3cSEs7B4EY0mcO0KmJYRdLHezL+4KnZqbs403/I3WVbD9d2pRsxPK1yz8w8xIbyvgDjljZFN4lO2Qi42FLHkMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877160; c=relaxed/simple;
	bh=GoqYKTckP/BhEgDGc5qqnhT3hA4mHxOGMhHIvduBbtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oP0pLMMxa2+yuJBY0zLtl3fgevNUnmKQlvaqD2sMPIPdf9u6p5o4NvuzrBifU2VF3MB4srAjf6HBjuXUd8eWMQRpKrLa6cHb80WpvID+/Flkysusv4isENTdUGXUhGcevM8Herzw/NPguC1zYf5zmI3tSGqg29Bgu7VHKieyQRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yh/c0pmE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yh/c0pmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727877159; x=1759413159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoqYKTckP/BhEgDGc5qqnhT3hA4mHxOGMhHIvduBbtU=;
  b=Yh/c0pmEXMNUWO2NV6ylIN0wmjnFMIjNtkF50QybVhvCWxYzYl4C8yro
   /UB43LqhiekcdAhUFlTo/d3oD91yzdPjcNSgBJ89Yn18cBqmH+ac7pO31
   QukZEknmx1NFivgdtA/1jg4zNDqx/2soOVnaQrOgvGHRH3cLLUVzVGtwv
   8PSJ3kEmBVfdrOu7bsg1Vw6FuHlW7gYWUiS1tLkpu6JTcDlM8O6bGo69K
   1pG5iKI/V5f1HajS53LLlHdM7meIAy8riSkGMJnL/L/6kL4do4GqQSPtz
   qB7CQ9ARb406ZYjvGOARwcjT4Ah6+kenqJn/Wpd3RdOHPwt4ztydTi8ub
   g==;
X-CSE-ConnectionGUID: 0thRSwKGSBOGqbSfOpovxQ==
X-CSE-MsgGUID: XJYY8WnbR+2klJShFghByw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27214947"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27214947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:52:38 -0700
X-CSE-ConnectionGUID: 5etvRFFaTsOUOMFbBADYkw==
X-CSE-MsgGUID: GkJF2TPIQ7mPhtZ1LfnG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78429287"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2024 06:52:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svzmN-000Sl3-06;
	Wed, 02 Oct 2024 13:52:35 +0000
Date: Wed, 2 Oct 2024 21:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22806/30000] drivers/md/md.c:4884:38: sparse:
 sparse: dereference of noderef expression
Message-ID: <202410022132.Z3G20996-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   084a6771cfb3ef307b750af8b7c35a07a725fc4c
commit: 448fbeaf0f07ea578841346b938245f5c5220b9b [22806/30000] md: protect md_thread with rcu
config: x86_64-randconfig-121-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022132.Z3G20996-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022132.Z3G20996-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022132.Z3G20996-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/md.c:3392:29: sparse: sparse: self-comparison always evaluates to false
   drivers/md/md.c:3561:33: sparse: sparse: self-comparison always evaluates to false
   drivers/md/md.c:4341:36: sparse: sparse: self-comparison always evaluates to false
>> drivers/md/md.c:4884:38: sparse: sparse: dereference of noderef expression
   drivers/md/md.c:5247:30: sparse: sparse: self-comparison always evaluates to false
   drivers/md/md.c:5284:30: sparse: sparse: self-comparison always evaluates to false
   drivers/md/md.c:5326:30: sparse: sparse: self-comparison always evaluates to false

vim +4884 drivers/md/md.c

24dd469d728dae NeilBrown     2005-11-08  4857  
e98a235fdfce57 Yu Kuai       2023-05-31  4858  static void stop_sync_thread(struct mddev *mddev)
24dd469d728dae NeilBrown     2005-11-08  4859  {
e98a235fdfce57 Yu Kuai       2023-05-31  4860  	if (!test_bit(MD_RECOVERY_RUNNING, &mddev->recovery))
e98a235fdfce57 Yu Kuai       2023-05-31  4861  		return;
7eec314d7512d5 NeilBrown     2005-11-08  4862  
e98a235fdfce57 Yu Kuai       2023-05-31  4863  	if (mddev_lock(mddev))
e98a235fdfce57 Yu Kuai       2023-05-31  4864  		return;
e98a235fdfce57 Yu Kuai       2023-05-31  4865  
e98a235fdfce57 Yu Kuai       2023-05-31  4866  	/*
e98a235fdfce57 Yu Kuai       2023-05-31  4867  	 * Check again in case MD_RECOVERY_RUNNING is cleared before lock is
e98a235fdfce57 Yu Kuai       2023-05-31  4868  	 * held.
e98a235fdfce57 Yu Kuai       2023-05-31  4869  	 */
e98a235fdfce57 Yu Kuai       2023-05-31  4870  	if (!test_bit(MD_RECOVERY_RUNNING, &mddev->recovery)) {
e98a235fdfce57 Yu Kuai       2023-05-31  4871  		mddev_unlock(mddev);
e98a235fdfce57 Yu Kuai       2023-05-31  4872  		return;
e98a235fdfce57 Yu Kuai       2023-05-31  4873  	}
56ccc1125bc141 NeilBrown     2015-05-28  4874  
cc1ffe61c026e2 Guoqing Jiang 2020-04-04  4875  	if (work_pending(&mddev->del_work))
f851b60db0fd83 NeilBrown     2014-12-11  4876  		flush_workqueue(md_misc_wq);
e98a235fdfce57 Yu Kuai       2023-05-31  4877  
7eec314d7512d5 NeilBrown     2005-11-08  4878  	set_bit(MD_RECOVERY_INTR, &mddev->recovery);
1ade24b66e5223 Yu Kuai       2023-05-31  4879  	/*
1ade24b66e5223 Yu Kuai       2023-05-31  4880  	 * Thread might be blocked waiting for metadata update which will now
1ade24b66e5223 Yu Kuai       2023-05-31  4881  	 * never happen.
1ade24b66e5223 Yu Kuai       2023-05-31  4882  	 */
1ade24b66e5223 Yu Kuai       2023-05-31  4883  	if (mddev->sync_thread)
1ade24b66e5223 Yu Kuai       2023-05-31 @4884  		wake_up_process(mddev->sync_thread->tsk);
e98a235fdfce57 Yu Kuai       2023-05-31  4885  
8e8e2518fceca4 NeilBrown     2015-06-12  4886  	mddev_unlock(mddev);
7eec314d7512d5 NeilBrown     2005-11-08  4887  }
e98a235fdfce57 Yu Kuai       2023-05-31  4888  

:::::: The code at line 4884 was first introduced by commit
:::::: 1ade24b66e52235723afa4554f8cf6ecc2fb29b4 md: refactor idle/frozen_sync_thread()

:::::: TO: Yu Kuai <yukuai3@huawei.com>
:::::: CC: Jialin Zhang <zhangjialin11@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
