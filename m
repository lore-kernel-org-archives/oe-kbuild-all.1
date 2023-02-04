Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837921C28
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675493022; x=1707029022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1uAH47nIUiMfntmwnNzB5vLIHHecPpm+mb1vbviqXM=;
  b=FIcL4vDMYB0nPlCKSkeFb2z+Eft/tApeHJICb1FBHrHr3sl0dZdqm5mp
   ooYPJLvk1IfHOLV7OyWB0G8SucgeNuXZR1UJAHv0ZWSdqPkUAzVDtVgo1
   /qaEf68FKTCmh2IXKCl6IK8rK0DgzJ/TYsDfMI3XSYNPdAluGj4zSWouo
   CI4xgUeJr6iHHKiUSlVIZ/KNRcs6pcxexyyvl6TOc532JOnUdGuPtn1IX
   eiMjjbA7zSEgCJwXR+CwAt+Ru66a3djfPM2fqrKOnLq3hI/VWq3oBsVz1
   ZoeplHz+sOSL4/IsDQe6V493nY1Wz25fSq2P27CUGwo8z2+0WUJxbXK+O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="326617880"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="326617880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643501388"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="643501388"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 22:43:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOCGs-00016n-2v;
	Sat, 04 Feb 2023 06:43:34 +0000
Date: Sat, 4 Feb 2023 14:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3770/20208] versioncheck:
 ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
Message-ID: <202302041420.0kMQ6YPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6 [3770/20208] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
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
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
   ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2-dec.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2-enc.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_v4l2/vsi-v4l2.c: 41 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_b0.c: 6665: need linux/version.h
   ./drivers/mxc/vpu_malone/vpu_b0.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_mu.h: 23 linux/version.h not needed.
   ./drivers/mxc/vpu_malone/vpu_pm.h: 23 linux/version.h not needed.
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
