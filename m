Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE68172A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727135695; cv=none; b=Rtfd0S4TayhJ9xxTdHIai4TDyc29j0iWids707b+CdRzbBUK7irmAs9XwNkZjKCO513Ws2ld8XaHxN4oOYD/p+V4kbFQ6l/RkmPxjID5JJMGx2K+31NYz/I8XhyGRvELIlMm3Q0MyP+C1A0TkHb7m4p7P0Gb+QBHXjCEbuWuIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727135695; c=relaxed/simple;
	bh=NlU0qZSAQMt2YvJ9+HFA+NBdfvP1oFOC4Ez8Y1XLDzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ckm1Wu/oEfzPZBuZtBUs1v0zLpAFgJt/8mUeChfGyEKlV70rna/6eY5gwsbVQQE0muj8ajsuJ/61RwHRTtkWdhZhnvowroBTx40cea9Nz9+m2bt0kFtd7SGrxedY7rGq0cWCPbiRA8Vqj90MKkpd8DlLSW7ZmFObzptaQ+EWM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEPT+6RS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEPT+6RS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727135694; x=1758671694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlU0qZSAQMt2YvJ9+HFA+NBdfvP1oFOC4Ez8Y1XLDzw=;
  b=hEPT+6RSQXcJpyCuFJNjM4SlDgJWWtHtn6kkODZtOUYPNgCpZX9JTkDe
   MTVFn+47jqTL+3MU1TisLc6icYbWRLp0cVKTa/3YJCfSXPc9UFKKzWmg/
   vA/reQgtLtc1VXDNmJconIfOWW7mdoakZ8T/wlP2YHtKpQj/c8KdOY2fi
   vnzx6X4ctlNvPBv7rcMunrqOIhXta8xewSMbfElPBMBbVriDsFO5+Amhs
   LdzFEy8IHXFSTSFO9sGluAqmRtM5AUjV5PEpO9GkqYaqAUDowZ35GLtVb
   b1nI7Bs9Pik0B4/wSfcgueam1TA5HfSeLzp+AniDNh/81UCFKpPro2nk/
   w==;
X-CSE-ConnectionGUID: sIl9/7C8TEqFzXp2bG8zhQ==
X-CSE-MsgGUID: 3EVcKBFvRpqRF9/2OsTTCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26228656"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26228656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 16:54:53 -0700
X-CSE-ConnectionGUID: KoHwqwHuTiyqAuDfRT862w==
X-CSE-MsgGUID: 0/68c1RSQ0+9Vz6TsXHdNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76151452"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 16:54:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssstD-000Hht-1m;
	Mon, 23 Sep 2024 23:54:47 +0000
Date: Tue, 24 Sep 2024 07:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2211/2441]
 include/linux/device.h:1775:9: warning: 'ie' is used uninitialized
Message-ID: <202409240741.my95PqIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 7ed14911c89112b6b74bc41a23e143e1699c53ee [2211/2441] Build report error when config IOASID disable
config: x86_64-randconfig-075-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240741.my95PqIF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240741.my95PqIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240741.my95PqIF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:37,
                    from drivers/dma/idxd/device.c:6:
   include/linux/device.h: In function 'idxd_wq_request_irq':
>> include/linux/device.h:1775:9: warning: 'ie' is used uninitialized [-Wuninitialized]
    1775 |         dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~
   drivers/dma/idxd/device.c:1371:32: note: 'ie' was declared here
    1371 |         struct idxd_irq_entry *ie;
         |                                ^~


vim +/ie +1775 include/linux/device.h

99bcf217183e02 Joe Perches  2010-06-27  1749  
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1750  /*
663336ee262809 Joe Perches  2018-05-09  1751   * #defines for all the dev_<level> macros to prefix with whatever
663336ee262809 Joe Perches  2018-05-09  1752   * possible use of #define dev_fmt(fmt) ...
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1753   */
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1754  
663336ee262809 Joe Perches  2018-05-09  1755  #define dev_emerg(dev, fmt, ...)					\
663336ee262809 Joe Perches  2018-05-09  1756  	_dev_emerg(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1757  #define dev_crit(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09  1758  	_dev_crit(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1759  #define dev_alert(dev, fmt, ...)					\
663336ee262809 Joe Perches  2018-05-09  1760  	_dev_alert(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1761  #define dev_err(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09  1762  	_dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1763  #define dev_warn(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09  1764  	_dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1765  #define dev_notice(dev, fmt, ...)					\
663336ee262809 Joe Perches  2018-05-09  1766  	_dev_notice(dev, dev_fmt(fmt), ##__VA_ARGS__)
663336ee262809 Joe Perches  2018-05-09  1767  #define dev_info(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09  1768  	_dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1769  
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1770  #if defined(CONFIG_DYNAMIC_DEBUG)
663336ee262809 Joe Perches  2018-05-09  1771  #define dev_dbg(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09  1772  	dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1773  #elif defined(DEBUG)
663336ee262809 Joe Perches  2018-05-09  1774  #define dev_dbg(dev, fmt, ...)						\
663336ee262809 Joe Perches  2018-05-09 @1775  	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1776  #else
663336ee262809 Joe Perches  2018-05-09  1777  #define dev_dbg(dev, fmt, ...)						\
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1778  ({									\
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1779  	if (0)								\
663336ee262809 Joe Perches  2018-05-09  1780  		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1781  })
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1782  #endif
6f586e663e3b36 Hiroshi Doyu 2012-09-04  1783  

:::::: The code at line 1775 was first introduced by commit
:::::: 663336ee2628096df0ce2b546b148cb74b5249fe device: Add #define dev_fmt similar to #define pr_fmt

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
