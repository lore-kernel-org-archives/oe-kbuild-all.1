Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9511720CCFC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733501390; cv=none; b=X1qYmiD7u0a3TiEFnb6I7zwm8e5OAzrQRLqTCcKvJuYzf6hGaPBXaqY8PYSJxT0yN0BWSclzgNDsTM3DQYeA8AELdPZ7niV8N8eP4fpxzDDZRjT3qvpFuLAF3QB0pxI7hRvk1OFXj1Fkij/MCDgDn4a78BscZOqD3Vmq6mufYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733501390; c=relaxed/simple;
	bh=otxmMdDnfllSw/3neoZSsOheCA51QwRYqoWIY04Yiuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TkW1tzkarUtmiCmy/PZ4ND0ZeA638ncWJr2fe9Xaf37/R2obS+23nnH2aqQI7hTd9KqJAYqkqSAGyZd0ON2MRZe+K0lkZd7mRiVPnKf0Z8CqZAOSf58FTooIupWQ/etJtYO640DgXeLcUjUBHbf50r0uDxLVIeW56c9VcKZtoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7JSJ91b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7JSJ91b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733501389; x=1765037389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otxmMdDnfllSw/3neoZSsOheCA51QwRYqoWIY04Yiuc=;
  b=h7JSJ91bx/wq9TquoH5lxKHTRFRukgjCAdjjGvF6A49YVe+3vUd/+sFA
   IgdWZAyIVEU+akJZ/FDmHSiPYamKvcMGUhYdOl7HDt35Ny/4W64VSvQSZ
   NwHcZz4gkFNhV3MiiyKcDqvcHQexPF2/X64VV2zmavE+gKkyWgTbuIHrw
   0Gq5oJPcpr2tD3HqZLqecNIo8hDvg1GNEf2dp/c7Nu8fHpYnDREAltVw8
   BJB5LU+IEx/gs96cQwRm1Vn4lJP9rNl2gXQukJ3iuyglrXgFz7VqG0VPb
   6K9IV6NGvjOkbsGt7RamkG9250GRYIkzkbkgrhlH0xRpg42n+dEDXoLLD
   g==;
X-CSE-ConnectionGUID: D9PvhCJyTJmyJqQSNiQkwg==
X-CSE-MsgGUID: 9UXsvcgbQhWGOSJU2MeEmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44329008"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="44329008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:09:48 -0800
X-CSE-ConnectionGUID: c5jIciafR8C5yEZ0ND3zfg==
X-CSE-MsgGUID: fLf5JZBuR0WHjLGQBHTu8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94640280"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Dec 2024 08:09:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJatk-00023x-1a;
	Fri, 06 Dec 2024 16:09:44 +0000
Date: Sat, 7 Dec 2024 00:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Ruslan V. Sushko" <ruslan.sushko@zii.aero>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [lunn:v6.12.0-scu4-dt-overlay 5/30] versioncheck:
 ./drivers/platform/x86/scu.c: 24 linux/version.h not needed.
Message-ID: <202412070004.8ScV7a8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   e5a74312d60c715601af06df72b460f497b0483e
commit: f639c4ae67b2eed2b3780f0d68df20faa5234521 [5/30] Initial support for SCU platform
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070004.8ScV7a8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070004.8ScV7a8h-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/platform/x86/scu.c: 24 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
