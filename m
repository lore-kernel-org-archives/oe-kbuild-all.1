Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127B126BEE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 04:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730780947; cv=none; b=C83oW0/h7tnqfhFf2PYJrXBbgY/z3912rvQ4aM3t84j71NSbzHXIU9Nvlipx/8o2SHED+hOUw4eAp9SVaNKAUFZJboXq/0DnArmDCf7buNLNi2em/6vcAPywofh78SXH883lXP/4i41UIo3Pkh1uDlCl5AhlJ31qnYFQHwBvkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730780947; c=relaxed/simple;
	bh=H92InTV9sb40pu6czRLP6HMblVsV+lr+MEcrdeE34gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwsN2RWzMMxSlqZfKVImGLoYS06wnawNoEMY4o4tYi851WfcGOqnl/ZbpeGZ+iGifcY70XtmYNvR4tjb09SDejfYTyYh3HH5ON98JUlDHaOq1uMvB/FgV8+IkB8nbEuAy54nVJMxp9RL1osxFRbNDP+5RXMRT27qc1GL6pJJErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBlEfokY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBlEfokY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730780946; x=1762316946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H92InTV9sb40pu6czRLP6HMblVsV+lr+MEcrdeE34gc=;
  b=CBlEfokYGZKlgZbeuBf2ap3zKO4VukDrFkBNhXGycX1p/R/JZdGbU6EL
   H7d6/WkIHcipz3uM8/GlfACprbOt71rzE432w57MdkBKiKQ9Rn7H/MsSE
   Fk77tpSphJqHpH1YwPjw0L47TOnfWSsZ51M29sHbQ9QgeG74433UFRHhs
   Ck7KGOcvo9MWxOUfoWx0yWXRfiBJ0bEjKyOZpUZoq/aIMla3t3Hm+OgCL
   Y9eAfyYrsrfa00e/+qbOfwvTEkc4Yqe4QhguY2ClnreGt0UEMdqoD3psw
   Ped8LeEgtScBwuVp33IXPQUMYUodOqZHOB/h/iT5A3J6FTiJSmL1M7+X4
   Q==;
X-CSE-ConnectionGUID: syOZ6swcQEelX3Oqia9lxg==
X-CSE-MsgGUID: tPljfI2dTIapELI1wEFe3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41905034"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41905034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 20:29:06 -0800
X-CSE-ConnectionGUID: h1/lDKGzTGOixk0RTNXs1Q==
X-CSE-MsgGUID: BtTjMFaQTDupuli6Jn8lHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="114656486"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2024 20:29:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8BBe-000lcH-2G;
	Tue, 05 Nov 2024 04:29:02 +0000
Date: Tue, 5 Nov 2024 12:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 21/25] powerpc64le-linux-ld: warning:
 discarding dynamic section .glink
Message-ID: <202411051209.QeAj03L7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   ea12a7f9c1697d73061d2c3627052fc528e238a1
commit: 72dae646de8d69cb64ff93ecdae9dfd5585a0109 [21/25] uprobes/x86: Add support to optimize uprobes
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20241105/202411051209.QeAj03L7-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051209.QeAj03L7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051209.QeAj03L7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64le-linux-ld: warning: discarding dynamic section .glink
>> powerpc64le-linux-ld: warning: discarding dynamic section .plt
   powerpc64le-linux-ld: linkage table error against `arch_uprobe_optimize'
   powerpc64le-linux-ld: stubs don't match calculated size
   powerpc64le-linux-ld: can not build stubs: bad value
   powerpc64le-linux-ld: kernel/events/uprobes.o: in function `handle_swbp':
   uprobes.c:(.text+0x5b54): undefined reference to `arch_uprobe_optimize'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
