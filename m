Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198B225D6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723238409; cv=none; b=XMA8XG0E389FPPM5RwC5Q3KRUir8+vD+OBHJ3QJKsnIa7JiOsRfE/ilryTgZkZmeLqalPauXOB+R01q3gKP0mclACcx6YvDrXi1pP8rysBjrDecyqQH5GUgsaWowUXCcKzQCbXoOunp2+u5HlXP/FMDEJsUlgpgNR3Hyrh74eTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723238409; c=relaxed/simple;
	bh=G+eU5nHfwgGjUf/lr9ABG1PW9p01Dli2brO4lyMXH0Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvcpjqD4dO8px8XjiH0m9dfeQRBeWyeLPRH/lmIyNt1ZYVorlg3FeVxD/GbYk3NM2UBHHKyR5iXmt16n3ertz2rHhhBQI5wlI9Mhb4un4w076+aMR4zyfCw0HVwau9POfeH9v5D0pycVtr+ayuIxFqwpUlKjAao25URGbTF+YbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeX5tb4M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeX5tb4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723238407; x=1754774407;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G+eU5nHfwgGjUf/lr9ABG1PW9p01Dli2brO4lyMXH0Y=;
  b=QeX5tb4MxHlY88oLpYNdM7isF3+Mv2HcAnw0FMhA7O/E3IUvtm9pA79G
   Zx3EWWwn5vCmb3hU9ryOX8QDkZVohvGz3FQt21HdYdseBZIWrcbmPAeta
   pkPsDQQXNti89FclriXrbb75D2CuROe8cx3Q/V+Ta5ecCA4DgYhgVWYfU
   YRZW2Lex12rLgFNMeIj8yJUyT4YdLM2By0cvBug4DFdY3MJX7doBHXCue
   UGaH5/IqKTcOaanPv45NENYNe6R08MOYX4LkVTm9uCi9cXXhua5kCIC/H
   0RODoxJqPYQXd3gT6eCQwIHS6pt8arTRLJbs7TnOoF4YPguiQnLHEDzJP
   g==;
X-CSE-ConnectionGUID: +ZOfH5kORKqmi8k96wQP2g==
X-CSE-MsgGUID: 9wzzy1jkRIiH/WzshZyBbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="20993511"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="20993511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 14:20:06 -0700
X-CSE-ConnectionGUID: 2DffZPhRTEiMeg9I1aMpiw==
X-CSE-MsgGUID: X3ixxzf6TaO/kinE2f339w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="58242802"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Aug 2024 14:20:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scX1m-0009H9-0K;
	Fri, 09 Aug 2024 21:20:02 +0000
Date: Sat, 10 Aug 2024 05:19:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
	Hari Nagalla <hnagalla@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 32/46] drivers/mailbox/omap-mailbox.c:635:34:
 warning: 'omap_mailbox_of_match' defined but not used
Message-ID: <202408100529.viKFbTRf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   d80245c38ed4432878e5fe309f6ba958fd2c2e8f
commit: acc3573ed94e855c69e7bec2855bc05caebc829d [32/46] remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem
config: alpha-randconfig-r061-20240809 (https://download.01.org/0day-ci/archive/20240810/202408100529.viKFbTRf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100529.viKFbTRf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100529.viKFbTRf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/omap-mailbox.c:635:34: warning: 'omap_mailbox_of_match' defined but not used [-Wunused-const-variable=]
     635 | static const struct of_device_id omap_mailbox_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/omap_mailbox_of_match +635 drivers/mailbox/omap-mailbox.c

ea2ec1e80f78e5 Suman Anna 2018-07-11  634  
75288cc66dc478 Suman Anna 2014-09-10 @635  static const struct of_device_id omap_mailbox_of_match[] = {
75288cc66dc478 Suman Anna 2014-09-10  636  	{
75288cc66dc478 Suman Anna 2014-09-10  637  		.compatible	= "ti,omap2-mailbox",
ea2ec1e80f78e5 Suman Anna 2018-07-11  638  		.data		= &omap2_data,
75288cc66dc478 Suman Anna 2014-09-10  639  	},
75288cc66dc478 Suman Anna 2014-09-10  640  	{
75288cc66dc478 Suman Anna 2014-09-10  641  		.compatible	= "ti,omap3-mailbox",
ea2ec1e80f78e5 Suman Anna 2018-07-11  642  		.data		= &omap2_data,
75288cc66dc478 Suman Anna 2014-09-10  643  	},
75288cc66dc478 Suman Anna 2014-09-10  644  	{
75288cc66dc478 Suman Anna 2014-09-10  645  		.compatible	= "ti,omap4-mailbox",
ea2ec1e80f78e5 Suman Anna 2018-07-11  646  		.data		= &omap4_data,
75288cc66dc478 Suman Anna 2014-09-10  647  	},
9c1f2a5dc2948b Suman Anna 2019-06-04  648  	{
9c1f2a5dc2948b Suman Anna 2019-06-04  649  		.compatible	= "ti,am654-mailbox",
9c1f2a5dc2948b Suman Anna 2019-06-04  650  		.data		= &omap4_data,
9c1f2a5dc2948b Suman Anna 2019-06-04  651  	},
595be654b0c23b Suman Anna 2021-02-09  652  	{
595be654b0c23b Suman Anna 2021-02-09  653  		.compatible	= "ti,am64-mailbox",
595be654b0c23b Suman Anna 2021-02-09  654  		.data		= &omap4_data,
595be654b0c23b Suman Anna 2021-02-09  655  	},
75288cc66dc478 Suman Anna 2014-09-10  656  	{
75288cc66dc478 Suman Anna 2014-09-10  657  		/* end */
75288cc66dc478 Suman Anna 2014-09-10  658  	},
75288cc66dc478 Suman Anna 2014-09-10  659  };
75288cc66dc478 Suman Anna 2014-09-10  660  MODULE_DEVICE_TABLE(of, omap_mailbox_of_match);
75288cc66dc478 Suman Anna 2014-09-10  661  

:::::: The code at line 635 was first introduced by commit
:::::: 75288cc66dc478b32e43970dd6913396526504ae mailbox/omap: add support for parsing dt devices

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
