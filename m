Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D6800
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 02:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735437636; cv=none; b=MlKNudsjfdr+ASWyDlGYI/8+ghDxLrSKvJn0xAZhpOuUhGdR5G6Hy8if/0svcubg3IlMSs52Ie/oXzL9pYpeDRk5IjIqVRtslpOAdbwYpxhFFlWXmL23GIhIu0XCCq7RMtb3Qx/lAW9oXqqg6HxYe90GcrYWc5fqb5ZUgm4G1Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735437636; c=relaxed/simple;
	bh=jvG8/xS3QgXRcWTQozkGKDPFS8EHIXDFAn9HTcP5Tt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRN5c0IAHhCftKe7rGUuCC2LSy3AI0P3zLd9L0HclWYcKnvoI2/xzW+l9WcT1/UVzGBwcNDgmvcuySerdnPpb7j17RLvNx4I2FbbfiSym3bYvI+0cwJZloVX73Wry/71Kb9dTg9ZT0Au56dEPZU48U32FCmBze8tXZTC16kelcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbzViZW1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbzViZW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735437634; x=1766973634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvG8/xS3QgXRcWTQozkGKDPFS8EHIXDFAn9HTcP5Tt4=;
  b=SbzViZW1Yg+2x97ZoruK493TXJ7MfMB/RpRjVJuNdZ3jz1yrf5KThV0B
   jW+fiaAexdsIoZFxLgUeI9kQBxrS/6OhhRYsDlq2FD94lehegdpLJ0dzn
   4C+LM7uHPTK2m1m3/rQk/3/emweerCBO5KQ+pDUuiiO/LbIwpfwNqX9Em
   o22YKUrPMe4sqcHzACtdiKUzVaQYji28JCEnPe23WY8U+lasvyKTladNl
   QVAv4F+d4U1FWo7SnQ74pX02NbZaJLarMWKyKoi05x9VdhZlQEd6ic15+
   Ma9vdlHpd9+ipvKZlnbGGl3RjjbhKwOFyoPU8PTo8+AzH/CnmDYW1ixsO
   A==;
X-CSE-ConnectionGUID: Rxy3XrHVTyGm6kjy4txS1A==
X-CSE-MsgGUID: JIlIo6VJQsKCJHnRVsHNjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47190639"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="47190639"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 18:00:33 -0800
X-CSE-ConnectionGUID: rr6DNUTbQHCioX2M24gqVw==
X-CSE-MsgGUID: aIkh9j8bQ3qQkcAdiyMU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123748576"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2024 18:00:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRibV-0004Qu-1w;
	Sun, 29 Dec 2024 02:00:29 +0000
Date: Sun, 29 Dec 2024 09:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] platform/x86: acer-wmi: Add helper functions for
 misc gaming settings
Message-ID: <202412290935.PUm8wsCB-lkp@intel.com>
References: <20241229001308.10064-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229001308.10064-1-W_Armin@gmx.de>

Hi Armin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241220]
[cannot apply to linus/master v6.13-rc4 v6.13-rc3 v6.13-rc2 v6.13-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-x86-acer-wmi-Add-helper-functions-for-misc-gaming-settings/20241229-081405
base:   next-20241220
patch link:    https://lore.kernel.org/r/20241229001308.10064-1-W_Armin%40gmx.de
patch subject: [RFC PATCH] platform/x86: acer-wmi: Add helper functions for misc gaming settings
config: x86_64-buildonly-randconfig-002-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290935.PUm8wsCB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290935.PUm8wsCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290935.PUm8wsCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/acer-wmi.c:1618:12: warning: 'WMID_gaming_get_misc_setting' defined but not used [-Wunused-function]
    1618 | static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/acer-wmi.c:1598:12: warning: 'WMID_gaming_set_misc_setting' defined but not used [-Wunused-function]
    1598 | static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/WMID_gaming_get_misc_setting +1618 drivers/platform/x86/acer-wmi.c

  1597	
> 1598	static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 value)
  1599	{
  1600		acpi_status status;
  1601		u64 input = 0;
  1602		u64 result;
  1603	
  1604		input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
  1605		input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value);
  1606	
  1607		status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, input, &result);
  1608		if (ACPI_FAILURE(status))
  1609			return -EIO;
  1610	
  1611		/* The return status must be zero for the operation to have succeeded */
  1612		if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
  1613			return -EIO;
  1614	
  1615		return 0;
  1616	}
  1617	
> 1618	static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 *value)
  1619	{
  1620		u64 input = 0;
  1621		u64 result;
  1622		int ret;
  1623	
  1624		input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
  1625	
  1626		ret = WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETTING_METHODID, input,
  1627						 &result);
  1628		if (ret < 0)
  1629			return ret;
  1630	
  1631		/* The return status must be zero for the operation to have succeeded */
  1632		if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
  1633			return -EIO;
  1634	
  1635		*value = FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result);
  1636	
  1637		return 0;
  1638	}
  1639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
