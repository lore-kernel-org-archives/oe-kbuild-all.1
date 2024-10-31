Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E21CC15C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 20:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405749; cv=none; b=mWgdu2jkuxJ7yHQ6OMRfl6F8C7wHxV74azoZ0iwQjbmjU1R1wWMpLVPn5Zpirck9pgRA9rZbtH7NlUHotGgisSTIPfrg3HJ/vSHwJ8eb+NZrB2C3Wt3XKn2CvRC2QSOpubUhTu+yQ/gzixZEOuDPRTcymIDRDp44h4zFN8BvtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405749; c=relaxed/simple;
	bh=4dR6H4q/ri+zk3yP4yI9OIF1Zj2kbgtK8FGEMx4q6Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8GMmEm7tQXvpwGrMQfnuWVhRo8axwbx8J+pkQr8J/71ZRbbsC7L4SofTXKhZ29c6qyX1FmzkiLh33R1f4gdF6lgitYeUAJ49PKEZJRPR1BQSkmhKAo8P2OQJRF6lpp5xYxFFpbw5l16SoTdcBptxAci4K3gZNR6Txi2UAyK55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1lCrGHi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1lCrGHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730405746; x=1761941746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4dR6H4q/ri+zk3yP4yI9OIF1Zj2kbgtK8FGEMx4q6Y4=;
  b=c1lCrGHipi80tzdIDKbk1ROdzdx2hMiz9wvJ03XRhl8BbOWIL3oTd34V
   Pwgtf0GadlL3PNR8ubNyiBUQ5F8vOLfKG7R2WqvdglQUWUDH6/PdRj062
   SUv+7m7Qb/5RAnDgoFMPwxMLgSjPlLG99qyhMq99S5QqPNdHfvXbfZPAy
   DPWGLa+feFg+8De5Zh2vyL8JZeaXQQ2+8muJGRstW3pXp6V5I5logBdv6
   5gqqeHZV1tcLe3Gjb0m9dER2CJCnXJvF5jcssC+e2lIyqNJBbKitt3QON
   kvCuJW20yKf9zs9wVrDvuN/dm04lNEgHeEvYq1kb//6aNXlPADveeR8pL
   Q==;
X-CSE-ConnectionGUID: if9lHG25Tx2dlskAGZjaAw==
X-CSE-MsgGUID: YHNVmYbYSkq4FpahAUoG3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30282998"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30282998"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:15:46 -0700
X-CSE-ConnectionGUID: Vy36aZtaTEq8tL8whTdq8g==
X-CSE-MsgGUID: kDhg2e68RWqPPUn1adSL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82411932"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 13:15:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ba2-000gg2-1C;
	Thu, 31 Oct 2024 20:15:42 +0000
Date: Fri, 1 Nov 2024 04:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 24/42]
 drivers/platform/x86/amd/hsmp/plat.c:105:68: error: request for member
 'root' in something not a structure or union
Message-ID: <202411010402.swXL37rr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Suma,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   df7f9acd8646bfad565e6d68a293ec0d8e3f2108
commit: 7d3135d16356f1f0adda7e76d4a747f618263db4 [24/42] platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers
config: i386-buildonly-randconfig-004-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010402.swXL37rr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010402.swXL37rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010402.swXL37rr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/amd/hsmp/plat.c: In function 'init_platform_device':
>> drivers/platform/x86/amd/hsmp/plat.c:105:68: warning: dereferencing 'void *' pointer
     105 |                 sock->root                      = node_to_amd_nb(i)->root;
         |                                                                    ^~
>> drivers/platform/x86/amd/hsmp/plat.c:105:68: error: request for member 'root' in something not a structure or union

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_PERFORMANCE [=y] && GCC_PLUGINS [=y] && MODULES [=y]


vim +/root +105 drivers/platform/x86/amd/hsmp/plat.c

e47c018a0ee696 Suma Hegde 2024-10-21   95  
7d3135d16356f1 Suma Hegde 2024-10-21   96  static int init_platform_device(struct device *dev)
e47c018a0ee696 Suma Hegde 2024-10-21   97  {
e47c018a0ee696 Suma Hegde 2024-10-21   98  	struct hsmp_socket *sock;
e47c018a0ee696 Suma Hegde 2024-10-21   99  	int ret, i;
e47c018a0ee696 Suma Hegde 2024-10-21  100  
8e75dff56e003c Suma Hegde 2024-10-21  101  	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
e47c018a0ee696 Suma Hegde 2024-10-21  102  		if (!node_to_amd_nb(i))
e47c018a0ee696 Suma Hegde 2024-10-21  103  			return -ENODEV;
8e75dff56e003c Suma Hegde 2024-10-21  104  		sock = &hsmp_pdev.sock[i];
e47c018a0ee696 Suma Hegde 2024-10-21 @105  		sock->root			= node_to_amd_nb(i)->root;
e47c018a0ee696 Suma Hegde 2024-10-21  106  		sock->sock_ind			= i;
e47c018a0ee696 Suma Hegde 2024-10-21  107  		sock->dev			= dev;
e47c018a0ee696 Suma Hegde 2024-10-21  108  		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
e47c018a0ee696 Suma Hegde 2024-10-21  109  		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
e47c018a0ee696 Suma Hegde 2024-10-21  110  
e47c018a0ee696 Suma Hegde 2024-10-21  111  		/*
e47c018a0ee696 Suma Hegde 2024-10-21  112  		 * This is a transitional change from non-ACPI to ACPI, only
e47c018a0ee696 Suma Hegde 2024-10-21  113  		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
e47c018a0ee696 Suma Hegde 2024-10-21  114  		 */
e47c018a0ee696 Suma Hegde 2024-10-21  115  		if (is_f1a_m0h())
e47c018a0ee696 Suma Hegde 2024-10-21  116  			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
e47c018a0ee696 Suma Hegde 2024-10-21  117  		else
e47c018a0ee696 Suma Hegde 2024-10-21  118  			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
e47c018a0ee696 Suma Hegde 2024-10-21  119  
e47c018a0ee696 Suma Hegde 2024-10-21  120  		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
e47c018a0ee696 Suma Hegde 2024-10-21  121  		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
e47c018a0ee696 Suma Hegde 2024-10-21  122  		sema_init(&sock->hsmp_sem, 1);
e47c018a0ee696 Suma Hegde 2024-10-21  123  
e47c018a0ee696 Suma Hegde 2024-10-21  124  		/* Test the hsmp interface on each socket */
e47c018a0ee696 Suma Hegde 2024-10-21  125  		ret = hsmp_test(i, 0xDEADBEEF);
e47c018a0ee696 Suma Hegde 2024-10-21  126  		if (ret) {
e47c018a0ee696 Suma Hegde 2024-10-21  127  			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
e47c018a0ee696 Suma Hegde 2024-10-21  128  				boot_cpu_data.x86, boot_cpu_data.x86_model);
e47c018a0ee696 Suma Hegde 2024-10-21  129  			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
e47c018a0ee696 Suma Hegde 2024-10-21  130  			return ret;
e47c018a0ee696 Suma Hegde 2024-10-21  131  		}
e47c018a0ee696 Suma Hegde 2024-10-21  132  
e47c018a0ee696 Suma Hegde 2024-10-21  133  		ret = hsmp_cache_proto_ver(i);
e47c018a0ee696 Suma Hegde 2024-10-21  134  		if (ret) {
e47c018a0ee696 Suma Hegde 2024-10-21  135  			dev_err(dev, "Failed to read HSMP protocol version\n");
e47c018a0ee696 Suma Hegde 2024-10-21  136  			return ret;
e47c018a0ee696 Suma Hegde 2024-10-21  137  		}
e47c018a0ee696 Suma Hegde 2024-10-21  138  	}
e47c018a0ee696 Suma Hegde 2024-10-21  139  
e47c018a0ee696 Suma Hegde 2024-10-21  140  	return 0;
e47c018a0ee696 Suma Hegde 2024-10-21  141  }
7d3135d16356f1 Suma Hegde 2024-10-21  142  

:::::: The code at line 105 was first introduced by commit
:::::: e47c018a0ee6962fe3dd895407e2c49538cc066d platform/x86/amd/hsmp: Move platform device specific code to plat.c

:::::: TO: Suma Hegde <suma.hegde@amd.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
