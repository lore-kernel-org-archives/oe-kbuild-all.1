Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02DD42AA9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 04:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784865; cv=none; b=lL8vy0l3rb6uaZEWoAHZ62Bi7cO2Pd8RzfSalRV3Th7ZmYBSZFPExCzcNU/vRr15lEAxHeKgWo/4RpI/RLIbzA/h8E9vNXgyDHj2cZkzYFzYtEJ4OXk2kNx9IRlf2ZwhKLF45TMXr0pcwKeAEcsj011DN8hSSvwwn26yKFdjMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784865; c=relaxed/simple;
	bh=s2cm4hiFmEaR6UNfdbntct21xPKNVWyIIqPHPNNRfAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIDT2MBjjUc2nLVKZs9v2Gij3nC4/kxvPjzaIVoSI3ZgA6OGw7MXPeZ2aY+YxTyL4kKFT7C0BboaZkdxEblR9+jADHxSIQPP+qoC9LLoUwlrZNOfwuziSj83inoF57j1qMBS860KFVNHBK/rwH+WdE0lkpiHQ5WGWHRGH/DTBRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+Woia3r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+Woia3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763784864; x=1795320864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s2cm4hiFmEaR6UNfdbntct21xPKNVWyIIqPHPNNRfAs=;
  b=e+Woia3rKjzVezeptO754nBo3vscsjgjRzmSjTvGsowCfgXPfEJS05mP
   nWOs8OGNBikQE/Gh2PYuj4dJIRguq1FzZET/jXlru+CJwu9kfddEk03JF
   nV38wsDe1O+ReHVRBqW6GDpDmZW5XviCEfUy3ayDP/YQnM5YHJqJcqIYQ
   uMTbsuFvkC3r+5CLzsb7XNcvky9Sda+oHj2017ZsdpG/CHnjPhWyhwD5G
   P9Ft08qAQDHRPKlGprcfH7o717NoPb3FZzovrxT1MT4vcltJV9u0Uktoz
   EvpgCI0mtU/YjmzNYX/YnSMQDorue1D7nk3/pRAyqUtO/KpGQ2XxyLcVK
   g==;
X-CSE-ConnectionGUID: DuNAOIw3QZiFnHyAzdggZg==
X-CSE-MsgGUID: 3p6K/vY2TtGFT1cjDWn1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76561885"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="76561885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 20:14:23 -0800
X-CSE-ConnectionGUID: fETZylXRTCiZ8AWcB78oyQ==
X-CSE-MsgGUID: 7+MgGdjHT1ekpYG1bcywIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192320414"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2025 20:14:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMf0u-00079X-1Q;
	Sat, 22 Nov 2025 04:14:20 +0000
Date: Sat, 22 Nov 2025 12:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2 27/41]
 drivers/mfd/rcar-mfis.c:108:18: sparse: sparse: symbol 'mfis_scp_gen5_info'
 was not declared. Should it be static?
Message-ID: <202511221247.uj6zxMk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2
head:   2b4bb2b272501af9302a01713e7e35ec89d1297a
commit: 2bb4d2c31c3a1ad12b8b360e98b267f171d383dc [27/41] mfd: renesas: Support MFIS driver
config: powerpc-randconfig-r122-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221247.uj6zxMk3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221247.uj6zxMk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221247.uj6zxMk3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/rcar-mfis.c:108:18: sparse: sparse: symbol 'mfis_scp_gen5_info' was not declared. Should it be static?
   drivers/mfd/rcar-mfis.c:125:18: sparse: sparse: symbol 'mfis_gen5_info' was not declared. Should it be static?

vim +/mfis_scp_gen5_info +108 drivers/mfd/rcar-mfis.c

   107	
 > 108	struct mfis_info mfis_scp_gen5_info = {
   109		.subdevs	= mfis_scp_gen5_subdevs,
   110		.num_subdevs	= ARRAY_SIZE(mfis_scp_gen5_subdevs),
   111		.write		= mfis_gen5_write,
   112		.read		= mfis_gen5_read,
   113		.area_size	= 2,
   114	};
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
