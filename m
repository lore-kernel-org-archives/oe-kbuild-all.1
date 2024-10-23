Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346374C79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 05:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729659630; cv=none; b=K0L5eOJlM0OG4RYMl82pZWcvw8NOTlcN0QqQRi7ftM51QlKFliwdXQcYSsubdXJyGZq5QOLAGXQYCA8XyhI4SY1Z2cepOSFiSW7wXRbmmZS873BiZO56cC6L6ebA1ZYqqVwssFrV93laJtFktST3BnwXofpa/XAaBK7YC6zEh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729659630; c=relaxed/simple;
	bh=SUs7zRCYReUQbQgJo4GOkiFPedtwKMZ8nUOxIAl+4iU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpkOyFAR9l4N9gccBd6iS7BeGGjyK8hN8+HK60LW1vwdiyRLcObs1vUMP47Ah8G1Z4xgBYReLlYlXJsmRnylsX6MyMO9tDBkBtaPBjFqCbi9tgBG9YHWU2WPHBavAAyCdTUlDST7XZ++H+3Nmn9q5DE105iHJxjWkk0w4oDxhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHCzJr7j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHCzJr7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729659628; x=1761195628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUs7zRCYReUQbQgJo4GOkiFPedtwKMZ8nUOxIAl+4iU=;
  b=cHCzJr7jstEMQgYJJWer2Ph44jxNqDPwGI9lVHpqlHPWx1xwvNJi/mYI
   oydp93Rh4hMzPwztG14fK2zYy+GUiJpsMTP2vyDmPqr2oxGg3mp898xAP
   TGa8gNXCexfBswEHisK/Mw1hc+1t1IOsCYAhfxGa4iF8AzfzzaVl+oDDC
   hcCUUMPxCdrfm2aH8T/HMG7L+kdGrdSDg/Em4Bhe6aFrR2LWXwIoby4uj
   vXs3KIUpVWq9jt2eB8UcOIOhU6o6lZIG8nweEUcmaBj90mtk8v4vW10nk
   vmD6bzbVgqv+DGDnfUbMrs4CghlB79gvDYuDboRLL8ZIUtD3gskQtObm9
   A==;
X-CSE-ConnectionGUID: fnhqgfHTTFWA60NwA15Npg==
X-CSE-MsgGUID: pbdKGoOpQouFXVELtZJBbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39805641"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="39805641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:00:27 -0700
X-CSE-ConnectionGUID: VD6ut2rvRgG3Kk2q/CSRrA==
X-CSE-MsgGUID: Bsod7SYfROy+X9+Ge2aofA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="85166610"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2024 22:00:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3TTr-000USH-1F;
	Wed, 23 Oct 2024 05:00:23 +0000
Date: Wed, 23 Oct 2024 13:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: [phy:next 59/60] drivers/phy/microchip/sparx5_serdes.c:41:20:
 sparse: sparse: symbol 'lan969x_serdes_tsize' was not declared. Should it be
 static?
Message-ID: <202410231221.HOdm6gHa-lkp@intel.com>
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
commit: c0a0a7aec1b142e116c61f3d3facc8c80e97bbff [59/60] phy: lan969x-serdes: add support for lan969x serdes driver
config: arm-randconfig-r122-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231221.HOdm6gHa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241023/202410231221.HOdm6gHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231221.HOdm6gHa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/phy/microchip/sparx5_serdes.c:34:20: sparse: sparse: symbol 'sparx5_serdes_tsize' was not declared. Should it be static?
>> drivers/phy/microchip/sparx5_serdes.c:41:20: sparse: sparse: symbol 'lan969x_serdes_tsize' was not declared. Should it be static?

vim +/lan969x_serdes_tsize +41 drivers/phy/microchip/sparx5_serdes.c

    40	
  > 41	const unsigned int lan969x_serdes_tsize[TSIZE_LAST] = {
    42		[TC_SD10G_LANE] = 10,
    43		[TC_SD_CMU] = 6,
    44		[TC_SD_CMU_CFG] = 6,
    45		[TC_SD_LANE] = 10,
    46	};
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
