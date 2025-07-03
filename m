Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5282DE6F5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557243; cv=none; b=cr2oHcf16r4LyzUxHtI82f0sno9Xdndg58R1yw5Nq6lKw84Fl/HnJjmA+YJ/x7wZFojCRUDl+UNmhlt3KP7Hmld6qfEaREi1Cang1k596SFk74Z32zlHKUx1G0lgsEfD2gpJ+lQl+XnctTfVuSCunsoiugUPafgL8VPiZvKpYzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557243; c=relaxed/simple;
	bh=vrLOAvfiUp/kzkSjilZb8dPqwx2h+3sq8mNIPPBKUE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxbM+oAEmoZWcF0pWEQnT4D8gIpzkRXRRhjioV0WIcRyaZaNtJrf4bi/vA5PtztLoHWAWtp7ytw7MEokMVORNM2NRxYYmwdddcsMBtYYLxyiXbgR1zgekm84ahgkaTvg1skolxw51K9ClC1ZxA3eFnCOQTTJ8PIZqmit/MdSWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPeHtSD/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPeHtSD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751557241; x=1783093241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrLOAvfiUp/kzkSjilZb8dPqwx2h+3sq8mNIPPBKUE4=;
  b=JPeHtSD/94ZweoX659VljUgetE8qRPOSIZ4jLZ8Lfny2JEtLUavHMxKx
   0oVUSWq0sLSKJumQcsaeazkFKtd5fo0wQ0S1h8Obnzm3lWE3dougXnEOq
   aC1PAdmzNGn8OIrWCsmMdxEHFieOk6UcvI6Hp2dHn+To4sBbkHMbpXIRD
   JeaY6+nqzi4mLVYRplfx+lfZhUzFklQJXnxFFhagJWiCfXEtX7pYesn/9
   x9pXLNZy5/OYghUetxVVivfxnh+Qp+GsSOusqCHibGQ2Kjv1Ry6kjAIVT
   yY6BBIYa8+DnbZnRZQ6k0+xJpcgjl4atT7hGx1MERMNkrbO4NCVclE46i
   Q==;
X-CSE-ConnectionGUID: /KW1yuC2S7OftNIdJ5kSmw==
X-CSE-MsgGUID: gIYybV0hTw+DYH6eZFzfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57562514"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57562514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 08:40:40 -0700
X-CSE-ConnectionGUID: NGwUPgc3Q7WKd4WFwp9utA==
X-CSE-MsgGUID: pZPywMxnQgCnFHetYNH1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154765510"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2025 08:40:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXM3C-0002jv-0o;
	Thu, 03 Jul 2025 15:40:38 +0000
Date: Thu, 3 Jul 2025 23:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Antonino Maniscalco <antomani103@gmail.com>
Subject: [drm-msm:msm-next-robclark 46/52] Warning:
 drivers/gpu/drm/msm/msm_gem_vma.c:174 function parameter 'gpuvm' not
 described in 'msm_gem_vm_unusable'
Message-ID: <202507032334.9SCwc952-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-robclark
head:   62da1a7f66fbaa9304a7e7384a86798d55f2661d
commit: b8774838b7160378a5d73d46e8ec3893390b6262 [46/52] drm/msm: Add VM logging for VM_BIND updates
config: arm-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032334.9SCwc952-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032334.9SCwc952-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032334.9SCwc952-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/msm_gem_vma.c:174 function parameter 'gpuvm' not described in 'msm_gem_vm_unusable'
>> Warning: drivers/gpu/drm/msm/msm_gem_vma.c:174 Excess function parameter 'vm' description in 'msm_gem_vm_unusable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
