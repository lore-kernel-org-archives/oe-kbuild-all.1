Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97D1FE451
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770770529; cv=none; b=CGDvaONatpatnOOvTXhFcvVxfDpIGuYB9IaPUchxhw7mCnXGQ+JgCBng+8aOErMeNzA1Nd/d9HaBqFXy79DbfTTgJpJh8aQ4QmX5HDSo0dg1QwqoJuoJJHtrO6GD0bSNs+bcUXU7qN2gUEP6L2dlc2i+zxPJvFfcMJak+8gk2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770770529; c=relaxed/simple;
	bh=nFfcoraVBUungQ2GfDdBN9X5zf+/KAm/HJoCo1bNa8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qIQYC1NFrcqeWMXisOaAgYIhyUy9b+7kbXxCop8+EDnz3GGyrcvC5LPV6uTB/tCRiFC75N33/r7cP/uLiiB8BBRdGOM2S6H3baJrmj3EZNrfdeAYna2jQvfK+umKXSNnnRSGdU+b5nnbrKK9DbKws4cfZ3uKoMuwnF5okmzUW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrPtUPfB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrPtUPfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770770527; x=1802306527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFfcoraVBUungQ2GfDdBN9X5zf+/KAm/HJoCo1bNa8A=;
  b=RrPtUPfB/HzoKxHhJr6TozSc6XxJyjVopgIfYt834wCfvZevDZ/+MvvV
   knkLP/KRj/QTWZ/sO2GS2Oc55FqsFlDL5Z+ZRiWtOzhCOexArTY/C0908
   hS7QDgPlQggqJipy+oCCT2VvCO6ncY4PkT2d15PP+VaIdDP+h8SuC37Xh
   iSSBiWiedjcRIjRF/eZheF7ZXwWEyTqZLTLe1JFFKfdqR1cHlWTJ7R/6a
   IyTdHmb4Jau03z9Uqb6c9AZD99MKfcKUOqI6hSXlzR8xoEdpIZSh63mG1
   EUhvhgbSbgCJxafovAZNnIspQeBIpQiWVhqYxb4YBp97quGUX+DyP3eQD
   g==;
X-CSE-ConnectionGUID: 9dlgRBeYTzinScs+ZLwgpw==
X-CSE-MsgGUID: wL/FPU2bRSKS1O1juqsRpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83281765"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83281765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:42:07 -0800
X-CSE-ConnectionGUID: wyVSHalUSaK3s9tQo+UBfA==
X-CSE-MsgGUID: Bvgh9oaFS/Si9AW3ukFzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249727914"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2026 16:42:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpyIt-00000000pXq-24Jq;
	Wed, 11 Feb 2026 00:42:03 +0000
Date: Wed, 11 Feb 2026 08:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 60/61]
 drivers/accel/ethosu/ethosu_drv.c:26:1: warning: parameter names (without
 types) in function declaration
Message-ID: <202602110833.BAT4ZvrM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   b160ea7e81b14378daf7dc40cd85e1b26ebb6634
commit: 409d5f2c32913392326ac7923364665eca17c1bb [60/61] accel/ethosu: enable drm.debug control
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110833.BAT4ZvrM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110833.BAT4ZvrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110833.BAT4ZvrM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/ethosu/ethosu_drv.c:26:1: warning: data definition has no type or storage class
      26 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:26:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Werror=implicit-int]
>> drivers/accel/ethosu/ethosu_drv.c:26:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +26 drivers/accel/ethosu/ethosu_drv.c

    25	
  > 26	DRM_CLASSMAP_USE(drm_debug_classes);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
