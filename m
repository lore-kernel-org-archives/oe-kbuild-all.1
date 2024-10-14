Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A317619CC35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903906; cv=none; b=iiL9YMFM+N3dcgL5ndyNTdVaSPsE1arI2ZVgL6n4ALJ4RTcnyN0NQgnPcZ7aEq6FzrLXm6EBC9uNfBDWyUIfVpmYoFJh3bksinplGEzJkL83+r1fBigsDO1xGFZcKislNkhzuYZvNAij0OMubOTTjKz1YvRS/zrKWxr1Qs+8izs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903906; c=relaxed/simple;
	bh=20Hm+fiKGySz265Th1o4Z+anRmFav+EnXEOqOb3GCjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1BkNVWCRwBPvs9Kcf+4ZpJ9RWMuT0bWZ4gW80WqwGcgUzxoRHwdAE1OXCTazuzRp5OpmdFzYfYRnD+aFJ/DqQ6d6GtNV/exXNH7pCTFTiRGa7F8S9Pp9gVENKMNrovAlV4IgSBS5N8uurtCstz5sCzrR83LiXwoqqxJQeg6qN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iu1LCV0U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iu1LCV0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728903904; x=1760439904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20Hm+fiKGySz265Th1o4Z+anRmFav+EnXEOqOb3GCjE=;
  b=Iu1LCV0Ua6uTGqhLC0nRuUUyRnlAbyAtd82u7ypNyUxx1awaRT9xFfef
   vKIVl1eloYrvqXOaOhI4+CgXSpKdHhbBhNh/9FX+8ywxhTSxJ7uV7pwPL
   yZ8h482gDiTHvEWlQSJG5KqikNmMTa8VESksshoavV01SpcAjBfLI+o1v
   4xcGa93aWKxy7i1mWU1uuHl3QJ4B30te5I7S+w8dpESn2SVb0Ur58x6t0
   SMFI1G5/YX4aS2wpOgcWu3m4ZlnWZw9huJ0Udu7lCDTI1inaH6yq0EHNQ
   pyKU+hmfOEWQ+y8TfF44+4pETJug90TdOIRC2NUQz7ZuFbqghh7oihcbT
   w==;
X-CSE-ConnectionGUID: vrhem1BcQNiLufuIatSXrA==
X-CSE-MsgGUID: yeSwF5WWQCeIu1UPJQD3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32163563"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32163563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:05:03 -0700
X-CSE-ConnectionGUID: j7dEx3tTROSLl7uvlaY4cw==
X-CSE-MsgGUID: ZnwA8dM0SQqVzTEa8OsgQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82321887"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2024 04:05:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Isj-000FDA-0x;
	Mon, 14 Oct 2024 11:04:57 +0000
Date: Mon, 14 Oct 2024 19:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10/14] versioncheck:
 ./drivers/thirdparty/release-drivers/bnxt/bnxt_ethtool.c: 6292: need
 linux/version.h
Message-ID: <202410141935.qVtNHbNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   413b1b249304f17f4514dd859a44e3959e5d7674
commit: 3db1e8157ba7d83cb745e12ed27871d83ed045ce [10/14] drivers/thirdparty: put release-drivers in tree
reproduce: (https://download.01.org/0day-ci/archive/20241014/202410141935.qVtNHbNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141935.qVtNHbNa-lkp@intel.com/

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
