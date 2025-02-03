Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918A1FF1CC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574883; cv=none; b=DC/Rzl9EXZTj9O4477DtuZ6TXbhe0aJ8t6V++3Jb69iigouB5GLIRqSvMSSWXLxYoczN5wCi67c64uofimuewbVtURokirL7n9qKCCa1DCj2OI1Y8dbCIHQrQcMI4209Rm/lHZHgsPHOqB2UtDO8PtM+yYdVLgmRsmJaygFJAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574883; c=relaxed/simple;
	bh=Cfb4SrGyKXsWWQtK2yNIaTpoSI6Dykm2ZCmW6VMkvE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jpfliFJdNsQgx5ftsruOKpSzCHn9Cw3El7JNU4ss5oZXqNO4iO2mmT7/GCpO+H5YXZZNttu40yTb5jdlUj4mPNPo2c23RL1LUmfy5sCF9Rmp9LGiM/yy7uMej83E3xBtIaaSPYuaVi7CyMDcv1M6ZKEGFKmzpNblibR59htaZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFEGBVO7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFEGBVO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574881; x=1770110881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cfb4SrGyKXsWWQtK2yNIaTpoSI6Dykm2ZCmW6VMkvE4=;
  b=iFEGBVO7chA77bSbQLQL3dOY4fJZ6KyGPMbScoyU/9Ov0vD8uUak1EjS
   tcMjiRsoysHx9xJJzK0O8Sj5HTJwXqb8ypCG7IC1LoPRa0q1Vlko5rpGI
   KR0OTT4IKS6pjey73m5DWPA++mwyaDtJOuk1De9LP8yAMz7GHvs53xzi1
   lI9SXGl4sQ3+X4OZylVUjtj0YAguSAyv+Oecb0NGhUAYzGCyWf+05cnTX
   cuc+IecTtmGpFgnUud5S04Q4voEotcA3HYsjaBkRQZ9f3kfHi4Y0uGXLv
   wiwcNPsMi+jgBVnsE/WF+a1b6SY5nOs4BY2Atw28zfTKnzplNrnNanesZ
   g==;
X-CSE-ConnectionGUID: 0lMT67ffQrWa6H8l/Ieh+g==
X-CSE-MsgGUID: w81b7MaFRW+4dDwpxX52RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38294591"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38294591"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:28:00 -0800
X-CSE-ConnectionGUID: FUnLZvMGTke2pm582EHikQ==
X-CSE-MsgGUID: WkmmcwYkQGWyDjLflpSPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115246134"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 01:27:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teskG-000qjD-29;
	Mon, 03 Feb 2025 09:27:56 +0000
Date: Mon, 3 Feb 2025 17:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 25/53] versioncheck:
 ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need
 linux/version.h
Message-ID: <202502031704.mXoAQt8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 6c0af79e75e54aeb74a525f9c6e958db674bf816 [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
reproduce: (https://download.01.org/0day-ci/archive/20250203/202502031704.mXoAQt8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031704.mXoAQt8P-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h: 11 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: 1596: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_spi.c: 697: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/main.c: 921: need linux/version.h
   ./drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: 13 linux/version.h not needed.
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
