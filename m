Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF9C42C4E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345164; cv=none; b=YzRAwshY/HLymX2+JCp7RiocUweNZCiCT6ktKb5qwwG0smcQFzNU7bOQtf3Sd/1Kaad4hlmI2KnLNbVaqEod/cdmXQEfzgNkOZpmFaZm/nVkrWUIWSLWP+QnLSnYRTxe4DtueQeq2Xt9P/01pVoqG6uyUBb9YSx3qWQwyqaRmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345164; c=relaxed/simple;
	bh=Qb2y/YwoOObm7ZFcCgBbzCN+KK5qlSlNGB2LbJQ5ZPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dc2ZkRHUnU8HUZKdZFlgdMLQWy3TQeVP95XJvznlXJfjBRoBPByysfGPczICmwehE011IKNS1UTSGwg0qtLQR+4rksaDpMY7Jxe6XKTI08tNtNbFtc64t+Y4y1LVItBDTkrBbd58YoLoUSefWhkaNJ+HeDvx5SFEADW69nkQ3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/EgMHXC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/EgMHXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785345162; x=1816881162;
  h=date:from:to:cc:subject:message-id;
  bh=Qb2y/YwoOObm7ZFcCgBbzCN+KK5qlSlNGB2LbJQ5ZPE=;
  b=O/EgMHXCkae4rcohrK1Mow5Xah4OS/8YauTRLq6nDZ6C3mz2J3UJVTu5
   wKzH9knpbSDDre+ESCqqHzVq84S1sOp9uHFCPxB3ro+KCLysPxc2VT4Lj
   AtFYmfooK3Jw3USlqNh+oMo/+NmnkBGiaCljT75I4MWf/tRTX+QnBXrzN
   eIjfj59bpREx5PzXIbF0TrbxBPfMz5UBpZ+fVi8RMwDosX6V/zH3ViB/7
   0ibMfkloG79HJ4lJbR7fampGaeLJsZgLNloDgZYOpfWpgKADuBSrNZzF9
   Z8971xqLsQTBCtZh/tZmDwh7+KwrGgbixZsKoqpWUhFk3caLZBwzjawiU
   g==;
X-CSE-ConnectionGUID: CAKQ9nOXTc6UD3Nc+0+IZw==
X-CSE-MsgGUID: lqVA9xh9TEOdmQ2vXt1fYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86149495"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86149495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 10:12:42 -0700
X-CSE-ConnectionGUID: K2pO3PRyS82GEPx/8rSEQg==
X-CSE-MsgGUID: 0zpKwixySym69poS7BKGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255761472"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 10:12:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp7pe-000000002BO-0pm8;
	Wed, 29 Jul 2026 17:12:38 +0000
Date: Wed, 29 Jul 2026 19:11:38 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 344/700] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by MSC313E_SAR
Message-ID: <202607291901.0yJ5bhrR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 88c3adc69c81ffc51dcc5902ec2f4b50e72ce948 [344/700] iio: adc: Add driver for mstar SAR
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_MSC313E_SAR-0-0 (https://download.01.org/0day-ci/archive/20260729/202607291901.0yJ5bhrR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607291901.0yJ5bhrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291901.0yJ5bhrR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by MSC313E_SAR
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
