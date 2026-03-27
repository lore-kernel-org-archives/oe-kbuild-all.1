Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00883BF696
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596540; cv=none; b=IcHkscIqWHoXXmxdUzpjfs792fBV957xGY/l1+jGh7VbOE6YgrQ337eKi/T4TRMcZXT2JBaNv8wBND3RFKv0O2rlvsQ6WLOKkpsJj3Vx77cqHTgoVdjtzu2fmqez+k1x3OuumnYCY2w3ACFPnTtViKrcdsjk0jyHlzRNHvEkEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596540; c=relaxed/simple;
	bh=V/vD5nwhMWjZen8sZJKGYg3mxV5U0mPfPQEQZfdzTuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO1DfPG0cSv/hKZcIgCwfbPeR0NN9MaOirqIWibLF5rFI/2epuc28WFSFGnKdHJM2H+4kttQldfrbxtS/bGg0utQad3ulC8CXCoF4DdYUUf5bq2SrQ5nxQITMX4KNqlr55XXBkgbUNBDa84WIWM4cpeuLnUuMPsR3RgswD239Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MME8Fdbj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MME8Fdbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774596534; x=1806132534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V/vD5nwhMWjZen8sZJKGYg3mxV5U0mPfPQEQZfdzTuo=;
  b=MME8FdbjnOA85i2VqIQVoo+tV/tqui3jtBrJlmL73ucTY0dLdj6GtL92
   X20ChftYvy5LPN+TXML/9Iy9+TtyjDU5UtLQYTYE3o+Kr6roTXE1zxupx
   OyuaxtxdAe/mtLtbGI7tjbK37HU6ndbJ/Ocsz0kPvOVobx/3BDCptXGeW
   NwqWeu7f8M8FjeoAt3VcCARwuy4iecHCEqb8nIy8fryWd45WCkoaYSm9I
   jtp+T8oTCih+bN9Vr1sL1I0uei0CGqrRz5l8U4g53tsLK+G+1bGfrmkOn
   Ue9bqZ/dVbI9g/1bpd/kAkrHL5sXkGlF2v0JG74Tz/N9ITxK0ppOm9IJc
   g==;
X-CSE-ConnectionGUID: m61CBNwXRVisqwgggh/OzQ==
X-CSE-MsgGUID: tF02dEleS0SMg7+CNSExDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75633491"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75633491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 00:28:53 -0700
X-CSE-ConnectionGUID: nw/w3xEXQbm7OmnTC0IuBQ==
X-CSE-MsgGUID: tYebg695Rxy3lZMio+clYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225246742"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Mar 2026 00:28:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w61cf-000000007Sn-0hyl;
	Fri, 27 Mar 2026 07:28:49 +0000
Date: Fri, 27 Mar 2026 08:28:13 +0100
From: kernel test robot <lkp@intel.com>
To: Matthew Laux <matthew.laux@gmail.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	gregkh@linuxfoundation.org, Matthew Laux <matthew.laux@gmail.com>
Subject: Re: [PATCH 1/1] staging: media: add driver for StarTech USB3HDCAP
Message-ID: <202603270851.dIxOgNPA-lkp@intel.com>
References: <20260325170634.55528-2-matthew.laux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325170634.55528-2-matthew.laux@gmail.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Laux/staging-media-add-driver-for-StarTech-USB3HDCAP/20260327-130544
base:   0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67
patch link:    https://lore.kernel.org/r/20260325170634.55528-2-matthew.laux%40gmail.com
patch subject: [PATCH 1/1] staging: media: add driver for StarTech USB3HDCAP
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603270851.dIxOgNPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270851.dIxOgNPA-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/staging/media/usb3hdcap/usb3hdcap-video.c: 7 linux/version.h not needed.
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
