Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55657233D9E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417026; cv=none; b=l+ZkutwwLJxDwE8vwJks2web6I24vQzVcjrkoEi/stZcGeeHZuIhi8W2yKo3eCPu55vZ9GsYFmBz+ONxVNwcoStm3KOFrHgGr5mA7iAwMnIgyLIlsnnOhbLkdAGP8MxbkWYVkk4jCzwflBbUv+b3PyTm/o5UmWBKNFTXTTSmGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417026; c=relaxed/simple;
	bh=HyeIxcRz1JU1nfyZdYv3H5TiITP/H7Kv6Bky+3r9CSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLcXIKE4zh3Vxpzbpjqiojps7+8SXXFVaIaDp/dykleOpQ3CXID3PQAgeJWswdT2UlCuPSmbNZdxyEZeHnDkYuunT85onySbYf/evwClo4fubzjE717RggRGDBX/6odkczUhA9kAytzpP2wClou+1BeBVY7x4LFJQyVGxzw8tsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkQMSsaz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkQMSsaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776417026; x=1807953026;
  h=date:from:to:cc:subject:message-id;
  bh=HyeIxcRz1JU1nfyZdYv3H5TiITP/H7Kv6Bky+3r9CSA=;
  b=kkQMSsaz9ZxZYHAehRB7jLmnTxHWcytm+lzYOR2udhYM6Y1PyJxVdQ/X
   YaE+/7iea9bJ6LBDrHQ8XPMOgZbfs1u6Scs7YWDfOngPBHpEWSMJm631V
   7SLSmTDO0QwQiwtgdvlJbAwO2WiogkMwvgJ21cVs2DYm55TPsny5RWGCy
   xGR3mGR4zo7qHDKh8s4RB/h0rPqL20KPFTBUXhknak8A/Ms/nXD3u/bza
   QgknPDyaFAflLoV4RS3u/sL2D7s+FCWKYKNeCWBQCgxQ7uz9P0kYrwAxx
   UT9AQR+8xH6wzFL1UzzoskuN+k/sG+IQVX0xmVUeRlQqXuUhjV1MQqo3B
   A==;
X-CSE-ConnectionGUID: iVj+F+GsTHiZen3BZ8KOYQ==
X-CSE-MsgGUID: h+foaAARQu+OIcP2woqcYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77441024"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77441024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:10:25 -0700
X-CSE-ConnectionGUID: im81rd1rTteHfR+u4gNYFA==
X-CSE-MsgGUID: n5s+iyTmQRKj7gn0NluY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="226637281"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2026 02:10:23 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDfDQ-0000000009t-31NH;
	Fri, 17 Apr 2026 09:10:20 +0000
Date: Fri, 17 Apr 2026 17:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Perry Yuan <perry.yuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>
Subject: [agd5f:amd-staging-drm-next 2390/2412]
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1394:32-44: opportunity for
 str_enabled_disabled(ptl -> enabled)
Message-ID: <202604171728.cFEktgVV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f0181ced20586d4d03c1e3a4bcbd5c8faa27399b
commit: 69bac120a7bb8bcfb8c949f884b9fa7ed920a5d0 [2390/2412] drm/amdgpu: add sysfs for Peak Tops Limiter (PTL)
config: arc-randconfig-r051-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171728.cFEktgVV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171728.cFEktgVV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1394:32-44: opportunity for str_enabled_disabled(ptl -> enabled)

vim +1394 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

  1387	
  1388	static ssize_t ptl_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
  1389	{
  1390		struct drm_device *ddev = dev_get_drvdata(dev);
  1391		struct amdgpu_device *adev = drm_to_adev(ddev);
  1392		struct amdgpu_ptl *ptl = &adev->psp.ptl;
  1393	
> 1394		return sysfs_emit(buf, "%s\n", ptl->enabled ? "enabled" : "disabled");
  1395	}
  1396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
