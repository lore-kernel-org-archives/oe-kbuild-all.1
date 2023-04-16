Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379810FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681680137; x=1713216137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTMIOJD+ebSEUpVWHengxFGfyDl5H9eW7YDwNA7U4x8=;
  b=huDC5l8KtuTAFqYjo8I60UqH2cq8bQafc4/ihoYRzjXwKp2hlshS+Hci
   ASrVXhsXkf8G2mVpc8qzw5XLE5+5INd/bit/sSofzUMQVi3wRYJpmA0Hh
   CFii1GZYLTOCfqv2WWNGV50LaVDVBFvVEeju21ar27EXJf4SRJSCNQ5AC
   UW/oao4WkniCPK9RFPsWlbpbtafJmMGQT7J683SfAfXU2+t/CFyVxSZmj
   +o5odVuyJYckYLVUqXOlZ6Oxh+CnST5mq+x6B7WfeiBFN4ikVCw377X/3
   5AKLP2fKteGmWdY1OtdkOeVN8CChdNPkA0G1Wb5ZpfeNf2UdyGpBObr9A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="431055948"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="431055948"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 14:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723059839"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="723059839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2023 14:22:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po9p9-000bqx-32;
	Sun, 16 Apr 2023 21:22:15 +0000
Date: Mon, 17 Apr 2023 05:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Ruslan V. Sushko" <ruslan.sushko@zii.aero>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [lunn:v6.3-rc6-net-next-zii 7/14] versioncheck:
 ./drivers/platform/x86/scu.c: 37 linux/version.h not needed.
Message-ID: <202304170551.jnFd3v1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc6-net-next-zii
head:   22f16af6fd80efa023ad3545ae6b1cf34516d51a
commit: 1ffad1170a4ee6d401e6c42631dcc590b2178e76 [7/14] Initial support for SCU platform
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170551.jnFd3v1I-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/platform/x86/scu.c: 37 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 294: need linux/version.h
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
