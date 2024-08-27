Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7B1C5793
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771579; cv=none; b=nkCYJ1Ni73076dJLAZXTlyn4Q8QRCXm0Kc30/SD75ILNc51Qpqa758gYFU+hqL05Rf7jd1kbeHYjU/d3jjPLqhuZ14h8mSjxoVRYqV0q/nlMi8EE5rT6eBwnAWUABzowLt4GOteNiQcHi0w7Y4AQtrvV8zCkOxec1HebEcGoPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771579; c=relaxed/simple;
	bh=kcgmvQQS+jxvR95YVmAVQbrOT7l818YRT57QwBP57Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ze4FM0udb7I0zByOp8KF/snFOxosf+ND9UuXqSMnNNHoqZCFL8gxHyxcRr79hqr9KXHq5Q1h4rWZbV2poQq1OuvYAcPB88tzvmO1mWTeN2nI+ZuGGrCX6Tl03g7Fe9YB2aFRitYQQjNzbEEFMOCmhZ1iS39LauGB3NQExffrIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgXDeDFc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgXDeDFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724771578; x=1756307578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcgmvQQS+jxvR95YVmAVQbrOT7l818YRT57QwBP57Tg=;
  b=CgXDeDFchkV0MChQs9eH23JVubSK0CQ5UoPZvyBkc6UJqqqPWWBmrSQK
   QH/i+oCVyEG+wIoOQh5oxoWBI+mzDlF3R5API23jIb/jBufvs675BfYQi
   vaxgYRjd9BBMJXcZELPePFB3j0y1pT/IxUBjlxGsqWELxBWoJYFFgIScT
   zJDvWBfmK9rdz/bTMRiGpVue0iU4Scx6oNPoYtDhxFaXScAG8Z0GwjWjO
   BXpIZIy1HUkaUJcfCp/8W0OlEHzUretm/0bO2W2B7IR2Ggc8J7++rq6HL
   p0v0L7A8OjQYSaadWFgt8aulgpzFCwCd8iwf11bBSHb8L2MuPw0HtJYQh
   w==;
X-CSE-ConnectionGUID: Gdy7dbSVTcK//8CWxZRCAw==
X-CSE-MsgGUID: TAt89OVrREOtDRCfbR5YbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40729097"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="40729097"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 08:12:43 -0700
X-CSE-ConnectionGUID: NE9/AR2wRfis6h8PtzJaag==
X-CSE-MsgGUID: k4DkaOdATUSCF8TLSUZVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67598324"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2024 08:12:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sixs5-000JJN-2e;
	Tue, 27 Aug 2024 15:12:37 +0000
Date: Tue, 27 Aug 2024 23:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10/14] versioncheck:
 ./drivers/thirdparty/release-drivers/bnxt/bnxt_ethtool.c: 6292: need
 linux/version.h
Message-ID: <202408272317.i9c535Gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 3db1e8157ba7d83cb745e12ed27871d83ed045ce [10/14] drivers/thirdparty: put release-drivers in tree
reproduce: (https://download.01.org/0day-ci/archive/20240827/202408272317.i9c535Gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408272317.i9c535Gb-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./drivers/thirdparty/release-drivers/bnxt/bnxt_ethtool.c: 6292: need linux/version.h
>> ./drivers/thirdparty/release-drivers/bnxt/bnxt_ktls.c: 1329: need linux/version.h
>> ./drivers/thirdparty/release-drivers/bnxt/bnxt_xdp.c: 659: need linux/version.h
   ./net/toa/toa.h: 7 linux/version.h not needed.
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
