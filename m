Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4A2877ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768170143; cv=none; b=kHZbQU48S3suAR5rzxLtdp+AlWtTtzjFC7uYXLlI830uqnq6ATEZ2zPaKlmF4dfmghyTpASKGdYnhMZTGKXe2w/e5DiWJWyzBwOxZhbUkj6f63Yi2/CWR5K9H7u3j9gyP0btpJCkb/EfOtkSXtRp9bT0ABi9EXzLCXHKUvlSITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768170143; c=relaxed/simple;
	bh=4rXxI67zKpSDmmMaH6uFDFcpboaWyQnoiNxdp/bMFcM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b1HLSXF810qxI2ju9KBWaad7BQK8KHcS3Wq/LmoIv/R452E5fVA+UpnIgrKu72+UtjEFpOekqUhiEyHE2AEyaEpKgbzXZL5lgZPxI6iPOxhWVytkj5Q87gtrxCRMk4ki3B1YOM8nf6Muuu2JN/aWAhq7G2PEKPHVk4QI0ibrff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5YbI8NS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5YbI8NS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768170142; x=1799706142;
  h=date:from:to:cc:subject:message-id;
  bh=4rXxI67zKpSDmmMaH6uFDFcpboaWyQnoiNxdp/bMFcM=;
  b=B5YbI8NSvvcKaLxPfqyN0E8bnFGnRdn8Hl/9B71+55jOEkh+0PoN/AlP
   PaTrY8oEu6LnG5quiw1ZwBHKtAsEPMKdt0ackqeMnT7Wdfaj9SIptuu6m
   YbQDqXq+1+178Y987MRb7MaVBuY5VOSCDNBPACReyl3vQfulTRJ7sqjOC
   6FUERPLthDg2APJbzDIdw6zFpQX9kS2BEe+OIR+02A2FIMp1nWcOgv2Qd
   WZVSEKZVWV1axsiyUlNlx7iL6G0cEsZTI0g78P4MPG7/xkKYNXNFJfQ5l
   EEUJYntnyxUfpyr+wfTtgC9bInSfJcYhU43kQusJsFB20owROtMjm1qOG
   g==;
X-CSE-ConnectionGUID: m3BaOn/uRl6TOq+5AyoiXg==
X-CSE-MsgGUID: rAyE60GcQSeotqZlmQRfPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80172983"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80172983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 14:22:21 -0800
X-CSE-ConnectionGUID: gSPmHbnWSQ6iF6/y41VYuQ==
X-CSE-MsgGUID: QKuwuYTWQkyqX+9nnnYucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203567950"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2026 14:22:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3pB-000000000VV-1duq;
	Sun, 11 Jan 2026 22:22:17 +0000
Date: Sun, 11 Jan 2026 23:21:34 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 AX45MP_L2_CACHE when selected by ARCH_R9A07G043
Message-ID: <202601112317.lMzVCDlM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   7 weeks ago
config: riscv-kismet-CONFIG_AX45MP_L2_CACHE-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112317.lMzVCDlM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112317.lMzVCDlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112317.lMzVCDlM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for SIFIVE_CCACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n] && (ARCH_SIFIVE [=n] || ARCH_STARFIVE [=y])
     Selected by [y]:
     - ERRATA_STARFIVE_JH7100 [=y] && ARCH_STARFIVE [=y] && !DMA_DIRECT_REMAP [=n] && NONPORTABLE [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
