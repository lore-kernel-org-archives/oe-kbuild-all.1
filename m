Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D383C769B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264174; cv=none; b=SlU+E4HU8D14WziuBxg4B29HWnuXeDHY0UardQjbHXDjPeQBubESvXjsJhde6ys+7PA9elmA11S0+WN/7nSGrphOUOkFOslnV9SCJFj2aKzbeyp+IGsXpJ6Sg1LP9KbodC+DV0TtweoN12ukUqQBWIhosKf1ff4dOUwLC5TWJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264174; c=relaxed/simple;
	bh=S7IsAOARt+lF7qF7MPHHDxbLfaXMPkS044oONr9QI30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBLDwfIvPk+oMun3bJ+RWXfq/X6FaeV9mCoUcXRI6Jm8PxJV2FM2G9tfUBmuG5sqKBEX6y0lu6UnnUeSbAnjH4K2ux7KmDsYLUykmerBKWZrX+luI/VBhmOQRsr5bL7AHNWm9vh30Qm12IcRBYHwVPMt7S6MqVdNbE85xAEW7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5NY9EPk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5NY9EPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781264168; x=1812800168;
  h=date:from:to:cc:subject:message-id;
  bh=S7IsAOARt+lF7qF7MPHHDxbLfaXMPkS044oONr9QI30=;
  b=b5NY9EPku1JgpXilI94/ZL1vrHwW7ewDjmYn7PbaSwt7BKNJIgU2Cw4/
   TKIXYiERHvx+uE3eSogEXRtk+3BvV9qXCbUWR4QxXOYpo6fmxwepSTyyE
   wLIPfH59KRvv4Dibh2cPDYavVRjP+B/qK2S0+i2q8cK4/1Sv5DqK15QwY
   kk7Z/mb/aMjX1Jjti1DBOLHAj3APi9sAJYu3TVQ+C407/2pCXAp/wvhCV
   laXYw9fqrfWMombgD0rS2epjaZxm1Fhc/FSXVBy2/GpaDZk8tnmk9ihrs
   +XjVkOf2ZauPCiOuhaZpcCC5MPnkBmbbwC3mOz7lrjppBHsTB+icb/ZeK
   Q==;
X-CSE-ConnectionGUID: 5kDd8eMaREeGJsYq/0iL4w==
X-CSE-MsgGUID: D+Ch9FcwSlWX9h9wU08vOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85935033"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85935033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:36:07 -0700
X-CSE-ConnectionGUID: xjhVMdp7ScaSiLK4clBfWg==
X-CSE-MsgGUID: mWXPkijDQZudc16xuMTpGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250722975"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 04:36:06 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY0B9-000000004Fd-22HE;
	Fri, 12 Jun 2026 11:36:03 +0000
Date: Fri, 12 Jun 2026 13:35:54 +0200
From: kernel test robot <lkp@intel.com>
To: hepengpx <pengpengx.he@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:6.12/android_v 1/1] versioncheck:
 ./drivers/media/pci/intel/ipu6/ipu6-trace.c: 4 linux/version.h not needed.
Message-ID: <202606121329.MFZmSe23-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/android_v
head:   68a638ff668a1d42dda25aab102975b86d6fc10b
commit: 79287e371573e1d08f38166d74d8f83319f7fda6 [1/1] Support IPU6 ISYS FW trace dump for upstream driver
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606121329.MFZmSe23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121329.MFZmSe23-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/pci/intel/ipu6/ipu6-trace.c: 4 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu-psys.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c: 4 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: 12 linux/version.h not needed.
   ./fs/incfs/integrity.c: 8 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
