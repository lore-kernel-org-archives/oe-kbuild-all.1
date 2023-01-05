Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C094EB34
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jan 2023 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672947582; x=1704483582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMu47TEJwFpky0P7Nxnkp3X34jg2IOq+7LmYVxUCxcY=;
  b=msTyOVUdmClEo1EGYuR9lLHc+9s1884jOUdWoG7RJgH/r7m1RfKCFqrn
   5SK7WJoxpHbLlpEMyCxU3caYvqx8ZSDaXhJdnVnArJBFuIDCGcUDdU+Ne
   c+VY1mS4y2Zgd3UtpmeqKPP8wh+R08JacxwqSMcxhDvHs6yw6etLTPZ9w
   3GrV9hZ1rr6gHSE47R/VRP/9T+caT37UPEmao0KJxQ+POCutUUWEz/eAz
   N1mnNUFgr4I1nzK8YsqIRfb4O5bwiILo5Jn4pwgqYmZambdHQwUQiH/pQ
   tdkiUnY+AFy8votCRtzj7C8YhAyr+I4DXZRVhSj1Q8/A/wXxs5SgKCraw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="408560659"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="408560659"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 11:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="779754166"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="779754166"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Jan 2023 11:39:40 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDW5T-0002NN-1B;
	Thu, 05 Jan 2023 19:39:39 +0000
Date: Fri, 6 Jan 2023 03:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.1.x-imx 4423/19702] versioncheck:
 ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 39
 linux/version.h not needed.
Message-ID: <202301060308.KcStumIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.1.x-imx
head:   437f5776f40f2984e94613c7ed9bd81388ec98de
commit: 3f9aacad7d973711cdfbdc9dbbf19f972f39c7d9 [4423/19702] sdk_fman: add LSDK-19.09-V4.14 SDK DPAA FMan files
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j24 ARCH=x86_64 versioncheck
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
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 39 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm_port.c: 40 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: 40 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_sysfs.h: 37 linux/version.h not needed.
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
