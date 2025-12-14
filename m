Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909B1448D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765700522; cv=none; b=KPQdXRBIvH7Md2kRTmgLGSYtsc/+baCxkTc2B5Zp3DGvsVQ6PnQBYpFMOtfdvdKBSbqNgA2e+J0m3uRNbG1RK2AEmwfVr8wmU1RmOazt4D0fW3xTgpYTckMxNSAYOj0+T1WCqdkLeJG1Xj+BCwf0Mqc7rxRzM2vNz8wp5Fqflfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765700522; c=relaxed/simple;
	bh=PNtSVsxK0yFWSs25/x8ZoP9djpK331M0DAxJUfSx1m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/jP7l57q2hvaOyo24Mej4s9Vv2uN+oBIy04gCpeaqS6ClxrBZsLUK0utko3znsggoBA4MsLEflOlIA2Y7wQrA1SRlG4t+AhjQ33WqNtWb+eIcYZo4BsggDIj7sxjvlK9nZAvMkNJmm6QTwMVXBuQwzCYklQX9dCKIQN69GAbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0wcc9HT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0wcc9HT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765700521; x=1797236521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNtSVsxK0yFWSs25/x8ZoP9djpK331M0DAxJUfSx1m0=;
  b=b0wcc9HTDNV4v4t89aSh9uihPvUgXsGYPZQ2U6XRLOmz5cAXzOjPTO6+
   WtOdT48P3RUkzmcEp0zKvPBfWhSaZh1KLLS2b0j+kw4ygoBEp/s0w0xmp
   d5Tz49fxkwX1Mp+1hLd/KuURUZMzBl+ZnpZFvtxYk8OJ/9ch9AxKhEVBM
   2eEcOM1swaDqN1sxIgc4DN2HuZiPzNcutQoTP1I21zXlSYKy8De5plX+k
   RP5Ar7FxF6p7VaGRDtG2eyXpiX4LL59sNOv/PL2RlrDT3hAZl0U5ensL1
   vj63MhikFbCKStGobF+tHmN0luv/9vS0farPdOQJwVKj4cAdxLDgoqqQP
   w==;
X-CSE-ConnectionGUID: 1qfuag7tT5ukP83MSoThNQ==
X-CSE-MsgGUID: 38R++ipbQEaGJ9Iox01/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85047158"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85047158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 00:22:01 -0800
X-CSE-ConnectionGUID: WAwBAuc7Tbuw79KWGsoO6w==
X-CSE-MsgGUID: MtmpAQvdTfSLIrE2nQ4Gpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="196751317"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2025 00:21:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUhMb-000000008rh-1wpm;
	Sun, 14 Dec 2025 08:21:57 +0000
Date: Sun, 14 Dec 2025 16:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/firmware/tegra/bpmp.c:248:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512141604.rwNqv1BL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   401d2e5564fad8fc4b2fa18984c5bfe568e36feb
commit: 6db913f5e449fcc0d1577d22f6c1955216aef2d2 [2/2] firmware: tegra: bpmp: Do only aligned access to IPC memory area
config: arm64-randconfig-r121-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141604.rwNqv1BL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141604.rwNqv1BL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141604.rwNqv1BL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/tegra/bpmp.c:204:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char * @@
   drivers/firmware/tegra/bpmp.c:204:17: sparse:     expected void const volatile [noderef] __iomem *
   drivers/firmware/tegra/bpmp.c:204:17: sparse:     got unsigned char *
>> drivers/firmware/tegra/bpmp.c:248:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char * @@
   drivers/firmware/tegra/bpmp.c:248:17: sparse:     expected void volatile [noderef] __iomem *
   drivers/firmware/tegra/bpmp.c:248:17: sparse:     got unsigned char *
   drivers/firmware/tegra/bpmp.c:423:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char * @@
   drivers/firmware/tegra/bpmp.c:423:17: sparse:     expected void volatile [noderef] __iomem *
   drivers/firmware/tegra/bpmp.c:423:17: sparse:     got unsigned char *
   drivers/firmware/tegra/bpmp.c:505:53: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] mrq @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp.c:505:53: sparse:     expected unsigned int [usertype] mrq
   drivers/firmware/tegra/bpmp.c:505:53: sparse:     got restricted __le32 [usertype]

vim +248 drivers/firmware/tegra/bpmp.c

   239	
   240	static ssize_t __tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
   241						  unsigned int mrq, unsigned long flags,
   242						  const void *data, size_t size)
   243	{
   244		channel->ob->code = mrq;
   245		channel->ob->flags = flags;
   246	
   247		if (data && size > 0)
 > 248			memcpy_toio(channel->ob->data, data, size);
   249	
   250		return tegra_bpmp_post_request(channel);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
