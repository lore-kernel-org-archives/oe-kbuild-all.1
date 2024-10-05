Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0914EC62
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139277; cv=none; b=d7mmeP2i9h50US5Yn3pLal3oiDisLI90823qXlGex+psNHzkDXJpxRcXfS/BGSVVp85WZJ4yU8FNEl4dLdixxRmEDC2b7Fa3Hi5tGCsohzEZ01fL4OPfTxrBJXwn3lC6gsFZRCY7+CEfar5ssd5AX1tH/0/OliuffzEYOH1aQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139277; c=relaxed/simple;
	bh=f5xfcbn3GbYI/lUU5fINpuOz/DCGKmOn504q0HrQAq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUje4QpA/TjotSkBy3w7ufZq6WrFgdtUOe/IXM576IPQeO72+QZZXPvd4lH6+8dDbK3AprgCXqBQH/Vj0PsORo8MxGKPf8D3W6hp97hAgDoBbZIM6HyT13LimlYN4bZeH6vXEfeS3nVVX3sIFavKQAqvVs6B7S7a3OtbsXe5LLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJB5Erlb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJB5Erlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728139276; x=1759675276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5xfcbn3GbYI/lUU5fINpuOz/DCGKmOn504q0HrQAq0=;
  b=EJB5ErlbCQHaWwUFKTiKIS63HvIDs1qqizXaCNJ8DlAB4A1ZPoYuDWqI
   ZgjscclvWb3J8N0tRqBNzxXKYn+jLfGqgkBq8z12K8FviHrz96vlMBs22
   3Vtt26WS8qNRPsRVZNgiAtvK/ZlDQq/6OdInQ55dkCunG7uFJiPheQ/Hw
   QWV9CGScKjmltfO8GsKPe73rs44bOmT1uyujGpKsv5jYeVHPV1KzTOpmP
   C9e+G5lmWdsMWKj2/RaIvpTYWzkznhGA4atfJQEqQcu7feAYEzXrdnUZb
   ZsoXcoHJEOzGTpRiqy/oaMvqHueHYNFPHuQOHbhxhKlznbY/CcXq1M3//
   w==;
X-CSE-ConnectionGUID: l18ZKp3TS8+BbP0evu2Rjg==
X-CSE-MsgGUID: nwE2J1R6TymDe7KeuxO8pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27222284"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27222284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 07:41:13 -0700
X-CSE-ConnectionGUID: WINWsCv0TvWnPAYapPVciA==
X-CSE-MsgGUID: EmDdXSTURJajF4nyAZXYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75420654"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2024 07:41:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx5y1-00031q-2V;
	Sat, 05 Oct 2024 14:41:09 +0000
Date: Sat, 5 Oct 2024 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Flora Cui <flora.cui@amd.com>
Subject: [agd5f:amd-6.2 959/3034] versioncheck: ./include/kcl/kcl_mn.h: 22:
 need linux/version.h
Message-ID: <202410052237.q7y3BZCY-lkp@intel.com>
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
commit: 9a6cbde2a71f958f927e1b6681bf7e724b18c4c2 [959/3034] drm/amdkcl: Work around mmu_notifier_put issue on RHEL 8.3
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410052237.q7y3BZCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052237.q7y3BZCY-lkp@intel.com/

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
   ./include/kcl/kcl_dma_mapping.h: 160: need linux/version.h
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
>> ./include/kcl/kcl_mn.h: 22: need linux/version.h
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
   ./include/kcl/kcl_rcupdate.h: 6 linux/version.h not needed.
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
