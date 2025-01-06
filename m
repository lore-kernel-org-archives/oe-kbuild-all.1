Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A821DDC00
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170320; cv=none; b=rLCTKx95N/u2GPy+pTnmY1yzjm+JxZhZnXRMsTp5YhkWFFIrnMp9e5en3dk7OOhu4R6jUISl+516yMt75BkCMyzgeZkrlF2/fP7t4pI7Wvp0jcBxD6r6yoAtNvxuF2UwSb8p2eAmCptwQS60fZpqK5ovfRMafDTIdYIWYTLyXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170320; c=relaxed/simple;
	bh=q/3+8Zl1rK9qtUxwNNOJcY2LA8tMwspXav3rlX9zYu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXtFHWZogahHZ1Emtxzmet6FX8XNXk6ryuiid2iCrlaph0GRio7QpxqAtffAv3AxaY94OvAv3ru1F/p5uzijISRoVYN4u/suWSIzyiXzxWQ8k9LI+ToKABgM/LPdX8jFmf7n/TCueKs4I1z4E4nd/hgtoaJ3pTxN/n/dd9lFX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrD6iv1H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrD6iv1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736170319; x=1767706319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/3+8Zl1rK9qtUxwNNOJcY2LA8tMwspXav3rlX9zYu0=;
  b=MrD6iv1Hv9iZAfy3mNnyhcPKQfSIUeymzUu0NopIBcTN4gt48XLhAgE2
   0+q5qNALoKtLK3ckF+Rh/3ddaQy/h+YccraqGUsQ8XvUvpX/Ja9pTExOF
   OWkfT5jdNjmwCp8nuZccrCaEVlJo/yIje5Dc6OlpXyIB7T8mWYJFWOTAN
   rIaF8RtBHDf9L1Nv9vtZuDsUljFy5L7Kwf3JCtR/3xCkgalkWz/2IEsWy
   SIgVLuMLNBpHlj56Jnl62rW+XNUD9Y+50eX96Nn+LBHgn1VsuRsItlerT
   /1RZlzSFnQfhNPP4Gd9hETJT3iQKVYF7d19MCXGUftNqwrEac6cPJIBJg
   Q==;
X-CSE-ConnectionGUID: LAWZ6HypQqK9d5yK7PDJcw==
X-CSE-MsgGUID: GLRnjQLCT/qFxPGz9ichiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40087003"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40087003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:31:58 -0800
X-CSE-ConnectionGUID: fcjOZKzHQYqJWhZN3Pq/SQ==
X-CSE-MsgGUID: g0qGIjvRReSgnqKVowhDVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139784490"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jan 2025 05:31:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUnD0-000Cej-2C;
	Mon, 06 Jan 2025 13:31:54 +0000
Date: Mon, 6 Jan 2025 21:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5522/25291] versioncheck:
 ./drivers/bytedance/trace_irqoff.c: 26 linux/version.h not needed.
Message-ID: <202501062103.BtT5lYdT-lkp@intel.com>
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
commit: bf331344145b453af2717206a21b29cfb6f862fb [5522/25291] bytedance: driver: trace_irqoff: Add trace_irqoff driver
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501062103.BtT5lYdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062103.BtT5lYdT-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/bytedance/hookbind/hookbind_char.c: 1 linux/version.h not needed.
   ./drivers/bytedance/hookbind/hookbind_sys.c: 1 linux/version.h not needed.
>> ./drivers/bytedance/trace_irqoff.c: 26 linux/version.h not needed.
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
