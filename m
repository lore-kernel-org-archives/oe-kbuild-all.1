Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888522;
	b=qANNzSSswdlrJkgdN5ntfKzn0VOaxIcrgTa2KOKWccqFKdHXyqn9DT5u+q9obDslbm6+
	 F2kMH2CcZ0yu7bF1reXwt2kTNLPpN67sYIYnQUjuMuuTNLAlkUcVq9rSNYLp8pHHJb4++
	 TiU2VGw1CH1i+1FGkeohqBSpD/fE1aqyQmZsVxGo2cicX1WI/Dj5/1J/tnxMyX0A8AQup
	 nWWeoeAVc5HCZAEdAzigiaaT69UStTCvoSb5bAVr6ycmk+3WYQ6iUSA1uq/PvM2ufO1yv
	 QDvrP1sXt3D/Bk2YubW/rD11ZhuNHR046fbexofhObgs3rXnRGsJhFIMSPkIRx90JYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=orpkeALbt+XILUXbfRsHazGdPo0++Qa4+hSwe1P4ERA=;
	b=YCldFPZQaYukJ4lDJfWmnUPmYsP+qjuibWAKZ1HKz8Np6tq6pDqqvbTScMdsGHcZH2Di
	 Gnquy3hb57zVuegb3qZ+p2CbiNCJ3QwXVY0VJn4zbmAcRO+TXg7SUSRYpsEoPBKImMoDc
	 jy3FoB7wf5bmRCi9ic5kBdXUD0G1BOtb5u7oh4PfAJleez+OUL3QnD8fe+RAuIRGg5vwq
	 VogsBSaFkcUMW6art7EnD+TifyQ2Oqb4y7gxVyaUMgojqcAMpckrktX9HvabqTNDVdTJh
	 8bHA7Y0DOoWL8TPkZXi3X1CKfLW2Ue62LIoO7H1IpXTGI97y+hhCA2nig8+0FgM8Asg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sv+8dQKU;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A666606A32F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 04:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A666606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sv+8dQKU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794888522; x=1826424522;
  h=date:from:to:cc:subject:message-id;
  bh=8qKbAwgvhR/QaBGnKdlEorNc6/PAeivG3ln47oxuMYo=;
  b=Sv+8dQKUGVzUt3wLSzXNoUXiXa9U7aFDh1CGXj2hDEM+mebdl1uZAWUL
   kWdKMzSYZWt2YdkTzxvqzLLLSSNeGK/m0QIT3wqEG2+9HTOZ5p9A7X+d9
   Gd+2t63TDEwQGGNpCmVt40DCEN7OcT7CsKzwS+nXuGp+PNnqweMdztbgh
   clruokf1HrqeyZrzZJ8oVn4R+qkYwIwb/r1BXmzXkNNL2Ak9X+apnnKHw
   dNXRt0X5Jfw8Zn1JlBXwCwqq9dJMu3RQ6Dnml8dossUtc+NJs9gtu+9Dr
   K6xgErkvV4e1iy1FHPE2yG36exSR9EjdyNKio3SpH+UPTtp2kuUuPvSEo
   Q==;
X-CSE-ConnectionGUID: T5fvKOM5SeqJeG7/QRXY+A==
X-CSE-MsgGUID: q5mHJQXaS5iJGdngJDNTvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3541321"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3541321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 20:08:40 -0800
X-CSE-ConnectionGUID: PhdnKoqVS7yToEUqddEMEQ==
X-CSE-MsgGUID: bZifgtfiRWiIPm6SshnZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9847486"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 20:08:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTAUk-000000002xW-2hJE;
	Tue, 17 Nov 2026 04:08:34 +0000
Date: Tue, 17 Nov 2026 05:08:12 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152] htmldocs:
 Warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c references a
 file that doesn't exist: Documentation/gpu/nova/core/vbios.rst
Message-ID: <202611170530.alvfXK8W-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 4949de7846c5e0ddc0de1567876238370ac1515e [152/152] drm/nouveau/bios: skip the IFR header if present
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261117/202611170530.alvfXK8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170530.alvfXK8W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c references a file that doesn't exist: Documentation/gpu/nova/core/vbios.rst
   Using alabaster theme
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRC' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_A' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_B' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEC1' not described in enum 'dpll_clock_quality_level'
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c references a file that doesn't exist: Documentation/gpu/nova/core/vbios.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
