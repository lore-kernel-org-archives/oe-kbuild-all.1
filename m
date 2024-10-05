Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEA8142624
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728121871; cv=none; b=RSpofCBvoWKKITiihdznLQhLoitQZCqPmNsQRMJANzQjZSTvjIWtrMA6j1/dvT3SErK/WLZVxxwv0UfXeI/UfErge6fDLuRNuWInxQVVTICYy1+uQ+AR3PDOOZjsDk7DFz3gwg2c4ViXrAkkjY2cs2p3tJpGvrX+xM8fUH64EIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728121871; c=relaxed/simple;
	bh=0nX2f+tLuKJvFnrAl6Cb7PUrCOmnaaLFzCKs01+tJxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfusqwCCwTdOzkXXvn8+enRjJxj/AU7Gm1+pQenhRUHV7HFady/o+qYxcOnhxOhKUYq0e9wnMU8IgMIW57u/kFIcsmN6fM7dG29mt8gPYUTiq2jWob3UnjbTZJF8jW36NwExW22hxjFEZIAi0VHzOopMpy2ZLg2ATDiq8U//9ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOSZYQeA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOSZYQeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728121870; x=1759657870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nX2f+tLuKJvFnrAl6Cb7PUrCOmnaaLFzCKs01+tJxU=;
  b=gOSZYQeA/2LwfNeN3AlpPci2rlI6O0d5vdFcn9kCwMBVb20xd73/sAab
   kVQ6GtMIZ6PTgcdR3355tEbFz/UiUPqGrVqTZwzfNIDDsyBRFMKrlzUPh
   eGgJ9jEloCMRYZCsVKtqdNclFZwb4GIH2/X6SVvokscLkK7OXeOqP5g7E
   4tIzpMdhKk3AsMJkS5Pc9mPkO6D1+enMiPHVxK7WsNh3JaoCIiuO7towG
   FXqL8kBAzIRgUS/7yTwjgEDTBJBhBAC024bfOCDxrTBH0KWN/kwYx9uV4
   +tX6Xl5WEzwk3GqdlvqZx7WyWezPgGsHR/bL5LBjP/IoyJtxlZ+4KPngy
   w==;
X-CSE-ConnectionGUID: c3B3NF0wTEu2i1ZAOfD8SQ==
X-CSE-MsgGUID: p+9x5lJpRJWCL2W962MzMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37992124"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="37992124"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 02:51:07 -0700
X-CSE-ConnectionGUID: c5ZJjCFrRMCXdlXYCoWZMA==
X-CSE-MsgGUID: ytnzKtRuQJCq8SyYmYDkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75280977"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Oct 2024 02:51:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx1RG-0002pE-2i;
	Sat, 05 Oct 2024 09:51:02 +0000
Date: Sat, 5 Oct 2024 17:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Qiang Yu <Qiang.Yu@amd.com>, Jack Gui <JackGui@amd.com>,
	Anatoli Antonovitch <anatoli.antonovitch@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>, Flora Cui <flora.cui@amd.com>,
	Slava Grigorev <slava.grigorev@amd.com>,
	Yang Xiong <Yang.Xiong@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:amd-6.2 734/3034] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_mn.c: 2 linux/version.h not needed.
Message-ID: <202410051729.ngsEgAkW-lkp@intel.com>
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
commit: 72f77bd97ad4b7b904a01f248ea47b55fc858411 [734/3034] drm/amdkcl: Test whether mmu_notifier_call_srcu() is available
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051729.ngsEgAkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051729.ngsEgAkW-lkp@intel.com/

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
>> ./drivers/gpu/drm/amd/amdkcl/kcl_mn.c: 2 linux/version.h not needed.
   ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
   ./include/kcl/kcl_pci.h: 27 linux/version.h not needed.
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
