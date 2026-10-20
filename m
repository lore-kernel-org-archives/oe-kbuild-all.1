Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488368;
	b=Wa65Tx7+s1wOZSCYzlkxQtC6OX8TXWDG1485b9WPFHqjAegT4QhuGWzG1LUquvGB7Nlq
	 Faywou5COzUaOGtiQSDPVWf1JiFVA4NMgNyIXzkiBqhQEyjQewz71FacrnattVsQyNbkk
	 ibQ6tqqI1pQSrFbI6DHcjorgNzCJHqRMSv/czfjooJ8/bySCOZC4Y32nuoU7Cx2u4CcYO
	 5RXQFXqf4v4HCnqQ5eHLtpVM1nXGOtY2k4kH+FCyY0KHIYy4g/Lri2urKhUDM9622gjU4
	 JrdqSGF8yz3rV+dcLMZmfNWd82AtNg/JOmpkCReocIf6Vrk2fuF722Woj66i8wAqOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=W+Rhe5ydj2jZWqxbN16yqoFugGkmmLRmuPSx2yveQLg=;
	b=uzl/5DYWkTcHeWMhNLeKzI3riNy4B5ovlGGlAEE5utgQRWpOPV+KlQZyresqKcApbpc7
	 LCNTvrU4UR1oL8TFcXk72z8PSWf0az/fNxgTQxpsZnpZ5mlp3YH5ReButVmpLBk6jyGiu
	 YUiyXeMXEu2r1MT7Idoi7eRHMHK5vsMxMVHCVE8D2DnhhW0o2s+fJsD5dxW0suQs+i5vg
	 2qKKOQQADmRmUp6VMLGEJ31DmYkMx4dABTXIhybLcWyjHZSGsmeOnJ5XMN0X6/UFubuWl
	 9Ls0nOu7JY7QE0VKvWlhJLVOCBatyXtZc367wccek14FVHpASp8Y4PpwPVcsKuZ4nTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ddn7VXDb;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB87606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 09:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ddn7VXDb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792488368; x=1824024368;
  h=date:from:to:cc:subject:message-id;
  bh=/2JryNOTNUcISLKy/gu+Ka8E4t4XzRqodsFfwHCIwQU=;
  b=ddn7VXDbkMVEFjvuWzPAYdyEihANP6PVB5KOvl9uG1dQpi+ndIzOR3vz
   uyznBow2IrFfebIGxT/SrTKsDOWEqXsACkKq6O3H7dkhu/w+Lt3GXBGlg
   S1ieDrpnneYtni8svQHVN8vkUX7r71k9OlRbiSbjE2yWHR3Klg6pbjJAx
   j8j7jOl2UgFBZD48zvVpGjSq8VW4ICx9WHxMUj6OH9hrWdkvaQGpAfQP5
   bbqhOo1DkAsaknM3kJK+1ij2j6XAE+fVohLpLsHWbYQUBYQyxREirbhMi
   2rEV1Qf0tkU5W4uXXW1p9LKYZulPUz/wP0gJtr1+1S2o9s1zNU3tMH0I2
   g==;
X-CSE-ConnectionGUID: UpubG4SbRviAUVMSkAjmaA==
X-CSE-MsgGUID: pX2eEroUR6msM2OScFvVUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1286595"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1286595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:26:08 -0700
X-CSE-ConnectionGUID: 4c4a+IS5RlWqTtebvRU0WA==
X-CSE-MsgGUID: t+ynon0VQHqJZ9ugQpFl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2752986"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 02:26:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ66e-00000000NEI-1Nh4;
	Tue, 20 Oct 2026 09:26:04 +0000
Date: Tue, 20 Oct 2026 17:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] Warning:
 drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in
 'dma_buf_set_name'
Message-ID: <202610201746.lD7eiuuR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Guangming,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   cb6dc4ce5c7ed6c514b36c47e5180113ef907c7b
commit: 341d2ddc74eb2989062a712d7853ed359232f47d [0/1] ANDROID: dma-buf: support users to change dma_buf.name
config: i386-buildonly-randconfig-1003-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201746.lD7eiuuR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201746.lD7eiuuR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201746.lD7eiuuR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in 'dma_buf_set_name'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
