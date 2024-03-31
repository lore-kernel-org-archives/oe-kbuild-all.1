Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C94AED9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711904256; cv=none; b=VEQWl//ItCyIWd30L0uC/RsqUQNqbTbZuoFoEiVw1Mv27f00iPmAun6v6fq6rpZmvwJRpxYQszmOXNpji9vxm1sFWzpG0eP2dUZ9ESgXKpLr35CDEtV3RNerkTFDPtu47hke+FrI+TEbVedOtHOJ4bsEABJtnzX7fi3WNLK0DEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711904256; c=relaxed/simple;
	bh=w/LisPYdq6yNii5eSgWJGQ/UMWDOLINxU8piudaGIGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIDami7ZprYqbXcI1Gn0juZjE//7g3p38ljZefqyUAVtUYUrrO/t58BtHh4gzdYu6au3yX7yC2mMo+7TttQi747IKhedkgKyVTHDq0jprXIzCit2ttqDFcw10Hp+BzGxLEsAM/mBTrX1M4su1E7dehNcikgvymHvY5HnzV5EUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb9cykZG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb9cykZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711904254; x=1743440254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/LisPYdq6yNii5eSgWJGQ/UMWDOLINxU8piudaGIGQ=;
  b=Hb9cykZGe22arVkOYuv9mkrB21EnPZ/5yh6BReBrdeKBfoLSTHVwHBQo
   kJtlXxC2UgB8w/LY7yjw4S0xIZPqzo0BQkVYK5eC1/BoyBT5HOanVTGbN
   +FjDCR2VqQowjBFsHMrPV+zKUlUgQRepqGTqQCEqC5GvoGS5+6n+CnVgO
   2hQ5BnaaO2DfV02VlqSD4SP/qLz0xHGFc4XIhTqfkslFa4cfIuE1aGD8B
   QQzqm2bNpmu60SGei2PSTnGU0BpqlvfSaQRq42/mi2iaFYYODAzyHeLge
   Z9GZ4eg2KARddUYuTYXy30QeP+oXh7ZJnBWU4VitOeA3xKm03OVoYeq+J
   Q==;
X-CSE-ConnectionGUID: NcLUAy5WSv6gC2LR+7jbrQ==
X-CSE-MsgGUID: ogKhRUP3SyON90SWEmiklg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6972494"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="6972494"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 09:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17941133"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2024 09:57:33 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqyUs-0001HK-09;
	Sun, 31 Mar 2024 16:57:30 +0000
Date: Mon, 1 Apr 2024 00:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14630/22010]
 drivers/net/xen-netback/interface.c:170:49: sparse: sparse: dubious: !x | !y
Message-ID: <202404010015.DyEtZXqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: b8f0cb59f64793764cac8b6db7bee9b6157ceb7e [14630/22010] xen/netback: use lateeoi irq binding
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010015.DyEtZXqZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010015.DyEtZXqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010015.DyEtZXqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccycVvJJ.s: Assembler messages:
>> /tmp/ccycVvJJ.s:1072: Error: immediate out of range at operand 3 -- `bic w0,w1,5'

sparse warnings: (new ones prefixed by >>)
>> drivers/net/xen-netback/interface.c:170:49: sparse: sparse: dubious: !x | !y

vim +170 drivers/net/xen-netback/interface.c

   160	
   161	irqreturn_t xenvif_interrupt(int irq, void *dev_id)
   162	{
   163		struct xenvif_queue *queue = dev_id;
   164		int old;
   165	
   166		old = atomic_fetch_or(NETBK_COMMON_EOI, &queue->eoi_pending);
   167		WARN(old, "Interrupt while EOI pending\n");
   168	
   169		/* Use bitwise or as we need to call both functions. */
 > 170		if ((!xenvif_handle_tx_interrupt(queue) |
   171		     !xenvif_handle_rx_interrupt(queue))) {
   172			atomic_andnot(NETBK_COMMON_EOI, &queue->eoi_pending);
   173			xen_irq_lateeoi(irq, XEN_EOI_FLAG_SPURIOUS);
   174		}
   175	
   176		return IRQ_HANDLED;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
