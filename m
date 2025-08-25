Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00902BD5A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756112978; cv=none; b=GjpHTRPnLTFQmp2ibbKNfTXBOl8zbyPXvueg+QBM+fVye/F5FFu3mlkv2dCamSHb8QpVcvMYMyEY0Ii9es4dhrz7hC+d/FO4LsF/l4uVcjTZakz8P+QMwN+C64m7EoCm/wsguFqYho4OYgueWSdBvBDcvpbsFbKkuS+otAbGfI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756112978; c=relaxed/simple;
	bh=0oHECyZVrZpCDLnXjhOLmLx930GWCuIoF5IZZy9+Dvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn3H/FYb7e9vzz8Kbo5joRMKHLowlyp0QEm4/vpt5PLSiOCO+huyJisVxpv7UbDwHK53ugwPDrukQU+p3KBnhU77/1TAKEQp1xDDfIYE8uUaIC1OWOLUgd8aIs7ekHiXwpjAOVLtO6loHrhOC5xIpD/EA23pXkuwOWT3+XflE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFxvHY69; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFxvHY69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756112976; x=1787648976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oHECyZVrZpCDLnXjhOLmLx930GWCuIoF5IZZy9+Dvw=;
  b=eFxvHY69kSF0Adh7WR7ajJX9blk6SOkMi0YHuLxpwX+IaXr3IrIBXUL8
   wGeCOqGzaotpukWY1I6vjS7pst04eRZJLptKfJpDVf7jo07mAntzJ48Yv
   efccU+thaSUBaUXlGXlH36H9+RaoUKygyjmi/IqG7vV5uPptfUT+7mHex
   1gmMHHFRznDTaCnOGc/q+Q0TJFQGhQnnd8p/o0sGmI1GcuIYjuYWYy9Tx
   fp2Qp2/mDqDfhALbV2cQAorE8+BHd/1QzzDT3UlRRIoouwFq/XTAhSeKm
   86sqELaRDV8D9mNPON+ozJbet5pJNndz4KD/CY4r/1zBW/GgX5HN3mLaP
   A==;
X-CSE-ConnectionGUID: 195ukpjDSWy85Ur+rpCH9g==
X-CSE-MsgGUID: btX+9n1ARTyWYPIW6j2PjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58247337"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58247337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:09:36 -0700
X-CSE-ConnectionGUID: Lm81gv5yQcmBsN+6KPE77g==
X-CSE-MsgGUID: vakdMRimS/+gLyurE53VFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200136441"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2025 02:09:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqTCn-000NXj-02;
	Mon, 25 Aug 2025 09:09:33 +0000
Date: Mon, 25 Aug 2025 17:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-v4h 61/64] ERROR: modpost: "drm_debug_classes"
 [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
Message-ID: <202508251721.BR0URm8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-v4h
head:   2f32032bffe62e9db729a4fdce26fb799d6f7302
commit: 02e60097f7e9bc1e34612bfdb35fb231d25bd52e [61/64] drm-dyndbg: temp-clean -WIP
config: i386-buildonly-randconfig-004-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251721.BR0URm8S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251721.BR0URm8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251721.BR0URm8S-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "drm_debug_classes" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
ERROR: modpost: "drm_debug_classes" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
ERROR: modpost: "drm_debug_classes" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
ERROR: modpost: "drm_debug_classes" [drivers/gpu/drm/vkms/vkms.ko] undefined!
>> ERROR: modpost: "drm_debug_classes" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
