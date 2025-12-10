Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB141E7C2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396955; cv=none; b=hVm1tfh2vLCywJ1i/ehGiSp17rqkV0t3tWpB0mlqxJiGnYncIQ2KEjHAk3eBMaqDMBFTeYpWk4D9cRqI4XK8p8PL754vzNXsNIyQLRIeCJcLy+rkMwvX/+X/BG8kL0dhi513vAh9UYD5AJZh0CZf4eLQxhS2/ovfLExaUExUt7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396955; c=relaxed/simple;
	bh=eZPzE3l92PxIXCZMAVSWamJUE1pkvGjveXhCX6emqDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLpJgvDWlYf+BIkLs2+B4MTQS4hwLNBieE82K8ifdGKvu2jpx7SgPZl2Im4xBv6DKhIrFQdOx7NA80MB5UM0UCCF3rYwiHytFPiY1F0m/0KUzKokufut7tBQOeP+kZm/mSshNkztvjU72xZocBTQCxOQW0GKs+a8wE5CT0jyXjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB+Kmy6V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB+Kmy6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765396954; x=1796932954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZPzE3l92PxIXCZMAVSWamJUE1pkvGjveXhCX6emqDk=;
  b=LB+Kmy6V9tB7iohdg1igHVJ5KY5U94uIC3hEAmbI5/H2vkW+wrr/Vem0
   /j8u1PG9A0sIl3N8JsJDBiAxb8UQxJbyK9XDWrzQdPWIldz5xtIDjQMTi
   8b1e+5SJW+2jGleoAn3/0gWm0dWtc8Ut9YA+fIqMr3TXq5nV1aUrZByPw
   g21iMw5BRaOUQPQS18ju8p6DTZtdvomIXpR71HWmfrLxkXipg/BZjutCA
   A9DfZJ1mE+g+w8hOOnwm0AFlnQekCvRmhCr7wSTG4h37esZ0Ys4V6hwbJ
   fLac3Cl9DjaoqSfVSJ9pXHqub7HsYht04bjsVd2zEMWCN8iQk63zM2iPI
   A==;
X-CSE-ConnectionGUID: TgDTxAj0RqiPhHaXn3vA5g==
X-CSE-MsgGUID: QhUbuowJShm6Cl53kh87xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67262828"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67262828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:02:32 -0800
X-CSE-ConnectionGUID: JYj2VH4RTaCwI792yda0Aw==
X-CSE-MsgGUID: id69FiNNQRiCSFmIWx+GjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="234023286"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 12:02:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQOK-000000000lW-35xy;
	Wed, 10 Dec 2025 20:02:28 +0000
Date: Wed, 10 Dec 2025 21:01:56 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] versioncheck:
 ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 11 linux/version.h
 not needed.
Message-ID: <202512102127.0BGDaK78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [3534/3534] net/hinic3: add huawei/hinic3 driver
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512102127.0BGDaK78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102127.0BGDaK78-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 15 linux/version.h not needed.
>> ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 11 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./fs/proc/etmem_scan.c: 13 linux/version.h not needed.
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
