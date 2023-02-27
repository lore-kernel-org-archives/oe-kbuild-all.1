Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA833DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677503624; x=1709039624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPvaZk6JQ5GnQZK/PNgvyhTulUT2+P/nFUgO2abCB5s=;
  b=HKOIFp3X8elNMLCCvP8SCnJGlqm2NpPHd5+3CZixGX9fHi38Tlz+7+pf
   lnztg2npx9S2GWmOpx4lSCkIwrGlzb4O/xfs+5Y/buMS+J9Joswy9pHDw
   /SyCm0WGYHJMUhIoUajzteDaCeodQHsOve2QJd4oxmGi4kKCw0JdHWhTB
   c10/a7rIFEA7Lfphw2BE62suJigAud9MPeDf64Tat1eNd7N4qJa/8BKah
   z4BkiB0hyNY6ujLvuhHRECSStUOa+lSIZ4Cw2btlqy0IymntC8Kg0BVia
   P3eRlzFWWEQJdS+Y5RN/IW8yFegtFnpBo6Gm0JuDWpcct9/rNgX8dOArS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="335334498"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="335334498"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 05:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919331424"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="919331424"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 05:13:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWdK1-0004Qr-25;
	Mon, 27 Feb 2023 13:13:41 +0000
Date: Mon, 27 Feb 2023 21:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 163/583] versioncheck:
 ./sound/soc/bcm/googlevoicehat-codec.c: 27 linux/version.h not needed.
Message-ID: <202302272107.TqCxgz0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: c5abbb8f699bfb53c0cba64c782345a48814b1a7 [163/583] Add support for all the downstream rpi sound card drivers
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272107.TqCxgz0w-lkp@intel.com/

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
   ./drivers/usb/host/dwc_otg/dwc_otg_driver.c: 1772: need linux/version.h
   ./drivers/usb/host/dwc_otg/dwc_otg_hcd.c: 4363: need linux/version.h
   ./drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c: 1262: need linux/version.h
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
>> ./sound/soc/bcm/googlevoicehat-codec.c: 27 linux/version.h not needed.
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
