Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C16FDC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715550162; cv=none; b=YNBGhlLIu38HLRD/9VZIdSZs/FoQ/6MkJGJdEc1MvpPKe7FpvZtrM/wcWHYho8QU0y0MAumrF1L7dsEskLqi8pL5hxpisk+4LvPS5/oi8P6+IHKfYM2452DIJdLVp1Zefg0ctb35HwmfIUWTEHfpIiWWYTLuil4Wt08Yj/w05gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715550162; c=relaxed/simple;
	bh=GegXgwzVJhPkAZSeayDMDHcceGbbQ2PLQmQg3R5SUEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y688EfMJHPUSoJoKLpgy87jcW5vG5IcxtUB7Y75KljhUtjYpFoCzYd5J0cEBNEqR4ZpjgHh3wZByIMUWm/xGpW25yjyYsadk61tqib0pgVM6vk+4o2xHItOViF2eNSO/7PhXatnZsWSbIbsKlT6q77NCOR52ko8xMQL8u34v09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdIbP5rI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdIbP5rI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715550160; x=1747086160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GegXgwzVJhPkAZSeayDMDHcceGbbQ2PLQmQg3R5SUEQ=;
  b=ZdIbP5rIJS3maYjOmGri7qVvj6Z8/DOeIWaM1EoL2Xa6iVj1x+J0tyCS
   bVLBb+DWFTeUaDybvik2zvHQy3eLb97mXmgp0/H2JZsKdt5gdNsWziJrN
   J4gJ/zQQYAh2lKP2DeDFSTRCMTfljLqsQt/heRTm5mEBPqHYpiZw2JPKY
   H6pQQ8SCP3D1jjaHhE3ihou9XFd324sLMM+6zVOOKqk0sYhyoJwuojxf1
   Vh1Xl1n+nhE16WcFsXdmmJrEn5IWB8exd51Cz4GqVnEYBgBU5HRgG92v8
   ItX3EX/+T1m0syn3vOFOjgHqZRkkYqHvEfU+tHRMtIpWS9gMAL7+A5Xyc
   w==;
X-CSE-ConnectionGUID: HniEpaZxQVmY9jiPNPxGSg==
X-CSE-MsgGUID: bJZAiIqBSxmkyzb1dm5lzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="28989301"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="28989301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 14:42:39 -0700
X-CSE-ConnectionGUID: xssJ4sMGSkmDXqfCYNvKPw==
X-CSE-MsgGUID: qr/sHLokQ3ac6l1s3BtUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="30106654"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2024 14:42:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Gxn-00099P-3B;
	Sun, 12 May 2024 21:42:35 +0000
Date: Mon, 13 May 2024 05:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 25/22961] versioncheck:
 ./drivers/misc/hwlat_detector.c: 51 linux/version.h not needed.
Message-ID: <202405130533.k6hOzZe7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   9addf64126a0035adf546b88a6519e544b3c0f16
commit: a16bf8e1849ac581cab474ff35f95174bf282cba [25/22961] hwlatdetect.patch
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405130533.k6hOzZe7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130533.k6hOzZe7-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-compare -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict W=1 --keep-going HOSTCC=gcc-7 CC=gcc-7 -j32 ARCH=x86_64 versioncheck
   scripts/kconfig/conf  --silentoldconfig Kconfig
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./Documentation/mic/mpssd/mpssd.c: 40 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 37 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 33 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 19 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 34 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 23 linux/version.h not needed.
   ./drivers/media/usb/cx231xx/cx231xx-cards.c: 1816: need linux/version.h
   ./drivers/media/usb/dvb-usb-v2/dvb_usb_core.c: 1123: need linux/version.h
   ./drivers/media/usb/dvb-usb/dvb-usb-dvb.c: 341: need linux/version.h
   ./drivers/media/usb/siano/smsusb.c: 717: need linux/version.h
>> ./drivers/misc/hwlat_detector.c: 51 linux/version.h not needed.
   ./drivers/mtd/nand/brcmnand/brcmnand.c: 14 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 24 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/cn66xx_device.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/cn68xx_device.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/lio_ethtool.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/lio_main.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_console.c: 26 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_device.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_droq.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_network.h: 29 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/octeon_nic.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/request_manager.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/response_manager.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qed/qed_l2.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qed/qed_main.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 9 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 11 linux/version.h not needed.
   ./drivers/net/ethernet/qualcomm/qca_7k.c: 30 linux/version.h not needed.
   ./drivers/net/ethernet/synopsys/dwc_eth_qos.c: 49 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 17 linux/version.h not needed.
   ./drivers/net/wireless/mediatek/mt7601u/main.c: 18 linux/version.h not needed.
   ./drivers/staging/sm750fb/sm750_hw.c: 1 linux/version.h not needed.
   ./drivers/staging/wilc1000/linux_wlan.c: 26 linux/version.h not needed.
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
