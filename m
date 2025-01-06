Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB91DDC24
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736165690; cv=none; b=bGcHehp1DQSO/0Lh8DOB/kJk6zrdPWjpC0r5qePGa7te1okErag8hh5RpqFvl3S6I8yOVPl6qRg0krxP4Fviq/kSQaywmEEdDB4dw6aQgC1bwzUfEkJ/fdOaAvvHUoqceB6I1WhL892pFL/+tLagvywFD9IeJ1UCmmEDtDNfhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736165690; c=relaxed/simple;
	bh=9F93kLFfscpfb0mmw34ROspMOlKMdAvf0e0O2jlOj8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUDBdAaIc+V02oqrUoJs/FLDTqOmM05HaNPtWY0K6tRYMN28u2JP3kK05mMtUdPIWw/M8s9KsoIZO/KIBDuT2KaIR3BJVxHJXaFKJEH/Ggp58+iHdMa5K+tYdETnPJqE7rIP4QIxrRosjndh0u7l4qzTvIVipSyQJDv9hjXhbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlMvB+p/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlMvB+p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736165689; x=1767701689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9F93kLFfscpfb0mmw34ROspMOlKMdAvf0e0O2jlOj8s=;
  b=dlMvB+p/KMmxlWtsIyLdUWo7iM1VI1OnhgQmIA9yiFvqIMX1IgNFQ9N4
   sFY4PwkN4pIWc0qjg25RG7TNuakPwvRzp2dq2nVRHvTpaQBcrsloS1lFi
   ekOqoa66LPY4q4x/TW7y/HXeOkDdkOYavgeyAKTtvBjF0b/PtyxyWq+XL
   mZAXHvj08o9ZdUwRhn8vk9C/Ryen7tdj5ZHz4ZUg4afoL9tMj0rmbiYOQ
   gQjPa43ffSCvEP4GjGy1MysgKkN81NMvVFrBBUaOvWm0gbLxKkEehYqAR
   Dh5GMu4mw3vZ8ajQ2Kkv/UOSeIEm0xXCRGNeD81pM1bdPH8q94sgoxIPN
   w==;
X-CSE-ConnectionGUID: noDMJ1B7Qjetz32+iYjeyQ==
X-CSE-MsgGUID: cSjlgDC/SFKXG7FlQPjpgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46982800"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="46982800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 04:14:48 -0800
X-CSE-ConnectionGUID: OJm6mTYuSm20O+UcMElsrg==
X-CSE-MsgGUID: pOKj4ab7RFSniAmMLRdxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107496943"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jan 2025 04:14:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUm0K-000CZH-0B;
	Mon, 06 Jan 2025 12:14:44 +0000
Date: Mon, 6 Jan 2025 20:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5519/25291] versioncheck:
 ./drivers/bytedance/hookbind/hookbind_char.c: 1 linux/version.h not needed.
Message-ID: <202501062056.w796vpMH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 7b8bb8cc2fb5e8291614f78dd5423873d634ccdc [5519/25291] bytedance: driver: hookbind: Add hookbind driver
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501062056.w796vpMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062056.w796vpMH-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
>> ./drivers/bytedance/hookbind/hookbind_char.c: 1 linux/version.h not needed.
>> ./drivers/bytedance/hookbind/hookbind_sys.c: 1 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 227: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
