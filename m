Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077E2DCBF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747974071; cv=none; b=UHy+OzEYRRz78P16SP33b+Np4VaRkXt4FB842AwMwZ8jzsbukAAnlbHjnPm3j3rzyNzw2VlUgmryEjNSX0wsYG1/Rdz7UACHv9nFIy7fpaxbSI3Xed1wkM/cjA87ZsUihWx2n+Say5RmhohfB9F79RlKugJy373a51VbuMrn2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747974071; c=relaxed/simple;
	bh=K6NhS9oEWJ5+Spdg7JE4XG2bBkrUg6/E34jdie2qJEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s41cTVYK/9eBlyUrCQafV5ylVlDC1LIGvRs2T5ipdvlYKekM7nrdBKxnkkcmEFxKg4GGmSqnzSMb+ula4vm45PqQ+aO3HOnu7yTyVmLDaRaqILGIp2i6axUc2XBv5L25eqVCAEdVkX/VTQKWu9Rl445JWiRM/7XZVgooL+Seiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2VTyLdE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2VTyLdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747974069; x=1779510069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6NhS9oEWJ5+Spdg7JE4XG2bBkrUg6/E34jdie2qJEM=;
  b=K2VTyLdEtmjgmrSEr7FSFx91C5sSQMGOaTx5pgCvYHDxs0T2IsUC8Wmm
   HD73H122FO0cXgvyUIisbDfHP70FPL0tiyLJGg5sDQzdp4xQQwMvmKPtL
   O7UEMyHf4XAw4s8pfeUQYsmN7cIJ2iudOPROGSX4/gTqQP+JJWo1+H+02
   uKrPdCXN+LnsoiXKILutWWz8kS3sTj+A9U1ujEdflYs7n9JMfEHZWijqg
   peYwWNA9QIewcJeTJjRkTBBrlcJC7cSWVGSDEtysjeP+pc1CV1+chPMfY
   QWrbi7izRUS8ZlZHPh7+eBfmp5Y1LfWyS2BjnDVuYe3Lrh1OApuT5gp5B
   Q==;
X-CSE-ConnectionGUID: clqm/e+GT++Vw2B5z/IHcQ==
X-CSE-MsgGUID: XoBEq2VyQZGiVh3hL3+SuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49900445"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49900445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:21:08 -0700
X-CSE-ConnectionGUID: 6niGSxeiR26a5Y7NIs4z1Q==
X-CSE-MsgGUID: IhG2arFxTwuOHge/kGZ+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145644038"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 May 2025 21:21:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIJu4-000Q28-3D;
	Fri, 23 May 2025 04:21:04 +0000
Date: Fri, 23 May 2025 12:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] ERROR: modpost:
 "v4l2_m2m_get_vq" [drivers/media/test-drivers/vim2m.ko] undefined!
Message-ID: <202505231242.txTmsvA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   085d10c030cc1153fab89379a096c5e0c83ee102
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [2/2] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm-randconfig-r133-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231242.txTmsvA2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250523/202505231242.txTmsvA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231242.txTmsvA2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "v4l2_m2m_unregister_media_controller" [drivers/media/test-drivers/vim2m.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_get_vq" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_release" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_queue" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_ctx_init" [drivers/media/test-drivers/vim2m.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_copy_metadata" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_init" [drivers/media/test-drivers/vim2m.ko] undefined!
WARNING: modpost: suppressed 14 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
