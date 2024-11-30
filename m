Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA32170A3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733011054; cv=none; b=kXq49XlUagjuAt6M5s/npWZWPoXGvgQ/6+FvmRMRfWD+v/ESQnpmVvQrpx3jtwOrADN6NuSZZi5xCzCeVh07lKZPXnVBQKvps4AmbBwFFRnjuq9k7nwYXYUeR2wXvdJQLMDOB08jLmkV2TLG3XMHO0sTyvAEhLo/ZEAZ0ecyJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733011054; c=relaxed/simple;
	bh=93kABybJFl60zm3kEciLlTNJzMjpgeGdKrlJon+c/uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sbzx+DvMY1mhD3YUQzzsiGmoAtc713+hR4AMVWb/VmoGpELks74nQCOTYquS6T7hYT0LSeQE1TDtEtzEaP/tVKnKdARp/Hn93wMB/CtEBHLMfyo1z4Un3Wz2UQ2R1yTPXUuZFKJ/UkC8+D3UpLWgRv6P+gv8bHhixGrH1CN4+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLXgFNC+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLXgFNC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733011051; x=1764547051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93kABybJFl60zm3kEciLlTNJzMjpgeGdKrlJon+c/uk=;
  b=iLXgFNC+amNbTpzJYvRdy3eORD3aLH8Kf4krCEDCSZpSpMsXUP1BiO5u
   vr3X1aAYHA+7mUpJwiJBhJMfUQ2YhCd+4LgkbesetpecZYt4RGtyICvvb
   07CTRaX8sfNk+3nBJKUuRVQ9jxpxZKegUD/VrQECO8S6mlRaGiQwHGeN8
   gDhXjSsgWnVUyPy/rCkt+ciPPXYW7WXBXhjrfJfMrB3Kr/7AiFjION2Wh
   r9BG8zKv/sE6wwN4/ztW5df2h6sK9JbE01B/vEgDjT8WyMhYoAohW1Fxz
   7zR8M2eEH+grXOTxApw/8yEuWlkiFI54p7/3V30nscrLj1maNaHdJBk4f
   g==;
X-CSE-ConnectionGUID: 8xf39KBVR2qc68uprF/y5A==
X-CSE-MsgGUID: /klH1qf6TaauqfYlWMB+2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33327687"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33327687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 15:57:27 -0800
X-CSE-ConnectionGUID: VZB1jUHDR863UiLqwrGmtg==
X-CSE-MsgGUID: Qoer54pjQniXLDOL1/W3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="93086290"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2024 15:57:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHXL1-00013p-1b;
	Sat, 30 Nov 2024 23:57:23 +0000
Date: Sun, 1 Dec 2024 07:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2508/2508] drivers/md/md.c:4884:38: sparse:
 sparse: dereference of noderef expression
Message-ID: <202412010733.0M8HqEii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: 448fbeaf0f07ea578841346b938245f5c5220b9b [2508/2508] md: protect md_thread with rcu
config: x86_64-randconfig-123-20241130 (https://download.01.org/0day-ci/archive/20241201/202412010733.0M8HqEii-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010733.0M8HqEii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010733.0M8HqEii-lkp@intel.com/

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
