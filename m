Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568291386DA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728116290; cv=none; b=NbnUvL3QR+byTsc8eIX7+XumRU+DxEI+EaXtWKbY2/JGm8PUwaLdHv/Gjo+JBb6UvvLhprjgdHs4g8MqPI2Ib1hsYnXr1Cvvu1P7Rn3hPxJXk7ZnroTiSNGYjwNulQIw+BU64otiJPGuck+j6XAht1b2eZ6lbzSpB92vTuW2QWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728116290; c=relaxed/simple;
	bh=axyjyANWgavMt3BH+7MSA8ouPmmeFDSYlxDzMHfNU5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQ6j1HVjq0L57tS87+RstFN498pWvfc5uzh/y8aeJ5ROT6K45nc2VIwIoS3t78LmD90v674H7MkPka6w8UsK1Wzu2wqJsg8hIqYOFjVjpBpkVydgrhL2WKik1jm0v0IlDsTUAcYehuVevDHiptFyc5ph8CoLLwiunLFlnAYJsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cfea/tuG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cfea/tuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728116288; x=1759652288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axyjyANWgavMt3BH+7MSA8ouPmmeFDSYlxDzMHfNU5I=;
  b=Cfea/tuGFYaxySbxh0YQoLz+5cNu64ZyTC+j3MdClJPI9EMlmaUx7oNx
   CLR3BC/lHFh5frDnJ3C2cxxEamKxX0DrL6RCE0TH2dWz1UWIZBuTbUtcb
   fIFk3uA/BDcRcVWgEIeNgUB8jXQ/W57eGd7lGpl0xGONXXAmwnCbvNITk
   pXxpqr/xYSH7n5gd0oq0Q0QCALrZRwSOdxtzMp6kSayLxv/8cCX1XtPCc
   rBxrZMPcwsAAlCblENtzIe/B1O6jIFQczFDtvOujiiFr5a9ghOJcNObFP
   ub81dd6mM6dGn3wjvaxw7ngAwUQsIa4AoNt9I5s9TXZKgz3qUjwWbfmgI
   g==;
X-CSE-ConnectionGUID: ODNcTEsoQAqhouAlMWKTRw==
X-CSE-MsgGUID: em/N11h5REKYF217x5KLzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27468903"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27468903"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 01:18:03 -0700
X-CSE-ConnectionGUID: iCVPlTOWRFyEEQy6zO6LHg==
X-CSE-MsgGUID: O5YLfRtST8i8zZAthOI0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74516899"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 01:18:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzzE-0002lM-1M;
	Sat, 05 Oct 2024 08:18:00 +0000
Date: Sat, 5 Oct 2024 16:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yifan Zhang <yifan1.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Asher Song <Asher.Song@amd.com>,
	Flora Cui <flora.cui@amd.com>
Subject: [agd5f:amd-6.2 677/3034] versioncheck: ./include/kcl/kcl_fence.h: 15
 linux/version.h not needed.
Message-ID: <202410051659.IwOQcg5h-lkp@intel.com>
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
commit: be3b2cc85771e75e131821de80bf20ec33fc0cbc [677/3034] drm/amdkcl: add AC_AMDGPU_DMA_FENCE_HEADERS
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051659.IwOQcg5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051659.IwOQcg5h-lkp@intel.com/

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
   ./drivers/gpu/drm/amd/amdkcl/kcl_pci.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/kcl/backport/kcl_pci_backport.h: 6 linux/version.h not needed.
>> ./include/kcl/kcl_fence.h: 15 linux/version.h not needed.
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
