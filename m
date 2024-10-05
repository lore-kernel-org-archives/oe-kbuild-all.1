Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F697AD58
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 00:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728087650; cv=none; b=ODBXTG+vI+sCztPcXNwsa2iTev01s/xbEAALgzIMxsenfEYHtux0wI25tntLRVbN9+izy17W4mRqmenDkUtTjiJB/wZiRSHdpaYSmGrvV3rIO1oL/dECK2ZRnljqpVQujVB8uXFg+15B1S38EThfc+FADWCRjs7/g4YyMBBHIww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728087650; c=relaxed/simple;
	bh=kEz83TRYgz6fRt4yQ1q687Ri25EwQHuYfT/O+PilJLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mg4ENCrkkQOuYgMiZC8Th/d6t8pvljQNg/cXtsueFjPkqUKVij4S2duQYf2tpTKkBqMtbzHSrky8OFb6sRqF4HfSVGr5lWA2GUIJKEAO2Az2TXMNZhc+R0b6rIbuwXl5x/HjvM+5Mytd5D0aA4z44fcimod5jZJN1Zl7Pq3dv84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcNO2Z9+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcNO2Z9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728087649; x=1759623649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEz83TRYgz6fRt4yQ1q687Ri25EwQHuYfT/O+PilJLc=;
  b=XcNO2Z9+YTz/0nHlFS2FJZFUJn5sRV/qykVT8yV4PTSJyLGmxmUcO/Wn
   wv/kQ/EqTBGf7bkms9tk2N7PMiEjiEuCPDWqvQJH+WUOTg9DJjeq6GHzB
   lZGQHehprZ0Cv/UrzU+peuqJ/NI2h0HP+emP0dm/s3+gWAwFn9Ur6mbxu
   ZHFhdzF/FOuu7pz8wivSaGJjskEGCDPoI5ptfjP585QWhNAwXqI4a4Xyc
   6N4ViBWOroEQnFR2K+eB0nTHBNOG49MDN973fXsTqDBrfzP3vVr7MXYAl
   hmPl1z1ir8aOgsudP21xoF9uGvnFZg+q/ElpcjN5HdIBaRn1hyq0ea6q+
   A==;
X-CSE-ConnectionGUID: nkqIZpWDRsS13JyFPAedWQ==
X-CSE-MsgGUID: ViCBUJUKQuWYQlA/bveOYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="14944336"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="14944336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:20:49 -0700
X-CSE-ConnectionGUID: pPiSVhGURMOJY/TigGpgCA==
X-CSE-MsgGUID: 0+i53GcZSfuYwxVkO7UPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="74692671"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 17:20:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swsXM-0002Me-1K;
	Sat, 05 Oct 2024 00:20:44 +0000
Date: Sat, 5 Oct 2024 08:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Flora Cui <flora.cui@amd.com>, Qiang Yu <Qiang.Yu@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Slava Grigorev <slava.grigorev@amd.com>
Subject: [agd5f:amd-6.2 597/3034] versioncheck:
 ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
Message-ID: <202410050846.RUOnrIiO-lkp@intel.com>
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
commit: 40651d27d11674c9d04cba7f0ab2805d4b46a4bf [597/3034] drm/amdkcl: add backport support for amdgpu
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050846.RUOnrIiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050846.RUOnrIiO-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.74.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
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
