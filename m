Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3CA19F487
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101764; cv=none; b=CJJi1ZsFU2uMdocBRx/B7M0pZtli3nSrFjGxa+LZmqP7yU5FXFY0DTR9GArTmwypDyubdTOqrhMNmMq26nfylArvd6yGgxNffCoeb+oiu9xRXVKHUIr7v3/9bIlXrA0TYrqd8+dhVHe1S1/nCq+aY6LsxgkkhD7ZDUxYzIN+3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101764; c=relaxed/simple;
	bh=7/N7b/4JmLhQ7RobVxTFhqReIXUHuhZNBYHKtByfRjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/IzqLLXHxyvXj4AuaZCigXfjdL5PDn53IRdiZ0b08glZAzkMwOcIVcZ0bKQ9sqzwFckyp5CzcuEvfT0Bf04W3ffhbH6QzNlb0+crJf8xVAHopLVRp4qvlQ7+EJpCYzN4rkg1bZgCzlPoGWotlj2zqFhErkjoDQ7IBA0jHsVBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHq58fR+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHq58fR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732101762; x=1763637762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/N7b/4JmLhQ7RobVxTFhqReIXUHuhZNBYHKtByfRjg=;
  b=fHq58fR+m3QwuN6c8FGoYSTFbVZqJoHTQvaZiiLYesOb6BiuwbOUzVZH
   59pvQs1gqsJpxe8CvJp6oWKjAxWpeM39Y+ubpIJhTvDt6UVgA1o93JItv
   Nj9k7jDWh0yBIFnHkAvN2xLo1I81seXBmb4unBmrciYrCAt06dMczNhmE
   ezDand+PzZjyW7GTd8q+HdQI88RdjyyPc11zpzIv/fKrQ7pnLMDQ+XzuE
   y93eGYJm8ok4IMMZZ0EdCWoI9B4WwlKLLhVz8LFhs/MjjTZ4TUsehwgz3
   ePD4yIHDIpzQ9GoLKKMbmyrMLzn7g8eEpqdF9FaqK8UHScWHI138cxc7O
   A==;
X-CSE-ConnectionGUID: smPnsLoNQKuVGmxLETtLrA==
X-CSE-MsgGUID: sQWlEEMSSXGYhc249dmb+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32265690"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="32265690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:22:39 -0800
X-CSE-ConnectionGUID: RoqgfcUOTd2aWIVvdnfe1w==
X-CSE-MsgGUID: x2WlC6rARGixUXpxsy/NcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="94950397"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2024 03:22:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDin5-0000ni-2t;
	Wed, 20 Nov 2024 11:22:35 +0000
Date: Wed, 20 Nov 2024 19:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Vyas, Tarun" <tarun.vyas@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: versioncheck: ./drivers/staging/igb_avb/igb_main.c: 10875: need
 linux/version.h
Message-ID: <202411201914.0abZyob8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_q
head:   aff8de868d4e17e98fa8ce0b1b124e54153b574b
commit: 34ea8dc24190e2a6708fa89231618fe2e92702c5 staging: Add AVnu based Intel IGB driver
date:   6 years ago
reproduce: (https://download.01.org/0day-ci/archive/20241120/202411201914.0abZyob8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201914.0abZyob8-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going CROSS_COMPILE=/opt/cross/gcc-14.2.0-nolibc/x86_64-linux/bin/x86_64-linux- CC=clang AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar LD=ld.lld HOSTLD=ld.lld OBJCOPY=llvm-objcopy -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 25 linux/version.h not needed.
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./arch/x86/hyperv/hv_apic.c: 23 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 30 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 16 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 50 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 19 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 56 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 17 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 42 linux/version.h not needed.
   ./drivers/hv/hv.c: 29 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 35 linux/version.h not needed.
   ./drivers/media/dvb-frontends/mxl5xx.c: 30 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 41 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 30 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 23 linux/version.h not needed.
   ./drivers/mtd/nand/raw/brcmnand/brcmnand.c: 15 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 24 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 35 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 32 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 34 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 17 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 18 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 16 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 17 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 18 linux/version.h not needed.
   ./drivers/staging/gasket/gasket_interrupt.c: 12 linux/version.h not needed.
>> ./drivers/staging/igb_avb/igb_main.c: 10875: need linux/version.h
>> ./drivers/staging/igb_avb/kcompat.c: 1977: need linux/version.h
>> ./drivers/staging/igb_avb/kcompat_ethtool.c: 1169: need linux/version.h
   ./drivers/staging/media/bcm2048/radio-bcm2048.c: 35 linux/version.h not needed.
   ./drivers/staging/mt7621-eth/mtk_eth_soc.h: 24 linux/version.h not needed.
   ./drivers/staging/mt7621-mmc/dbg.c: 36 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/staging/vboxvideo/vbox_drv.h: 36 linux/version.h not needed.
   ./drivers/usb/early/xhci-dbc.c: 21 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 30 linux/version.h not needed.
   ./fs/ext4/ext4.h: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 41 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./samples/mic/mpssd/mpssd.c: 40 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 16 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 18 linux/version.h not needed.
   ./tools/perf/include/bpf/bpf.h: 36: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 20: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 46: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h
   ./tools/testing/selftests/bpf/test_tcp_estats.c: 37 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
