Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F008479
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 03:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714362328; cv=none; b=iTF8uw30wjSy3XmUMBggjeqpJbO++T05o1uv+A1QauRH54CWiLMF44eBGHYXTXGkxAkcs1dcdGKXOa4l/IgS8k4WqPRobfo/JlBu9Qr7pUdPNw8jlRoJm4ocg0QXa0M4/5/PweOfO0zJLt/1yM/rHmubptvH0/CGpz+96EU97V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714362328; c=relaxed/simple;
	bh=3pb2vhVbkwLY/8q195wbelGyWeQL6hp/BI+q2G0vlZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxjqAILQJRlFbgyIWGQ9rnltvali6UtYzVhVUM6bEtY1RvDb89kK197IO/5O4nxTGysXp5e+G5/qvJ/vTy1wkyfSn3M+85RnT3hX6/nnMSxW+VFqnBwm1LkLUtlnowAQVGUv1CUC13ofwa/GbLZDWzmjcokORlNrWLamFPpClQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWFV+x3y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWFV+x3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714362326; x=1745898326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pb2vhVbkwLY/8q195wbelGyWeQL6hp/BI+q2G0vlZQ=;
  b=IWFV+x3yDq+4A3MUZhdz8p1CN+0GXKAvcQlA2O05qO1Ym+SxqI2r1uJc
   VXEdBUBNmIpsjOCtV0wsZxNJ0A6MpB5j6LSXU5VziMNNagtz8qyakhaoR
   P0FvIn9hfQSKDIoSKizy3v4b7EOu7F84rsYTlMFOEEpDm3mHLDG0SDEQg
   01YnhEEhQXzS4FFfSEf+LokycNoM95nQs/iAk4pk5yRLADYPdFHOngMt1
   kjoIFNVhN0IHREADyzhXrb+wQBwTy5AHtY5nAlA18DL+91hDhiMOZt9Um
   ECfppYgorh3nm/O/VjPamlSVIN0M6BtgNEJOOUphxBTTTXvgw0/+TSnzs
   g==;
X-CSE-ConnectionGUID: nWsC5/xoSjG55YmEeIWF1A==
X-CSE-MsgGUID: dJGDtLebSIq/YEf8ELEi9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9864218"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="9864218"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 20:45:25 -0700
X-CSE-ConnectionGUID: Yj0XmCCXQaaHcD6Si2UZiA==
X-CSE-MsgGUID: Q5ijH8sfTpa+vYQvkZftVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="57174107"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2024 20:45:24 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1HxB-0006vE-2l;
	Mon, 29 Apr 2024 03:45:21 +0000
Date: Mon, 29 Apr 2024 11:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Hao Yao <hao.yao@intel.com>
Subject: [intel-lts:6.6/linux 5/12] versioncheck:
 ./drivers/media/pci/intel/ipu.c: 17 linux/version.h not needed.
Message-ID: <202404291129.G4NYyIHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   d1cb504e1323e71b54298946aa0679a1e5ab30b3
commit: 03f88a642c95a67db5f55a76f7ef860ce70676af [5/12] media: i2c: Don't use legacy IVSC driver on kernel v6.6 later
reproduce: (https://download.01.org/0day-ci/archive/20240429/202404291129.G4NYyIHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291129.G4NYyIHT-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/media/i2c/ar0234.c: 17 linux/version.h not needed.
   ./drivers/media/i2c/d4xx.c: 32 linux/version.h not needed.
   ./drivers/media/i2c/hm11b1.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/imx390.c: 15 linux/version.h not needed.
   ./drivers/media/i2c/lt6911uxc.c: 24 linux/version.h not needed.
   ./drivers/media/i2c/lt6911uxe.c: 24 linux/version.h not needed.
   ./drivers/media/i2c/ov01a10.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov01a1s.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov02c10.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/ov13858_intel.c: 8 linux/version.h not needed.
   ./drivers/media/i2c/ov8856.c: 10 linux/version.h not needed.
   ./drivers/media/i2c/power_ctrl_logic.c: 9 linux/version.h not needed.
   ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
   ./drivers/media/i2c/ti960-des.c: 12 linux/version.h not needed.
   ./drivers/media/i2c/ti964.c: 11 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu.c: 17 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/platform/intel/ipu6-acpi-common.c: 16 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./include/media/ipu-isys.h: 9 linux/version.h not needed.
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
