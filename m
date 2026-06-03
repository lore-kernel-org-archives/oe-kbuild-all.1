Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5820468E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455880; cv=none; b=U09uVs4ArMumV+BH9FfsHovEjcMajEzO0Cc6E9wxrmdtK3NNHfSw8L+eqFmF8WVHAHi30GgMXO9dPF1XaH50g/31TH3LVbs6545iP7w4YcebFD6S321XUn68G3+IdrPE1pNujr45RSVThv4H9pOe4yeNd3h60QGjTqqvrsWgqqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455880; c=relaxed/simple;
	bh=60pK/qH5SyNAIPm5HIqv+KWuTazrOSOXV/VGp0V+W64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sFfYo2kihkCC/pFFcBrC+NLbnB3allOz/0reXLJyY48EfGS8ByiYgBwm0K9n4EPj8XdYnyK6ENiOGarV2Yss5DwrvTLMtLaRP9VqE5neBJVir/CBb8qEnvN69tx41DKtiNWLSGNT//tnCoDKByZrHMFlgp1sJ8C1iQMjVECiPrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDySFkXQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDySFkXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780455877; x=1811991877;
  h=date:from:to:cc:subject:message-id;
  bh=60pK/qH5SyNAIPm5HIqv+KWuTazrOSOXV/VGp0V+W64=;
  b=LDySFkXQrmDKtw8UNlU/PfoxkkdjW3QRZH+zGJ/CCqFUL958rpuN0+q6
   T97wszMvJjzlMZJaAWJZlXBtaptrOTMeBGUtzFrq9MhkjBvu3GP7KAAH9
   ww8B7Rs17Nto5gDT43xBYL3G0lE0fFhXPuzwAlfO9Pmo1Aok6rxh2L76O
   pMreB46Q+LxG529l6e+FPYu17nc83zkM3Xm3aNYD2OoQ4Etbjqtyr9Bnv
   g3XQuUaEN33PgEVMHQIAbcy8U+5W4LxEHumbaWCEdOMf/rQ+tV2yQPeJA
   Z8cz+E+NtkT2C/pZmH4Su1krvMg6QMlZ1CEGmcY9W7HBEWThQXWogAjy7
   Q==;
X-CSE-ConnectionGUID: JreRKAhrQIWLXisV8TVoAA==
X-CSE-MsgGUID: BxEUVQknTRmRcJM3cXeMCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80991578"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="80991578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 20:04:36 -0700
X-CSE-ConnectionGUID: DnPYHUS0QtWALK0Rw/Szxg==
X-CSE-MsgGUID: MzjKTlhoQZuDj5JwM2Jvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244197822"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 20:04:35 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUbuC-000000001v3-1cNY;
	Wed, 03 Jun 2026 03:04:32 +0000
Date: Wed, 03 Jun 2026 05:04:01 +0200
From: kernel test robot <lkp@intel.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Willem de Bruijn <willemb@google.com>,
 Jordan Rhee <jordanrhee@google.com>
Subject: versioncheck: ./drivers/net/ethernet/google/gve/gve.h: 19
 linux/version.h not needed.
Message-ID: <202606030436.B9LXjyAm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harshitha-Ramamurthy/gve-don-t-pass-in-unused-parameter-to-gve_adminq_free/20260603-082043
head:   0bff339f2924223f9933ec10822286fade19e277
commit: c31c8a52927bed272a548776d0302e06bf8d756b gve: introduce gve_adminq_get_device_properties()
date:   3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260603/202606030436.B9LXjyAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030436.B9LXjyAm-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/net/ethernet/google/gve/gve.h: 19 linux/version.h not needed.
>> ./drivers/net/ethernet/google/gve/gve_adminq.c: 1648: need linux/version.h
>> ./drivers/net/ethernet/google/gve/gve_main.c: 20 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
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
