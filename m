Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D3535CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442775; cv=none; b=TxzykhkhTVRJfQSU7/7JJKElG9nAs55FwOthMAYglpkPoNpQF0wzCjbaz1w3pmFQMhIfFRjx6T4cDEi94UAoKDmE3MNjVRWqAqF2AFs7z3Bb872syeurEgZ8D2iV2Zts9KbF7iCG800d92aLrRcHacQnDbU82DOMUwsVGAbS0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442775; c=relaxed/simple;
	bh=o/yyP/kE8xT7j25KM7lyamqZ/xsKaoyU1VIt9z9DoGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXLkxwb7oIi5FM9/3QibzJPgjjr+CBd15yuFGA7QC7VxPaBP9euaVdYl5RQ8GclAP2V115dwZZS9pxF8gvXiuY/PZ/jI7wxBOm5f9KkVtxM5JGftwUAP0NVj5yqlflJThJNe/UwO+cxC7rMsyXvC/GYGgb+l0C9lYOdMb/+Odq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqkzYt1i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqkzYt1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712442773; x=1743978773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/yyP/kE8xT7j25KM7lyamqZ/xsKaoyU1VIt9z9DoGk=;
  b=KqkzYt1i5MhJQhVVFc0xGpReRjju/rTx5W62HM2DzQY2QHNoDKVcgkFW
   j6ITfZVRS/fJGMp7bTgEfr3JzxdYywBwqDUz0UNuZjeRLRe/XYswexv64
   8v02bj/SyU7MnibbYOPD6etBAabGh1gPgcFPA3zP5zyQyw8xTi3pMlAEa
   nol5bs6lDGUgSLLMA+1YJe9X3/C+zhFkoayxwiJdE1SwUkiDICIbz/UXY
   H6zpcW6vhlBDnKzJgMFNw2pM1gajYdWh7x+rV6GkAsocj3jSv3nJih4pm
   g55Baf25TJDHJ862RyBgF+svedNmhcsCt97jumc5tzp8OmRBMY8UXZjBX
   w==;
X-CSE-ConnectionGUID: L0ZaboNlSvyzed9+h9Cf4Q==
X-CSE-MsgGUID: xcykPPgCST6hpZfUUwdsfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11540543"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="11540543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:32:53 -0700
X-CSE-ConnectionGUID: 1NHzTjCsRtCFZBPlasi3Yw==
X-CSE-MsgGUID: HJU7EdPRQNild/v7rmZzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19583485"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2024 15:32:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEae-0003uE-3A;
	Sat, 06 Apr 2024 22:32:48 +0000
Date: Sun, 7 Apr 2024 06:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:rw_iter 119/133]
 drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:394:9: error: 'value'
 undeclared
Message-ID: <202404070606.N3qT84JI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: e87249505c4da39cd708f06f20fe87abafb08174 [119/133] drivers/net/ethernet/amd-xgbe: convert to read/write iterators
config: i386-buildonly-randconfig-001-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070606.N3qT84JI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070606.N3qT84JI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070606.N3qT84JI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c: In function 'xi2c_reg_value_read_iter':
>> drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:394:9: error: 'value' undeclared (first use in this function)
     394 |         value = XI2C_IOREAD(pdata, pdata->debugfs_xi2c_reg);
         |         ^~~~~
   drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:394:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/value +394 drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c

5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  388  
e87249505c4da3 Bui Quang Minh   2024-04-06  389  static ssize_t xi2c_reg_value_read_iter(struct kiocb *iocb,
e87249505c4da3 Bui Quang Minh   2024-04-06  390  					struct iov_iter *to)
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  391  {
e87249505c4da3 Bui Quang Minh   2024-04-06  392  	struct xgbe_prv_data *pdata = iocb->ki_filp->private_data;
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  393  
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10 @394  	value = XI2C_IOREAD(pdata, pdata->debugfs_xi2c_reg);
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  395  
e87249505c4da3 Bui Quang Minh   2024-04-06  396  	return xgbe_common_read_iter(to, &iocb->ki_pos,
e87249505c4da3 Bui Quang Minh   2024-04-06  397  				     pdata->debugfs_xi2c_reg);
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  398  }
5ab1dcd58597c0 Lendacky, Thomas 2016-11-10  399  

:::::: The code at line 394 was first introduced by commit
:::::: 5ab1dcd58597c04f6d50980c3d5f3c2518301b31 amd-xgbe: Add I2C support for sideband communication

:::::: TO: Lendacky, Thomas <Thomas.Lendacky@amd.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
