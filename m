Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBD1ADE9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692660579; x=1724196579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDPOwgrPznz9jBpCb5pcTP5SBNPT9KlfVwuudS423tM=;
  b=efiWnZRfzq6uo4zae+tXpcjp7WPVBihar9rZK3bKMh4K+v+s0wVIB8ca
   Oe33ugxMpcz/LEBOcPP/Wp/ogeDu1+l4fg8yVGMfFR1iP3SpYK7tMKI2S
   lWb9Spu8kT02Piu0jLf1ko2hCMtDjbynAAyCR2aISU9ZpQmSLTIe28ups
   KNVyU6spMxhk/h8BwmjeNk4cno8ezmWOjKXUB0iD0JSMgI6QTfImns8vd
   8xpGob483I7r5Y+LUBSljm42R+yMKhea9xN13A1jlhTZjqUY3XrIvLayf
   G8qZGsXwP9Nj5McpSMTJ41nTxo8kCdoilIgrdNCjYw3nMmGXUI0/6nAUZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404727901"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404727901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765547692"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="765547692"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 16:29:36 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEL1-00013U-2a;
	Mon, 21 Aug 2023 23:29:35 +0000
Date: Tue, 22 Aug 2023 07:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-fox-pvh 2/8] include/xen/acpi.h:67:17: error:
 'acpi_suspend_lowlevel' undeclared; did you mean
 'xen_acpi_suspend_lowlevel'?
Message-ID: <202308220730.QMP3ck6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-fox-pvh
head:   d8772168691b2c723955f566a1211fba9afd19e5
commit: b6f1a467514766f7cdb4baf372a878eece68cc71 [2/8] xen/pvh: Map pirq for passthrough device on PVH dom0
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230822/202308220730.QMP3ck6U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220730.QMP3ck6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220730.QMP3ck6U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h: In function 'xen_acpi_sleep_register':
>> include/xen/acpi.h:67:17: error: 'acpi_suspend_lowlevel' undeclared (first use in this function); did you mean 'xen_acpi_suspend_lowlevel'?
      67 |                 acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 xen_acpi_suspend_lowlevel
   include/xen/acpi.h:67:17: note: each undeclared identifier is reported only once for each function it appears in


vim +67 include/xen/acpi.h

068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  58  
268a207563f933 Liu Jinsong           2013-02-14  59  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  60  {
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  61  	if (xen_initial_domain()) {
268a207563f933 Liu Jinsong           2013-02-14  62  		acpi_os_set_prepare_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  63  			&xen_acpi_notify_hypervisor_sleep);
be6b25d15f5e67 Ben Guthro            2013-07-30  64  		acpi_os_set_prepare_extended_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  65  			&xen_acpi_notify_hypervisor_extended_sleep);
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  66  
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14 @67  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  68  	}
268a207563f933 Liu Jinsong           2013-02-14  69  }
b6f1a467514766 Jiqian Chen           2023-08-04  70  int xen_pvh_passthrough_gsi(struct pci_dev *dev);
268a207563f933 Liu Jinsong           2013-02-14  71  #else
268a207563f933 Liu Jinsong           2013-02-14  72  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  73  {
268a207563f933 Liu Jinsong           2013-02-14  74  }
268a207563f933 Liu Jinsong           2013-02-14  75  #endif
268a207563f933 Liu Jinsong           2013-02-14  76  

:::::: The code at line 67 was first introduced by commit
:::::: 068e0dc7b7c1db9801e3d7f2ba5cb1d2a552a35b xen / ACPI / sleep: Register an acpi_suspend_lowlevel callback.

:::::: TO: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
