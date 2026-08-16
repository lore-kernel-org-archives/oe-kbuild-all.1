Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074C2C3255
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786915125; cv=none; b=G/Woi1j/HqlnPJJpbhxO4DRtHLaNtC2yZPFgGTycfKR3RE2u1+joOcx70pjq03hSgEQsw4+IEgS3uzFlhquj5QyEAnDMk9BKJAICTcBmwiJnkJAQIiqkNqtoCS5f/cDyyn1lIjcSiI143Iz79jt+X1xhQwwoMEeVEGgM8aZnTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786915125; c=relaxed/simple;
	bh=BKHaEXRzagv9Hwz2NHksp9OSi74XM3X5jnihbEGshu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfzdnrJtnVdJzOMic2DuCaTxWCawysQVg6iopek6OZQDygwJ3Pl5r7R3bbwxvkBfPiUILMNvOdtDG7uxX9q0ME0gcBnTooQpniJEDOaZ+wqoQZjTLnVwyonKy8hrZkRRgzR9hFPDye5l/EuM/cEM2yy85ohXhFO3txsRAxQmq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYWKjvgS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYWKjvgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786915123; x=1818451123;
  h=date:from:to:cc:subject:message-id;
  bh=BKHaEXRzagv9Hwz2NHksp9OSi74XM3X5jnihbEGshu0=;
  b=jYWKjvgS06S+3xbHVY6m5eApaz62c3ExriCiBGfJFcf8KQRSbneMXt9r
   xKzZT81ctTY3djF6Iv7xqQJrf/Ei4havMW6de9vh5MfWMuXXJ5j23nyx1
   B943SLCuTV/E2ocW1oDfyXNuAvwaQ9cZU5APEZjDCDwUKjYSWzXyazwBt
   8fmisDYDBVgQEBtJ/z8py3YnNi9PQVHLKOa6LVsas1vo4z5HliRZdsf1F
   nZNDSPDeRtLsbX+GXLTjvR0Eg493259HqyGIHXPWVNWJUd7rWeEb9fwzt
   ujuopz4VWNBTCOJ9MaROMynmTKow8IJgHWAxH42ktszVxGawnIHMGPIYZ
   A==;
X-CSE-ConnectionGUID: EB0h0gtcQ2yJOiEiRyX8lA==
X-CSE-MsgGUID: PcM+gZwBSICxkSf3KAWRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="74930722"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="74930722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 14:18:42 -0700
X-CSE-ConnectionGUID: X8iHqja2S8eWjgZc+X3lXA==
X-CSE-MsgGUID: lEL85rqKTB6ibPcVCKsr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="258526561"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2026 14:18:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wviFa-00000000d6u-18i6;
	Sun, 16 Aug 2026 21:18:38 +0000
Date: Mon, 17 Aug 2026 05:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 156/217] Warning:
 drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description
 in 'davinci_spi_platform_data'
Message-ID: <202608170511.e4bYe4sq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 6cc451353fcbdefe9d376e72702743c6dc202a1c [156/217] dma: ti-edma: remove platform data based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170511.e4bYe4sq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170511.e4bYe4sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170511.e4bYe4sq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description in 'davinci_spi_platform_data'
>> Warning: drivers/spi/spi-davinci.c:128 Excess struct member 'dma_event_q' description in 'davinci_spi_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
