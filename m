Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E451DA11A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733159892; cv=none; b=NGPfo19uUMWT2ol1zBPm+rExH6hVLNkz1UpGXgu+du0qOEYcJxDsCBBe6vJR3X8chI1pXOei4ZuZXivYWOaMU1wvnKIwPKU+dh7/Vz7ZvGK6IDsNxXuYgtCwBa+Dr1H+kpLY7AGFv5DIlYOUFhcth3wCseckqBSuQNn/FgtptLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733159892; c=relaxed/simple;
	bh=9OkQViywKjq39LCAcORVOVMT9g/5vhU9wyUoRdGW+hE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ccreH89IpJ+RM5OfDDjGQkSUsepmNOpLpTitVINNPkVZgWSieeUGN3fCi1k9ZvBd5ZiAmCFAWEGDABaYR4t9QoflaBqdU+9cQD4L1qb5AXJ+rzOS/t5QD/5zS41kG1pWOyelyFk+Cn1TrC0ZWd+jlHS7RYWlze045NZKtzZzIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dO3AO3Rq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dO3AO3Rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733159891; x=1764695891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OkQViywKjq39LCAcORVOVMT9g/5vhU9wyUoRdGW+hE=;
  b=dO3AO3RqCo9OsT88psv8mCCY421bENK+XOpeHEyqT0wViGBGwtzFKyS3
   k/z4b9di5+FjxdUZGD+mvUhxcjncvDEfNGJoV9/FdWlMHbx/SL3lNhcvh
   1NbH2A9j+CqUag4G9OomdmeBzSQJ3xAS89QX8/jVtVa2q69XfpUzTM1lt
   DFg3fkLxAUX5gOi7YzkDb6NJzCfvGIr9WazpnpwrWJ0stGFidUD/b9tuv
   3IXfD68M547g0vU71Oij6eKaO0n8o/o1jz5bWr5FktC6PM4/LP97t5qDE
   ncCglai5giKF026HuG+cJ1iqK5C5SmxodTNfkhq8Ij+A5oggAY5Q4PcHZ
   A==;
X-CSE-ConnectionGUID: jd/hF7S5RQ+1xH9qIdcB8Q==
X-CSE-MsgGUID: zUbmOnm8TYi14R2uH7so/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37006581"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37006581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:18:08 -0800
X-CSE-ConnectionGUID: +giI83+1TSmvbWDB9ruinw==
X-CSE-MsgGUID: FmqsJyntQOiDdlth35aA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93492247"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 09:18:06 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIA3e-0002el-1v;
	Mon, 02 Dec 2024 17:18:03 +0000
Date: Tue, 3 Dec 2024 01:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417]
 drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype
 for 'ubcore_open'
Message-ID: <202412030157.Es0GoXeE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: 95c713224477ac3433652331dd715e9bbcbc793a [2417/2417] ub: init ubcore module
config: x86_64-buildonly-randconfig-002-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030157.Es0GoXeE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030157.Es0GoXeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030157.Es0GoXeE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_main.c:61:5: warning: no previous prototype for 'ubcore_open' [-Wmissing-prototypes]
      61 | int ubcore_open(struct inode *i_node, struct file *filp)
         |     ^~~~~~~~~~~


vim +/ubcore_open +61 drivers/ub/urma/ubcore/ubcore_main.c

    60	
  > 61	int ubcore_open(struct inode *i_node, struct file *filp)
    62	{
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
