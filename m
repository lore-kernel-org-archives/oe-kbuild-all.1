Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A7748D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 04:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728101399; cv=none; b=Pnjb0GyvOaOmTf8Z8EysuK/d9JIJKdko6TMFNnFYugyBVJFV/lZQRX2F/CgvlDjluTE9cJ3GbOSHI2fQ7fKqk5B6PGFooibtK5He7iNxeaoCgWu23CXOrkjthswoS8OWD2ThkM6QKtCelSrmbx43rZiSR/yw+w5SLpY+3DD8z38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728101399; c=relaxed/simple;
	bh=Q6+AFm+5kUcmqRIOx6gBARgUe1KRiKYn9ezrXZkPNOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loqBL7Rj4PgN00O/GJl7mbPQ6wz57WsRemtqceUnvfD4+vl4ZvDsLDaf4+TtbiuqGl2zr8+6ECYh9nz5JWMi/0LwCqUj7Fis4nRBGkeUFoyQ++agT3OKit5QfsluqCvS0DgUyFS9TueMBXvTCn+mXb2u95INcd/T6yBOuMMTNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyLgzuC9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyLgzuC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728101397; x=1759637397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6+AFm+5kUcmqRIOx6gBARgUe1KRiKYn9ezrXZkPNOs=;
  b=CyLgzuC9swhyb74Wnrw8jEJLvZQkbThf1JTnzMk0Acajs7noAErEOvsL
   w39Vg+4MWIWpdp2igtPpGKpfpS8LeW7jf1Uo8g8pQVIkrp9Hy74TNyaPY
   L9ppNpURVJXMORXYoDzIpwMwQkCPbDXTOzOGV7GWJejEmtRH1GFZAOO5n
   3ewz/kbxrXPofXjD/j66fJV4I41ILOp/ewV8JItLKe5yWPdlUVqTxJ+n9
   zBTs04xuoQ5zutZj3odgrHFazCHjNSE8fLRGLcS/kNRDUb1Tnte4LxhCd
   /YVqVPyS2urzAxHFPfcw9mgLvHDPWPMsN5xRvLkiTiHPsx8TIV9WSWEKU
   Q==;
X-CSE-ConnectionGUID: bxuxt5lISl6Ck1tlrCW8cg==
X-CSE-MsgGUID: iMnsqVFjSLK48sj5oVWAAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27138225"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27138225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 21:09:57 -0700
X-CSE-ConnectionGUID: R4KbNLCVTESLXPt5n5oG4w==
X-CSE-MsgGUID: qlkk1LkeSemLbAe/aqYoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105746512"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 21:09:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sww76-0002Y8-0A;
	Sat, 05 Oct 2024 04:09:52 +0000
Date: Sat, 5 Oct 2024 12:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Qiang Yu <Qiang.Yu@amd.com>, Flora Cui <flora.cui@amd.com>,
	Chengming Gui <Jack.Gui@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>
Subject: [agd5f:amd-6.2 645/3034] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
Message-ID: <202410051244.Z9N2xy68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-6.2
head:   89450c67d99b47b5c1929a5cd2d8467b6ee686a4
commit: 86c203b45dd328beec514e991bd97fc23b34bea7 [645/3034] drm/amdkcl: add lookpup unexported symbol support
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051244.Z9N2xy68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051244.Z9N2xy68-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 406: need linux/version.h
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
