Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC596547051
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736095; cv=none; b=X8Te8kTfH/dd2w7sn6SSFxT2xXGnIzV3Uh7E6l2kbd2w50JEpRhEF+mAqBwJq7EKxDrsd7FfhUnbxk7Ws7VJ1LcnjkUoiVmzx34d/A6js/ZmEOEH6+T4CiBV3uypcjJJFhA3L7KrLcFqa+2UCpxUdbned9nVPWiK/y/bP+ZjeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736095; c=relaxed/simple;
	bh=QAmXBmyGdIaJIHcqZ1hIQxGOtsmhNSNv2eh5Vfjb3mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyCfyOoE1EchGi6riao8PkAvZQeKIdu0xpJlAn1G0fFsfxzdcirivXw1rSmJ6HxH4DKaHOGqmQFEcqNPyhqi2NgGB8PjJUlemrmCRG3ybp0z9Ov5CYNNoNKnwbe8HOhhXSTfB7XuGTbcjLkvJCw884am8Q/tdJBtDFShO4YRj80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgxywzR9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgxywzR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789736093; x=1821272093;
  h=date:from:to:cc:subject:message-id;
  bh=QAmXBmyGdIaJIHcqZ1hIQxGOtsmhNSNv2eh5Vfjb3mY=;
  b=WgxywzR9Ru54bVga3+hNNjjp4p5SjMftMSlwxhIcr7zSZ65+l8jn8MhH
   F20GJG6P+NNA1IlQrSQOj+YCRNsPCfeHOMdRBDvfTbvfeLAbtLPyzWkRE
   OSg/GnKyAaOPfteUTnFgqymQcSLtC9maq4ihGe7P46l6yKVNDAxi8ny76
   pvfaXxzomJSlwGg55Ij7o01pjVxjuWuFV1vFZWtfjVpAziziEGwWs3QQF
   LYUAd3irbgyvk0kRNSc+v9Bp7bmRBEd3tAys1WmtGrKoNCKjIjQK1KB5X
   hNq8N/LKeUVjVAX6OmDjgUIRsSiUqhgKpwcWjLjokC5T2oRuY1flk/uuS
   Q==;
X-CSE-ConnectionGUID: lkthnf11SuKnk5dCTxfaRg==
X-CSE-MsgGUID: sPykCD2VS5yg2YX0ec+BgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100901575"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="100901575"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 05:54:53 -0700
X-CSE-ConnectionGUID: QCHxW6sDTjKPJthKh3ZN/Q==
X-CSE-MsgGUID: OuPjc709R9ewWyIDLBe+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2625024"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 05:54:52 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Y72-0000000015c-0BS9;
	Fri, 18 Sep 2026 12:54:44 +0000
Date: Fri, 18 Sep 2026 14:54:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 0/1] htmldocs:
 Warning: mm/cleancache.c references a file that doesn't exist:
 Documentation/vm/cleancache.rst
Message-ID: <202609181450.P60PDpWA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   ce3170e88ddc0c1f321d444eaf0203d2706b7131
commit: 982031a7a2c868aa28f34250596679cd5bbc5a66 [0/1] ANDROID: Revert "mm: remove cleancache"
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260918/202609181450.P60PDpWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181450.P60PDpWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme
--
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
