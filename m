Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58A46B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 00:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748045450; cv=none; b=gSIDc99XOXugdXTQ6VfaXkzQAhi7kNfZ1gU/ktDh7wmdPWCTHEvAXWfljrF41DSYE9mw6w6IQBfeJ9h39IlaTX3iZT/O18ZP10E7hIvdXAn9gul+vRRqqs0yjiZn8YMVIr+zwxWuxlM7KvxitJFsgSaKqZORuLZn7JTv1Pc4Wv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748045450; c=relaxed/simple;
	bh=RwFH+9eC0x1j9jwecH9ERXy634x6CoiFasiGrgO71n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeD283aiqmxBOu4/WpigenF4NhDksMxwzLHjB3SxP6g5T4A1wtikN+HkwMWup46kJlgUfeoTciQ5thV7Qj3KOpfsv6RdjaxdtaMI2+wzf0vhpl20jbP6Vrs0WcevVdUc1nhUs92x8/YEoNpkT0RCX23+wRDrHmNABsDIF7bATSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbxYXvb4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbxYXvb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748045448; x=1779581448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwFH+9eC0x1j9jwecH9ERXy634x6CoiFasiGrgO71n0=;
  b=nbxYXvb43gkQ4lMuhSEmp1g0dODncnQOCLi35EgEZxA1DVSCR7DnH6wp
   i3ehNypccuU2x03SqW8r1aKqYOt7QUiM0btc0TpBEWMu74gNBda/e9lVj
   uqY8TNFyCbsoEjAeSiAQgRlOb2KxYB4FLekmuSVWSqmaTX+m/WAxEEvsw
   +jasGuCM0NgqKy09ZrwvYTD5dya1x3LmUCaaMqBT1TwiWndzusiPke0Ke
   KHrC3Lx3pGiyCEIzXnBUzhDL4yZhiKi9alyyYBeuLaaNsPxn5hmqE635i
   MIu9c0OLBq8RvMi3h1kRxC/d1D2P9T2q9DZ5KC9XgJl5w/BVNGNSjepVN
   w==;
X-CSE-ConnectionGUID: ZJoVPRZzRXCW32ua8WtZaA==
X-CSE-MsgGUID: CS6hTQpYQueTjoUgLNYpXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49812660"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="49812660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:10:48 -0700
X-CSE-ConnectionGUID: 2szxgWSUQRq3wKDhM0GDEw==
X-CSE-MsgGUID: tc++673KTsKN9uu9eufaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141245528"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 May 2025 17:10:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIcTM-000Qoi-00;
	Sat, 24 May 2025 00:10:44 +0000
Date: Sat, 24 May 2025 08:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>
Subject: [jlayton:uek-localio 2082/2262] versioncheck:
 ./drivers/xen/ovmapi.c: 36 linux/version.h not needed.
Message-ID: <202505240814.2c0o6L2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: b5194c8398f7957c3f36d96e24b3676b26108927 [2082/2262] xen/ovmapi: Port ovmapi drivers from uek5 to uek6
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505240814.2c0o6L2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240814.2c0o6L2c-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/xen/ovmapi.c: 36 linux/version.h not needed.
   ./net/rds/af_rds.c: 41 linux/version.h not needed.
   ./net/rds/ib_cm.c: 40 linux/version.h not needed.
   ./net/rds/rdma_transport.c: 43 linux/version.h not needed.
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
