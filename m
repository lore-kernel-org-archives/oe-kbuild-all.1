Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27DC8E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723414820; cv=none; b=NxyRBTK9xJ/pqPwl2qKsICSCzzzF2s0yhkhRgEaU58DQFXkYaxTD/RUGXut31XJLnsJlJTgE701Bd8mDdt7y/CSZP7LK/65nLhWvqHkEd89qqPZB9RXXMh0vH+JApF6AyThBb0uut53uBlfHZHpblTrJahqReY5i5nIetiRvsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723414820; c=relaxed/simple;
	bh=z9Hq0b8dkt9WcKdA6nPvpJAxvR9DzNI1I0WbRoBY6w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzyXjiaMnT6wXHKMZ8SaXF4JnkqdXNGqKV1GpBHo1gFmWLNCC/guHqQH2CVZlv3aBQHCKgffiw9CTtVMGzb6RN7BeALaw5pGnp0TBFrrQewf18/BCIIpCzRUUUEilaroWrx5hH/kjf4TCwmr4eIHvR1wA/F6cNqTcK96qFo4LjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxmHYspE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxmHYspE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723414818; x=1754950818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9Hq0b8dkt9WcKdA6nPvpJAxvR9DzNI1I0WbRoBY6w0=;
  b=SxmHYspECWAxCXcQRUCDn3RwW+ysy5YamwjFXyJaafqpm76tnR3wCpTj
   ohXPfpRTdTM8o/QppIW0+X7kk7c/kyTSnY/MBnqy1HuUckSQ52QM429mr
   b3eFdVCpPCBrfWBlqMxc2C3TTs2VSjBWmseoEP45rMb0+HfyPkGZtEreG
   rFFXaGeVGt3qPgfdrV42/tf+/RQapo6QS57AQJ147L34ARBXKukXZBsVl
   6+CUJ/0CMIVPFSf7L6+av92coZlNPlUvleRi5HkhhkVus8e05386sAEs9
   54tlz4hpP07TbR6k0svDbElAN2d7kll9LmS3SQMD/crFyGxEj7IXqBIzs
   g==;
X-CSE-ConnectionGUID: PAj1M70qQGqCgbenDp7FVg==
X-CSE-MsgGUID: vHFC/n8pQa+U8mEHzUP8cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21394084"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21394084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:20:18 -0700
X-CSE-ConnectionGUID: hS9FtRYqQAKXc/yvsI6bjQ==
X-CSE-MsgGUID: Q5qwcTRTQpyBTzigMdLNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="88924226"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2024 15:20:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGv9-000BBz-02;
	Sun, 11 Aug 2024 22:20:15 +0000
Date: Mon, 12 Aug 2024 06:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 35/40] ERROR: modpost: "vb2_dma_contig_memops"
 [drivers/media/platform/vsp1/vsp1.ko] undefined!
Message-ID: <202408120630.rm095RKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   53be161810164d318caa3cfe563e7054f161f1f4
commit: 92672773016c4c2910dabcba5ccba00c7dfdf789 [35/40] drm: renesas: Add RZ/G2L DU Support
config: hexagon-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240812/202408120630.rm095RKG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120630.rm095RKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120630.rm095RKG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vb2_dma_contig_memops" [drivers/media/platform/vsp1/vsp1.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_RENESAS_VSP1
   Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=n] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_V4L2 [=m] && (ARCH_RENESAS || COMPILE_TEST [=y]) && (!ARM64 && !VIDEO_RENESAS_FCP [=n] || VIDEO_RENESAS_FCP [=n])
   Selected by [m]:
   - DRM_RZG2L_DU [=m] && HAS_IOMEM [=y] && (ARCH_RZG2L [=n] || COMPILE_TEST [=y]) && DRM [=m] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
