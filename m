Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD722D78B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hz4+sstz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698339093; x=1729875093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlBSiFuZgVAjpzI9thL7DgKBdPYnumDJoGIOv4i+UeA=;
  b=Hz4+sstz0GbDboMddwI8Hn1751GgRj9ndatPxoJD1wf3vzmFhS4dwAJR
   wAVmgEgJPpw8kHzVDH5CFw795juJTN8DZUPCU4HbzDrUkYw0In9uvQu5S
   /8g7bUEYRcq+M6nU+uNb6CRKhmI6VuzwYrq66+kC++Z//zwPCi3zjRzzR
   oN9eUL6s6CI16zziwCHBqx/QLT2Yw8lq+toH8dCHNlRDHiLOBdHDDnHQk
   EYTLvxSRvoN4BtSnUwwinWsZ92s7BP85ff6PS7Zc8AHLvPGaz3109WVFj
   jjiMJuNc0pktCul05qlAEgmtHCq+vq349qTbngQmdNzEHaF0cSHEHP8Zf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="386481968"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="386481968"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 09:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="882895259"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="882895259"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2023 09:51:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw3Zw-0009xe-1x;
	Thu, 26 Oct 2023 16:51:28 +0000
Date: Fri, 27 Oct 2023 00:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [linux-next:master 14769/15220]
 drivers/pci/hotplug/acpiphp_ampere_altra.c:63:75: warning: suggest
 parentheses around arithmetic in operand of '|'
Message-ID: <202310270037.19V5rqDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
commit: 13ba8a09c4f6fd87b4919ed2dc5e0dbf27c3de7e [14769/15220] PCI: hotplug: Add Ampere Altra Attention Indicator extension driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270037.19V5rqDL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270037.19V5rqDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270037.19V5rqDL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/psci.h:10,
                    from arch/arm64/include/asm/acpi.h:14,
                    from include/acpi/acpi_io.h:7,
                    from include/linux/acpi.h:37,
                    from include/linux/pci_hotplug.h:92,
                    from drivers/pci/hotplug/acpiphp_ampere_altra.c:14:
   drivers/pci/hotplug/acpiphp_ampere_altra.c: In function 'set_attention_status':
>> drivers/pci/hotplug/acpiphp_ampere_altra.c:63:75: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
      63 |                      PCI_SLOT(root_port->devfn) << 4 | pci_domain_nr(bus) & 0xf,
         |                                                        ~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/arm-smccc.h:380:44: note: in definition of macro 'arm_smccc_smc'
     380 | #define arm_smccc_smc(...) __arm_smccc_smc(__VA_ARGS__, NULL)
         |                                            ^~~~~~~~~~~


vim +63 drivers/pci/hotplug/acpiphp_ampere_altra.c

    38	
    39	static int set_attention_status(struct hotplug_slot *slot, u8 status)
    40	{
    41		struct arm_smccc_res res;
    42		struct pci_bus *bus;
    43		struct pci_dev *root_port;
    44		unsigned long flags;
    45		u32 handle;
    46		int ret = 0;
    47	
    48		bus = slot->pci_slot->bus;
    49		root_port = pcie_find_root_port(bus->self);
    50		if (!root_port)
    51			return -ENODEV;
    52	
    53		local_irq_save(flags);
    54		arm_smccc_smc(HANDLE_OPEN, led_service_id[0], led_service_id[1],
    55			      led_service_id[2], led_service_id[3], 0, 0, 0, &res);
    56		if (res.a0) {
    57			ret = -ENODEV;
    58			goto out;
    59		}
    60		handle = res.a1 & 0xffff0000;
    61	
    62		arm_smccc_smc(REQUEST, LED_CMD, led_status(status), LED_ATTENTION,
  > 63			     PCI_SLOT(root_port->devfn) << 4 | pci_domain_nr(bus) & 0xf,
    64			     0, 0, handle, &res);
    65		if (res.a0)
    66			ret = -ENODEV;
    67	
    68		arm_smccc_smc(HANDLE_CLOSE, handle, 0, 0, 0, 0, 0, 0, &res);
    69	
    70	 out:
    71		local_irq_restore(flags);
    72		return ret;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
