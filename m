Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FAE3AC3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695909149; x=1727445149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4US4cF/QGpAbLr9htCWoP6qqhOhpwvEAcb6whsWP2A0=;
  b=X3MvIculohek2k442SWuCdj8M6oQBqnI8hfaeiRciS8MjtxzknqdxkPu
   zcBRsJJqX2KbN79aZzoqvostfZgyM9nhpe0M6awbgCVh4MSvo0RZ9hEED
   EQjsql5qpY0S2OxpdGVbfIOWV3LLN5ZpSHhE4M2w9ocBT3cTW+c00Tz9s
   oG+o/oto1ccjeUaZkF4GTYfAZs9Y0U6zXhBfQAtV6bqCR/srAzcwLYc/O
   20Ew7uS8f2ymdEYKi2/XpAMnYxt8UbQno66IoHZhUI8MpRWornYnB8/uM
   4wPt0vT79LM9Lg1PeqfR71Cd1as2BAQvJnWtNqvXsgFuJB1OZ7dy7rIe9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468352278"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="468352278"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 06:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893034517"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="893034517"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 06:51:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlrRJ-0001Vv-1G;
	Thu, 28 Sep 2023 13:52:25 +0000
Date: Thu, 28 Sep 2023 21:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-6.7-next 161/306]
 drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202309282119.UoamFUFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: efad45b3891cfcffef6767f1ec1ab16185787eb5 [161/306] pci: hotplug: move cardbus code from drivers/pcmcia
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309282119.UoamFUFV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282119.UoamFUFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282119.UoamFUFV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +2816 drivers/pci/hotplug/yenta_socket.c

eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2813  
eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2814  
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2815  /**
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23 @2816   * EnE specific part. EnE bridges are register compatible with TI bridges but
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2817   * have their own test registers and more important their own little problems.
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2818   * Some fixup code to make everybody happy (TM).
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2819   */
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2820  

:::::: The code at line 2816 was first introduced by commit
:::::: 6541da46604098055a014521b08f183d90f2e546 yenta_socket: copy pccard core code into driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
