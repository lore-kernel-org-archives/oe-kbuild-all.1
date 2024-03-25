Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD776BFC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711401932; cv=none; b=X1mxI77w1BkCe6r9ymsHds7ZkfaICotSWt4Lor29vNrw4k80RnyDLTpyoHyMzQ5k4kfq3z/LLHBQOx5Dv3Yx3tROrO/1l0Yq7BfibLmuc+Y40Kslzjh9dHYowNN0bdp+HxMcgaLfDeyxE1RfOIpZyi4V0MnPgQVvGk/glhHaXSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711401932; c=relaxed/simple;
	bh=Rxq3pF6WZzFy5cDg26Lund8bz5zNND+NW7pQ1GzryOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sod8IJflpj4arfdjDSfNTtmI2QOpqy13uNUQn5O2FHhU1ptXeQVrH5zmipqUrGboUcXAgTu7UuDlaFhrxhMRsyiA67nI8XnVYrg5TDWRdyCinYlXMPhJgTN6FRJI/9XSm26BY7URi18PAgPM054wRum+xPoWaVCPmxe5921F+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELr7LRtL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELr7LRtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711401928; x=1742937928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rxq3pF6WZzFy5cDg26Lund8bz5zNND+NW7pQ1GzryOM=;
  b=ELr7LRtL6PmMrNEXvDVedOOpNq+Pa00wY8WWyXvpTB4gk1HDO90icLbI
   7s4nmw52Z0oUUgWXsStiGet7ePhxQBBggyNGdoGHm4SM7ODLx/8+SRQfh
   ek/ypsN66vFQCM6BcnRstKRFgUibVVjax687IcrTJ2BZeaRls1W/25UYC
   ivvM/SYLubPpWI2AScgDXJsU9P0zMyX4PrcJTuSIHpieyefzrHR5Z1+iL
   J8LQytFBBB/k83XiZMxAyvVy1bpK+Vdynpgk1uwPNr/ZcIL14kUeBugRP
   ak58h6lYHM6/tFL13ojIlXVoKFxHsM9EiswDLjodbRZGu6eQUOenH6Z7s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="7025988"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="7025988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 14:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15799384"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2024 14:25:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roroq-000MqQ-0j;
	Mon, 25 Mar 2024 21:25:24 +0000
Date: Tue, 26 Mar 2024 05:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filepKh54x 1/4] drivers/spi/spi-rspi.c:27:10: fatal
 error: linux/spi/rspi.h: No such file or directory
Message-ID: <202403260548.Q7Uyjo07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filepKh54x
head:   a283629ddd86c38aacfda153f0faa7f3bd4419a5
commit: e7b3c4623c421b1243a73e9e8ca7fd838f88b776 [1/4] spi: rspi: Get rid of unused struct rspi_plat_data
config: i386-buildonly-randconfig-002-20240325 (https://download.01.org/0day-ci/archive/20240326/202403260548.Q7Uyjo07-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403260548.Q7Uyjo07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403260548.Q7Uyjo07-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-rspi.c:27:10: fatal error: linux/spi/rspi.h: No such file or directory
      27 | #include <linux/spi/rspi.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +27 drivers/spi/spi-rspi.c

a3633fe7aa7022 Shimoda, Yoshihiro 2012-04-20 @27  #include <linux/spi/rspi.h>
f3a14a3a4d9a54 Geert Uytterhoeven 2020-03-09  28  #include <linux/spinlock.h>
0b2182ddac4b88 Shimoda, Yoshihiro 2012-03-07  29  

:::::: The code at line 27 was first introduced by commit
:::::: a3633fe7aa7022e2e9b2b799a0cbf3d6944d8ba5 spi/rspi: add dmaengine support

:::::: TO: Shimoda, Yoshihiro <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
