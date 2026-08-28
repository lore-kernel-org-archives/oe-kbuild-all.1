Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA783E832B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906648; cv=none; b=aNE8+omU3BILwDtjB5w07b/lIx/jrTaU9a35ZKENTuOxqYHQz2HK0A2HIJVlRAvuuKEulrqis92Gvdun1qEz/CPflJzOipJdNx1x3JQsZ+oIFfEF7T6cRzi41PohfYKy9F4AKyVXtyW0AC7DfuudTrqeTO+XGktliXZKRoSN3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906648; c=relaxed/simple;
	bh=koOzwTTgZ2RAJyyMxGDUeyfsmYlW/hIMhGnDyQrKM6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gF5U4T4u3ZdHbLuf1iJf1Nxi4mOeJ8M4w2YwfoHHK99pUyi4wwY0CL9e6PDz9yU71ERkK7FYr3DWMlj/a0zssY2qN1OdDVGCjesSpZa7Ai7GT8GxlTGZ615yz6/FJNWevZNo0ouAxSCIQSpun4MFLcv+ZFtEkNWpaHF5nBWbMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcKP0kQZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcKP0kQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787906646; x=1819442646;
  h=date:from:to:cc:subject:message-id;
  bh=koOzwTTgZ2RAJyyMxGDUeyfsmYlW/hIMhGnDyQrKM6M=;
  b=EcKP0kQZLu4hHXDiBWBhdCPFNfdWKwp9RNtlr+K/abZFSQ26kEkJcU/T
   9fF599E8v5kmMXANrDsmncnvMeXSZClsOd3m97+15/mUdQN9QnTAg9RwO
   bG0bxHPT44t2N82i/3sF//JaJ8OfawEqbGjJcKzoSjfRQ6A+p+CUnQyBd
   /smTLVb5X7ND/KFlDfpW9tfOodSxQWFdx52vaq9RGdS815jgCYMtTuDO9
   SEY8KYNE4fp1OYPhccuu+iJUYoHo52/NASmg/7MtsB2zSWsdSxLoOVYdZ
   rWceDvZR6YYSbs23+6iCeLHbxaOth9KZ8UWDSHzail05LUtX+ur8D9J7m
   Q==;
X-CSE-ConnectionGUID: TXK668A5S3WMDhZBjNLa4A==
X-CSE-MsgGUID: FsGah8X3TVWAvOyHpjTAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90924627"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="90924627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:44:03 -0700
X-CSE-ConnectionGUID: FJRFSOT1RA6PJA3duJvZfQ==
X-CSE-MsgGUID: XURG6QEQQ16HSF2SC4864Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="270053791"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2026 01:44:02 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzsBs-00000000135-1GEj;
	Fri, 28 Aug 2026 08:44:00 +0000
Date: Fri, 28 Aug 2026 10:43:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] kismet: WARNING: unmet
 direct dependencies detected for INTERCONNECT_QCOM when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202608281044.BMqZZMRW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9331e8caf0b91bc59e1c69068a59bf93d5e8a31a
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [1/1] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: arm64-kismet-CONFIG_INTERCONNECT_QCOM-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281044.BMqZZMRW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281044.BMqZZMRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281044.BMqZZMRW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM when selected by GKI_HIDDEN_QCOM_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
     Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
