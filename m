Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ABE1DF246
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745212335; cv=none; b=FBst4dmmGwtQO7sgbup2Zjr35D37g8tgNz/Pe5Taui6Xc2RnzV7b8Q/XBjQFI8NGLuPZZf7MaGHf8ceWkhhJ0OYkPEd/Q6Y1Qwfd2AwSf6qpnbtQdb/OxgrL0/dS6nUKVvfENIei5kmFzwUUqF8i9PvzPyIQggyZRD06bYJKu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745212335; c=relaxed/simple;
	bh=9oGPQcbcQByEIGZqc9fITkSZ0hQh9GAWw2wmrZT88gY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtUsZbTHwsbqR4aZiJ4PsxGDyEKRyuxlaXjSWryQYZGmcF+TZZVGZS/3R9OL0S/uzdvNwpwJk5GycSBBDzMzkXZ/RzkWdVq/xJ9n6QIqZZlzXm0SrvrrpZWFsdPzgdTTeDYsDrfNipGwKIShLOkRu9bBJ01BOtNhhEv1cG/YUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5Onyert; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5Onyert"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745212333; x=1776748333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9oGPQcbcQByEIGZqc9fITkSZ0hQh9GAWw2wmrZT88gY=;
  b=N5OnyertF0rLh5iR8erNkbiK2NKZpcU1ImnG3H57FKUaU6Azk0w815Pd
   HmQzqrVJhgvQgJKwNB1xrCzzBG8SXrcrKQAlIuapUMk6afy693x06pJVh
   NznDKdGTgXa9reuTDVijtce5Ln7UWWRyp9OpvDE+Hxjf7GIZrFAQZXY0P
   eegGNkD/dmHlrCsyHtCIVz+up2M83DwuwCmVzOhHzCPY4beuieW5K09DL
   5dOgxLy+o2xw+cm9W3I2FUSyPh0JghXBXGavquRxblTp/2+80p5HmGz0J
   1BzsCn+u325cP+wme0KbRT7t/XjRc95Qzq0DgX3wz4NedBmZ8TOqPe/jN
   g==;
X-CSE-ConnectionGUID: t4k/VC2BRM6WuYT9CSCKZA==
X-CSE-MsgGUID: wz841EPDS7iFePOSzFMYOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46631888"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46631888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:12:13 -0700
X-CSE-ConnectionGUID: 3IqXLe3BSbqBDsypC39zDA==
X-CSE-MsgGUID: jQGIZU7GSmaCrHJi++jvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136483745"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Apr 2025 22:12:12 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6jRx-00009L-0s;
	Mon, 21 Apr 2025 05:12:09 +0000
Date: Mon, 21 Apr 2025 13:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2139/2139] drivers/cpufreq/cppc_cpufreq.c:852:19:
 error: dereferencing pointer to incomplete type 'struct fb_ctr_pair'
Message-ID: <202504211352.ik4vkTIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bf197758b04f43e61ebab66520f1420c1b64853c
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [2139/2139] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-002-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211352.ik4vkTIa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211352.ik4vkTIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211352.ik4vkTIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_get_perf_ctrs_pair':
>> drivers/cpufreq/cppc_cpufreq.c:852:19: error: dereferencing pointer to incomplete type 'struct fb_ctr_pair'
     int cpu = fb_ctrs->cpu;
                      ^~
   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_cpufreq_get_rate':
   drivers/cpufreq/cppc_cpufreq.c:866:9: error: variable 'fb_ctrs' has initializer but incomplete type
     struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
            ^~~~~~~~~~~
   drivers/cpufreq/cppc_cpufreq.c:866:34: error: 'struct fb_ctr_pair' has no member named 'cpu'
     struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
                                     ^~~
   drivers/cpufreq/cppc_cpufreq.c:866:40: warning: excess elements in struct initializer
     struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
                                           ^~~
   drivers/cpufreq/cppc_cpufreq.c:866:40: note: (near initialization for 'fb_ctrs')
   drivers/cpufreq/cppc_cpufreq.c:866:21: error: storage size of 'fb_ctrs' isn't known
     struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
                        ^~~~~~~
   drivers/cpufreq/cppc_cpufreq.c:866:21: warning: unused variable 'fb_ctrs' [-Wunused-variable]


vim +852 drivers/cpufreq/cppc_cpufreq.c

   848	
   849	static int cppc_get_perf_ctrs_pair(void *val)
   850	{
   851		struct fb_ctr_pair *fb_ctrs = val;
 > 852		int cpu = fb_ctrs->cpu;
   853		int ret;
   854	
   855		ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
   856		if (ret)
   857			return ret;
   858	
   859		udelay(2); /* 2usec delay between sampling */
   860	
   861		return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
