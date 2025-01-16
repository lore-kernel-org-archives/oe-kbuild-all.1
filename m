Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0E12E7F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990397; cv=none; b=Bv3NCuOvk0y1RHGuyLtk4AluwD8pJ3sa+bQ+wm83C5A0Sd/l2t1Wh4CQiFecjBq9r54TxqKnY5g/vGmFAnPHVbYC5E2bEu30RrgZ6graWCo7mGd4yO9amX1/ZOcm5MrcWp8FqOBC7oh2ON/XgbK7w9o5hKX9Ce04C6D/4+w0IF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990397; c=relaxed/simple;
	bh=PrzRuhO78eMlzXuiXFXqETr24m9Y8A3x0PSGnnGAXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1I8Ka1mhPkkRc5MDWYEIvhKK/jkorrQc6vYm/IhglMiLCni6119V08E6I2vkX7/UOgbPL4ihB9CtAE1/XaDUY9rm5GIrGoqJ9YsuFDL4Y8Se/V4lx2HYLcb0NxTtmgMThQIrVnELUJpWvE3eP8PorPPWlZmgpvtExYmqkgG6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQJq9+LY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQJq9+LY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736990393; x=1768526393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrzRuhO78eMlzXuiXFXqETr24m9Y8A3x0PSGnnGAXcs=;
  b=MQJq9+LYlWO1a+N1BnbJp9hZrNE29acxHWspUFOIv92PssHit1X3KdZi
   vUleRamKAXVcccxQ2BrBBaLN41AxTeW07X8Qxd4+x7mlPbHdl/P4mZ2TA
   fwWmYT+8QOVmjaVIFKIan38I2VSd+Tk1u/hYxCAEi7b8pZC56Bepd+Iu2
   6tGr6pv3PBKxXZjAU92Z3YNGte79zd4J0Dwaz7eLP+owv+mcvXD0W1CEB
   fF6DtqkLPCP2PbqPsPA6MlDdUfsZxX8eBL9FlJx4bpNXd2osqe6M+M5Kg
   qQCWTBLYLq1n8tvtMviOVxUde7ztlbrsfHmP73sx542cAyOFVCFIXTYqM
   w==;
X-CSE-ConnectionGUID: Er6U5koBRNy+CpCfUUCPmA==
X-CSE-MsgGUID: iTPC019ISL+peKRgqn7ObA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41287011"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="41287011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 17:19:53 -0800
X-CSE-ConnectionGUID: m0GHXWiwR9GLKKl9O9ftiQ==
X-CSE-MsgGUID: K60LicOsSlyb0GKFgesg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="105901168"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2025 17:19:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYEY1-000R5R-0U;
	Thu, 16 Jan 2025 01:19:49 +0000
Date: Thu, 16 Jan 2025 09:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s'
 directive output may be truncated writing up to 287 bytes into a region of
 size 64
Message-ID: <202501160921.lmlcfVaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piotr,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
commit: 1050713026a08d605b61f039700b67aab646371f i40e: add support for PTP external synchronization clock
date:   3 years, 6 months ago
config: alpha-randconfig-p001-20211207 (https://download.01.org/0day-ci/archive/20250116/202501160921.lmlcfVaU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160921.lmlcfVaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160921.lmlcfVaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/i40e/i40e_ptp.c: In function 'i40e_ptp_init':
>> drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s' directive output may be truncated writing up to 287 bytes into a region of size 64 [-Wformat-truncation=]
    1375 |                          "%s", sdp_desc[i].name);
         |                           ^~
   In function 'i40e_init_pin_config',
       inlined from 'i40e_ptp_create_clock' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1414:13,
       inlined from 'i40e_ptp_init' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1519:8:
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1373:17: note: 'snprintf' output between 1 and 288 bytes into a destination of size 64
    1373 |                 snprintf(pf->ptp_caps.pin_config[i].name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1374 |                          sizeof(pf->ptp_caps.pin_config[i].name),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1375 |                          "%s", sdp_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~


vim +1375 drivers/net/ethernet/intel/i40e/i40e_ptp.c

  1349	
  1350	/**
  1351	 * i40e_init_pin_config - initialize pins.
  1352	 * @pf: private board structure
  1353	 *
  1354	 * Initialize pins for external clock source.
  1355	 * Return 0 on success or error code on failure.
  1356	 **/
  1357	static int i40e_init_pin_config(struct i40e_pf *pf)
  1358	{
  1359		int i;
  1360	
  1361		pf->ptp_caps.n_pins = 3;
  1362		pf->ptp_caps.n_ext_ts = 2;
  1363		pf->ptp_caps.pps = 1;
  1364		pf->ptp_caps.n_per_out = 2;
  1365	
  1366		pf->ptp_caps.pin_config = kcalloc(pf->ptp_caps.n_pins,
  1367						  sizeof(*pf->ptp_caps.pin_config),
  1368						  GFP_KERNEL);
  1369		if (!pf->ptp_caps.pin_config)
  1370			return -ENOMEM;
  1371	
  1372		for (i = 0; i < pf->ptp_caps.n_pins; i++) {
  1373			snprintf(pf->ptp_caps.pin_config[i].name,
  1374				 sizeof(pf->ptp_caps.pin_config[i].name),
> 1375				 "%s", sdp_desc[i].name);
  1376			pf->ptp_caps.pin_config[i].index = sdp_desc[i].index;
  1377			pf->ptp_caps.pin_config[i].func = PTP_PF_NONE;
  1378			pf->ptp_caps.pin_config[i].chan = sdp_desc[i].chan;
  1379		}
  1380	
  1381		pf->ptp_caps.verify = i40e_ptp_verify;
  1382		pf->ptp_caps.enable = i40e_ptp_feature_enable;
  1383	
  1384		pf->ptp_caps.pps = 1;
  1385	
  1386		return 0;
  1387	}
  1388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
