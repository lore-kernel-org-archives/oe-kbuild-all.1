Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C1156C6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715083299; cv=none; b=g8gkaAN/Bgu60NZBAHICg/niBMQvNQMm9KZqinb7u+hPL3waQNtDYYvzrrRuPyV2So2clu5qSL+MCt08mhGxmNaJJzb/jvvEk+SgChsvQad6g9KEl62rENWIJZo/58lT/Kt9T4bFz2o3z3J2BYFHXOQThSjkBT6xyS9iY1kVKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715083299; c=relaxed/simple;
	bh=3eeAJfnCwg0/gmpajuOGgW9UqBEKBcglEnDiBDyVWCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1Yrx0oHeilaVv0Wx1uC2x/aj7x92kJFJvohCS/F2NdQXcAyNy7rlJnvL9Hjtllk1XNt6werrw4CAwuBXtjo+OhOMzdyfauora0TCYFhNrbG3WDpgGf83mQVBrQ3Jp/DNxIPavxYqRmXthFyB2ra9mag4ZeUPx2bVbcowmqrKG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i49/9JFy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i49/9JFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715083298; x=1746619298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3eeAJfnCwg0/gmpajuOGgW9UqBEKBcglEnDiBDyVWCE=;
  b=i49/9JFymgM2hwMJU+fg7VeKp4OdyYuNi0Amv/q4OgJQgx007vtupqcJ
   sK3QNRrotcRxXCbQkdBT9uGlWzQAzaVotVrUviQUVFZm6G+bvGSyoQEeG
   efWPWQaTiXwV8QrseadZAK9/ZovJshw4AayNbqfKA0nIqLM3iF1cm1NAk
   RYMyKGFDD/rdft7rWmNIt8TH95eUZIFp48D3erfrQucjVmmbSH7oaIKRd
   A/I2dqu8jX2NuiHjGBXrZ6hDkqxTrwA1QngtWmU1XlQmaFVjhnxSHujFa
   lVpAZSbrZ+/DY2EnRTp6V5zD6Q65u1ERfMhOK+PD2r2OvHPCX57lR+WnW
   Q==;
X-CSE-ConnectionGUID: 65vnhPZqSQu0G44uhBr/pw==
X-CSE-MsgGUID: MRnQ9t4ARbKqCWJmfHKdbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10994643"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="10994643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:01:36 -0700
X-CSE-ConnectionGUID: lKYBd/ajRy+dLu9Sn8WRbg==
X-CSE-MsgGUID: O+5y45zsS+SJHUz9GzI4/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="33307854"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2024 05:01:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4JVi-0001sa-0R;
	Tue, 07 May 2024 12:01:30 +0000
Date: Tue, 7 May 2024 20:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6513/6518] versioncheck:
 ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
Message-ID: <202405071950.qx0mhNvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b294718c76ed688d3272e48c431221a8194cd2d3
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [6513/6518] Add mediated ccp driver support for hygon crypto technology.
reproduce: (https://download.01.org/0day-ci/archive/20240507/202405071950.qx0mhNvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405071950.qx0mhNvK-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-13 CC=gcc-13 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
>> ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 13 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
