Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EF15AAB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967098; cv=none; b=f2+xibL/A6KxNzTF4kLLpjjfO3i2HNd497t+HSdJA/1D+T6/4y+iB40KGX7VUPVARWznHCTuoVNBqXWHKfNsuHp+qVpcwrXUPPDWJ24qZHhurFep+lgzaueZRLzo6hc8FFvuJukxk5GtKfPKgcHPpHq8RNyVBbAUfSWDek6S/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967098; c=relaxed/simple;
	bh=17FrExctQ66YMh8g9HaZYflyY/8WgwLpLrWyhZHCQQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQ3mwbftG4yagIysXEOog+MefIYwbbVu4BrBQy4wGYo+dXABqB7ox8cLZr76YLMIq1SK6NTfrG7UoRcnEyF90qAjKjoZdvbm32nmH8cAp7526DH1qHy6Ey6F8edBz6vaMgGI35MEOyil+tJx8vXNLfInd8Wc1ni5G0iHz7WZVuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Anc/h5bg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Anc/h5bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713967097; x=1745503097;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=17FrExctQ66YMh8g9HaZYflyY/8WgwLpLrWyhZHCQQM=;
  b=Anc/h5bgMd7Rj5N3sExTWsw1H39lca+xWIreBvi0B0Pg1ojcauF1OrvF
   4+p8sevHo6wXgo7rHRfEGTVig//p++50CQskw9L6iU5QC9YyQRbtVIgk6
   vJY2JgWNwW+Vel2oWyFfUVueqBXZjcGIo9mtV4hwCwNvZ2/oO/yScxvD2
   MzElJy0tIR8dNfx0vAv9riBHNkGWgAvIVxpE1PJPKOCqmcihB/tX9HRzk
   bT+bVOQoZ4iY21ozagVam0II1RIKAj5lKzkwKVxQGzvk06iYxU8JY2DHA
   vbHXECktFurgNGWjUOjMjSx+7QM+yPM1fHadhLpFUwJ3pxQt/rzl58wB8
   A==;
X-CSE-ConnectionGUID: pBbgFk+eTL2ShKZP/LdpBQ==
X-CSE-MsgGUID: vo16mUKER/StUihYJUrT5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10136832"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="10136832"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 06:58:16 -0700
X-CSE-ConnectionGUID: k/1766Q6SBK6DTrTGTjuVw==
X-CSE-MsgGUID: qD/ADGtkQwKQV6f5sd4yMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="55918864"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2024 06:58:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzd8V-0001IC-2z;
	Wed, 24 Apr 2024 13:58:11 +0000
Date: Wed, 24 Apr 2024 21:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: [linux-next:master 5890/8170] drivers/pci/pci.h:359:23: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202404242144.8931hnhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: 99ce03b849f89ae2a00addf5b5475d2bb81972f6 [5890/8170] ARC: Emulate one-byte cmpxchg
config: arc-randconfig-r122-20240424 (https://download.01.org/0day-ci/archive/20240424/202404242144.8931hnhx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404242144.8931hnhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404242144.8931hnhx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/pci-driver.c:520:42: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:520:61: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c: note: in included file (through include/linux/pci.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/pci/pci-driver.c:389:19: sparse: sparse: self-comparison always evaluates to false
   drivers/pci/pci-driver.c: note: in included file:
>> drivers/pci/pci.h:359:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got restricted pci_channel_state_t _o_ @@
   drivers/pci/pci.h:359:23: sparse:     expected unsigned long [usertype] old
   drivers/pci/pci.h:359:23: sparse:     got restricted pci_channel_state_t _o_
>> drivers/pci/pci.h:359:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got restricted pci_channel_state_t _n_ @@
   drivers/pci/pci.h:359:23: sparse:     expected unsigned long [usertype] new
   drivers/pci/pci.h:359:23: sparse:     got restricted pci_channel_state_t _n_
   drivers/pci/pci.h:359:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pci.h:363:23: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] old @@     got restricted pci_channel_state_t _o_ @@
   drivers/pci/pci.h:363:23: sparse:     expected unsigned long [usertype] old
   drivers/pci/pci.h:363:23: sparse:     got restricted pci_channel_state_t _o_
   drivers/pci/pci.h:363:23: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] new @@     got restricted pci_channel_state_t _n_ @@
   drivers/pci/pci.h:363:23: sparse:     expected unsigned long [usertype] new
   drivers/pci/pci.h:363:23: sparse:     got restricted pci_channel_state_t _n_
   drivers/pci/pci.h:363:23: sparse: sparse: cast to restricted pci_channel_state_t

vim +359 drivers/pci/pci.h

ac04840350e2c2 Lukas Wunner         2023-03-11  337  
a6bd101b8f84f9 Keith Busch          2018-09-20  338  /**
a6bd101b8f84f9 Keith Busch          2018-09-20  339   * pci_dev_set_io_state - Set the new error state if possible.
a6bd101b8f84f9 Keith Busch          2018-09-20  340   *
347269c113f10f Krzysztof Wilczyński 2021-07-03  341   * @dev: PCI device to set new error_state
347269c113f10f Krzysztof Wilczyński 2021-07-03  342   * @new: the state we want dev to be in
a6bd101b8f84f9 Keith Busch          2018-09-20  343   *
74ff8864cc842b Lukas Wunner         2023-01-20  344   * If the device is experiencing perm_failure, it has to remain in that state.
74ff8864cc842b Lukas Wunner         2023-01-20  345   * Any other transition is allowed.
a6bd101b8f84f9 Keith Busch          2018-09-20  346   *
a6bd101b8f84f9 Keith Busch          2018-09-20  347   * Returns true if state has been changed to the requested state.
a6bd101b8f84f9 Keith Busch          2018-09-20  348   */
a6bd101b8f84f9 Keith Busch          2018-09-20  349  static inline bool pci_dev_set_io_state(struct pci_dev *dev,
a6bd101b8f84f9 Keith Busch          2018-09-20  350  					pci_channel_state_t new)
a6bd101b8f84f9 Keith Busch          2018-09-20  351  {
74ff8864cc842b Lukas Wunner         2023-01-20  352  	pci_channel_state_t old;
a6bd101b8f84f9 Keith Busch          2018-09-20  353  
a6bd101b8f84f9 Keith Busch          2018-09-20  354  	switch (new) {
a6bd101b8f84f9 Keith Busch          2018-09-20  355  	case pci_channel_io_perm_failure:
74ff8864cc842b Lukas Wunner         2023-01-20  356  		xchg(&dev->error_state, pci_channel_io_perm_failure);
74ff8864cc842b Lukas Wunner         2023-01-20  357  		return true;
a6bd101b8f84f9 Keith Busch          2018-09-20  358  	case pci_channel_io_frozen:
74ff8864cc842b Lukas Wunner         2023-01-20 @359  		old = cmpxchg(&dev->error_state, pci_channel_io_normal,
74ff8864cc842b Lukas Wunner         2023-01-20  360  			      pci_channel_io_frozen);
74ff8864cc842b Lukas Wunner         2023-01-20  361  		return old != pci_channel_io_perm_failure;
a6bd101b8f84f9 Keith Busch          2018-09-20  362  	case pci_channel_io_normal:
74ff8864cc842b Lukas Wunner         2023-01-20  363  		old = cmpxchg(&dev->error_state, pci_channel_io_frozen,
74ff8864cc842b Lukas Wunner         2023-01-20  364  			      pci_channel_io_normal);
74ff8864cc842b Lukas Wunner         2023-01-20  365  		return old != pci_channel_io_perm_failure;
74ff8864cc842b Lukas Wunner         2023-01-20  366  	default:
74ff8864cc842b Lukas Wunner         2023-01-20  367  		return false;
a6bd101b8f84f9 Keith Busch          2018-09-20  368  	}
a6bd101b8f84f9 Keith Busch          2018-09-20  369  }
89ee9f7680031d Keith Busch          2017-03-29  370  

:::::: The code at line 359 was first introduced by commit
:::::: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
