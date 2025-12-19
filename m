Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8934EEF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162588; cv=none; b=WEaVmas5vXpNkFW5n9FgC8ruBW9DMfcqIX+4HKkz6V1J6vJJ6XL8DxtSNQGVAaXlPmgEiVAwYBRenerQDnYZ4rlt4rU0k44LqVqrNr0mV6aB/yYoq6QVRsRoznGGIQJ21+eIniL5kXfau32yg5mCy0E56IXtZfokcbNHDe/yFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162588; c=relaxed/simple;
	bh=jmDWK0EpiUmjqmHlYE4mqSkS+/nIiS5VABM5Fn32ElE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D63376D+YuwoIf5PnSns5vEKhdZGRauVaxkztL44ZKRxIn52ubw+ZAWwLh0WVFvCwkQLHgAZVDXe9ZbPNBN7sukQv8yZyepiqqf4CYCvqIFEy3O8wL1a61HXX4dc55CKnX8IpZaDbe8APITaHL+5XBN+GCzow+p5qaRGto74rc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jn6F5Azr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jn6F5Azr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766162586; x=1797698586;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jmDWK0EpiUmjqmHlYE4mqSkS+/nIiS5VABM5Fn32ElE=;
  b=jn6F5Azrl0B0slS1CI5+IhJQld0zDFw7iwIZL21WBkhV/1+eMOuEXUQd
   p/lLHveG98Ia7kccIx0jmVoZbjdz0NdjBEfrwOKoliberZTuWvU7WT06V
   Lo8GBnPxOPkuJJ/7pAmg4GjR7Z1lwQ4y2qaVm+a7WngP05qyB1C894s3m
   8FBhro5NBkhdpaYSSpErBi6tPr2yulUCevahs3qDzmCLw2rHCGt7DKRc+
   1lgTCaMupEgTjO6wHYyeYbHxaiNwQhDKoxnEPUQCuZMuvJIHjvHeT7IFV
   JNZqMrhOgtkxJ6RYc3Qe0glHbbWuh4WZZ4gh8QE9VwX55evrDgJzQx/F2
   Q==;
X-CSE-ConnectionGUID: neu70lMVTuWM0WIpvKsOLQ==
X-CSE-MsgGUID: +QOEmDwFQ6OCf3UQiTZjKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67320593"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="67320593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 08:43:05 -0800
X-CSE-ConnectionGUID: kzwx6J8sSpOlNxi81BiJwQ==
X-CSE-MsgGUID: omJ3VGMcQea4EhM5hubWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199147779"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 08:43:03 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWdZF-000000003kr-0zJO;
	Fri, 19 Dec 2025 16:43:01 +0000
Date: Sat, 20 Dec 2025 00:43:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: xe_lrc.c:undefined reference to `xe_configfs_get_ctx_restore_post_bb'
Message-ID: <202512200124.GXsCEROm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56 drm/xe/lrc: Allow to add user commands on context switch
date:   3 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251220/202512200124.GXsCEROm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200124.GXsCEROm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200124.GXsCEROm-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_check_device'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x2f30): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
>> xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x510): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5cc): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
