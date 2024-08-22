Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF417C224
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318884; cv=none; b=GCrknNh5heVpiN5CrV8whcwdmh3QZVIucerinBbZM8OzDHhummWlW3sqql5B6aHK9l2HZUuTtR8Cu+rVxB+RXc6ogufC+/AdCclpNe6FF5mgL1wDvCF2NF/1O5ZY2PV1uRNWp7pL7V9Kqia8d3GTiLPX9BWm04uGeS4BsfL4UOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318884; c=relaxed/simple;
	bh=NSz8hBhBJ2yxNATGmFhxFxKtg77gsINJS+lRKEoQwaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kls9uGiWkrxDDrxXU3Ce62RpDUxK0Hq+xL+Ii6II6AnXsg1gbTDy+fdmLGZRnqnQPGPJG/R8KkUXc5J6x50Mj/Oj0dgEgxeLsNTKr26dLgWMQoSIYD0URJoBUh+HgL5rqoB6BrTL510VZqms05zvh3Vv4mfNSs8KHE6o3brOVy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAQinJE4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAQinJE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724318882; x=1755854882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSz8hBhBJ2yxNATGmFhxFxKtg77gsINJS+lRKEoQwaA=;
  b=eAQinJE4TxZbdnQUbdkCA0zvN4GFWAiOOfcrFn0BP/PVdep2Vdnr/RFg
   byMF0jeN++smoOLk8JQv3LAA6y9apOXue4Vaj11xbyZt7TZ3dvlFCrd1t
   GSTcSgKgdEXChwtGjHSDK+38XJjsfO3+j1iH1zqVjD2poLy5EebSsnWh+
   jO8KP1cVHOG77oKJYTiSOWj9+T1UobZKLpzpvB6w6bY0qdtp7x59/NVpy
   XJ2XSW8shpim/2uwpB7I/Jrs5uCGtw0P0Q/ak15Vqk+4/F3sLFqhWExvr
   +HI70b27Tf5oGXBsX/1MfYqCU8Kpbi+TYN1CmEG+4w70LPX0qSSavyTQr
   w==;
X-CSE-ConnectionGUID: oNPo3AllQEig0+QLhbFBZg==
X-CSE-MsgGUID: wEKwRBdyR1y3IvWP4P0/vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22892086"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22892086"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 02:28:01 -0700
X-CSE-ConnectionGUID: tlfHk2PyRSC1guS/u5gI9A==
X-CSE-MsgGUID: riZfrtqFS+O9AJy01NqYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98882336"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 02:28:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh46n-000CdA-21;
	Thu, 22 Aug 2024 09:27:57 +0000
Date: Thu, 22 Aug 2024 17:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: AlvinZhou <alvinzhou@mxic.com.tw>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 3/20]
 drivers/spi/spi-mxic-uefc.c:983:25: error: 'mxic_uefc_of_ids' undeclared
 here (not in a function); did you mean 'mxic_uefc_spi_of_ids'?
Message-ID: <202408221714.bCSxM2Rc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   a84bb95001ed7e4eaed415147f3ed18063df8ff7
commit: 3a117622bcdd9cc7e4747224858f669a5209a35d [3/20] spi: Add support for MXIC UEFC SPI controller
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408221714.bCSxM2Rc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221714.bCSxM2Rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221714.bCSxM2Rc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-mxic-uefc.c:8:
>> drivers/spi/spi-mxic-uefc.c:983:25: error: 'mxic_uefc_of_ids' undeclared here (not in a function); did you mean 'mxic_uefc_spi_of_ids'?
     983 | MODULE_DEVICE_TABLE(of, mxic_uefc_of_ids);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:250:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:250:21: error: '__mod_of__mxic_uefc_of_ids_device_table' aliased to undefined symbol 'mxic_uefc_of_ids'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/spi/spi-mxic-uefc.c:983:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     983 | MODULE_DEVICE_TABLE(of, mxic_uefc_of_ids);
         | ^~~~~~~~~~~~~~~~~~~


vim +983 drivers/spi/spi-mxic-uefc.c

   978	
   979	static const struct of_device_id mxic_uefc_spi_of_ids[] = {
   980	    { .compatible = "mxic-uefc,uefc-spi", },
   981	    { /* sentinel */ }
   982	};
 > 983	MODULE_DEVICE_TABLE(of, mxic_uefc_of_ids);
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
