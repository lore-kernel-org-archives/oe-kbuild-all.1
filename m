Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09041B26A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBZks0Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215196; x=1728751196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1ZFeff2FC+/axoCPBEmU86xwJXgzwT7MgIqAA9nOyk=;
  b=SBZks0Lp9gLoGFnRKwQmAMfVO9xo0kcH4J1uwpvrkVt5G53+DCfgUPDL
   VzyVnKnild2HuR44kcJfyudvxSxCY/jP3Ntd0774DSo/lM9lwnEMj4LwP
   vwNl7P8ZQ02XGLZCnWA2oLS+pJ5R8IviYHKwHZtcLqeAPa0dj9y97iGeF
   jLBbkNgYsdu65AGs1FZipkzPhigeDvySlMKqDrvp8UfjfRovjFwyZF9p1
   uAm2iVMykUlcK9NqtFAWSm25GN4ElkcDiFVA4k5HSSFnLFXiZLX5LZnOU
   MqnaJrdCsMvUq8EmPWl/njKvxFa4rw2/l7kOKdYStcWr+wHpancFQUZeK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385058259"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385058259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871146758"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="871146758"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 09:39:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLCY-000589-1p;
	Fri, 13 Oct 2023 16:39:50 +0000
Date: Sat, 14 Oct 2023 00:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: undefined reference to `.L874'
Message-ID: <202310140044.PAShwiKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   10a6e5feccb877c3c75ad11d27942ad52c24815f
commit: 079c8d9da26ed041a54706de68b754337e6df17e mtd: rawnand: export 'nand_exit_status_op()'
date:   3 months ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140044.PAShwiKd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140044.PAShwiKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140044.PAShwiKd-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/nand/raw/nand_base.o: in function `nand_do_write_ops':
>> (.text+0x4a24): undefined reference to `.L874'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
