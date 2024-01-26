Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23998BE7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706248658; cv=none; b=NZmBjIcCQ5x4yr5rFjT9IJCKcwvKwQNf+U3DD9VCSv/qptbxO+RWh6V72dUXUzB0wUs3rvbTmb+P/NDYR1/NrpX7cz9eynT0u2W/XTkoIsA61hD7Eg+w1hkvssY3Fv1jhJo89pmSDWGmQTIJhPkY1xaWnDVeaewS9V4cmys/zOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706248658; c=relaxed/simple;
	bh=TF+C4A4M7xLpdMDvQq5bFg4l4drwc/OMM+vq+4keBuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXb7JA4+it/smZfVg6BEGqRdekRJxjsm7y84SKH9s3ePG0AmumXtBsmh2w8ymqtF9lOfCFI9uRemGGghTsrVbofgalSyhRtJaSIoahKHgki6/WSKZUixChkHY/p/N+VeA9dB2CU4DAu3SBf60EwZxY+30mZd9Xvhf7c/Uejc/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff7qZ3aC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff7qZ3aC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706248657; x=1737784657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TF+C4A4M7xLpdMDvQq5bFg4l4drwc/OMM+vq+4keBuA=;
  b=Ff7qZ3aCqrq+fbeM5Aago0hmhjrnWfOLti6pznMXnDX+UwhZo7pzqbmp
   JQKEW3E77r/5cDmwTW7OBXRig1+T+bS9o4B2SAeO1ivxfJvnQVwo/3vnT
   xz98iVz03HE7uc2RPfYtQhGqdVhx0CQDxkUxhUT6hN0bBKjoCkR+qPEoz
   TgLQ6IZDJMByUdEq5QKkO6bFDXXsuuJzZPx/CbcDLThwy35OQFjxnA0On
   yNJnwQxojfYk5SPhb8teuTwhCLQDmSQQnv56Z9U1MUJLcUEFxafh11T4E
   3YdZd+iFRfyrs/JDH2Gi4ODj6IT3G0du0IhcJnGkd+JGC7c+OzVHIdJSn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9077536"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9077536"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 21:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1118172425"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1118172425"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2024 21:57:33 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTFDX-0000kC-2Q;
	Fri, 26 Jan 2024 05:57:31 +0000
Date: Fri, 26 Jan 2024 13:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: James Schulman <james.schulman@cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: versioncheck: ./sound/soc/codecs/cs42l42.c: 18 linux/version.h not
 needed.
Message-ID: <202401261331.HaHQneXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
commit: 2c394ca79604b404fe60218670ab301ecb758b34 ASoC: Add support for CS42L42 codec
date:   7 years ago
reproduce: (https://download.01.org/0day-ci/archive/20240126/202401261331.HaHQneXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261331.HaHQneXf-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j28 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
   scripts/kconfig/conf  --silentoldconfig Kconfig
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/arm64/kernel/hibernate.c: 25 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 28 linux/version.h not needed.
   ./drivers/block/skd_main.c: 37 linux/version.h not needed.
   ./drivers/firmware/efi/test/efi_test.c: 11 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 33 linux/version.h not needed.
   ./drivers/media/media-device.c: 900: need linux/version.h
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 19 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 34 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 23 linux/version.h not needed.
   ./drivers/mtd/nand/brcmnand/brcmnand.c: 15 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 24 linux/version.h not needed.
   ./drivers/net/ethernet/cavium/liquidio/lio_main.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qed/qed_l2.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qed/qed_ll2.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qed/qed_main.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 9 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 11 linux/version.h not needed.
   ./drivers/net/ethernet/qualcomm/qca_7k.c: 30 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 17 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/staging/greybus/light.c: 15 linux/version.h not needed.
   ./drivers/staging/ks7010/ks_wlan.h: 17 linux/version.h not needed.
   ./drivers/staging/lustre/lustre/include/lustre/lustre_user.h: 48 linux/version.h not needed.
   ./drivers/staging/media/s5p-cec/s5p_cec.c: 25 linux/version.h not needed.
   ./drivers/staging/media/s5p-cec/s5p_cec.h: 25 linux/version.h not needed.
   ./drivers/staging/media/st-cec/stih-cec.c: 19 linux/version.h not needed.
   ./drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c: 40 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 30 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 18 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./samples/mic/mpssd/mpssd.c: 40 linux/version.h not needed.
>> ./sound/soc/codecs/cs42l42.c: 18 linux/version.h not needed.
   ./tools/perf/tests/bpf-script-example.c: 48: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 35: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 50: need linux/version.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
