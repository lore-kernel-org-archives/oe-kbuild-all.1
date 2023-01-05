Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78899EB0F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jan 2023 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672942115; x=1704478115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1ptIxs4C/VheumDuhIWxB2bTXuCuw7TleUVFyoiC2k=;
  b=h77JJseymvjE+5kFiHuG5ghv1mev5zpIX1D6hvhFubIMVBrs+cQsAR+M
   vk2kBR3AYzd+6ToJ/HHzuls32eiS4mqx+La9/K/ifj10xr9tfDufpzoyU
   9MKg/5iHo+e27glWXk1jrDe+Yq/GMU+1baCMd9dNSJj81BKWIIb2apR7y
   bn/mEBlr/Rql/zzHc9ajwvk2OuJoi/3Pcjw8tP85NO00x9bqLxnpHU9JN
   LNe5daPjUdi5Kdf3MVo7+avb1bdqgJumRTXSVT8+YD+LMhHQn7X1t5kV1
   D1zfL+QO0SYoP4z7uNawtokShPgkYf3q0wtJCcKX6Ojo2nEQdd5VTpPgS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="322346559"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="322346559"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 10:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="763233772"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="763233772"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2023 10:08:33 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDUfI-0002F1-34;
	Thu, 05 Jan 2023 18:08:32 +0000
Date: Fri, 6 Jan 2023 02:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.1.x-imx 3662/19702] versioncheck:
 ./drivers/mxc/vpu_malone/vpu_b0.c: 6663: need linux/version.h
Message-ID: <202301060237.CRHMIomZ-lkp@intel.com>
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
commit: 40154c59427a487831b0075c7b81bb6864e93cb6 [3662/19702] vpu: malone decoder: enable mailbox and unify code
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
   ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_b0.c: 6663: need linux/version.h
>> ./drivers/mxc/vpu_malone/vpu_b0.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_mu.h: 23 linux/version.h not needed.
>> ./drivers/mxc/vpu_malone/vpu_pm.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_windsor/vpu_encoder_mu.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_windsor/vpu_encoder_pm.h: 23 linux/version.h not needed.
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
