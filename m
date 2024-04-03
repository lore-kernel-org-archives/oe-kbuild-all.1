Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A4224FD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113827; cv=none; b=D1Fx4hdFgiL8FRR8NunTAccn2r246uDXGSZd+jvD44DiETn6eCTPnGSsxIes/ycjkA8HzvvqsSavZ3kol1YYEfaIiM/72rfXxnZlWV614Rx3SoUo8KMAjL28MbCFCln0mfTwlnDAbsl1HsjXWSUHCrW0kDGA0EI4rq3kDmOMRBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113827; c=relaxed/simple;
	bh=wCfm/jd4TfVdQSnx+WwsJ6USTfrSeIyCpQDQkIwXKj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N32PUj9IO1PcVfCZJ0jUURa2QzOgbhgBf3rMPy5cIFCc5pmUJlLLaszC2otPdpwr9wBtrHUzv1ghh2cUm5nLvZuTbAnM93ojurBQJjtNIVoT51mT3ZUBRDhLpVvvasEkS9cVRxflAyN5kzMukmu3O3Rwo1AevjrncvgxsMolI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auDRS5it; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auDRS5it"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712113826; x=1743649826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCfm/jd4TfVdQSnx+WwsJ6USTfrSeIyCpQDQkIwXKj0=;
  b=auDRS5itOoIuwM0QMP8LtWA1armRCyWGaKWGEGAEuNA28vR1s0P8evBs
   B7zgPgI+k8NwPd2mSZ9Ie9UbCvDx1lxFLWgkdR+UnW7J6i0pLWwJ3V6yy
   joYv2PG1xBKW/MMDwFyo/edM1pBtd6VE8jkMUBDZjGyaDBcHdIZESEspI
   FJMaAXkBIz+OZp6rgy9YqVE7YVOqxgdzXZoIjJ1cqszEzFoT+uJsVq9Nt
   6VKKdysiQCMJBNIx7d7u87IzPtdBVTh+QwmH6IdSsrRr2wFs3vk527caE
   4ImXm6g4u/YsmqXL3k1Eh/YkBhacNMG485ABl5xnBZSR7JUTRt9v3HfI0
   A==;
X-CSE-ConnectionGUID: etvtqGsnRS+aPljvcL16Gw==
X-CSE-MsgGUID: 97n+WistTZ+MyuxaCsVZeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24819370"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="24819370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 20:10:22 -0700
X-CSE-ConnectionGUID: 6erBVo4WTFCnmiN1HpnMGg==
X-CSE-MsgGUID: b84PCcBtRB+t/mawl+AQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18392259"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2024 20:10:21 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrr10-0001nq-31;
	Wed, 03 Apr 2024 03:10:18 +0000
Date: Wed, 3 Apr 2024 11:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 3057/3220] dcn20_fpu.c:undefined reference to
 `__aeabi_l2d'
Message-ID: <202404031057.VZjwLh8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
commit: bb69ec565409a4f137b0fac0b8f02cedee52cea7 [3057/3220] drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT
config: arm-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20240403/202404031057.VZjwLh8e-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031057.VZjwLh8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031057.VZjwLh8e-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.o: in function `dcn20_populate_dml_pipes_from_context':
>> dcn20_fpu.c:(.text+0x1268): undefined reference to `__aeabi_l2d'
>> arm-linux-gnueabi-ld: dcn20_fpu.c:(.text+0x1280): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: dcn20_fpu.c:(.text+0x1298): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: dcn20_fpu.c:(.text+0x12b0): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o: in function `pipe_ctx_to_e2e_pipe_params':
>> dcn_calcs.c:(.text+0x214): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o:dcn_calcs.c:(.text+0x228): more undefined references to `__aeabi_l2d' follow
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o: in function `optimize_configuration':
>> dml2_wrapper.c:(.text+0x30c): undefined reference to `__aeabi_d2ulz'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.o: in function `populate_dml_plane_cfg_from_plane_state':
>> dml2_translation_helper.c:(.text+0x35c): undefined reference to `__aeabi_l2d'
>> arm-linux-gnueabi-ld: dml2_translation_helper.c:(.text+0x378): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: dml2_translation_helper.c:(.text+0x384): undefined reference to `__aeabi_l2d'
   arm-linux-gnueabi-ld: dml2_translation_helper.c:(.text+0x394): undefined reference to `__aeabi_l2d'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
