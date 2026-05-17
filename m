Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C71E54B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778994801; cv=none; b=ArQVLlOPlzPyxathf70J+4e/+lYwiAXklHdeK9W3WLOeC98txd+PWaTLfnBuzISzXE5xPnrw6c3+h7D6L0FhOMPormlaXfiqUqvdKhmOagS0HrW5t4sNGOqhQuVCSOJ/yMX70M2XJ1GdmC68lS01aR3UmrW6+S/mYvSaEM3t6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778994801; c=relaxed/simple;
	bh=NrreUJmMhVo7G49aHntbm9vYheKC7kN4qSsf+o47kg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPdNLyMp5ByU2SEWHlYUynAnATOoTNusoSUfNS+BfYnUv51Ceejz6vUSEhnppivGsB8aaEAj7e3EujZ2wUi31Zj48fSRyxba0mLlOEWnXJh37pNRvbezrYisqZj9/a8Ifh62frzikQbCPRZxWNLcZZTSCCxESPvXAT75VrxSGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOgoTXo6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOgoTXo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778994800; x=1810530800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NrreUJmMhVo7G49aHntbm9vYheKC7kN4qSsf+o47kg0=;
  b=NOgoTXo6TKEFyGAChmJ/1+5n43APU6wqMJPx0zLC50vC9fEbo+US5Edi
   XC8fVY3MI+XoTlWkQw4vkqkDmiVQAHdY2ntu+7002K/w3frgyz+gsc+Lf
   NTq+RXKwni1XSunPIvQrJsXutz0id5OSTY4SdqQnJ+sKTS+3HuSb7DxUC
   tkBK6UPZK7PjBEQd7KlrkSUbKT20ZkxyXJEURFfO7iQK/VzRojnNbQbpY
   v+xO/PsSjOi7jD7CcuWrA7q5bIGvRtegzyrU7QnrR5l1lcGiVaq/9Z6r/
   SRqFdcNtgTVGWG6RL20JN+xowY6aBvlfpHbXD+15loXMRLiovc8T0cjda
   w==;
X-CSE-ConnectionGUID: bVn+j44kQrao2aLSJRS+aQ==
X-CSE-MsgGUID: iBxalcy9TOay1ZEqUAFpPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79931405"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79931405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 22:13:19 -0700
X-CSE-ConnectionGUID: YxTgBYiNQzeVW9Wus7i42g==
X-CSE-MsgGUID: e6csiXYLTB67IPqF+Dngsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="236053818"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 22:13:18 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOToR-000000001NS-2aT4;
	Sun, 17 May 2026 05:13:15 +0000
Date: Sun, 17 May 2026 13:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gilles Risch <gilles.risch@gmail.com>, alexander.deucher@amd.com
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Gilles Risch <gilles.risch@gmail.com>
Subject: Re: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 /
 DCE3.1 systems
Message-ID: <202605171301.73YzX9wA-lkp@intel.com>
References: <20260516185226.3005-1-gilles.risch@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516185226.3005-1-gilles.risch@gmail.com>

Hi Gilles,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gilles-Risch/drm-radeon-fix-eDP-resume-from-suspend-on-iMac11-1-DCE3-1-systems/20260517-025343
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260516185226.3005-1-gilles.risch%40gmail.com
patch subject: [PATCH] drm/radeon: fix eDP resume from suspend on iMac11, 1 / DCE3.1 systems
config: riscv-randconfig-002-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171301.73YzX9wA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171301.73YzX9wA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171301.73YzX9wA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/radeon/atombios_encoders.c: In function 'atombios_set_edp_panel_power':
>> drivers/gpu/drm/radeon/atombios_encoders.c:1386:14: error: implicit declaration of function 'ASIC_IS_DCE31'; did you mean 'ASIC_IS_DCE3'? [-Wimplicit-function-declaration]
    1386 |         if (!ASIC_IS_DCE31(rdev))
         |              ^~~~~~~~~~~~~
         |              ASIC_IS_DCE3


vim +1386 drivers/gpu/drm/radeon/atombios_encoders.c

  1372	
  1373	bool
  1374	atombios_set_edp_panel_power(struct drm_connector *connector, int action)
  1375	{
  1376		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
  1377		struct drm_device *dev = radeon_connector->base.dev;
  1378		struct radeon_device *rdev = dev->dev_private;
  1379		union dig_transmitter_control args;
  1380		int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
  1381		uint8_t frev, crev;
  1382	
  1383		if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
  1384			goto done;
  1385	
> 1386		if (!ASIC_IS_DCE31(rdev))
  1387			goto done;
  1388	
  1389		if ((action != ATOM_TRANSMITTER_ACTION_POWER_ON) &&
  1390		    (action != ATOM_TRANSMITTER_ACTION_POWER_OFF))
  1391			goto done;
  1392	
  1393		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
  1394			goto done;
  1395	
  1396		memset(&args, 0, sizeof(args));
  1397	
  1398		args.v1.ucAction = action;
  1399	
  1400		atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
  1401	
  1402		/* wait for the panel to power up */
  1403		if (action == ATOM_TRANSMITTER_ACTION_POWER_ON) {
  1404			int i;
  1405	
  1406			for (i = 0; i < 300; i++) {
  1407				if (radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
  1408					return true;
  1409				mdelay(1);
  1410			}
  1411			return false;
  1412		}
  1413	done:
  1414		return true;
  1415	}
  1416	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
