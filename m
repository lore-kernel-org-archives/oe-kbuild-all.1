Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445B1FE451
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046413; cv=none; b=db778EydzcQbHoSI9wtjCKM1p1uDPSNw8Nhvn8z+AuQ0cmRD7EpE4wJboagLCsEhnaWyG2sKGv1dHwIto+S51kSvyLj9n9rEg2Q5GK3OD5JZ1n5CQ4uq0q2N1JQGebQTwWo2wv6ABpOhcHmymR1E2/seXUkeq//CD2WmAzwTWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046413; c=relaxed/simple;
	bh=TLa1VSC1E0+hPTqXyVEjTPZOZUDSUocAomf4nOmJY70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/xYpPOFknwY5+lxToIjh3Dr03zIHp4baK5PFAYnaMy9AxATUGRKIy8k22Zgc4a7Mwxf8JnkYg/GpQSthTa4WOtWo/eQJAYwoKyo2UJ41EgMLhg5Yeuxr0t7yyoL0LiLJteAMZHxk+0Jkea91HGqubV3em7lvyAJ+RsrZGmuciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmyKmpmC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmyKmpmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754046410; x=1785582410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLa1VSC1E0+hPTqXyVEjTPZOZUDSUocAomf4nOmJY70=;
  b=AmyKmpmC+4guf+8X5sd/O7Rc8dWD1ZdX4qrF/2WUshX1YzxHlxoOVvGy
   fSKznEkd3H9aMZg+1QETaQM02lXA/8AF78jg1P3RrXPUmh8ghtR5XC51Y
   /4GXzAgvvMzg90zhDmZvOqIakZnTCQP6lD07PlwIF1uLH8A0NgKgtxMea
   QcYzF/V1cJyGnPjt/n6L/apq1wmHBd1GkxdIBMEYNEKdKPIc7V+6ihBG/
   /ulXMdj/OT6YuViC+nsAJy/rPa2RQqnRd+eicUFNxOWCBDxQ/XicZEzkX
   m1VRaulm8R038DvBPWHih+MwaEzAjMOp71KF1q5SkUfnFYlWeTyNe9qCC
   Q==;
X-CSE-ConnectionGUID: yGS+ddS7Ta+8njLwCpNOng==
X-CSE-MsgGUID: XKexU1VLSPOmRMJZkBxmUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67466921"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67466921"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 04:06:49 -0700
X-CSE-ConnectionGUID: O5cuo6SnQ+u+CATs1ZynMw==
X-CSE-MsgGUID: MSDp0DiwSTO1nGtCaodv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="168918899"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 04:06:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhnb3-0001D9-2E;
	Fri, 01 Aug 2025 11:06:45 +0000
Date: Fri, 1 Aug 2025 13:06:09 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2628/2628] versioncheck:
 ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 11 linux/version.h
 not needed.
Message-ID: <202508011355.f9w5qabM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1ca83de3cbd1afcc3038a46ab4c4c4626b9a4712
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [2628/2628] net/hinic3: add huawei/hinic3 driver
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508011355.f9w5qabM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011355.f9w5qabM-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
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
