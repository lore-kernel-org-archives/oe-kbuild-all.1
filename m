Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524081E489
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712598725; cv=none; b=T7dlXcp9UZPQvtl4TV4xRAdboQ0cmbs2r6JH2NpywOAXKyEaelkredxMNbDZPlK/KHtoZvIxCVvFHgiXsVwt8Ltjk9jcbqr34Gm2dXhTJD2MbPmw7hb7LIEz8e39WIANfcjiiaPIUn3IFz3mjZAf5RY6/vdK7xl5gVnSHpOF7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712598725; c=relaxed/simple;
	bh=hXj716UH5X5M29q4UJlmi9i5R+rJ+cK0C+67A8HIdkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sH+v/FU60obDjXig+vro4y8FgpPL8AOq7AquZ4ptB4FadzPviBB3cgjaM75yV2gjj2V0fIyOWS4/dC0uvWirCGNFaLajt11h4fBGnTNsUOTQmac3taTGCj73fRox8Z01tljVYXjJ9Lqbx9FNyYQWD4jdZq6tuo9cLfqKcJp37Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F46Y0PDT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F46Y0PDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712598724; x=1744134724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXj716UH5X5M29q4UJlmi9i5R+rJ+cK0C+67A8HIdkg=;
  b=F46Y0PDTwBnEo1OwOYmbsBLvJksO6kJb4jxwdKbgmRFewiIzL/R20ufg
   SCqiEnsKLQoYM8Ik0EzZQoNQuPbaFBiYh/6bBS2mWzF7l0IdZkjLIilQb
   L0S8rSe3YVVEnFoflBCZueUTq0eRFTA+MlJoqj6UxOc17iAKjgbgmBrzC
   p3Av8oVW3BMtrfPXVPSPUpFX+hJ2uiSjEPnCvnKbe0J436UtIq2uS34+1
   20+6Km5wcurPjmyq0ODAdUozzBYlT9LGDAvWS9tbcKiL7YC4XAgnkzB/g
   xDYxdv1Olk7lKYQtUpBuzOieGlF/9cY5lneLycnzLnHQiqz98cGm8t5Zl
   A==;
X-CSE-ConnectionGUID: vgSCOuEYSrWYjKcDfOiJww==
X-CSE-MsgGUID: 03ce9Q+4Qli8O3Cfi6/3Sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19036281"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19036281"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:52:03 -0700
X-CSE-ConnectionGUID: 7c7LryRqSjiSxVP69I8hkA==
X-CSE-MsgGUID: 3q3lQdJBSvaP6GnmJyvtow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24440878"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2024 10:51:59 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtt9x-0005P8-1U;
	Mon, 08 Apr 2024 17:51:57 +0000
Date: Tue, 9 Apr 2024 01:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4742/4745] versioncheck:
 ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
Message-ID: <202404090115.v2w0qa82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   8f6a5e3290e9f21469c4c1a19720d99ba74574b3
commit: c090427aa9fedae1c25d50678064010926b02de8 [4742/4745] DRM: Phytium display DRM driver
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090115.v2w0qa82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090115.v2w0qa82-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-13 CC=gcc-13 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
>> ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
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
