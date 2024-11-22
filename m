Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E61304BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732265595; cv=none; b=Dw81ObYndz7ugAdgrragVm80j7QMdto0XSnCMRvs5y97/E9pGASBPb7syOPAL624PMddvzf+Fz2ibDr/Bk7QnlU4AhsqSwPlWOFRbPxqgddwyFCs7S7qbNH1quN7dJ/OvNxbagLX8iFHwbYx28gI8AMyrKgLbr5aAw2TPlDimOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732265595; c=relaxed/simple;
	bh=INdeDmsWuemB/KN4dkTrVzkgob0ra1EYetdVfAg2Mik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukzR1bsX9Ht+fcM3Ji1WbCpMWcJN6TAXnyanXFRaSYzd1BMtw1HNHfZjnVuO+TXagkRWJcxOxiBV/2UHbJxxQu3IkQ3x9+SH1rQMkkumuIjIcjm5M1l/hbbmjK+0Nc6zW62lcZatRzvcXkXzRZoj/yrAwSjUp8KuRf2NPMauKYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnaENmp4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnaENmp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732265593; x=1763801593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=INdeDmsWuemB/KN4dkTrVzkgob0ra1EYetdVfAg2Mik=;
  b=DnaENmp4U65hNbtuAGXmQL7POOq4owhdl4nuCNr7+oWNxtdU8ijRCB0R
   YzYcuZ35iDEEIwh5/lYBqEGscwM/cHLeB268zsaN4o3YCOstC8Bqoj1C3
   0dz/CqZA0UjYge8j5olBM3sXZ/IIezZNAQ9aWvXYUg+FZZPL9oNE+W3P5
   WZq/VW2L0LYuB/U8w9vFK/+ZrAcm2GlyqXh79NWRoppP7WHMYCUfZ8K0n
   Pok+nZvKd8F3M0m3JVn1S8wMVnmiYzfLwS842dLejEtos5zHQXuUMyu4+
   x1Esoj7rP+1lrXW0nBFLRVeTqqpvuNvP1qPgr/hs79tSGOJ8h/b7RrDww
   g==;
X-CSE-ConnectionGUID: /UlJUjG9TMG34Vthfu6xQw==
X-CSE-MsgGUID: yC6gmVukQj2Vqcm7LVu9Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43480768"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43480768"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 00:53:07 -0800
X-CSE-ConnectionGUID: Pem/+ObvTU6sTu8QP9M9ug==
X-CSE-MsgGUID: ne3dkoSVQU2IZ3aUyhRSPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90317446"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2024 00:53:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEPPS-0003nL-2v;
	Fri, 22 Nov 2024 08:53:02 +0000
Date: Fri, 22 Nov 2024 16:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/6] versioncheck:
 ./drivers/media/v4l2-core/v4l2-loopback.c: 9 linux/version.h not needed.
Message-ID: <202411221621.CGesInWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   6d4e4c8b2c8c3a3cc0af134d62691ef604b7b1d2
commit: 53cbd83d41d0c467b04577ccb6727700e25865ec [6/6] media: v4l2-loopback
reproduce: (https://download.01.org/0day-ci/archive/20241122/202411221621.CGesInWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221621.CGesInWA-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/v4l2-core/v4l2-loopback.c: 9 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
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
