Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D73F9C5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728128111; cv=none; b=RYZL8hV+sKaYvhu/lPU3vsTUkVhpZZr1S/udKLQ5skfONPt8nCyabGglafsftAkwLBm2xEbd8Mbws1OIwQ1zZ3iWCfOPNruPMd7aCRHWjsj+pgQAAx5K2aRgq7Z+3+HSgipNcUE0Q5izSWJL78LMzCEMMhRxgvTH8ain1ByhcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728128111; c=relaxed/simple;
	bh=jwLUjgtlg+K80QYAETRgkoWcKcsFDn4M4kxGSXocMUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5+lmE6Enghbq75m/GXDpApACi+ZbpwuHjYv8NWurXGcntQchGppDiD0K6kfZedAZgLVYsOPEGP3PBmIsivpBPtIyJ6xJzdy8SdconrHBnWBnvmF1R0ec5r8lIk9+dc6XBqRQ7hsVu64UF6uHE3XJKg/ZgnnotD34WBLlx7ebNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+AbpmF7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+AbpmF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728128109; x=1759664109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwLUjgtlg+K80QYAETRgkoWcKcsFDn4M4kxGSXocMUw=;
  b=e+AbpmF7GkeyVWMTtx3GSlNntsnNnopfQS2tuGhEpdCzcg6fK7g5SIyh
   hccoJemuVtzRXvDQRSU3JQT9GCTarwIdYXZEiwbpQKqpyK7LTfQ7YTNxM
   kOQB23LheO36qxkKa3ydpxO6sDXDffrqhpWeWGJC2+yBetoE07HrZ3nOJ
   y16U9g3/d5rQXeu3z9L7PoG3eRvlMSWFYdaln4qdfnRwBh10CoRm0f+NB
   GChNJ6iFbN0MQJ+r0O11jRpiICYPtH4e2j1dj0C2O9VO/r8Wpe4GDA35d
   lB51/vVdRaI5Nr1dRVRxPFF8U5+WthLpQUGQvEVYoRumSe2xd+xyCVrKz
   Q==;
X-CSE-ConnectionGUID: 17h1aNizSoenDcB1hC9LYg==
X-CSE-MsgGUID: LnZKcWfHRHC6/x7CD1c44w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="52737564"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="52737564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 04:35:08 -0700
X-CSE-ConnectionGUID: fXf7q8M7Txyn/wK0UK0o2Q==
X-CSE-MsgGUID: ks6sEhHDRYOPqPwmdWZhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="78945908"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2024 04:35:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx33w-0002ts-2s;
	Sat, 05 Oct 2024 11:35:04 +0000
Date: Sat, 5 Oct 2024 19:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Le.Ma" <Le.Ma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Junwei Zhang <Jerry.Zhang@amd.com>, Jack Gui <Jack.Gui@amd.com>,
	Flora Cui <flora.cui@amd.com>
Subject: [agd5f:amd-6.2 747/3034] versioncheck: ./include/kcl/kcl_rcupdate.h:
 6 linux/version.h not needed.
Message-ID: <202410051942.V5mAalX3-lkp@intel.com>
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
commit: 970f45a211b70a6dc4e5c0aa5096ed5318ad95f7 [747/3034] drm/amdkcl: check whether rcu_pointer_handoff is available
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051942.V5mAalX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051942.V5mAalX3-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_mn.c: 2 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
>> ./include/kcl/kcl_rcupdate.h: 6 linux/version.h not needed.
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
