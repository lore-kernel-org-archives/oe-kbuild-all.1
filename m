Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F71400A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 03:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725851904; cv=none; b=gkHpi3+TG15hg1pvgYREEKKeY5WIvMIdPdwpFRMUfI4KRVZdode+CS9evYAP7GOt9CEd87Gm6gCa8dzb+OKKTIBxQgCgyr+dqaT3ronGV1VS8XDiWn3+zIr4ifDobuHOPy35QlV5/jn/Ekd1j55m5p+DeYyM5JHSOCuILJiwq+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725851904; c=relaxed/simple;
	bh=9Qz9uKha/JsjFXVjA+l4/vxvAxzRVh/qnDbGxTqCvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZgogEIy4bd+lVkOvgE3MHGrnkFQ3s+1KXPRrBk6EgSWsSz9CPCnXybDJMr7b9ykNR98c1Jk9j8Ni3ac/le62QtRc1rXInfKLpnGqwTcL1OMYG0Ql9qb0OlSwqhahTlMC1lB0h01RA7aTaPpfZo8Qi/47sLFjLb8evK40sov8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAkW5+w9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAkW5+w9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725851903; x=1757387903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Qz9uKha/JsjFXVjA+l4/vxvAxzRVh/qnDbGxTqCvDY=;
  b=MAkW5+w9fpZBM4vOLF0y2Kjor7iJIcOILDsgC9s3CXR9+P1NT1dwl+Oe
   /Kq5HPEVIsv82B/0qMbcyJsouIFRDOaXIvrbKJAPyguih8M0XBnVG7ZII
   bm6CXXwU36K5vLef7ZVajaH2gAy6tRo1/2IHKGxcdbyPG2tvNxR3bMzRs
   wNIzE6/4Goq1X57pvUOINZv9cxmqmy/6o/p8W+H0sZ7PytAiPo4m3blXb
   Sqj2PXDg1FGDCuHS46MZAdjBi14xDCSHhZV2Vv1JNq/Izz5bvtG923Waj
   8lA9z1kuhkNPUgr8DeoeOrh0yjFOKdfcySneYIkW5bcWptuGbZOekFMcv
   g==;
X-CSE-ConnectionGUID: B+eB0isTTc+Z41BZ4TVbZg==
X-CSE-MsgGUID: S9ZN9BENQT+icVgteaiVQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="49937530"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="49937530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 20:18:22 -0700
X-CSE-ConnectionGUID: A3axwJrtSMOUO5eHvKuvng==
X-CSE-MsgGUID: WcqwQ6iMT22jDwzhsyI2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66755645"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2024 20:18:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snUuv-000EEf-2f;
	Mon, 09 Sep 2024 03:18:17 +0000
Date: Mon, 9 Sep 2024 11:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 17/98] kernel/tkernel/shield_mounts.c:254:5:
 sparse: sparse: symbol 'shield_mounts_release' was not declared. Should it
 be static?
Message-ID: <202409091143.rCYSpREc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: 7dbd79cf59e88173f385083fdf39603a49c99233 [17/98] tkernel: mounts: add shield mountpoint in container support
config: loongarch-randconfig-r111-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091143.rCYSpREc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409091143.rCYSpREc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091143.rCYSpREc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/tkernel/shield_mounts.c:254:5: sparse: sparse: symbol 'shield_mounts_release' was not declared. Should it be static?
   kernel/tkernel/shield_mounts.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/shield_mounts_release +254 kernel/tkernel/shield_mounts.c

   253	
 > 254	int shield_mounts_release(struct inode *inode, struct file *file)
   255	{
   256		return single_release(inode, file);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
