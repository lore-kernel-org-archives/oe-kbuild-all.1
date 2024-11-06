Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A981F8EE0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898271; cv=none; b=hVUdf9lv2GTT7bRCpGuIILUMchA22YxJOJw6aMKOCwWLn/A9+gnzTxZeZyzYrdZuqnSUid6HOH4yJMerxv0ycssMTidwMs5xXSMzeP0WQLXxhVGgQc9kNXfFas3XhK98RHk/Yi/RrbsbIOXAT24B2ZJd7//YcsvfmgtJjwYg2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898271; c=relaxed/simple;
	bh=536n4a0slU6yz/JsUm+aY2O5haEqSbaaPUR8g4vVlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lETRgrry2YtF+u5Q4AtQh4YjWs7ICBskCYFm5qQnHTzIIz+A0Qet0rIoKTzt4vnysYVYS+26pyZtzGssy2pc1BwZyUgrUYbd57iXFpJWvbUVTAMYaZN3RmcrKjQBuj6fAHpbsyMhwZyDkaUs8mlWbSMXZbrdBW0degS1o/20pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dECtIos2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dECtIos2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730898268; x=1762434268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=536n4a0slU6yz/JsUm+aY2O5haEqSbaaPUR8g4vVlrs=;
  b=dECtIos2qT3RmOG7dcUyaNaA7XFopCVHnVVIS4fQemx7jiZtkHcCqJPz
   A4WHEjgeFlTojT7vHdSvVSMWb9riso7JNQWJOuRgiQCQMv93Yf4oZ7c0K
   KWPoAvtV6M9FfhXzzJE+0NPXgMBrNYKNP7pJc/3G5BXEsTACBuQVXJvza
   FjWq3QJs3AYuNHtuOkjGleA533x/z9mkki0S7+ANN8cGzW3AfQ+dBjvvW
   Rctfu7yr8NHh0LTqgN1jspullBFXjg40xsN5o4FwylNBtR03FDP0pAzpp
   xD12kCCBIQOsf3vtUuc03NT5zrKmDN1o1P3kGPMF4UHiXC7FnwrWaRuQf
   g==;
X-CSE-ConnectionGUID: /7B48xpkSvSUlKmcm78oNA==
X-CSE-MsgGUID: qBnze3sVSHmgkT/sdATakA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30122068"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30122068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:04:14 -0800
X-CSE-ConnectionGUID: hemqPnAnQ7OG98L7vnlTgQ==
X-CSE-MsgGUID: B56wh+b3TouVFngpu8cSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84078493"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2024 05:02:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8fgK-000o7w-2s;
	Wed, 06 Nov 2024 13:02:44 +0000
Date: Wed, 6 Nov 2024 21:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:169:60: sparse: sparse:
 non-ANSI function declaration of function
 'amdgpu_amdkfd_gfx_10_0_get_functions'
Message-ID: <202411062131.WZjYqvaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 6bdadb2072243154e6441bfd789dce1fc941976c [1/1] drm/amdgpu: Add navi10 kfd support for amdgpu (v3)
config: x86_64-randconfig-123-20241028 (https://download.01.org/0day-ci/archive/20241106/202411062131.WZjYqvaN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062131.WZjYqvaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062131.WZjYqvaN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:169:60: sparse: sparse: non-ANSI function declaration of function 'amdgpu_amdkfd_gfx_10_0_get_functions'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:433:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:435:17: sparse: sparse: cast removes address space '<asn:1>' of expression

vim +/amdgpu_amdkfd_gfx_10_0_get_functions +169 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c

   168	
 > 169	struct kfd2kgd_calls *amdgpu_amdkfd_gfx_10_0_get_functions()
   170	{
   171		return (struct kfd2kgd_calls *)&kfd2kgd;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
