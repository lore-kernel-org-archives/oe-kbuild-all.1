Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79529A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677501702; x=1709037702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNjnYfbwEi+hbYMZUV6BW4F6EyB/4gjplIulza7w9gA=;
  b=ZbC/jcyCJW39Qol963qUtHZjM30evpv+CMBlSM/MurZ8J2z9LPaJAuoY
   jzW2RlLFiK2pAn/j1gj+oAW6KrA/yaXUGJCmp7hrTMUszsbUpIqoxAwe3
   hrnJ9ORBPZDTX3csuRx0jaES2YUs2ITexjbwm+6DxhmnooKniSLf1jdTr
   s3dkjBKtUn7zuLlptPE+fCx9YySPq8nSc2sXaIzqRCWkKhBbDHbLo3vne
   6MugkhfXlnWmCHxgl8v71FjHI6HMUgZeVnlFv0Aq1hNneCZumf2tSShrc
   GASsuBqZO9bDeAyIK9iLu7ujCwFsDWqa0sK8r2pp6F7LPRuJA9kJhGoNZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="396400638"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="396400638"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 04:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675872335"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="675872335"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 04:41:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWcp2-0004PH-2h;
	Mon, 27 Feb 2023 12:41:40 +0000
Date: Mon, 27 Feb 2023 20:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 145/583] versioncheck:
 ./drivers/usb/host/dwc_otg/dwc_otg_driver.c: 1772: need linux/version.h
Message-ID: <202302272037.jA5jR2aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi popcornmix,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 6683bf57769cfcf2d9187b56b0e81c4ed93767dc [145/583] Add dwc_otg driver
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272037.jA5jR2aa-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j28 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./drivers/usb/host/dwc_otg/dwc_otg_driver.c: 1772: need linux/version.h
>> ./drivers/usb/host/dwc_otg/dwc_otg_hcd.c: 4363: need linux/version.h
>> ./drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c: 1262: need linux/version.h
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
