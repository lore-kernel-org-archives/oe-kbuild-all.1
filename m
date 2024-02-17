Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280231CF83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708202328; cv=none; b=goXENrNOP7LRuIVJLyQNgm7NDmdxqICHMbQRyrawtQIDlUU8fntW1ApZUsqr8Jyf2xwvd7PrRNBV5a6jXU6Pn0LQ0TyXTq0MKv7NfVdPphAamF4nWiOKYAazcLTB95JP7SGssXE4sUhlfqMODUMl3PuGXWtHVrr0cb1w5FhD9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708202328; c=relaxed/simple;
	bh=y+fVO4j8MrghHv8krnKdwckTGuNiqe4HgqZ7M9Al3g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q33N6QWSIL9xiLRx5ZCjFuVLAHp3E2aRMol+npPhL2mdQYCbvwOTwUUPt4jLbzvVjslsYNrACwP7+v2gRCY8Ge7paJ2OyDV9ib1upcWe3rqET4FOHcl4949PfqG13LcflHHxG0Wdix13MTreVI0ECvRj6TDNFbOJQ0gC6z6S4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPYo/4pJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPYo/4pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708202327; x=1739738327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+fVO4j8MrghHv8krnKdwckTGuNiqe4HgqZ7M9Al3g8=;
  b=MPYo/4pJTv1cJl66aiFU8sxaSIhwJSOHCm0YRZ/XgBp3uQNZ//iBUNh0
   8+z5ZGeQYqC6wd4T29xQZR4rPzHjw/UIa9WXruhZ829E3OsI5WdzkS6vw
   B0TpS4UV72sHI2bVeaZfoXzE+i3uv5luz+rXwCVonHbwNSEviGHVmJ6y8
   GDWiPT9oQPFMLT6FiHfx82OJj4Fo3lDSUJnwuZkIi15CezBXjMkh5HIwr
   OSZiKsvoOiww1tLUHLd01t4d3cb4fqqEya8ywGdcA12w73EwUwOsJQocZ
   wgqTRZo4+Zt3VWdVOeUyiOYxumgOII9Jje8Pee1tlpyQO3QmeZ6+YnFeU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2443271"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2443271"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 12:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8724417"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2024 12:38:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbRSD-0002Ug-0K;
	Sat, 17 Feb 2024 20:38:36 +0000
Date: Sun, 18 Feb 2024 04:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 12/18] lib/spdm_requester.c:1576:13: warning:
 unused variable 'rc'
Message-ID: <202402180455.dv029WGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   1a9221ee0ae5a61b66e4577483c9af52f30c31b5
commit: ad45bf7bd4ce4b039779ecf95047c4b4c1dc0c55 [12/18] PCI/CMA: Expose in sysfs whether devices are authenticated
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240218/202402180455.dv029WGd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180455.dv029WGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180455.dv029WGd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/spdm_requester.c: In function 'authenticated_show':
>> lib/spdm_requester.c:1576:13: warning: unused variable 'rc' [-Wunused-variable]
    1576 |         int rc;
         |             ^~


vim +/rc +1576 lib/spdm_requester.c

  1571	
  1572	static ssize_t authenticated_show(struct device *dev,
  1573					  struct device_attribute *attr, char *buf)
  1574	{
  1575		struct spdm_state *spdm_state = dev_to_spdm_state(dev);
> 1576		int rc;
  1577	
  1578		if (IS_ERR(spdm_state))
  1579			return PTR_ERR(spdm_state);
  1580	
  1581		return sysfs_emit(buf, "%u\n", spdm_state->authenticated);
  1582	}
  1583	static DEVICE_ATTR_RW(authenticated);
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
