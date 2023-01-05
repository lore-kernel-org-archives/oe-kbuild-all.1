Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCDE8BE0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jan 2023 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672927511; x=1704463511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rDSJUVNN+tZVCwcYP6J3DsxCBKK3WPS/QEWnynGnhQ=;
  b=PTCiIwTZuK4Udl9HM8M726VMtzV9+//2O7OhJKAJ+kH2jEDEf1luCv//
   lnjuh1MvjV2Wp8+SwSf/LMlCXEGlXY27FIB8qIRUDRBjeVjDbd9/B/vdA
   jKcyX1OtyuxjVKkqgUzeN0KYN3f9+ew6YpWP9YE7EmI9mhpf10DkOfO2A
   yj8kzWJyzzHywIuV1PwT7ks0O6rHTzTCi/PdOdwiQthUDjhmtRaqqNiJy
   m37oS0b48SV1REoK1WP+9EZGxkXtr4jNAIrcVb3gZNvFAQeQPyCD8Wv0s
   ra6BISOu0IoKvriNZflBS8P0qWuM3/TFccOaCP//5fbjN/8oDWp3Na4Nm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="322279550"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="322279550"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 06:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="724070049"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="724070049"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2023 06:05:05 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDQre-0001op-0S;
	Thu, 05 Jan 2023 14:05:02 +0000
Date: Thu, 5 Jan 2023 22:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 22/38] versioncheck:
 ./drivers/media/i2c/d4xx.c: 32 linux/version.h not needed.
Message-ID: <202301052232.P2NilTvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   85a3bdbbdc8610afb39ce136b53d410e7666ed9f
commit: cfb5743695d51c3d275a3646d140336c6e515358 [22/38] media: intel-ipu6: implement new vc solution
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/media/i2c/ar0234.c: 17 linux/version.h not needed.
>> ./drivers/media/i2c/d4xx.c: 32 linux/version.h not needed.
>> ./drivers/media/i2c/hm11b1.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/imx390.c: 15 linux/version.h not needed.
   ./drivers/media/i2c/lt6911uxc.c: 24 linux/version.h not needed.
>> ./drivers/media/i2c/ov01a10.c: 10 linux/version.h not needed.
>> ./drivers/media/i2c/ov01a1s.c: 10 linux/version.h not needed.
>> ./drivers/media/i2c/ov02c10.c: 10 linux/version.h not needed.
>> ./drivers/media/i2c/ov8856.c: 10 linux/version.h not needed.
>> ./drivers/media/i2c/power_ctrl_logic.c: 9 linux/version.h not needed.
   ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
   ./drivers/media/i2c/ti960-des.c: 11 linux/version.h not needed.
   ./drivers/media/i2c/ti964.c: 11 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 227: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
