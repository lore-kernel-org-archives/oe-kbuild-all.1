Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37222F01
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764997722; cv=none; b=BZG91ksL38HCuJYpQ589P+XyAeE5HceAHoNdCDNTmcp5igfoyWZVy3yvk2QLhp/YxEx6IDH8HJyCPbJfnx0890IyZYUG9NlGr9GEGVBilcny17jrSIuaWjhmDex4/3x77nmDhKMi3qpMmEPlZJM0lguf2H5Is7x9beZN8gB1Ol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764997722; c=relaxed/simple;
	bh=nPXoNUDczSILaR2lqdE3uK28DaJvV1VIRfiovjBNLQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z53hXb0tpwRDAR3iDyD3opxIUAOXrcIHHLzrEX+9J9VCUCLRDIDkHdLzKmCSh+BqA2XmFxdPVcBP4AVc8cQ9KBNJqHYLBgweFI2hLlqRf4gV+GQvKEWgDlLj1sQqQyHZQLSXmv7Qg9JC9xZhcyn7c4cv70s6tw2TO4PFJ62xpSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCEe7fX4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCEe7fX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764997721; x=1796533721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPXoNUDczSILaR2lqdE3uK28DaJvV1VIRfiovjBNLQs=;
  b=GCEe7fX4M6JfAMbqYnW798cvSPwf1d58m6u8L0BukavAfKh6jmN8IiVT
   WU/ZZx1qrUPrgIRqiBeWoFZkLMwlhH3Xwe42kUuSXS7wntly6jNIM5N4x
   qq7ARRtDNGO+wK/ZIg8pfgPF79+Q5I2W54NZJudeR3oa2V7nvFBEFH2Sf
   2JTuCttzZ+DUfbcg4bEcu+eUqKl+s4AdpFXcfzAFgbq0p56+5YvhiTs0U
   D63Cv40qWKM20F+yZfS+jkVInzl9VuopY5euQSmZcz1VegFLFRd1UJQ+T
   AV94RQo09T2xfLV2yU/YMn6lskhp26bz/uSyi8yWPOx32q6+ugsKUW3q2
   g==;
X-CSE-ConnectionGUID: hxEVDT5YRy+xPTPUtzGFPg==
X-CSE-MsgGUID: 17TSnvJ8SemwtIh7aTjGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84436126"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="84436126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:08:40 -0800
X-CSE-ConnectionGUID: cIIoT7m9RD2+E+XTTg+GPA==
X-CSE-MsgGUID: YgLo3vznQDKQtmhpRI7LNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195535874"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2025 21:08:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRkX6-00000000FsD-4BYL;
	Sat, 06 Dec 2025 05:08:36 +0000
Date: Sat, 6 Dec 2025 13:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382]
 drivers/misc/sdma-dae/sdma_umem.c:53:19: sparse: sparse: symbol
 'hash_lookup_entry' was not declared. Should it be static?
Message-ID: <202512061353.zv9lgx8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: 42aacec658a804ffbd46535125897c2a089fb55d [3382/3382] drivers:misc:sdma-dae: optimize kernel code
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251206/202512061353.zv9lgx8W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061353.zv9lgx8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061353.zv9lgx8W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/sdma-dae/sdma_umem.c:53:19: sparse: sparse: symbol 'hash_lookup_entry' was not declared. Should it be static?

vim +/hash_lookup_entry +53 drivers/misc/sdma-dae/sdma_umem.c

e64fcc91b39705 zhangshuowen96 2024-06-11  52  
e64fcc91b39705 zhangshuowen96 2024-06-11 @53  struct hash_entry *hash_lookup_entry(int ida)
e64fcc91b39705 zhangshuowen96 2024-06-11  54  {
e64fcc91b39705 zhangshuowen96 2024-06-11  55  	struct hash_entry *entry;
e64fcc91b39705 zhangshuowen96 2024-06-11  56  
e64fcc91b39705 zhangshuowen96 2024-06-11  57  	hash_for_each_possible(g_hash_table->sdma_fd_ht, entry, node, ida)
e64fcc91b39705 zhangshuowen96 2024-06-11  58  		if (entry->ida == ida)
e64fcc91b39705 zhangshuowen96 2024-06-11  59  			return entry;
e64fcc91b39705 zhangshuowen96 2024-06-11  60  
e64fcc91b39705 zhangshuowen96 2024-06-11  61  	return NULL;
e64fcc91b39705 zhangshuowen96 2024-06-11  62  }
e64fcc91b39705 zhangshuowen96 2024-06-11  63  

:::::: The code at line 53 was first introduced by commit
:::::: e64fcc91b39705284a6fc63bee257d2fed5e836a drivers: misc: sdma-dae: support page fault preprocess

:::::: TO: zhangshuowen96 <zhangshuowen@hisilicon.com>
:::::: CC: zhangshuowen96 <zhangshuowen@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
