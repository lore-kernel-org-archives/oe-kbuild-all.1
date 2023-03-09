Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B922F817
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678348036; x=1709884036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k18HhiGZt3YzR7hw6H4WVoixfJZPFZVFqUIxGzo8Q+c=;
  b=LKy8C5KJtjLyXKX8mHKz33N+IGokDNoHhyBD+SH5yKot6xfT7D2vmYMA
   p4ExoTA+7QAQjy8uCJaS8a3yRm3AiZEG/lb0LnD9HLECRsRcQkrx1f8KA
   3tu5zv3ecjFGBLaxZx0Blx80g+xf4aqy4O5Gbqe2Y6tYv/X9702mZYgmB
   YZDiCd8f22aLtmHaG2fabaraHEdt8V/QchemYIOPrz882uy0VlTfY6bDS
   ZxBy0QtaVhddH/LRORkAL5/ugootj4EVjpd67N2qnZ40wiY8mlutf7huG
   ACTqzMrdp2izYwHrDPKWCVvoJDcrU+FmAGxbK8g/QHrrG5KVChuNH1Fil
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="401216042"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="401216042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766333577"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="766333577"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 23:47:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paAza-0002km-0E;
	Thu, 09 Mar 2023 07:47:14 +0000
Date: Thu, 9 Mar 2023 15:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.15/linux 25/38] versioncheck:
 ./drivers/media/platform/intel/ipu6-acpi-common.c: 16 linux/version.h not
 needed.
Message-ID: <202303091505.ktosTqN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2533aa36ba52e96057d68a4ab377a6293b91c1fc
commit: 749d43047fcec4edeff7ac888e732305dab791a3 [25/38] media: i2c: fix allyes build issue
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091505.ktosTqN3-lkp@intel.com/

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
   ./drivers/media/i2c/d4xx.c: 32 linux/version.h not needed.
   ./drivers/media/i2c/hm11b1.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/imx390.c: 15 linux/version.h not needed.
   ./drivers/media/i2c/lt6911uxc.c: 24 linux/version.h not needed.
   ./drivers/media/i2c/ov01a10.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov01a1s.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov02c10.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov8856.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/power_ctrl_logic.c: 9 linux/version.h not needed.
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
>> ./drivers/media/platform/intel/ipu6-acpi-common.c: 16 linux/version.h not needed.
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
