Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5F361965
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997324; cv=none; b=YiW4UJuxNj66+xxDmjuoNtMQcLZYcz+nmRhmENsFX76dV/S2AErzMa2JjR2DRxSArRR1MnDU0DV4NqqZGxCyxodDzgUk9jmEWbKUapXQVhWUVy1/l+66gCvr6bkPFMttMPKEpHUU2U4RhQI6bN2b2TbD9HvYNuINi/+uukLZGc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997324; c=relaxed/simple;
	bh=elZ/e80tPIpV2OlsjyIMW/TwmjCjUadrDnr+SQUhEL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E0OKwmGTBYmh2D2GvJFGtwwmse1WtEbwRv6ppM/qsQMVwma7JQ1SLNi0BXjcccjjl395sI7Yy8XzQW4yarsbqgK3c+6O3Ed/Kb1OGU5+Ay1RD7NpRN1PxG1IGIrr1ZJLkdkilFmKycFwSpVDVXzgHDwpqpZC43ksDEmD0gvC2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IM9A85Db; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IM9A85Db"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786997322; x=1818533322;
  h=date:from:to:cc:subject:message-id;
  bh=elZ/e80tPIpV2OlsjyIMW/TwmjCjUadrDnr+SQUhEL8=;
  b=IM9A85DbIjbTvqOFltyfJxdVEyF1cREKc6UmfgaziygrpZ7FH+47fgmc
   P8FdwCByIOw1MlaPw388/yx0tCmyQrYzY3dLUSKYLmLYzumWKdd727E9b
   b0CJfO1C8nrdkGl4TYVm0fo9EBwfJQrDKQWb2xcukdh/QFxUoD+2cdvCo
   qwjMDwzmqzMZaF7/2mVM11p5nAUpIMTJVlo+9ZP5zrdJ4tI0UI4vFhiln
   PwG7dAk5KsddbkA3ilNIg6iMiWRxG/1V+6dJQ5KkEnKbl6LlxMJiDqcBu
   LD0F2h+CxBW/f6snvRcB6SuWY4bAvJjEhmmq8UnOcDvy9xAjDc1WXutPr
   g==;
X-CSE-ConnectionGUID: GeqPkHEBRb25hBC/v89A1g==
X-CSE-MsgGUID: h57VI/BrSDiVexjNIIaLDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98997896"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="98997896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 13:08:41 -0700
X-CSE-ConnectionGUID: Zrqs9BUMQaCNsh0tt3+ePA==
X-CSE-MsgGUID: YAwpXacAQfq24eqSttpcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="266991761"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Aug 2026 13:08:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww3dO-000000006xV-15aJ;
	Mon, 17 Aug 2026 20:08:38 +0000
Date: Mon, 17 Aug 2026 22:08:31 +0200
From: kernel test robot <lkp@intel.com>
To: Kisung Lee <kiisung.lee@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: versioncheck:
 ./drivers/media/platform/samsung/v920-scaler/scaler-core.c: 16
 linux/version.h not needed.
Message-ID: <202608172236.7ATfqV6e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kisung-Lee/dt-bindings-soc-samsung-scaler-exynos-Add-ExynosAutov920-compatible/20260815-165208
head:   beccae5f05d7d3bfa4f4e8cba17f99d0082392eb
commit: 7f3e8c79d6f6411bd4980d63c4e98dc505397c7b media: samsung: scaler: add scaler driver code
date:   2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260817/202608172236.7ATfqV6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172236.7ATfqV6e-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j112 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/platform/samsung/v920-scaler/scaler-core.c: 16 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
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
