Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FF148832
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714724123; cv=none; b=BsKCbZHS2+H/3SL1Uc9byZ558aenmV1oGrXPaNUzFtdbXD7D+c7zkutAJSFNdvPWse/7HrhGgLHBT/QPisC/ZV0Z0eWXNn9PWUtSXzaR4NWLyFNU8Bah56VcMInU40UqqwplvcVSuV90UDrjbG9LOIvg4mnj2Om0C5yWfkyMZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714724123; c=relaxed/simple;
	bh=HZJWU4r24HMGf8/2/wG7/I662OdsjKxUO4mz6aJntjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtrwQgD/aizCHkOcmvYk1nCLm2Aolpt593QA/pwpH3dW9C3w1aLk5h+3brlx8ScI/+t66vWgoUpALTRONohmemi5TtdNRCd5yexJBhNd2XBOG09S6k/JOxuoDyW7TJrjH3sP4NVqW07XZUluyOTrbhwaUvOjfQEkPDO6GkDigM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGI5eaX2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGI5eaX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714724122; x=1746260122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZJWU4r24HMGf8/2/wG7/I662OdsjKxUO4mz6aJntjo=;
  b=mGI5eaX2TTycD7dGHxOSM/ihWuCHCViRT0K4HjdxdsmNxssEDiadYpSX
   ecrgK/uj0dzkB163f6qiD/xZdNhIAFWIy5uGybx09ymvDM3WRuORQOJAR
   5qx5omWI+np35ReVacLn9dRS0Keuq7nNrtXd9rYo5Tto9I8oGTwk0o33C
   m+yJWUPIgbVUpwuJetK9zpw6ZUxnxqcIIbCdzOt0TH16UsJhGfEgjc3s8
   GleIYiO0WJJJ95XEbBJRw2GH3D6bCO4M1nt82Fvhdl5NyOkceyuOzNPb6
   8FyJE9G0msbeajZjBIEc+GXwqrZ7nOawfXYreISh7nOQoiodVqJ9UDtms
   w==;
X-CSE-ConnectionGUID: 5Vj+cudsTGaxAoxu5Buqaw==
X-CSE-MsgGUID: QsQgVNWMR9uHg9jVX0ZGsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="35914943"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="35914943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 01:15:21 -0700
X-CSE-ConnectionGUID: nHZ6HqB2TFyLyqbOToUTWg==
X-CSE-MsgGUID: TnudGuqoTQ221oZl4LdJqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27902557"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 01:15:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2o4b-000BSi-2g;
	Fri, 03 May 2024 08:15:17 +0000
Date: Fri, 3 May 2024 16:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1014/1143] versioncheck:
 ./drivers/soc/aspeed/rvas/video_main.c: 15 linux/version.h not needed.
Message-ID: <202405031613.gqjnrwmF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: f778d27331abc1655c4425fcdee0086a7b81464e [1014/1143] RVAS: add rvas driver
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031613.gqjnrwmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031613.gqjnrwmF-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.76.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/soc/aspeed/aspeed-host-bmc-dev.c: 5 linux/version.h not needed.
>> ./drivers/soc/aspeed/rvas/video_main.c: 15 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 410: need linux/version.h
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
