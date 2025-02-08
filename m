Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387B2500D0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029460; cv=none; b=a7FPb++j93fKr/UBU1GQDI7PPHgmuQGSE+ISpOO4bSff6kiHRRX/3ybJq8YwzaU3CpCf6N5iBeMjRqqZ/X+3kTWEwTYgiFSGRXdMAepFnkSXx2fEJxkdmB8sWFYfGksdm38Ql1BEQP7Y6pkel5TG41SM1ebcIReXxtAzGMH9WQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029460; c=relaxed/simple;
	bh=ZpMEECqllP5SDZSuEWLGVmXv1701v0vXGG+u3egY5D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hu4zavNg0VVYDY459eWJXTIh7qG/tcaK3oo+TfniMw05Vs6CcFEZdqkwn38jz8S7fM41/uCOJ434DpeVJJ8rLcu8qW9FlqYPvqYCc64iEcmZ8zOPxfpW4i3JzIoR97D+igMY1paLwrSlcez6V0f+eonzXt9+YrWWx2buhwqtVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kc6ViEB1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kc6ViEB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029459; x=1770565459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZpMEECqllP5SDZSuEWLGVmXv1701v0vXGG+u3egY5D4=;
  b=kc6ViEB1Cn/sOaJnN9tlB0F3pQKPnVnQbbEIWJkCJ6M3QY177DUZ446k
   ZirQzF0EmNq7wD3++q5zI+8fKL+DmQKwMDllhx1rbDWs61wFarT6It4Gy
   e3trdvu0wa3DyfW9rN7mFk+EzxnJxp5zq340JEXxO9/+l7I4XJLHscf/T
   DOxxQ3rc2ImgSqJfWfxgzvyIZ1T+14MHwy3VNdSAGcWAqi+yrv/J3ER3z
   OcCkK8WiUE+r0wnAS/2ZDdN5/AmetRfMBY1fvWEuH+M0nQELwRLmXeXXQ
   1OgiNofYTnVoOOw7+Tslizdz2f6fe5PZSUMUo3qixJ0Xjkf/ZjRXPl92h
   Q==;
X-CSE-ConnectionGUID: h24I/QBBTRCcSYQeYb0xgg==
X-CSE-MsgGUID: iQvWxlIDSDuHF6lQ0CTFiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565691"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:16 -0800
X-CSE-ConnectionGUID: U0IfHmbxRnGuoeLtqLyB9g==
X-CSE-MsgGUID: gy60i0DOTJ6gq3m+4H4xEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111619573"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010Dz-29;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: [broonie-sound:for-next 6/13] sound/soc/codecs/cs35l41.c:1166:31:
 error: implicit declaration of function 'acpi_device_hid'; did you mean
 'acpi_device_handle'?
Message-ID: <202502082338.UoPVUCIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   f3a0dfda57f208c90c8c73f3bee2e8390f585b1f
commit: 1d44a30ae3f9195cb4eb7d81bb9ced2776232094 [6/13] ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available
config: arm-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082338.UoPVUCIP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082338.UoPVUCIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082338.UoPVUCIP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l41.c: In function 'cs35l41_acpi_get_name':
>> sound/soc/codecs/cs35l41.c:1166:31: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
    1166 |                         hid = acpi_device_hid(adev);
         |                               ^~~~~~~~~~~~~~~
         |                               acpi_device_handle
>> sound/soc/codecs/cs35l41.c:1166:29: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1166 |                         hid = acpi_device_hid(adev);
         |                             ^


vim +1166 sound/soc/codecs/cs35l41.c

  1150	
  1151	static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
  1152	{
  1153		struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
  1154		acpi_handle handle = acpi_device_handle(adev);
  1155		const char *hid;
  1156		const char *sub;
  1157	
  1158		/* If there is no acpi_device, there is no ACPI for this system, return 0 */
  1159		if (!adev)
  1160			return 0;
  1161	
  1162		sub = acpi_get_subsystem_id(handle);
  1163		if (IS_ERR(sub)) {
  1164			/* If no _SUB, fallback to _HID, otherwise fail */
  1165			if (PTR_ERR(sub) == -ENODATA) {
> 1166				hid = acpi_device_hid(adev);
  1167				/* If dummy hid, return 0 and fallback to legacy firmware path */
  1168				if (!strcmp(hid, "device"))
  1169					return 0;
  1170				sub = kstrdup(hid, GFP_KERNEL);
  1171				if (!sub)
  1172					sub = ERR_PTR(-ENOMEM);
  1173	
  1174			} else
  1175				return PTR_ERR(sub);
  1176		}
  1177	
  1178		cs35l41->dsp.system_name = sub;
  1179		dev_dbg(cs35l41->dev, "Subsystem ID: %s\n", cs35l41->dsp.system_name);
  1180	
  1181		return 0;
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
