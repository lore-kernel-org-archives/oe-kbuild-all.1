Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614528F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DK/bVHa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698487880; x=1730023880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMQTDb7NiWQRJCaNunEFE6x3AhRY8Ia1XuIlkX9Ieb8=;
  b=DK/bVHa5TrTmUq/jJjb8fJEP3F+u+HzPIkFkJI+JUP8HafOntLy9ujxI
   JiXfOnS3+kZp5lMeMJ1N9FrroqoxahqYgSw7JEQCWPvk6MLhP80JKvS88
   9ZZfpGO3gzRspT1dyjti/wP1zJmNyvE8ppIt638NbAyo1bRW7MXD++wp/
   iPNaaVVUsvnU/2iyO8iUr1bMJk6vtQDTR+tSjBgUX+Zluqrcm4Y2NpGrE
   QwU84luwO4kuRmBPK2U9A+BdjC04yIpJs7prZxKzh4wFGPZqshm3HZ63v
   xUUo0egvlkpU3RfnNo7Zy4T9hSGoyPMvXCuw0KDCPz3XKMdrCSqIsUfVm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474129334"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="474129334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 03:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="1035053"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2023 03:10:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwgHj-000Bdh-0H;
	Sat, 28 Oct 2023 10:11:15 +0000
Date: Sat, 28 Oct 2023 18:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-6.7 158/325]
 drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202310281840.o9hmMviI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   c9ecd45768d19a28da1d81e19ab3663828a4fec1
commit: 79b776e0483c8c7fb4de1c0cdb957cfbdd9dc0ac [158/325] pci: hotplug: move cardbus code from drivers/pcmcia
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310281840.o9hmMviI-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281840.o9hmMviI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281840.o9hmMviI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +2816 drivers/pci/hotplug/yenta_socket.c

eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2813  
eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2814  
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2815  /**
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23 @2816   * EnE specific part. EnE bridges are register compatible with TI bridges but
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2817   * have their own test registers and more important their own little problems.
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2818   * Some fixup code to make everybody happy (TM).
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2819   */
9c183ed7a4fc96 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2820  

:::::: The code at line 2816 was first introduced by commit
:::::: 9c183ed7a4fc96052c1129a64186126014c89670 yenta_socket: copy pccard core code into driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
