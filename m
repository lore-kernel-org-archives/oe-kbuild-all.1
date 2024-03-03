Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823F8B653
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709462810; cv=none; b=qtgzAYWMdS54NLV5rCd6IbWnTJ0QxKS/YK9OxfCvZKVQ0mIN6VDvpv1b2k661bygKtFDDPQKQkJw02XFIRT9mhb5GFETREdlSFXyUBo3pkz9i7wVTLndk31vj5W3EfTyukrOfrMcjtAxfVbiaf6qtA17V4aAmOPPmEGAZDEewHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709462810; c=relaxed/simple;
	bh=PWeGO0T0Cg5owYpCndnAvCvhqQ7D62nuX52KKH1eptI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7hXMS036+oGbXWndlM4eS4U2G36CiHPAigfyySDkq4vFWcAPUDHqBc3diiDu0ed/CxtrVZUtJe+SDEkqkHJaLh8AomNFeFYMhdwSWx/SeZeVsnDpSJU8K7Zw0IKhKdDkK3xlW6etxaWxDGEDVH/rhTIqya1McFPIMhdXZYlJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kk2IkFzu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk2IkFzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709462808; x=1740998808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWeGO0T0Cg5owYpCndnAvCvhqQ7D62nuX52KKH1eptI=;
  b=Kk2IkFzuVRbvFHh+tIMFoQdvnTCbh0VuH6tSnLRlX0Haz29GINutDs9t
   4ZtGc/M7s322JL+dt2wVhFqCZqFCRvy3kQj6JAy6EcKpGvFrwkEwdV7MF
   QbY0CFeJ46kctIqOVcgl/p4gcVdicllitM6jN4fuoIaaP5XXXkYx+xrdy
   JYVAG3KbMveMqI1TWzo+TdQ+M+5/DyVf/oWi+NRVzxdgeKgfuwYvLGmDd
   Jfdxp0DvlaqGZiKrpJaW90s5D7fZfFIyUj+wP1LQlIDWdah/2ce00mcTG
   aAUU9yV7RlUU1M3yXAjFJ6WoUbdSYhJelT9QlBNTMoOQnS9jOgYFOcgFf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3815217"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3815217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 02:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8635850"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2024 02:46:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgjMh-0001iy-33;
	Sun, 03 Mar 2024 10:46:43 +0000
Date: Sun, 3 Mar 2024 18:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6153/27938]
 sound/soc/fsl/fsl_spdif.c:69: warning: Function parameter or member
 'cchannel_192b' not described in 'fsl_spdif_soc_data'
Message-ID: <202403031855.imMM7hPn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 0815c79bdd566f7cf60bd567caf91b5481da9782 [6153/27938] Merge branch 'audio/next' into next
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240303/202403031855.imMM7hPn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031855.imMM7hPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031855.imMM7hPn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_spdif.c:69: warning: Function parameter or member 'cchannel_192b' not described in 'fsl_spdif_soc_data'
   sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'pll8k_clk' not described in 'fsl_spdif_priv'
   sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'pll11k_clk' not described in 'fsl_spdif_priv'
   sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'bypass' not described in 'fsl_spdif_priv'


vim +69 sound/soc/fsl/fsl_spdif.c

a2388a498ad2f85 Nicolin Chen  2013-08-21  47  
f61b9273c347980 Shengjiu Wang 2020-06-17  48  /**
f61b9273c347980 Shengjiu Wang 2020-06-17  49   * struct fsl_spdif_soc_data: soc specific data
f61b9273c347980 Shengjiu Wang 2020-06-17  50   *
f61b9273c347980 Shengjiu Wang 2020-06-17  51   * @imx: for imx platform
f61b9273c347980 Shengjiu Wang 2020-06-17  52   * @shared_root_clock: flag of sharing a clock source with others;
f61b9273c347980 Shengjiu Wang 2020-06-17  53   *                     so the driver shouldn't set root clock rate
604e5178444ea1d Viorel Suman  2021-04-26  54   * @raw_capture_mode: if raw capture mode support
516232e3609f485 Shengjiu Wang 2020-10-15  55   * @interrupts: interrupt number
516232e3609f485 Shengjiu Wang 2020-10-15  56   * @tx_burst: tx maxburst size
516232e3609f485 Shengjiu Wang 2020-10-15  57   * @rx_burst: rx maxburst size
516232e3609f485 Shengjiu Wang 2020-10-15  58   * @tx_formats: tx supported data format
f61b9273c347980 Shengjiu Wang 2020-06-17  59   */
f61b9273c347980 Shengjiu Wang 2020-06-17  60  struct fsl_spdif_soc_data {
f61b9273c347980 Shengjiu Wang 2020-06-17  61  	bool imx;
f61b9273c347980 Shengjiu Wang 2020-06-17  62  	bool shared_root_clock;
604e5178444ea1d Viorel Suman  2021-04-26  63  	bool raw_capture_mode;
f1861edd8d4036e Shengjiu Wang 2021-10-12  64  	bool cchannel_192b;
516232e3609f485 Shengjiu Wang 2020-10-15  65  	u32 interrupts;
516232e3609f485 Shengjiu Wang 2020-10-15  66  	u32 tx_burst;
516232e3609f485 Shengjiu Wang 2020-10-15  67  	u32 rx_burst;
516232e3609f485 Shengjiu Wang 2020-10-15  68  	u64 tx_formats;
f61b9273c347980 Shengjiu Wang 2020-06-17 @69  };
f61b9273c347980 Shengjiu Wang 2020-06-17  70  

:::::: The code at line 69 was first introduced by commit
:::::: f61b9273c347980f570d1f9cecb867a7835c613d ASoC: fsl_spdif: Add support for imx6sx platform

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
