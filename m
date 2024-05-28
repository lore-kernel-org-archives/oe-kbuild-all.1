Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BD4CE09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875101; cv=none; b=Xh6j0l+WweHJPScnFc2BNZLmqOElYoCeW4TwKUVQ9R6xWfPNZge+o3zPFON6e+ajDhhUxlP4TtK/2LZ2MB8WsytdivvsMxnWesGoMKP49+wg2Lpc+EIktwl+EiwEmdjF1EVi+cXsT9eFg1wyX6Yq4uikFe6K7+C7TZ+UmlaYZ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875101; c=relaxed/simple;
	bh=5gkhLKWxgDZ34+Eyl3mbTsC2w8H5C0iqJlMLehljoIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpDd1ARXdTsnCW99fuC9oBW/pJDxz96SSrvjonr2/YMqTjRqhofIza3QovEtEFN9zwEraEYmQCcNX8vj5JF9GyBBEjlgsBw7m4jvPYazDkef00imj7HDeALPlkE+6TokoEnROZFhrTwz7E3KwTb8pM7sGrPYrhT/+2uYfOyiedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLo8ZJMa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLo8ZJMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716875099; x=1748411099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gkhLKWxgDZ34+Eyl3mbTsC2w8H5C0iqJlMLehljoIo=;
  b=kLo8ZJMaXR22QypoxgsLjtk8EmrLVYd7o/EdxFKSt6GIbMO3ifJfM3Ab
   v7fWcd5QHChN8/11x1p8f4Jskzugay99KCKH1CMI6CLn35+lr9z7OhrnO
   XS2adq5CqAaLbr9wOdX4sSOyNqbUYp+d6XHUq+2fbZv3HNb+o1FOuEoic
   7RxX4zy2XSxl59UOvej/5WOJZoEg0Zk9dbC9TzHLHto4hOo0T7fc4PYUQ
   ooIK/GZS35SUVMFX06Kg/AZkVRN5R0oSDBgVdcvTeT3dv1xF+S+ZCcY4K
   ul3avrav71ghNrlPjbu1FE9fHNDk5sQtJwNeRVhO4mVV+3vjR3SrsHT7+
   g==;
X-CSE-ConnectionGUID: O7abi1WiRlCJVzs6ilUJIQ==
X-CSE-MsgGUID: I3Y/I7SYS3KlL6cqeLHGBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38580721"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="38580721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 22:44:59 -0700
X-CSE-ConnectionGUID: N85gUd0FRjmeplWbE1KKdw==
X-CSE-MsgGUID: SPtICldbR5iVXyxtUtUwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="39750746"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2024 22:44:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBpdb-000Bkt-34;
	Tue, 28 May 2024 05:44:50 +0000
Date: Tue, 28 May 2024 13:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/multiple-port-per-dai 18/18]
 drivers/soundwire/cadence_master.c:1820: warning: Function parameter or
 struct member 'ida' not described in 'cdns_find_pdi'
Message-ID: <202405281340.USonUKGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/multiple-port-per-dai
head:   22cf2387a03939981ddea144429e60442371c232
commit: 22cf2387a03939981ddea144429e60442371c232 [18/18] cadence: use IDA-based allocation for PDIs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240528/202405281340.USonUKGG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281340.USonUKGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281340.USonUKGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/cadence_master.c:1820: warning: Function parameter or struct member 'ida' not described in 'cdns_find_pdi'
>> drivers/soundwire/cadence_master.c:1820: warning: Excess function parameter 'dai_id' description in 'cdns_find_pdi'


vim +1820 drivers/soundwire/cadence_master.c

5d6b3c8ba12a20 Vinod Koul           2018-04-26  1802  
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1803  /**
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1804   * cdns_find_pdi() - Find a free PDI
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1805   *
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1806   * @cdns: Cadence instance
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1807   * @min: min PDI index
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1808   * @max: max PDI index
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1809   * @pdi: PDI instances
39737a313085fa Pierre-Louis Bossart 2020-01-13  1810   * @dai_id: DAI id
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1811   *
1b53385e7938d5 Bard Liao            2019-09-16  1812   * Find a PDI for a given PDI array. The PDI num and dai_id are
1b53385e7938d5 Bard Liao            2019-09-16  1813   * expected to match, return NULL otherwise.
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1814   */
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1815  static struct sdw_cdns_pdi *cdns_find_pdi(struct sdw_cdns *cdns,
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1816  					  unsigned int min,
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1817  					  unsigned int max,
1b53385e7938d5 Bard Liao            2019-09-16  1818  					  struct sdw_cdns_pdi *pdi,
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1819  					  struct ida *ida)
5d6b3c8ba12a20 Vinod Koul           2018-04-26 @1820  {
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1821  	int id;
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1822  
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1823  	id = ida_alloc_range(ida, min, max, GFP_KERNEL);
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1824  	if (id < 0)
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1825  		return NULL;
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1826  
22cf2387a03939 Pierre-Louis Bossart 2024-05-27  1827  	return &pdi[id];
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1828  }
5d6b3c8ba12a20 Vinod Koul           2018-04-26  1829  

:::::: The code at line 1820 was first introduced by commit
:::::: 5d6b3c8ba12a20519130c6b49ac40790426efbfd soundwire: cdns: Add stream routines

:::::: TO: Vinod Koul <vkoul@kernel.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
