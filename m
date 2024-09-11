Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A181547C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043323; cv=none; b=ng5wTnZAKaml+OCnW+xZ2LudlbpPlDPFKwiz/cmQ345NF4u4pM1JIUgOVBPmxVwB7ap7LY2ZaDz9Eum+vzb1Ffj0YyTsuY31l06U6bZhaQs2ulzCKiOYwi8xQDxMycluBwjH4ZPRiB0ca/TToKrIBGfywKEAT8SobUL/SgJLhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043323; c=relaxed/simple;
	bh=jjDPyG3kB6mHkYQiotiBFq2NfyKHsPnYBwWwirdaXFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdoxD5cFgVba31GUxKqMNPjxVXBICxG45PXeopA3/jp0ZTN4rx4fyrFKMdlmzpWtOp5GkLEQ8IjBvtT9mIDGqGQFBAu3xsZwg7hBsjnmkXJVqkk3UymVTg2p7zGkY6el3fdvcO/xv3QHjrUN9i1mfKMqB2KAIpTghK0GnU5o0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6UfJaFB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6UfJaFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726043321; x=1757579321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jjDPyG3kB6mHkYQiotiBFq2NfyKHsPnYBwWwirdaXFk=;
  b=K6UfJaFBvRx/kwk115lC+63uOMfdWtoJxYwcSE0ft0dRGPZeQ1D6GXd9
   MrOjsRQ7qlJbqHoco7cm1SNE6/hGRgl0hj9Mln5cIm/W3FNmRYaMf2end
   Y2oKcMl04eQsffUaON+7G16cd4/jEgqEXXBZhVX3ydMkECratzXLkEBNp
   meMNQwwiqOb/E6iumInBCOBLqr2ok2ZrG/jPZv8Zu0k1mZitexy6khUce
   fu1+BX6BATZnPaLZB9KKNNM/cmxRnZammmrLx2sg6loPz9cLOlu8sXwcU
   YkuFnifnxFLYeO5nk8QUUP/+Rjpxvii6ujJb88DQiTjS8JJOBRxBkVtYk
   g==;
X-CSE-ConnectionGUID: 7cBnMXWKRHKs0gR9+FMdYg==
X-CSE-MsgGUID: XeRnaADvTdeEhNYiHEqGhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24698173"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24698173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:28:41 -0700
X-CSE-ConnectionGUID: 9h9mWeCdRbSKFHjGfuHxiw==
X-CSE-MsgGUID: uIedZmokSQOC8dqCWpPKBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67523333"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2024 01:28:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIiL-0003Eg-2m;
	Wed, 11 Sep 2024 08:28:37 +0000
Date: Wed, 11 Sep 2024 16:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23170/30000] drivers/md/md.c:4884:38: sparse:
 sparse: dereference of noderef expression
Message-ID: <202409111647.nFxvLIVx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5cdf8021f6f20b488b2592811728b3f934fae628
commit: 448fbeaf0f07ea578841346b938245f5c5220b9b [23170/30000] md: protect md_thread with rcu
config: x86_64-randconfig-121-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111647.nFxvLIVx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111647.nFxvLIVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111647.nFxvLIVx-lkp@intel.com/

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
