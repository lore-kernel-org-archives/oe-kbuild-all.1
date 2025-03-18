Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42DB20CCF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307775; cv=none; b=LEBhwsiS1OysKYSKd7VtRyNF5gLOi4p25JgwPNG7M9cXvzgbJ2GaNBe+iXZbKZcpuhu4CmrSqh5be/yQLcEY6bB9VaoWQxpD6c/fMJEO68JIn151+xE0uOhQuqO0OQsmo0EAnw4GtnVeGc0zlfXgfOiu9JYPPFkVqGeAc2lihF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307775; c=relaxed/simple;
	bh=Ur3YpA4A/kRzASVk5q2P1A6mWBhwp3Nc/vJ1CPgbbNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKlgh4WY5/UBsU3YEPMp6jCJJ4+/hXMDH69xYgFW9ecD7tfGCJFPFhreQ/12zZ1ciH06VyBahH/Wmkv/tDUdd9ClR/ydMSTenlgdKPPgzO1l9RPO8V1rrecZp5bQAQYq/jYYm31gwM0R+mPhL0YculyeEI4L8MvF4uwQL/BytOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dONtNZkc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dONtNZkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742307770; x=1773843770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ur3YpA4A/kRzASVk5q2P1A6mWBhwp3Nc/vJ1CPgbbNc=;
  b=dONtNZkcLZrIX56TbkdOhgoM9hcJjPGvYAhqvMGNgOmC8YERC1wEmEgS
   56p0y/7XkLeq121kSt+yZEFXtOwh5r9Pf1TvpxxTlwPZY5atEMOE62Lcf
   2gg/K7Vxm2DpwFOWZ0yUYE864VmnFL/qk+aRzLIJLxkMIqeK2b28XrC6p
   GFS8a5jB3ex2nCexpg6Zn8tLMGeL8BagO8bSI8cmlqfcIZuRBsTKa9xAW
   dJauak3c6mb5+7RkLCHMpn6in7Ed6BROAd6GvmX3en1FDqVL2PgiciFk4
   D1/fcU01t8XSeOToX/fF7PPVnrAPyKwDwFWS4nnpT5RqeAs7CWj/Zskzk
   g==;
X-CSE-ConnectionGUID: an55aGH2RGC0DRramiznGg==
X-CSE-MsgGUID: nyluxr3HQt6mbj6zRWIKqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60844036"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="60844036"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 07:22:49 -0700
X-CSE-ConnectionGUID: YG9g9hXYRE+CkD0w0+KX0w==
X-CSE-MsgGUID: Fy57aWhSSPC5sFuipRkxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="127383720"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 07:22:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuXq9-000Dqp-39;
	Tue, 18 Mar 2025 14:22:45 +0000
Date: Tue, 18 Mar 2025 22:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2041/2041] arch/loongarch/mm/cache.c:69:29:
 warning: variable 'way_size' set but not used
Message-ID: <202503182233.88LCSaAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   010e974aad58e203f1e68707107db00593fcf851
commit: 7bd845b17aab36ac5d381557b797845404aaeb57 [2041/2041] LoongArch: Update the flush cache policy
config: loongarch-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250318/202503182233.88LCSaAj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503182233.88LCSaAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503182233.88LCSaAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/mm/cache.c: In function 'flush_cache_last_level':
>> arch/loongarch/mm/cache.c:69:29: warning: variable 'way_size' set but not used [-Wunused-but-set-variable]
      69 |         int i, j, nr_nodes, way_size;
         |                             ^~~~~~~~


vim +/way_size +69 arch/loongarch/mm/cache.c

    65	
    66	static void flush_cache_last_level(unsigned int leaf)
    67	{
    68		u64 addr;
  > 69		int i, j, nr_nodes, way_size;
    70		struct cache_desc *cdesc = current_cpu_data.cache_leaves + leaf;
    71	
    72		nr_nodes = loongson_sysconf.nr_nodes;
    73	
    74		addr = CSR_DMW1_BASE;
    75		iocsr_write8(0x1, 0x280);
    76		way_size = cdesc->sets * cdesc->linesz;
    77		do {
    78			for (i = 0; i < (cdesc->ways * 3); i++) {
    79				for (j = 0; j < (cdesc->sets); j++) {
    80					READ_ONCE(*(u32 *)addr);
    81					addr += cdesc->linesz;
    82				}
    83			}
    84			addr += 0x100000000000;
    85		} while (--nr_nodes > 0);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
