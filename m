Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E915200A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726642866; cv=none; b=pwN7VfhfxtvdO6xXHzUUadGUt+rkyqQKtEQSp9DCvWG2GzKlSG70n5eEvYf6Q4CiXNgt6SGEEZSMyRLAcE21Xr721kbRWQk5HsJL4e657RQAPL+MFDy5CzSXTb4i4lYAQVQDJUv17rCvqG5Ft0Sxmaksmgps44VrfqMp3CFk7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726642866; c=relaxed/simple;
	bh=PwW5Ltbe++Cdq+XEeIpYIgibqf1xxXS9ZJe6wxrnSeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pa/kL823g5rqpRpCsfh3A4viwtqEj8UyMgJgSyncwNpekf1ibQxKfFc8lbdPxHPDx3obeG2U/H9YfnDc1e6mH5+O6BJwf33bZh0PAw/I3yw58Ffo0HVRwfe6VMDA1ungjrCt5aIDZX7wLjTWAwJICSIRpfXfQMzvooH6Zjd069A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EybAnFJV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EybAnFJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726642864; x=1758178864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwW5Ltbe++Cdq+XEeIpYIgibqf1xxXS9ZJe6wxrnSeU=;
  b=EybAnFJV4Ji6OPqDDu5XtEG07FjB8yUkntUTEn20xwXrVe7sdLekTT4V
   tcw15psGqD2rIRyvz3oKjaJruQhE+61qUqJ3VP4bh3VUSJAoHC64OIgjF
   aO+bIdQ4OrUPjLGvGHTcCJmN0UzoTbgFmX/wIevj/YptB5MSbix8Va0D3
   msR7wG3nJi49OltAGcW5BtzYD2hpNfX/n9ZbOfM9otLm1tSLVUcFNu7Xe
   8dk3tp9w7CabQOmCqSo+wBfRQQo1Tdy3dLqfCl7iBQrmOnIpKC6Ik5e14
   VcJYDLlL3q/zyHq6J67TyuR8k6zy8dH1R5UwmifYQNDtCbzx9gYDJip1j
   g==;
X-CSE-ConnectionGUID: wjecpJKvRJOCvdXWvAr5uw==
X-CSE-MsgGUID: LQ7LV1LyQT6LhvqsL1tKMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50947946"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="50947946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 00:01:03 -0700
X-CSE-ConnectionGUID: zfnKPWFjSNytAOXJREC9Fw==
X-CSE-MsgGUID: VX6QcwKfQBaIGQmHZVNi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="74284125"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2024 00:01:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqogM-000BwT-0C;
	Wed, 18 Sep 2024 07:00:58 +0000
Date: Wed, 18 Sep 2024 15:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3406/14977] versioncheck:
 ./net/tsn/genl_tsn.c: 12 linux/version.h not needed.
Message-ID: <202409181422.A4Ykr9uY-lkp@intel.com>
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
commit: 8bad9bdf1fe710ab0b4d97a1266a7cf3954d0a7e [3406/14977] net: tsn: netlink interface to configure TSN capabilities on hardware ports
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181422.A4Ykr9uY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181422.A4Ykr9uY-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./net/tsn/genl_tsn.c: 12 linux/version.h not needed.
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
