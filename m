Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C941F9406
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110962; cv=none; b=NU78r+zZlEI7QIo1CE2VHmpsbC0yvxaUqfrtp6UMjshvfFiwi4QMKCnaotaQz/l/k88cWUJcPxsC/Zm0aXCU7imD+sPKaIk9Fl5Qe/iRelSopFx3s6tI3ftR1D2afpo0Z/bKCEuu/fz0Ha4Sr71BRuQC8NytzgIR/VmYe268jsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110962; c=relaxed/simple;
	bh=EDwQsaZ2I5sVR1CGL9j+9lNMUXUsfHH7Pk4on0uy1Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtnO+hHZLkMSEtVTH1j4GG24m1fVg9jW4HoiRM4ApMv58XC5NYEd7hPreYkwt51GzldwnERxlF1XMu5Woll0bLeDk4nVMVK+WhGa49J6qBYg5jimEtQSfGista71dLBq7pRkamkq7OEMQTjZtpJEkwcpE7LcRgxchCKXE8JFR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awz+Trz5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awz+Trz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749110960; x=1780646960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EDwQsaZ2I5sVR1CGL9j+9lNMUXUsfHH7Pk4on0uy1Yg=;
  b=awz+Trz59rkFutF+Vnb+fkUxiYG3epDJUqlI3Vx3D8gdyjs3z+hoDyqj
   obe7u7a4Shqqs5fb2eN6pJlQK8a4DRtIMm2ssMfsy/aoAU9YC7uJBFu5V
   8zKhXdve3Tl/qTmasF0KrjusDTzAtahQPS9OY+lHl9XSrH8z37c1GM/a2
   9PDkHWAHTtIRJ5T6XLwFJvodT6qSUke2XMg5c8m2jMQKeG2ZZK2N85C/U
   DmeJdFXBCyO/w3Sc/Wes0G99insFJQWgKkap0lFoA3aJjh6QXWd9YJkOc
   /kpEIif9ihCv5yWLfRxmYhhKZNOVxZdW4YUBTcVu1OjWfoYNUwVBikcUR
   Q==;
X-CSE-ConnectionGUID: e6VBHoOYR3eXwovuky8Vpw==
X-CSE-MsgGUID: qQAkNLrZQS6GPfoiMv871w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51133732"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51133732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:09:19 -0700
X-CSE-ConnectionGUID: tjPDdeH0RFe4ewu9QownAQ==
X-CSE-MsgGUID: ILVGREVVRhG3WJP0ywc3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="150313399"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2025 01:09:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN5f2-0003t9-0Y;
	Thu, 05 Jun 2025 08:09:16 +0000
Date: Thu, 5 Jun 2025 16:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <202506051643.EykHDzkN-lkp@intel.com>
References: <20250530111917.1495023-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-5-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on pci/next pci/for-linus geert-renesas-drivers/renesas-clk arm64/for-next/core linus/master v6.15 next-20250605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-rz-sysc-Add-syscon-regmap-support/20250530-192256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250530111917.1495023-5-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
config: mips-randconfig-r122-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051643.EykHDzkN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051643.EykHDzkN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051643.EykHDzkN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-rzg3s-host.c:262:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         writel(RZG3S_PCI_REQISS_TR_TP0_RD, host->axi + RZG3S_PCI_REQISS);
         |                ^
   drivers/pci/controller/pcie-rzg3s-host.c:45:37: note: expanded from macro 'RZG3S_PCI_REQISS_TR_TP0_RD'
      45 | #define RZG3S_PCI_REQISS_TR_TP0_RD              FIELD_PREP(RZG3S_PCI_REQISS_TR_TYPE, 0x4)
         |                                                 ^
   drivers/pci/controller/pcie-rzg3s-host.c:307:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         writel(RZG3S_PCI_REQISS_TR_TP0_WR, host->axi + RZG3S_PCI_REQISS);
         |                ^
   drivers/pci/controller/pcie-rzg3s-host.c:46:37: note: expanded from macro 'RZG3S_PCI_REQISS_TR_TP0_WR'
      46 | #define RZG3S_PCI_REQISS_TR_TP0_WR              FIELD_PREP(RZG3S_PCI_REQISS_TR_TYPE, 0x5)
         |                                                 ^
   drivers/pci/controller/pcie-rzg3s-host.c:373:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     373 |         writel(FIELD_PREP(RZG3S_PCI_REQADR1_BUS, bus->number) |
         |                ^
>> drivers/pci/controller/pcie-rzg3s-host.c:929:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     929 |                                  FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp) == ltssm_state_l0,
         |                                  ^
>> drivers/pci/controller/pcie-rzg3s-host.c:929:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/pci/controller/pcie-rzg3s-host.c:934:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     934 |                         FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp));
         |                         ^
>> drivers/pci/controller/pcie-rzg3s-host.c:934:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     933 |                         "Could not set max link speed! LTSSM not in L0, state=%lx\n",
         |                                                                               ~~~
         |                                                                               %x
     934 |                         FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/pci/controller/pcie-rzg3s-host.c:941:15: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     941 |         link_speed = FIELD_GET(RZG3S_PCI_CFG_LINKCS_CUR_LS, lcs);
         |                      ^
   drivers/pci/controller/pcie-rzg3s-host.c:955:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     955 |                                FIELD_PREP(RZG3S_PCI_CFG_LINCS2_TARGET_LS,
         |                                ^
   drivers/pci/controller/pcie-rzg3s-host.c:1152:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1152 |         val = FIELD_GET(RZG3S_PCI_PCSTAT2_STATE_RX_DETECT, val);
         |               ^
   drivers/pci/controller/pcie-rzg3s-host.c:1383:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1383 |                            FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
         |                            ^
   drivers/pci/controller/pcie-rzg3s-host.c:1511:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1511 |                                  FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
         |                                  ^
   drivers/pci/controller/pcie-rzg3s-host.c:1577:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1577 |                                  FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
         |                                  ^
   drivers/pci/controller/pcie-rzg3s-host.c:1604:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1604 |                                  FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
         |                                  ^
   1 warning and 13 errors generated.


vim +/FIELD_PREP +262 drivers/pci/controller/pcie-rzg3s-host.c

   251	
   252	static int rzg3s_pcie_child_read_conf(struct rzg3s_pcie_host *host,
   253					      struct pci_bus *bus,
   254					      unsigned int devfn, int where,
   255					      u32 *data)
   256	{
   257		int ret;
   258	
   259		bus->ops->map_bus(bus, devfn, where);
   260	
   261		/* Set the type of request */
 > 262		writel(RZG3S_PCI_REQISS_TR_TP0_RD, host->axi + RZG3S_PCI_REQISS);
   263	
   264		/* Issue the request and wait to finish */
   265		ret = rzg3s_pcie_child_issue_request(host);
   266		if (ret)
   267			return PCIBIOS_SET_FAILED;
   268	
   269		/* Read the data */
   270		*data = readl(host->axi + RZG3S_PCI_REQRCVDAT);
   271	
   272		return PCIBIOS_SUCCESSFUL;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
