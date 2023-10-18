Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361AC2FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJlxsWhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697612903; x=1729148903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DTY6PWxcfVC2rkBDHEWr5aG26LW/dArxwsZFJzhB4a4=;
  b=XJlxsWhxvVMBcpgHp2fO2/M5i1Fr0wDZ2oCCORslGoZc/Cb8rj+5ao4U
   HbNUfh89QoYqVwPa3NrBZW2uQjubwryz8wO34wOQKnjZWsk/tvkvWd93v
   tlCoF/sz66ucfSljSVX42WqjuvFaEKzFX3SZnA9N3pCLQextke0LVeDxz
   /1CFS8lPwgCZT2myi6GrKoCAqSogql+VbjQD7WU2DlAgaXeHvxnfNw6w8
   e3CAuH8j4P1q2cKfe2vk9a4fVPHnEGNsizphrNWg0uls8rULRs0Q9ywzx
   b3z4tFUljoNs9SLX/OzMWt5SCfj/rqo51+YV8MDKY1dQ2rBcMBzRDOOjx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452426776"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452426776"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826757512"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826757512"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 00:08:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt0fD-00003A-28;
	Wed, 18 Oct 2023 07:08:19 +0000
Date: Wed, 18 Oct 2023 15:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1570/30000]
 drivers/input/touchscreen/elan_ts.c:438:32: warning: 'elan_dev_pm_ops'
 defined but not used
Message-ID: <202310181427.gc0SyJIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b96148101fe98f235abc2577b8a3054e753381fb [1570/30000] MLK-10142-1 touchscreen: elan: add elan touch screen driver support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310181427.gc0SyJIO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181427.gc0SyJIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181427.gc0SyJIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/elan_ts.c:438:32: warning: 'elan_dev_pm_ops' defined but not used [-Wunused-const-variable=]
     438 | static const struct dev_pm_ops elan_dev_pm_ops = {
         |                                ^~~~~~~~~~~~~~~


vim +/elan_dev_pm_ops +438 drivers/input/touchscreen/elan_ts.c

   437	
 > 438	static const struct dev_pm_ops elan_dev_pm_ops = {
   439		.suspend = elan_suspend,
   440		.resume  = elan_resume,
   441	};
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
