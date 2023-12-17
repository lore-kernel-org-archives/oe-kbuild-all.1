Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C577136F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLq0G6Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702790303; x=1734326303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=baH8IQgWf61F8UaaNIYViiBN4AN1jmx7iCpfS8CBWgo=;
  b=DLq0G6Ay22onEryDN/Y+oKmjsgVN24DzTW9+NRCv4l8NaoYPIX1QP86e
   rXhYs7u51O0Kekve5XWxKALJHs39aA7AJ4R1lhPu2wujrdxNx91qW2quY
   UdLTmbfJznmGES5F7TBNMOn3D49i8WgywIGp7CnoUDF6NleLwfWI2WRo2
   ql9Ifp4RcOI7vQHtEQFlqCNVHzc6avmvsVb5RfuLbNihvzjPnpUWiqPFI
   HDBuwbo3qNN5GS6OIzn0MkstzatpGopeM3DUNKwhffIYO3I5Lb4Slx9km
   BSW6ASTBsIPzf5Ls0vg7LRCIPTs/xYQhTAHsHWZl7CYPU0fNLxbe7KY82
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2588184"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2588184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 21:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16778410"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 21:18:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEjXe-0002gf-2X;
	Sun, 17 Dec 2023 05:18:18 +0000
Date: Sun, 17 Dec 2023 13:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3031/16025]
 drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for
 function 'get_mu_buf'
Message-ID: <202312171334.lLAYU54a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vabhav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 94cd15eaa1a2683afc6b0949be818d597f51eb2e [3031/16025] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171334.lLAYU54a-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171334.lLAYU54a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171334.lLAYU54a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for function 'get_mu_buf' [-Wmissing-prototypes]
   uint8_t *get_mu_buf(struct mbox_chan *chan)
            ^
   drivers/mailbox/imx-mailbox.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   uint8_t *get_mu_buf(struct mbox_chan *chan)
   ^
   static 
   1 warning generated.


vim +/get_mu_buf +140 drivers/mailbox/imx-mailbox.c

   139	
 > 140	uint8_t *get_mu_buf(struct mbox_chan *chan)
   141	{
   142		uint8_t *addr;
   143		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   144	
   145		addr = priv->base + priv->dcfg->xBUF;
   146		return addr;
   147	}
   148	EXPORT_SYMBOL(get_mu_buf);
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
