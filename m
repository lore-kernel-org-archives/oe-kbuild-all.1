Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF41A7249
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 23:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742254601; cv=none; b=Eq+F9W3VvEZXV1Z0F6Uz671BI3VFI2kHvKWIR7wohQ9gSkP9yRP8VVlPc2uHSnX5H/pzNuHoVI8/cxYYIMI0KgvOV+Sp2zNY+eBcfIX3PJqwRkAG8AuIjneRaNv+H2hm8KZLDOH1JheboLyUj2ZqH7WxUd7un1bEMWdL6Z492yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742254601; c=relaxed/simple;
	bh=6ZyE6tSnUMEtuF8q3JDtB3fZ17g7DikLXNjyb5xHjWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=APJzfY7K3SbH7awpxSFFLu8ruXinry+e3j8/CuXbGlxFDcL8kWWtCIpS1dgEPVxcXtLmdqBidhhJXdhiNM55YCXSHMdWaoVJtHnsL/pLrGdjCTPF99AHddA7UVbmzymuVYkyweSl/u3/7O4urtDQeN7RVUBob90SvdSe7IiMV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOlrRq0C; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOlrRq0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742254598; x=1773790598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZyE6tSnUMEtuF8q3JDtB3fZ17g7DikLXNjyb5xHjWA=;
  b=nOlrRq0CqeXl+1oOT24Xm0xDDA5N85pcG7k4mKhvRYY8btExnv0poThL
   83e5Wi2YsQBmVv7RvHRM8nxZc0Yv+TWuz1bzgCrS6Y3z+orIgUTCvZ+cp
   uwAK71AdgEiNBTht24jAfHU41jPJtLrYJyeuS0Mk2plzgHUC9l6vErydm
   WHYt9i7hywBTL713pTsGJHcgSBIaKYX4CaA2dngP07ZtTGm1Mep7bKTby
   5OeIW8Nq2pmydNdyokCH34CSLKXZQgu2ONwQGKLaySp43gVzLbS16kSgk
   pinfGNjOJOh9U6Dem7FDS7EkNUOGfIONgtggf42bjbo0+hNfivhWbI1eC
   g==;
X-CSE-ConnectionGUID: eg2j/4nGSyaI9qfxGlkVPA==
X-CSE-MsgGUID: R3S2WzvtQkuP4HZTYct0/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43286252"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="43286252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 16:36:36 -0700
X-CSE-ConnectionGUID: AB0uUV01Tt+gx2xAjIRV2w==
X-CSE-MsgGUID: ciEkYkYlSi2q4bKVD6Ma/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="123037093"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Mar 2025 16:36:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuK0W-000DE7-2H;
	Mon, 17 Mar 2025 23:36:32 +0000
Date: Tue, 18 Mar 2025 07:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 21/21] versioncheck:
 ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not
 needed.
Message-ID: <202503180732.706kAwH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   0e71e11c7c57c6a824d6a2a6d48ef99568a94b3b
commit: 5beb05c06d06e80489ab0fb616cfbc42b94e19e6 [21/21] anolis: drm/yhgch/yhgch-drm: rename inspur-drm to yhgch-drm
reproduce: (https://download.01.org/0day-ci/archive/20250318/202503180732.706kAwH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180732.706kAwH8-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
>> ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-ethtool.c: 1114: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: 6256: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: 2329: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-os.h: 27 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
