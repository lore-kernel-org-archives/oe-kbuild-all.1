Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986688825
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 02:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729649782; cv=none; b=aIaJWZApe9b6uXxJ1YY+nhB5dBYsBvGntTKHRjlBD1Kdq4RfthNWh8jCqYmV/CZqZS1yTy75lrEVgFDBPEPDgdKshy+28tV6XbMmvz4fb+n/5ob+O6e5v1mnu8mv0JsE9zzYuKgppiglnaY/sriqEZKxl5f5UV1amhbPD3NNlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729649782; c=relaxed/simple;
	bh=Bo3sMSaEUMtmDeRs9LbdvUp20i6VfeJ5M5hs0ZObfE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfhtSuPcgZIDL6Cg1aZ6+/QO8jpoWkJPi3AAmupDs+tdKWvqS7dbMngqgdV/M6Mpo/bkUobT21CcvHF3YeUTO/9/dNshC0pjq9fHJQRd3KsnJn4mPDsC5VHWB1FCXtf9XER5yWWBkAiXOq8WIGUvdZvSZX6Xp4QKOF1qwm1D/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMF98Lgg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMF98Lgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729649781; x=1761185781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bo3sMSaEUMtmDeRs9LbdvUp20i6VfeJ5M5hs0ZObfE0=;
  b=cMF98LggNhsC4MCnJQFQHgwRJMODF5xo3aaXJm2XZnRKacevdrK8iCeM
   bNbgtGeQKF8ouV7vz8teleTk0+70//GPtoglLAXZVLYYwF8ZyelGqNqbg
   nxaa+CD6vfGMjRl/pbV8NXVtMCiUMbAWINkHDA7ZLDe9SFhnHvQbXeDqV
   uAybEM90b2xe4loGBtxON2nShXhTfqjZ2EvKRnawvyipMT2XnRgzoBle4
   riGU+DkqqEwujzZdqGMcbs9Hda0fKBVOD4qdMkRVAVAWdhkR2qURGQJpN
   RCk/x9eXlQ/E3zYLTJfWubiSJNwNcks0sVeWUkU0Jaf5MKkYHR62z01+Z
   g==;
X-CSE-ConnectionGUID: 8BUzUtrNRu+5xr61j2E4rg==
X-CSE-MsgGUID: AcX+H5nzTJmcVZOtkz41Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29113324"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29113324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 19:16:20 -0700
X-CSE-ConnectionGUID: LFGQfhgBRV2dTxwjiAJVjQ==
X-CSE-MsgGUID: 9U2poxMkR/+8Vf5H7ysxow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84870873"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2024 19:16:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Qv2-000UM6-0e;
	Wed, 23 Oct 2024 02:16:16 +0000
Date: Wed, 23 Oct 2024 10:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: [phy:next 56/60] drivers/phy/microchip/sparx5_serdes.c:32:20:
 sparse: sparse: symbol 'sparx5_serdes_tsize' was not declared. Should it be
 static?
Message-ID: <202410231044.toG9YfUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   32f4a76b8e7cedec9f9aedbfc43626536bba8350
commit: c8e4c8b7ea47cb9044c190e6148e994c8e04a34a [56/60] phy: sparx5-serdes: add indirection layer to register macros
config: arm-randconfig-r122-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231044.toG9YfUT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241023/202410231044.toG9YfUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231044.toG9YfUT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/microchip/sparx5_serdes.c:32:20: sparse: sparse: symbol 'sparx5_serdes_tsize' was not declared. Should it be static?

vim +/sparx5_serdes_tsize +32 drivers/phy/microchip/sparx5_serdes.c

    30	
    31	/* Register target sizes */
  > 32	const unsigned int sparx5_serdes_tsize[TSIZE_LAST] = {
    33		[TC_SD10G_LANE] = 12,
    34		[TC_SD_CMU] = 14,
    35		[TC_SD_CMU_CFG] = 14,
    36		[TC_SD_LANE] = 25,
    37	};
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
