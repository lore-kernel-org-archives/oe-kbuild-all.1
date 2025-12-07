Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E9280CE0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765124588; cv=none; b=TfmyJuodlxkvkeroGV30fl5LwMUgaeQn6KKFpjUtyuRPDm5/X6TfWXUEaGoszy0DmZH+lGXWa2e3DwD8c5SYdxAuAcIOsJiKnOtbvvZD9Fg8tjYnWvll3zktaCjtSqP5/rAMXKp5WtSqX/cWgmRp95E30d3QNsZnlf+T3E+0rB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765124588; c=relaxed/simple;
	bh=hPURtOetenBAh49qHRXUTuSWrfOHz/1lh4RZPB8gdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiOuEBZGnVfLj8EnExqrbEULcmurTE3LGBPbqphjOpaY1Fjvlinq9di4knWu16N5tykUNXdVEIWNJ6YGKy2NQRDVVCf3UA7MTk2U2YI6BD/FFmCV1oZKIMdT2w7mCdmvmZEDSP+l1jGNOVp/n8UQQIgr1fraYdJT0JACCmD6ba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL8kL+UA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL8kL+UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765124587; x=1796660587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPURtOetenBAh49qHRXUTuSWrfOHz/1lh4RZPB8gdHM=;
  b=IL8kL+UAMprJPlbsET9YdX1DZEOG48dVB61stJNgHc8AA2MLBtbfrA2d
   5ADrqwqIlYrFPMtNVh/GPaKweZsISyZa7ieO6CcjN3FaKaqG8r6TJQ7ra
   TmBfVZ/+9P0p3Rmp0/yDtQUdmC0TfAM6qXAR26VxKLz1o+JzPT1QiiR40
   4AG34GAlFchs/W2rYaP8kkQPgL1sKFW+NSt3rCmdYFYdYOuPrQS1hBtt5
   4PrsIOVw1Zs55AOL+6h9oBaL7Y8rBt7YNsHS+RIQU5tL6qdoCGs0VJkM+
   5he5MaLgbWs3Nr0CiUxvWy1VhNVog3ePIekA/7C6ExkOLgWz91VKZtm1O
   g==;
X-CSE-ConnectionGUID: jWhJtoORTiueLppUxpnKZQ==
X-CSE-MsgGUID: 0YrjDjNFQIyo5MGPj3X+TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78198750"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="78198750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 08:23:06 -0800
X-CSE-ConnectionGUID: NozKzZ5pRcqvQXl10Yclhw==
X-CSE-MsgGUID: Turtobm1Sr+V6cQS6lUEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="200210711"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Dec 2025 08:23:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSHXK-00000000JNR-2sbe;
	Sun, 07 Dec 2025 16:23:02 +0000
Date: Mon, 8 Dec 2025 00:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Mingrui <liumingrui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] drivers/misc/zcopy/zcopy.c:621:51:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202512080059.AtMf7DsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 0305a09f222b7b94b01e478948f09ef95e9afda2 [3482/3482] zcopy: Introduce the pageattach interface
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080059.AtMf7DsU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080059.AtMf7DsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080059.AtMf7DsU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/zcopy/zcopy.c:621:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/misc/zcopy/zcopy.c:621:51: sparse:     expected void const [noderef] __user *from
   drivers/misc/zcopy/zcopy.c:621:51: sparse:     got void *

vim +621 drivers/misc/zcopy/zcopy.c

   611	
   612	static long zcopy_ioctl(struct file *file, unsigned int type, unsigned long ptr)
   613	{
   614		long ret = 0;
   615	
   616		switch (type) {
   617		case IO_ATTACH:
   618		{
   619			struct zcopy_ioctl_pswap ctx;
   620	
 > 621			if (copy_from_user((void *)&ctx, (void *)ptr,
   622									sizeof(struct zcopy_ioctl_pswap))) {
   623				ret = -EFAULT;
   624				break;
   625			}
   626			ret = attach_pages(ctx.dst_addr, ctx.src_addr, ctx.dst_pid,
   627						ctx.src_pid, ctx.size);
   628			break;
   629		}
   630		default:
   631			break;
   632		}
   633	
   634		return ret;
   635	}
   636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
