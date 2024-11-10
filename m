Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865BF1FAA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731208994; cv=none; b=SoAXNwDNrDEKUP7/abIMLEYJO5ms9zEvYaSWCS1ruggI0/FEjriDLY5yKnzrMd1oU0AlwYbF0HSoJ3FjClxEuoSyhrVXQ/a+OXcEktVstceYAe0/kz1K3NpXy8PeWgzW3DTx+5VfWzzYXfr4tZmK8bKCHFZA1gy/guVAowsHs4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731208994; c=relaxed/simple;
	bh=PmUCwkzsG0do4FigGfAxSZ9jbp0TZKNtAzc5hUM6lXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzDBZKNPdmQIjDtt72RxeUtEMaELWrSTHlpRXn+N3epd6HPmH8c++jAvoHgHAV/EoGW7ywScTadG64H4+44BOj24LuAvrFD2ZGVHHKppG+ogbNl9S7woBGHETEDVWa7iJVZYAMEr5Rs04tDF5atz7t2HNU9q2u+7UKCD5fb1ljU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlzNKigF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlzNKigF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731208992; x=1762744992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PmUCwkzsG0do4FigGfAxSZ9jbp0TZKNtAzc5hUM6lXA=;
  b=HlzNKigFIL4TtcTeQQEd/T597/7EfIWL1QOP+D+s4+A+BnogMN5dWbnX
   GTXrPDTFvN+okta1j0oIfj5fVuiymYUYZGa6UaaUdPKcwd0lwvKuqXavs
   eJPv67ijMeDgyxovaGO8L3zgbEQePNElrKtAsydQnbF4R44WcwrN8zY7w
   Qe6DqqJ+FmJfujhWAgjYfJKzhlx1s3l5rSH+zNRXKlwng5E662xunWcvY
   k3/Lb4kDsTbg2jpbGfBIicGlaNAt3zShQSQDF6OJXM1iV+uJ1qC8A4ZOK
   ApvmhsRq16LBKyeQrTWQ11LFIDf+dmGCogCIKhxXJLxYLQlTxVWbmiF8y
   g==;
X-CSE-ConnectionGUID: 6bAb4dpfR2O75wiJSuAUYw==
X-CSE-MsgGUID: j4mPA9vUS5C/xI019c8LPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30904441"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30904441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 19:23:12 -0800
X-CSE-ConnectionGUID: bwBu3v/CQ7+syySXffGqDA==
X-CSE-MsgGUID: hb3dU/5zSmeS5dLYV6jbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90955507"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2024 19:23:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9yXc-000sto-2R;
	Sun, 10 Nov 2024 03:23:08 +0000
Date: Sun, 10 Nov 2024 11:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1288/1288] mm/sparse.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202411101122.3P9UBhzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: 34b64663e85dec8dac9dd02d94a50d90000a51a7 [1288/1288] mm/memory_hotplug: allow arch_remove_memory() without CONFIG_MEMORY_HOTREMOVE
config: x86_64-buildonly-randconfig-004-20241106 (https://download.01.org/0day-ci/archive/20241110/202411101122.3P9UBhzq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101122.3P9UBhzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101122.3P9UBhzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
