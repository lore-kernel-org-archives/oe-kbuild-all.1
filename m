Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4E19E836
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729604446; cv=none; b=gTL2/3hn4JkU7bqFuMzs9icf7YTd/pjLYFHKPN6kSTLtCx/O/fi0bumx3y32PEUXGSpPLvjFyx0pNLBB6NJwZMw4U/NgqULrbjLZROXj7tN93+5ZSq3Bd2zk0tL0rs5OrF/ejKTE//wXo/V4jqKw2wEupSeWtyKCh++LALethqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729604446; c=relaxed/simple;
	bh=9KaSpJyY7LGR8LUzcfp4iyZGFIP7b7AuLrLpeF6VU5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fo2R9qHnWXr5LQwEQHHp6tbtgencjEAn1KO1vSIDllqaJGu1nsOZXnpRpt9B+PN050Jwfg3lkhAcm3jZAD1p/UM6sr6+iq2y0Xl4Al/TUSXuzyk9uN5DiEoYW55V69OcRnN0VZ+KLgSVuLDeWK0HS1cPaMwDHVBosmr+1lrDXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7TjrYNn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7TjrYNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604443; x=1761140443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KaSpJyY7LGR8LUzcfp4iyZGFIP7b7AuLrLpeF6VU5g=;
  b=g7TjrYNnLMra7OK/k391pHruBzcC9EvgaYRb/5E8v1K5ArPWnFjLpqOS
   Gsm92rIQSPo00OpY32lg9yqjCW6ro1RyXBuCnyHt0vmjJs+f4emTpYoqU
   JVyTvlJhVSqeXaFmD5LQTA3EsSU40TEbEKHyL4j3UE3uRYmxFgwiTgPuN
   2q/VrJ+8x8g6bVAQZYhEdJUGpYKktt6HCTZZjYHBMPsQ/Qf72LEm3imPf
   x8hDZxlfqy/dgc0pvIhY3WJVz24idtE7/PA3IJZQah8AABnIeW0+qCWq7
   Mt3TpQZ0DRkCwVGPZFiTnu6+oByAV4bjb1sHil5c2Hsm85SgzRHhYcFMA
   w==;
X-CSE-ConnectionGUID: kcjyWPhkR0iXVRbCk6tD/g==
X-CSE-MsgGUID: De4XOS4JTmCP5ytLoDXfTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46604250"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46604250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:40:43 -0700
X-CSE-ConnectionGUID: TgPnK3f2RIuXZ09j72PzoA==
X-CSE-MsgGUID: y3sJX283SmeapR2oxm36gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79783453"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:40:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3F7l-000TdE-35;
	Tue, 22 Oct 2024 13:40:37 +0000
Date: Tue, 22 Oct 2024 21:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1849/2444] kismet:
 WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected
 by VFIO_MDEV_IDXD
Message-ID: <202410222156.Quz1pdot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 3fc743601586ae7d5e07907a94af65a8112159d4 [1849/2444] vfio: idxd: wholesale copy over 5.12 PO kernel mdev driver
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20241022/202410222156.Quz1pdot-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410222156.Quz1pdot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410222156.Quz1pdot-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]
   
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
