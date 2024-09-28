Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF61850B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727523198; cv=none; b=jAwvtizV658Y0F8aywKTQteggaxxHhaog6mb1ChgiwB5w6SJ+o7mvfuBC6WAhF800mwcnZV+8P4+Ca8KzuCaeuJgMR4nqqdiwbADMIomtpyk24PlCxjro76u8w4aDWQZj/Gq8QsqJcDEAnpNSuoJHn7dvw5MVV4OrCKhWmly8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727523198; c=relaxed/simple;
	bh=zqapubDTdzjLRt63XZbW07pSumFDWP/MkchxyCLxAtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwAy3DJurviIqCTUCKielm4vH05U6aRIXy3dgM95jLRiOAR+Q/OwCoruOAuH2yhXau0r2YiEEywqxRSHw3UJgiou2O0xr4x5AQE54ZtjmR3QEmNDbOszd5nhrz6EQlO2P76k/EjLIDv3PX8qQwpaTQoMX/cgSSxZCD92IWLMa3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiUjbr5f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiUjbr5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727523197; x=1759059197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqapubDTdzjLRt63XZbW07pSumFDWP/MkchxyCLxAtA=;
  b=FiUjbr5fnzIpTqdcPxtE7fbdU8WVXadTuvsg2nhG4uX+NpQmRhNKdVd/
   yXtVPkJ957ru07l3aljYza7fk4b1Z1MQmeLozdNyOMEB+Mdesk3zReMI8
   Lyye4sL2W3XKuf9nQyj0xcBYzMqVJnf5X1BA/wGxAtkE/2HZWCq60q6Rj
   UxnW7Rbbs1Nza6dY9cguW5MeAijqtk/1KuL5zBHx8h/XjU07cGztI5fPP
   9mWo+gfl7+UKwgUFyxE2LkiROqxuaAv0uCrI5Bmjlj43K6IB42aAdhuoL
   ut24OvnYVBSA9rKUDv4vbdg4QLJ/OmvTugt+8HgqjERBuFcaKqX2quVoo
   w==;
X-CSE-ConnectionGUID: DZDHcNe/QTqnXhpMyHtPaA==
X-CSE-MsgGUID: ewME0ASjTBafMaTNW7ayRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30452503"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30452503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:33:15 -0700
X-CSE-ConnectionGUID: x45iBn5fS5WXb7vpyvEtDQ==
X-CSE-MsgGUID: lLwW8+3XQfaQsJUMDkximA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77321200"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 04:33:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVhG-000NDH-39;
	Sat, 28 Sep 2024 11:33:10 +0000
Date: Sat, 28 Sep 2024 19:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20090/30000]
 arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for
 'early_pbha_init'
Message-ID: <202409281932.KZq0zK8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: f43933b3f947a7f9314ec8d704c6ae01041dbbba [20090/30000] arm64: cpufeature: Enable PBHA for stage1 early via FDT
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281932.KZq0zK8A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281932.KZq0zK8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281932.KZq0zK8A-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c:1627:6: warning: no previous prototype for 'update_pbha_perf_only_bit' [-Wmissing-prototypes]
    1627 | void update_pbha_perf_only_bit(const u8 *bits, int cnt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1729:13: warning: no previous prototype for 'early_pbha_init' [-Wmissing-prototypes]
    1729 | void __init early_pbha_init(void)
         |             ^~~~~~~~~~~~~~~


vim +/early_pbha_init +1729 arch/arm64/kernel/cpufeature.c

  1728	
> 1729	void __init early_pbha_init(void)
  1730	{
  1731		void *fdt;
  1732		int node;
  1733		const u8 *prop;
  1734		int size;
  1735	
  1736		spin_lock(&pbha_dt_lock);
  1737	
  1738		fdt = get_early_fdt_ptr();
  1739		if (!fdt)
  1740			goto unlock;
  1741	
  1742		node = fdt_path_offset(fdt, "/cpus");
  1743		if (node < 0)
  1744			goto unlock;
  1745	
  1746		prop = fdt_getprop(fdt, node, "arm,pbha-performance-only", &size);
  1747		if (!prop)
  1748			goto unlock;
  1749	
  1750		if (!cpu_has_pbha())
  1751			goto unlock;
  1752	
  1753		update_pbha_perf_only_bit(prop, size);
  1754		enable_pbha_inner();
  1755	
  1756		pbha_enabled = true;
  1757	
  1758	unlock:
  1759		spin_unlock(&pbha_dt_lock);
  1760	}
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
