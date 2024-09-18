Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B18A933
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726625697; cv=none; b=LtpQz0C9+xJypYCk0DFEZcSPwszct2/yStZhI7uT+HGmmziqVjmk2zvPPbdNmIpB1pQAERMAeIXhXBHs/iLjeq88BUZw0fxGthS+1i5ohp7rkGIQKO5er8EJ+XuTaPYXLQNlfXbdp4W5dhH/k9CnETpeVW0gyjcraEDn8o0dvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726625697; c=relaxed/simple;
	bh=ULnUE0Xqn+Itw3faK3fRondVajbmwgF+htUaha+yMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=un2H3/9eeuyKl6uqRsuCUO4MCPE45qnkSU/a6lpdNMWUkY13Yb/oktVuMlAN72zGxThQFTld4v/0DvLz15t7uhtMXvH8j/TaFTNTcd2PRujhuwVVX5KAtV5jy0+Wy3V7KNErHsqmFlYrux/n3JTOLZWX+CWmFU+FKwnRiUxsMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6WV4x95; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6WV4x95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726625695; x=1758161695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULnUE0Xqn+Itw3faK3fRondVajbmwgF+htUaha+yMnI=;
  b=V6WV4x959LnMiXNiyLgbPS4GS9BgcEFl/Qf1x3CPJLh7OkJvlGsI+q/v
   AcqOf+gQCa4xSDF5zZigZ6L+J/PHO9saYFyNHLVk3qvbhmmEOGYQw/UvO
   Ue8cjlRyKvx74pOkTzMQ5bv3b1NBv/P6ZPNxErYV/kml2ky6gpNKPejp/
   cjhGJzGWfP54pzHeGvXBnRe9VeRPftKjH6HGhB/SrsLwzXMyKiXDzZoWL
   sxmzw7SlDWb2d5FZ/zPnRoNbsYikS+wvvLHCNHnWLZZxhZmIsfZ3J/row
   SZFHM5lEXtRULmbAjq+HR6Ckr+8ym/Htjuo5Ntrm1bHcQjCqFBU4eW0XM
   Q==;
X-CSE-ConnectionGUID: lNaFtlZlSFu061pexvmo/w==
X-CSE-MsgGUID: 43ySrj+OTSmjCPiLnbvAYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29411904"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="29411904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 19:14:54 -0700
X-CSE-ConnectionGUID: vDTSqoi7RjOsH/+K0R9bsQ==
X-CSE-MsgGUID: WHVLoedlR7idg7ScD6X+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73744112"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 19:14:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqkDQ-000Bn4-39;
	Wed, 18 Sep 2024 02:14:48 +0000
Date: Wed, 18 Sep 2024 10:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 284/14977] versioncheck:
 ./drivers/staging/media/imx/imx8-mipi-csi2-sam.c: 42 linux/version.h not
 needed.
Message-ID: <202409181021.sOTqizEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: d0d8bff2916a390eafad6cbd0a01e3fc899a4ded [284/14977] LF-5503 CSI: i.MX8MP use dual 10bit raw sensor images is abnormal
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181021.sOTqizEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181021.sOTqizEM-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./drivers/staging/media/imx/imx8-mipi-csi2-sam.c: 42 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
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
