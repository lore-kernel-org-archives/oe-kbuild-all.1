Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E21CC17A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572900; cv=none; b=geILtT5tDCS2qdKR2XGt+OH98bCzR838JG5Ky8jPzNixYRuPDRTi1/BuDcv7cWTENQRfKOwm+exgaqo9BSBtkIhWTnZdiM1zndrN2D/B4RNs7YkPnp2JHOZ3vmEhBZYHrMAbA2b8PaH335Cn5LuDVud441hpAYEk7HlC/2QKl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572900; c=relaxed/simple;
	bh=lEZkKSz/tv/70UAn1sHwy+UEQb0s24Elbzs8q4Dwf+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGJmP0presjPT9CG5IpqQw4LIoaw1k0R1IWa11MMQH3l5/MgBXy0eXSKkyny9607cS2G6Pf6gaEreg5UGmYMm+nKHP0u80B2sIqVusc7WOz47vR7CLud/Rj4IV0/SbuDTaNJqKiOWgVYraUrwF98Yd3ElY9+xSFyozVQFi8lPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3YNhJgP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3YNhJgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728572899; x=1760108899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lEZkKSz/tv/70UAn1sHwy+UEQb0s24Elbzs8q4Dwf+4=;
  b=L3YNhJgPRm1kUoF2j6XEP7unR/ol/ZGSjpJr+UCwj7KuXmzbZNvZrNQK
   Mn2WKGqJI78rMo5mAb8r+YHecb1ni7tV9dgP0DreXuQb3lTEu7WWICONe
   L7a/7NKHGxnEMSndxaMx0zuebrSnFuERYdcPs/yzcVaK33vtNPRzZO6TL
   +OXJN3T4NVSLOEDrKDXMaZ/7DE99+yhkmARyGVwhPvJEAcedZC3Mxw1Zh
   edqaKSFh6wL8pDYurD8qAyC7uRCEle/XnqZs6uynkVAHN3JN+BxZyneTQ
   76gmyUgz8OdEqXLaqRrmQ2Zbd9W4fFXTrNimiihjgMr5wrFGa6AgwSCKE
   w==;
X-CSE-ConnectionGUID: FqGz4pyZQYaXDSoc56k2OA==
X-CSE-MsgGUID: o//GDFHRQMK9JUolIKBdEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28076480"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28076480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:08:18 -0700
X-CSE-ConnectionGUID: Oz8twLOrTK2TuAHGFM/ywA==
X-CSE-MsgGUID: np7c1hQOTgaTj4QLSBOKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="107460240"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2024 08:08:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syuly-000Atd-0d;
	Thu, 10 Oct 2024 15:08:14 +0000
Date: Thu, 10 Oct 2024 23:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 84/90] versioncheck:
 ./drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: 13 linux/version.h not
 needed.
Message-ID: <202410102259.zcoS9Eiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   ac58041210cb96802c85aa7803e9d768086f043d
commit: fce79512a96afacbe297ba3c5c2f7ed34944540d [84/90] staging: gpib: Add LPVO DIY USB GPIB driver
reproduce: (https://download.01.org/0day-ci/archive/20241010/202410102259.zcoS9Eiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410102259.zcoS9Eiu-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: 13 linux/version.h not needed.
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
