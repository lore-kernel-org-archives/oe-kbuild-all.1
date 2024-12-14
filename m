Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141B169397
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734188866; cv=none; b=JckPWkiG7c2X4pKxhzMgTxnfiHasiUjT2iadOoYl0LMAqto7UQa6weME4Y2geB7pZItao3+bngB6UcfklrIL2WF5Owm6GW0D02jrWCM8S3i9c8ennsWaxOdC6JJexQJ6qY5ubFD24pIraGYkWl6Zws4xjcga9v1o9GM2TTWDBTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734188866; c=relaxed/simple;
	bh=hhAKbRXkK1zl9YL4p4o+qOovShemcMc5tPUXnGF8bQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lyg4MldcIImDStXhDXLk4NREQoclpC6GFiZThPNRw6N2p96B3LG96IInW3hSfue+6chXiaAppyU24juuaAlrxMHauFnksgA+mRrdjraNzvkc/erMZ62chjO3Q0eOPy1wqOuy2VmuPEt1IGatxODNvXzEvWm3Szd2wtAN7RED9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5OjHuF5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5OjHuF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734188864; x=1765724864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhAKbRXkK1zl9YL4p4o+qOovShemcMc5tPUXnGF8bQ8=;
  b=P5OjHuF5rrnFPcbZZhkUrsUpIf0UuqsoFZnkPHxoBE5A/M9E1KheQ5Le
   QhrjbOz8hFEEP9zIuxHW4YxHKW7uxz62oQuaiRgAleOOOF0vxxd33w1P3
   01/u5JR6GikK8QErvgsxV5IxD17hpdTBlhaTsfa8h6rD8LW+Uxfzp+qhs
   1kg4BTATOUKglaHEMpp2TaDSR9PAx1pKFfeRZThHWKGprNzNoRomgBfzH
   /p19Mz4ICkopVM/1P5Hb4nIUgG0BpL4DFHHOYIlbiiIvol8AEVjNC5fNd
   JuwAPNzV4d7VNJoq2sbwOUxDs8BFrKI1qkX9cEIHbiq9eprBDRtQMBc6u
   Q==;
X-CSE-ConnectionGUID: 3cBqKCKYQFGqKmhNA94N5g==
X-CSE-MsgGUID: ijw+7FYtScus4Jhz2jWlEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34357880"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34357880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 07:07:39 -0800
X-CSE-ConnectionGUID: gEgEcJpJTLCQwaedD3YW/A==
X-CSE-MsgGUID: ebZR9JbHT52gWsWsXInueQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="97032827"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2024 07:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMTjx-000Czn-2W;
	Sat, 14 Dec 2024 15:07:33 +0000
Date: Sat, 14 Dec 2024 23:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.14 4/25] ERROR: modpost: module snd-compress
 uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
Message-ID: <202412142316.x6rwrzcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.14
head:   5ce3beed07b8145aff61f2cb41f1868f6221271f
commit: 24a01710f6271ec32b629d714e6a64a69665128b [4/25] ASoC: fsl_asrc_m2m: Add memory to memory function
config: arc-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412142316.x6rwrzcG-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412142316.x6rwrzcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412142316.x6rwrzcG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
