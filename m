Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA301872
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 05:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694324126; x=1725860126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnK/gIBCjFDn5TDLtYEQAG3yVoJnKsg/ivyDl1I3LIc=;
  b=ZaPh9LaquG5g9E1iswqx9d9+b8WlHXagiolX3FtMDYitwZH/sDC9ULnQ
   2BnUB8Cp07XHF51mO+g+W7RPfFDGIXeYtJ2M68wjVRvtzh8Dbg7A2+bxb
   aLAs19+Hu0YM8kzGpIFpzr+AirUoLkaW8TtQJ07H74+kyngULMa6d82ik
   QVv3/+BB0ALm6AtZyDttmgy7RwuGLt6Vfhc2YsFShBSwQtYRMlOXMMqbv
   a45Dng2bvCbAVfRK8j6t84OEg8OFjWHgBLzmNHbh2O8eu+xK/CBmnLriF
   flfOK6x3N7MBrYKp3gybcCkro4slYYYQxqG3Ww8Z1zmipZ/p5JD/cgLVL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381688482"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="381688482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 22:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916620219"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="916620219"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2023 22:35:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfD6R-0004So-1Z;
	Sun, 10 Sep 2023 05:35:23 +0000
Date: Sun, 10 Sep 2023 13:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3742/25020] versioncheck:
 ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
Message-ID: <202309101330.twy9Vgjg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 8f7998e7e4752bc33817edd49b77bdad5e569676 [3742/25020] LF-1762-5 mxc: vpu: replace '---help---' in Kconfig files with 'help'
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101330.twy9Vgjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101330.twy9Vgjg-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
>> ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_b0.c: 6965: need linux/version.h
>> ./drivers/mxc/vpu_malone/vpu_b0.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_mu.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_pm.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_windsor/vpu_encoder_mu.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_windsor/vpu_encoder_pm.h: 23 linux/version.h not needed.
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
https://github.com/intel/lkp-tests/wiki
