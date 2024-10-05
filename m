Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592B784A2F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728133693; cv=none; b=Qv1pMNegxS3jcXfKcAV0hg+XSHHqyPqkYCtp4X7f4rFK/hNF0IG9+Gg9HAS49HXyZxyTYO9wGBSqz8pXdh3w6Im49gFqy6J6GdiNOuTCTMnOcIIIi6KfRhNv6XOeHR9kJg9RYa4uyGxvNShl6k8kBn//S/9w2TsCqgkHonPF6nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728133693; c=relaxed/simple;
	bh=3qC1M5RgIKX7z2O6Z2PMh5qyvvbmho+v/2UdQYfk9Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sL0S+LmOkQkncsCKsizc4b+TiycaH0SC8J+Bu7/SIzkNfkoPuoM1STGCBxArxyqBzGhU/20XheItbLnyyazSsp97CosioStuwSVkHZ13igga9ZHkR3UFyduaJeRgu+hwje0jzDol1JkIUMa3F8gR5hoDDsi56MiA8A521a5B258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiNCtClT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiNCtClT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728133692; x=1759669692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qC1M5RgIKX7z2O6Z2PMh5qyvvbmho+v/2UdQYfk9Gw=;
  b=QiNCtClT1k1FD79KhJ18W3+lx9OoQXqwb/KnGNlui7Qy/7P0tEI9G7WL
   u24krG0GmlLEC4paAamAasXqK4hGRayzDEgYzq00UA8mQdtSsfYbGZDjD
   i3523Sa3acQabh5Xv8XNpeFC2DyJ0pEWt0QxjjcMi/yuaYjA/QXD97NQj
   Oe/kVMENsuK2fXtkY0C0BRTahOkJv+A2RlD7Zf/fe5o1ga1OIyUO2rv8T
   BiWpLWQgYzaEtbhYf/dy8kULsGv3siO8Otb9wp+DLoROf/1+0P9RRBBtB
   SO9NXsGCrs/BT4Rvw5xTPS5ef2eHtAXpTyZzwgBb4+gnA1U5gAbZqgAO8
   A==;
X-CSE-ConnectionGUID: bgr6uo9pRdKbZeUfYMytFQ==
X-CSE-MsgGUID: ECLORjEoQYW/xSYmxOU9Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27474897"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27474897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 06:08:11 -0700
X-CSE-ConnectionGUID: ultfrMg3Q5eCi3YIElBfNQ==
X-CSE-MsgGUID: leu5EFMzT4mJCFWngk86YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="78958473"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2024 06:08:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx4Vz-0002xq-0r;
	Sat, 05 Oct 2024 13:08:07 +0000
Date: Sat, 5 Oct 2024 21:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Le Ma <Le.Ma@amd.com>, Yifan Zhang <Yifan1.Zhang@amd.com>
Subject: [agd5f:amd-6.2 928/3034] versioncheck:
 ./include/kcl/kcl_dma_mapping.h: 160: need linux/version.h
Message-ID: <202410052036.NutOiY8z-lkp@intel.com>
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
commit: 4cd652e133c9a0428f95b7640b40576f6c85edb3 [928/3034] drm/amdkcl: fix dma_addressing_limited() not work correctly
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410052036.NutOiY8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052036.NutOiY8z-lkp@intel.com/

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
>> ./include/kcl/kcl_dma_mapping.h: 160: need linux/version.h
   ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
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
