Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFB1C17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zji8RXQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697272482; x=1728808482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPPzVIUgp0AK8vOZoDMTao+LWqWzx+vuGEpTZh7f8jQ=;
  b=Zji8RXQDnIqYnzdxiaOhSSbMPXZCQ3V0T8VZMGj+NEc1hTlNCyXuIDe+
   HbCLUfOvSru7OoOM8j2AJpX16kj+i/IaOnVwwG9dtB5XkK7EGGyD9RC4l
   gE9jOo9wexPyR840gn+yYeteTErr/DjMfv1LheZ+Ij1yUbiSBTay8P7Jn
   UgIN9Bj5OOdeogNFEWSSiXAg4Jn/ObdggUNxiqzi3WJcs8cvDv/Pgmz8D
   KBKlx2cc28bg9k5eNOfaB71VaFI1/uwiWanruMN/iagJ/ASLoVgH3RpGx
   FD6iFU5SwL3sOrbzlhH/qnX7I1FZsF5sbKSaujJzWgY+ZI2KiBZ6V8eOd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389172512"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389172512"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871400490"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871400490"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 01:34:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qra6Y-0005u1-2a;
	Sat, 14 Oct 2023 08:34:38 +0000
Date: Sat, 14 Oct 2023 16:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3282/24603]
 drivers/input/touchscreen/elan_ts.c:438:32: warning: 'elan_dev_pm_ops'
 defined but not used
Message-ID: <202310141631.2ojE1uey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 54fcaa7e7c4edc52b07400f297d45ca1035ab134 [3282/24603] MLK-10142-1 touchscreen: elan: add elan touch screen driver support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141631.2ojE1uey-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141631.2ojE1uey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141631.2ojE1uey-lkp@intel.com/

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
