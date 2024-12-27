Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE851FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321274; cv=none; b=gzlizHNsm7jvBunBaJZckaKb+0UlBfUEuFFdGf3xB9S1sAv3wi/lUARM/Q22NwAJsyMU7g6Lu4QnsgNkfvmNnaDGnY/OsnnxQNxbAqYffSohmFiaG2JmcRwNR9ELg+lNUi/L3Ms2jrsfH7Fz4JDhalLmNlGYVifp0T4fmtA7/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321274; c=relaxed/simple;
	bh=7fYBeK6Hll3oP7/6u6XsOKReWn2+48GdYfcN1H7v2a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgID1WszQHIQ3yWgd0XVxmtDPfcTEaSMaY3+D5rXKILBrWImyD1QI8ZxDjtPpnb+rm49ZCYHhOU1meIf9hQZLamVpz+lfZMYMjGsNOmt/lImQvNa+qUv+7YOp5ONNCDls0j/TFsgflYhvzBdi9VOfSUwhsLlS0CY91WWhLS7+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPw2ISNM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPw2ISNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735321273; x=1766857273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fYBeK6Hll3oP7/6u6XsOKReWn2+48GdYfcN1H7v2a4=;
  b=fPw2ISNMpd4iy/JrN8GzjFTJleImTkKifu3VQl71KUDBmjVYkPMdG+gz
   ixvWGWlKe9JN0HCqovncTUWmdng5aLDfrch8SdEdqiEDwnfnKF9UMst1X
   ozzSBsLZiazM17Mg8UpuLdjK6orq9Tw8tuLCtXhllzGmHKH41imLMDQyC
   Xbnb1c5Co9SZMMLKlmhDQP7NR0++T4ZZcWFE0a6+NlkWI8Iee6q8mzdx+
   I6L4V42Qvy1WP1o+WI9GGSIUaMD8UKDGqcM3sWw55ERjroJGSYyW6dw11
   qbziGSDq6Ay2a2MSR6CIrgXZYqZD3jAtca5pZNWs/LyAc8lhgZgeIEao8
   Q==;
X-CSE-ConnectionGUID: s+uzOtB/Qa6DXj9q7UyBjQ==
X-CSE-MsgGUID: ez9G7J+vRiirI/u1AIMEuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35948331"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35948331"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 09:41:11 -0800
X-CSE-ConnectionGUID: AE4PLdoaRMGt7awhMwvx3A==
X-CSE-MsgGUID: 8MIZSHsRR92YFonOZmlzGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100677514"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 09:41:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREKi-0003O8-0t;
	Fri, 27 Dec 2024 17:41:08 +0000
Date: Sat, 28 Dec 2024 01:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355] kernel/ktask.c:80:5: sparse:
 sparse: symbol 'ktask_max_threads' was not declared. Should it be static?
Message-ID: <202412280123.7Ss8XbOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a8a9daf97ebc8e303e039402fe784e7bd4e5a9bb
commit: c48676ef6b6f9cb8497d6264ae9ff71b87630337 [1355/1355] ktask: multithread CPU-intensive kernel work
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280123.7Ss8XbOc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280123.7Ss8XbOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280123.7Ss8XbOc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/ktask.c:80:5: sparse: sparse: symbol 'ktask_max_threads' was not declared. Should it be static?

vim +/ktask_max_threads +80 kernel/ktask.c

    78	
    79	/* Maximum number of threads for a single task. */
  > 80	int ktask_max_threads = KTASK_DEFAULT_MAX_THREADS;
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
