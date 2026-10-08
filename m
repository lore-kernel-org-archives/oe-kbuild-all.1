Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C052FD69E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470492; cv=none; b=HQqedjFRFb5UxEKArqadVwN38ukCZgDVh2pztXZFZWutYpfA4wuawsztswBdtSofOCa0jwgSkOSJuwmpD/Z3H8NR9A2Mt6qw3TBUnBjuhvNxf69aBXqE0v8GHEGWIKUuQ8Zr7tcqmavnqrZM8uSPcjOjQwvVYsw1LFkXT54Icb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470492; c=relaxed/simple;
	bh=x+F+V4PSSY00R+effW9tPucMVMjGTrV/17YlGusQHO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JTNsSBY+UqdJL2DwEPePG5iH/uQsoSrRV8PwvA7qjYUYBd78LwndCdUzQOXOtihJ2IYnbxpE99on/qLNaG/MG8AB6bkFORyz/cMUF00KdeqJJmrZemW0sSVVcrkavfDcQtaSzBECWtfu59PSbCsTAh3PjzG6V21bai3jYVVXR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3HuX9fr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3HuX9fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791470491; x=1823006491;
  h=date:from:to:cc:subject:message-id;
  bh=x+F+V4PSSY00R+effW9tPucMVMjGTrV/17YlGusQHO0=;
  b=K3HuX9frJcPX6RDjPoyMGvWUR6QWcXxGIDT1s1yDtsINHMhyIA9yUSsT
   9oQfzlzOTgbUYWQBkmitEBmM1pKzua4QSj8V5Fmw4j+u9TsBX5m3Rbp8N
   1oDXAkTZL0AxsbUe6KtXbBVPWnUDc6AyZoWdvOUfwZPMX1MM/mjLlzN72
   hHzYr6hOgZV59wgA+Df8YIY3LDx6dRHvC8T8E2gPfEN7M3doby+NMDYNn
   65CIGtUQuDqnZz4HvgoQARGmcpe7sSp61FXAK7R/0WF386eYwVTPpfRjh
   JJI3/2L6Jtc2pSmuQwoSAM5QwLVguTK7V8o6z6bFmzpuQ3A6D+lSwZzMS
   g==;
X-CSE-ConnectionGUID: HPvQW0ZeRiyGkKpozr6udQ==
X-CSE-MsgGUID: RBQKGb4eTH6Ei6iIH8PehQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="137076"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="137076"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:41:30 -0700
X-CSE-ConnectionGUID: PAAgML/qRe6+7iHGF88JnA==
X-CSE-MsgGUID: OCZcKiOFSfKYgaCrq0xzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="70537"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2026 07:41:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEpJF-000000005b9-3z23;
	Thu, 08 Oct 2026 14:41:25 +0000
Date: Thu, 08 Oct 2026 16:40:30 +0200
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 578/15343]
 drivers/gpu/drm/amd/ras/core/ras_umc.c:492:7-14: WARNING opportunity for
 kmemdup
Message-ID: <202610081601.QfHncpYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: d7a282ef25ef45a3c4dcc97042e0c007051c6006 [578/15343] drm/amd/ras: unify umc record logging paths for runtime and preload
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081601.QfHncpYl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081601.QfHncpYl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/core/ras_umc.c:492:7-14: WARNING opportunity for kmemdup

vim +492 drivers/gpu/drm/amd/ras/core/ras_umc.c

   486	
   487	static int ras_umc_log_record(struct ras_core_context *ras_core,
   488					struct eeprom_umc_record *record)
   489	{
   490		struct eeprom_umc_record *rec;
   491	
 > 492		rec = kzalloc(sizeof(*rec), GFP_KERNEL);
   493		if (!rec)
   494			return -ENOMEM;
   495	
   496		memcpy(rec, record, sizeof(*rec));
   497	
   498		return ras_umc_log_ecc(ras_core, rec->cur_nps_retired_row_pfn, rec);
   499	}
   500	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
