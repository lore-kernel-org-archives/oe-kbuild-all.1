Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E339ACD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 05:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749470; cv=none; b=mZrMXH9KHpVT4rX7Gwl7QyUmKSjNMxnYkPaadfc2iTyRWEPNK+Ej4a5oIB0Z+p6xXDpYHf8JMf/6MeJT36dGrGXY6WWgOCtdTGxMCuebo8SPOHbP5AZzGY/+xd3CkS6D9U3yDVgB4tGye5uhfLTh+hXxosgP13i55fPTNlcquK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749470; c=relaxed/simple;
	bh=IIKp4ss8FEVY0X+kEkyRDQ0W9mp8xosCSDyDtFugYxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jH4f/Ug0Kf7rtEJFmhAknSkjjIGZntsjWDw6ATfHnYB7yc6YRYTpxQzhkZUS2JGWeB21XBNqES3fZ8U0ugZo35r746t0bS+2XqMXcOeRmquAnuGDLaWTqeanDPlFeqZs7fjtvnkrEboeslRGYlvnOu1ZBheHTrsWZT4dRfJzOlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7I5Np75; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7I5Np75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715749468; x=1747285468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IIKp4ss8FEVY0X+kEkyRDQ0W9mp8xosCSDyDtFugYxQ=;
  b=l7I5Np75e+v5AyMri3NE029G+2KC6OjaBhTZR3FFdyUOut5lMEHhmJFi
   V6X33H9m5GkauISgTXDNn6vPr9zHGuAEqJjr4yS2YQ9Cb4xAoAAzko3fO
   Sc82ed1SRdDoxyTJuQcbAtgIw1twykb6YLJvRS4Oc/QIPYNYjnH9/TIdP
   apMs4ZMM9Yno4zuiGqeqppBjzkVJ5mWBOIGqVG13hhEP5UZ07d6qyBxs1
   cdqMxgZTGSpCt49nWD4K/gUxYkVUwwp3SMPJoitRZO9Psq5mFoJxb9jqx
   I4j9feLZAGClq6SdbEW+Pg4uwDhHzHwn8ZFyMV7jPfIJpZLQCOHxzJ4bu
   Q==;
X-CSE-ConnectionGUID: qryYbVg7TlOJxPw45fuEow==
X-CSE-MsgGUID: qtdFZ93HRoSX2SBiTr4gug==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11893465"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11893465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 22:04:26 -0700
X-CSE-ConnectionGUID: HZS9/nmYQ/aodcyvT/MMkw==
X-CSE-MsgGUID: zq33C2s7T7GaROt/FqEcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="35459402"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2024 22:04:24 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s76oO-000CST-2s;
	Wed, 15 May 2024 05:04:20 +0000
Date: Wed, 15 May 2024 13:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6599/6606] versioncheck:
 ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
Message-ID: <202405151334.cCH2Y2j2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   132fd09d97c8c6bbb390dbe92516ea83e08cd1cc
commit: 0e593db3fec9ea1f08b5b2b37f7c0b7147086858 [6599/6606] newfeature: crypto: tdm: Add Hygon TDM driver
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405151334.cCH2Y2j2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151334.cCH2Y2j2-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-13 CC=gcc-13 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
>> ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./net/toa/toa.h: 7 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
