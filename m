Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB210A18
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728096416; cv=none; b=duDg2q/GgF5Uxdpb9Wlv+nEozI2Xs1vtCBHF2PAW55lwBkZbY7/y8eGqi9EAuHY4tqTO5lzPMbvLfKXdKRFsArGSarRFpT3+AheHZSZsoJCgq6KtLz03X2RRPRWCv48Fn/7eKoXhMffH7Grk8Fc/sRvCTvqcuANhiEQxAIG93dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728096416; c=relaxed/simple;
	bh=sG0q/YV04AOba/dCL40xHCR92wyMRnxNTG9dQMy+1yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rStlj9vKk8Y7hkVw1bAlf4RB5HJriztekPorwtrCCb7L7p0ZgsrSr5tF2eaXl3gtrhXFbNKGAOxSeUNCvMm6SNLlegnt0EXFUG+pdbM8DaQ1dkl9AcnSu/EGfz5ZX/cdLKD+nMcFwfObUAsOwoHTeuXw8qUCJD7NBMYRyd5eZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGXjEvgj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGXjEvgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728096414; x=1759632414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sG0q/YV04AOba/dCL40xHCR92wyMRnxNTG9dQMy+1yU=;
  b=iGXjEvgjW2lRyFcecIVV+Z/CCiQ8lnUv83G2VjxTAIU3Cij7sGHPOnDx
   MHhlGYAj74opddCPxD4YdMZywb5VV2/9m5ggahz899mpodSs74NuJMMMs
   YP9tzrjI4kjNjcDjPnLODTwX4keXUgmKVOxICO/FXfaUtdYeRUKVYeNjY
   MXAN9zAFlbnLG76T7KX0cLSeRNckBmTjfDmTC0xvlbZht4hmpY+4bfMXm
   KePWKH5af2eXep17ajuluplpj4o0wNjCImnB0yxbQqqqgc5i/w18zqG0m
   NFaB3xGw1mRGOcN74vVVIixSlimNf1fS8Qx46LPK6XqigFOaDAjtd5ui2
   A==;
X-CSE-ConnectionGUID: fuA+bWo0QnK0BFz1YvUeXg==
X-CSE-MsgGUID: Y1FqXxXuT6ecUXmHcsXhJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49856499"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="49856499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 19:46:54 -0700
X-CSE-ConnectionGUID: F1wDll+sQ+yTloUxgtXQ0A==
X-CSE-MsgGUID: jOSjBVj+S9OIhYG2vBim1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75012107"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Oct 2024 19:46:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swuoj-0002U2-2K;
	Sat, 05 Oct 2024 02:46:49 +0000
Date: Sat, 5 Oct 2024 10:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Qiang Yu <Qiang.Yu@amd.com>, Flora Cui <flora.cui@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Slava Grigorev <slava.grigorev@amd.com>
Subject: [agd5f:amd-6.2 599/3034] versioncheck:
 ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
Message-ID: <202410051039.LWhlzoRO-lkp@intel.com>
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
commit: a66092b5662c30d98fe68e6282b0ee909e449240 [599/3034] drm/amdkcl: add backport support for ttm
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051039.LWhlzoRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051039.LWhlzoRO-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
>> ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
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
