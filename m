Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F631804A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762046865; cv=none; b=Wym3b6/B/IBG5OAowz2Ym+gecb/1YbB8dxPTHJQYIpPmYFFYxjJPEWHBldt76xSWxNJabB2i5S/SSszYIo5C1JPfVlo+wfV7W3EJ/P+/MXPJ+lnI6c3Caf5xmou3RiuZ7l2f/MSfdmxXFAjHJCfQE92zICZzwFqd4ZJYj+2tqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762046865; c=relaxed/simple;
	bh=Pnbs0vvgtppnwi0mIzvTuZM2zAces6tWmnLhkzrcsNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6801hVH5h62fmQ/vHjHQtUHjdrlSCfMU41XMwA6lHJPEDKr1dMDpSWE/PWhdUDpumMg8BTWxX2C0fU2pUTVZG5C03rxZJERlkplcjkcoDo/A03j+w2PxlePP/kExz0Tou9j5Ven/rPVCS3WLI96xoTBlzIeNa6NHK+PNeL3/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkDCL5Ym; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkDCL5Ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762046863; x=1793582863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pnbs0vvgtppnwi0mIzvTuZM2zAces6tWmnLhkzrcsNw=;
  b=VkDCL5YmxuysEO9c/MYYgFvMPpKX7ZVe5YZjvGj3EeDKUycE6lDBr3D/
   lt5Gj3Wes3Ci9Pv8mqvdfQThj5XNuhh/AbUoPXu1hN5NInvqm5bdMSKbJ
   pUaainQF8cWkNHDsJiwGkex3QP3cLgyLOT3PYAPL7IXkxxrQGACrDo1hG
   t3MUQJeXZw2FKwdcgiC14uQ+OdIpfaBqWBc2A11JOiPDf7F63vsNjQn0E
   45NUv3m2CdBh+qXjCuGcr3EBtInxtyIpa1Hd9pWRjtcbQxq6eOrd6l6MY
   XUHSrlmkDYwU2706CnuDxldsS/IJ7OcwwJjpLweH8us9tEHzfrNNHZJ1Q
   w==;
X-CSE-ConnectionGUID: JmWnNB1ETWSFkcM4GiE5PQ==
X-CSE-MsgGUID: aPwwB/EBSIOsq6IioW4d6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="89629919"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="89629919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 18:27:43 -0700
X-CSE-ConnectionGUID: 2Z5F3CWiQfG4Nqd4k0lUbQ==
X-CSE-MsgGUID: 4fpxL4sPT42cWMAJA/FkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="185830303"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2025 18:27:42 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFMsd-000000001QK-3CS4;
	Sun, 02 Nov 2025 01:27:39 +0000
Date: Sun, 2 Nov 2025 02:27:24 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 1/11] versioncheck:
 ./fs/ntfsplus/inode.h: 15 linux/version.h not needed.
Message-ID: <202511020205.Rl2cAj6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 38bc68f2634daccb0b4884259ba52ca8b4b2c3a4 [1/11] ntfsplus: in-memory, on-disk structures and headers
reproduce: (https://download.01.org/0day-ci/archive/20251102/202511020205.Rl2cAj6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020205.Rl2cAj6B-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./fs/ntfsplus/inode.h: 15 linux/version.h not needed.
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
