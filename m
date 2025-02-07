Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4EC19ABBB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921606; cv=none; b=Ril63BKsaxPh2P68rNjoZFHLky4zwXc3AhCBxAMZVqXFn4vTzMzuXrzAFAzPiuszceFAP2l3KhjfSu7w0KaUnKdYSJWqDjkFa5xONIlJF7ucyXBzuAW+H9KM8ntfMKjn56F/nvGJNyY3rPVe3HYw5qMz65u8K3ejVkQYL8+xfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921606; c=relaxed/simple;
	bh=WFlvW2qQ6O5lkW4h8HuY5whDGK8wdeCkRG5zVZ46DFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rpe2CXQ/eeaRE5CbkTI9P8oAnP+iJd9eDuxdAvkfRp8eHQEHbpabc3BqZLsLKMOuTCYA5oL3opDhjtvIHnkMxONZDH8HIBHsfCVWePd+pMMQLzIFGPNltDsHUTvrYHzloValLStOWYoHlFvP1szWj5ZOqTjTbDQ/xk5fInQ1HNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW/ISvSB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW/ISvSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738921605; x=1770457605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFlvW2qQ6O5lkW4h8HuY5whDGK8wdeCkRG5zVZ46DFo=;
  b=XW/ISvSBKM8URBeNGhFjYbuIfZqc/g+9ccP8lYwdj/lmfKMI/Ug5gf4d
   ZFnv1wpfiQw+TM0B02/KAx90tag+wvO+MRPaVjVz1oveCMqMFk2ph6XzL
   +y9BNEjUqb0zfUedTscNWJz51eygZr4VsnlL9+LwbZuDgiRRfCSefSb6/
   U8mnUUFIiiOHIeI8q/w5Xq+AZUeZDO+MgTaFyIRv+xRVxxzfj4EkZvVMQ
   nXZQx6iLRl5OSDQ9ESkHDWgZQIOOmK1u6XoZ0A06iqK+sfEVN5GtnzbTx
   idM60o5elYhFzxf4BI3ZoQOp4vaFiNNgRI4On7OXaiHvRE5iWw1rru+a2
   g==;
X-CSE-ConnectionGUID: YH3lR7t/TyGpZ61U04DYQA==
X-CSE-MsgGUID: n0KvvT6pS1i2dNa7PyPeWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64914548"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="64914548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:46:44 -0800
X-CSE-ConnectionGUID: 4NsPt4lvRZirP+V6fv+Q1Q==
X-CSE-MsgGUID: 1qAjs4XDQMKARoyd3KIrFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111331042"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2025 01:46:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgKwa-000y7l-0i;
	Fri, 07 Feb 2025 09:46:40 +0000
Date: Fri, 7 Feb 2025 17:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [linux-next:master 2057/2219] fs/f2fs/super.c:3203:5: warning: no
 previous prototype for 'f2fs_quota_sync'
Message-ID: <202502071752.J4sbl1Et-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed58d103e6da15a442ff87567898768dc3a66987
commit: 7e8588cc6b09f027f986a340092ffea747b8edce [2057/2219] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
config: arc-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071752.J4sbl1Et-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071752.J4sbl1Et-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071752.J4sbl1Et-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:3203:5: warning: no previous prototype for 'f2fs_quota_sync' [-Wmissing-prototypes]
    3203 | int f2fs_quota_sync(struct super_block *sb, int type)
         |     ^~~~~~~~~~~~~~~


vim +/f2fs_quota_sync +3203 fs/f2fs/super.c

10a26878564f27 Chao Yu 2021-10-28  3202  
af033b2aa8a874 Chao Yu 2018-09-20 @3203  int f2fs_quota_sync(struct super_block *sb, int type)
af033b2aa8a874 Chao Yu 2018-09-20  3204  {
af033b2aa8a874 Chao Yu 2018-09-20  3205  	return 0;
af033b2aa8a874 Chao Yu 2018-09-20  3206  }
af033b2aa8a874 Chao Yu 2018-09-20  3207  

:::::: The code at line 3203 was first introduced by commit
:::::: af033b2aa8a874fd5737fafe90d159136527b5b4 f2fs: guarantee journalled quota data by checkpoint

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
