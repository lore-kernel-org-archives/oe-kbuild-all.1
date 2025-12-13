Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A5146A66
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765652621; cv=none; b=sfb+p2ZoziC+6Rr55s+zo6KQYfigaNjqJSgq5nxLR1bGg2rthL3iuqn4vnHxlcueSt97IvNDgKaicI7Xip8GDHBgJM/wcWnGoAh7NIIVh10mViDRcszgKqTnBEcOAYIDy3397xJzBsbFkdm7iWzFIg7WP2id38xfYh0ey6vEjR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765652621; c=relaxed/simple;
	bh=NObeftqP4NYmAYVxyQYw9ZMmRwehxHCdwm7nwBp8ywc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByBNvyrwn/eDY35h4DVl9D3oNMg8FdxXUK7szI2nIQE7RwUOC9yeDRxIhQeZQMTBPuvpLMeZX16xxZxXDsZP/X+dRi+ftvHgdBtC9q2hhe68xk0VueN40y05hA4dlVCG7j7SQLI6S8/IWfdiQs2YU8MbFciTSWcrO97rkR68mBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErHHkkCF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErHHkkCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765652617; x=1797188617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NObeftqP4NYmAYVxyQYw9ZMmRwehxHCdwm7nwBp8ywc=;
  b=ErHHkkCFWOkS/r0wTUBdR2HWuLAVpIJmzXXqPNPYPpZt3fpHg5bDZ2Or
   Q9SiUg5TvkJX8zDHtLT/sX0FeE1ACIArRUBV30292t5yg/2PR3VeWVhiA
   JNUOHPe1wsqpr+g60lTmTskXt3gAURKafHLW91B+CAwbHL4WtXymlUGYp
   FlOOq+YP+06qDBc7r5g0/ez69DaSXIZIcipkwjCbvqC8+5zW/dHWMVBF2
   sh8hVUlYeQWw3trIF46vSn3QDVf5HbW82T2W5WK9YrNVeXPfQHEOIRLat
   hgaqR6MMEGYjKJCcsyz0nezIJj396CiUW9mKskPIHfxYkmNFemmBen3Ld
   A==;
X-CSE-ConnectionGUID: 8RTy1aiUTv6Cq/6PzAuNIQ==
X-CSE-MsgGUID: BvAmBBBaRDyFZzcBgCGrPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93095596"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93095596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:03:36 -0800
X-CSE-ConnectionGUID: V23JayAaRc6Q+46QvoVMbA==
X-CSE-MsgGUID: g1rKNCyhSuqofyHf2aEFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197351495"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 11:03:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUtw-0000000029g-2EVE;
	Sat, 13 Dec 2025 19:03:32 +0000
Date: Sat, 13 Dec 2025 20:03:01 +0100
From: kernel test robot <lkp@intel.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: versioncheck: ./drivers/mfd/eio_core.c: 22 linux/version.h not
 needed.
Message-ID: <202512132032.9J2Xudm0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
head:   c18290cbd17e0e56c46aa6f3a3fdb91de2ee83b5
commit: 3265ff741af01a3bac442ad23941ddfd01e123b2 Add Advantech EIO MFD driver
date:   26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512132032.9J2Xudm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132032.9J2Xudm0-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/mfd/eio_core.c: 22 linux/version.h not needed.
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
