Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E01925A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218224; cv=none; b=nW4DM6V6RWI/vhoObWeKp4nJz1GY5Lv5fAtnCPbEw3tesjUYyLUfsSCvU3HaonMzNLE7hN2V0cVbesXhXreCd1YqkGOpVuX9snHE4ysZWczta9CgW/mw8mi65AD9x/xQck6RQPjZM7ewlMYoJLfCNq/zr4Nk2lKUfo3NYZ9ybTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218224; c=relaxed/simple;
	bh=DWc5UfhxMaeT6RhAe4fgWrRCTKI8hjdC8cUboAB0AeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVdHydmyTekEm1MJRizYdv+wF/Om1JGtsSwubDmTAO26Vd8su0bB/QH8dZbwCW93hy5OdBTl3GAB/UJ0mQ00koOuOjiDA4XNGRhFbF3sH3Ek1VbYfyW6XhTrYdhHl1FTkOvIhp8i5/ftUApBJUBTPTEYiYolZls4c0Zl85eFRv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nky9q5sn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nky9q5sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738218224; x=1769754224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWc5UfhxMaeT6RhAe4fgWrRCTKI8hjdC8cUboAB0AeU=;
  b=Nky9q5snuld82DnpxMTSknb0Q1SQjnqiYyV97Yf0G5VR9AlcxetoztFa
   pNFRxI8lszfSjPnUA292Wr5lIaKWnjtJ/bJWF2ihnDzALQrZu+wMwVjbx
   YrmEwRY6DNWcoCV5MSDUajIYTNBTeXIjP/eamzUEn1OiAlBVPZ6yH5TUy
   SAQvvQ09UBsC0mr5ge4GGnxyY4pHgtZqN6b95u/K6BqiTe6ZQ3OyOwCsd
   oLrskwl+bI7d9AaWtlGt1PnVcdQkeFM9HryHs3y2MLHNP4AvCKdv16oxz
   vPs1iO6xLyIseO4M+FwHtrgH4zvTxB76+uHDzpjDTu5lgvb/FUrWdjwAR
   A==;
X-CSE-ConnectionGUID: 15m+w/jBSdWM9ziPkEc6/A==
X-CSE-MsgGUID: ZRrYOclFRx+8Xe+6lsB8rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61225397"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="61225397"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:23:42 -0800
X-CSE-ConnectionGUID: MvTIRGU2S3up+2XoSjRbGA==
X-CSE-MsgGUID: yuST46hOQWm+pNdmpaMo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113853398"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 22:23:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNxj-000jkD-03;
	Thu, 30 Jan 2025 06:23:39 +0000
Date: Thu, 30 Jan 2025 14:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9] htmldocs: Warning:
 drivers/gpu/mediatek/arm/mali/debug/mali_kbase_debug_ktrace.c references a
 file that doesn't exist: Documentation/filesystems/seq_file.txt
Message-ID: <202501301438.8PpAXFGF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu-Che,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   20c6549501f674937409aba5411ee8c5c0ab133a
commit: 3347e43f1763e946c8db116bb3241731d1417cab [9/9] CHROMIUM: gpu/mediatek: Rename midgard to mali
reproduce: (https://download.01.org/0day-ci/archive/20250130/202501301438.8PpAXFGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301438.8PpAXFGF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
   Warning: drivers/gpu/arm/mali/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
>> Warning: drivers/gpu/mediatek/arm/mali/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
