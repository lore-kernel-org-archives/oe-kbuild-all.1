Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DDA2BE043
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777693321; cv=none; b=rp2bq4ZVGHEx9ZsN1jyrprQrA/ceGtZMu2sOetaM2rlckAWnLRDAeNTa5cj9GEZXi0uYe3/VaTlA+g8P4TOsv/ublYrevTiS57hBJC+DM4bwdyOJRovhhUJoLkV5gRfmFAepdP1mthpK30I1jKVznKkrYPJxVzYm79us4SDFF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777693321; c=relaxed/simple;
	bh=+7raraAEaje+OB+R+uHS568RtEJkzuArsDCK2GMWjbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uJt5wVPuOBQQ1sBgm9mhzJ6oPWuCAGLWIOMyv6pR/1nx/NStgaian7BRpzREQhQTidhvi+gjUsEd+nXDrL+xu5dMTOSDS0cWkaHH5QKv9MCqfcm4mNC/oboaKsXqMGk6QPSns3M3IkH2S6L/j1uxKJsW8fK1wxAA/7CAjd/KYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE5I+/uh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE5I+/uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777693320; x=1809229320;
  h=date:from:to:cc:subject:message-id;
  bh=+7raraAEaje+OB+R+uHS568RtEJkzuArsDCK2GMWjbk=;
  b=BE5I+/uhYEF4Wa1dQAu31YUd2UUHdTaIXcDMxmcLiiUScZm/EnnMBUN3
   r9HuVhaRa+iNKXhZ+cU1oesJ40jaRfRnjoV2Q2CDGO6/dQKu1bb0192nD
   q8xkcVEhbwSYE0gpZh4FXZzT1QYm4XZ6VAhb0xYVH+3D6baPQ8HB2ZocL
   cLe5Cc8O77BhsxYpwYKamd90MyqMq/zHiJBQYFRF6ls2T6x5cdSLkhBgG
   xRemBaqvJKWbYNBEXP4hL1CtFwUML5a2nHik3Qg++vmYwnMHMfxhY81xH
   EgeeWBRcPCmsthEKhI/sg4iIp/IZg9u8v8+4OhycCi9p2y1s2lWfEGSJu
   w==;
X-CSE-ConnectionGUID: iMEkFAc1Rt2InO9YrGceog==
X-CSE-MsgGUID: fXRl2BThSgO+Ss4GESro9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78846792"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78846792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 20:41:59 -0700
X-CSE-ConnectionGUID: 9J3CLCawT9OzCV7Q58NQNA==
X-CSE-MsgGUID: 2rQ5b1SvSl+PLAj8cpdg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="240000124"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2026 20:41:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ1Ep-000000005Bh-3LOv;
	Sat, 02 May 2026 03:41:55 +0000
Date: Sat, 02 May 2026 05:41:32 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 versioncheck: ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
Message-ID: <202605020520.U2d7IAEp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
reproduce: (https://download.01.org/0day-ci/archive/20260502/202605020520.U2d7IAEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020520.U2d7IAEp-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 449: need linux/version.h
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
