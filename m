Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE76ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678454962; x=1709990962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2xIdSw61BQVmNBR0WrDcyFewv+OIwZTPPE7da6pOYU=;
  b=CizEyiVbBjH/aGUz/ArA2nXVnFx9iriH7o9yxdy3OhO0AJMOHFubGzDA
   TLj6XvJM2OfX+FYBm1WPGj7uvAEfCKKPOzCNpYF78lecCd+R1W0MOd4q5
   QOWgfgl3jbuvHCNsAqVSVDsvaW9gh9cuhkmw1aghlClgHMGIFQHiqpqCv
   8g2H6nwnIfqiEbOxS3CZGMhNLKHWyaGD8EtnmeKZTx3NIA24sayKXxzpi
   Wb78k33mk9fwemczi+sugSgMID08B210iqMDneGiOZsvUw+MhCIlgT89a
   NBTL72wvATtIkv/aMo8GkhIPEH9ARjfhlwqsd/+CSJjJF5y2R7T8eQ0f8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364378940"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="364378940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 05:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851916287"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="851916287"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 05:29:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pacoB-0003st-1S;
	Fri, 10 Mar 2023 13:29:19 +0000
Date: Fri, 10 Mar 2023 21:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/property-read 60/75] drivers/usb/host/ehci-ppc-of.c:161:62:
 error: expected ';' before 'ehci'
Message-ID: <202303102146.perdZJXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/property-read
head:   74493ede940cb21df9738396bb9dc7c33d1ecc37
commit: 267fb6d23eaaeb7486efacc1dbe5eaf8a080862e [60/75] usb: Use of_property_read_bool() for boolean properties
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303102146.perdZJXU-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=267fb6d23eaaeb7486efacc1dbe5eaf8a080862e
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/property-read
        git checkout 267fb6d23eaaeb7486efacc1dbe5eaf8a080862e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102146.perdZJXU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/ehci-hcd.c:1321:
   drivers/usb/host/ehci-ppc-of.c: In function 'ehci_hcd_ppc_of_probe':
>> drivers/usb/host/ehci-ppc-of.c:160:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     160 |         if (of_property_read_bool(dn, "big-endian-desc"))
         |         ^~
   drivers/usb/host/ehci-ppc-of.c:161:43: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     161 |                 ehci->big_endian_desc = 1;of_property_present
         |                                           ^~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-ppc-of.c:161:43: warning: statement with no effect [-Wunused-value]
>> drivers/usb/host/ehci-ppc-of.c:161:62: error: expected ';' before 'ehci'
     161 |                 ehci->big_endian_desc = 1;of_property_present
         |                                                              ^
         |                                                              ;
     162 | 
     163 |         ehci->caps = hcd->regs;
         |         ~~~~                                                  


vim +161 drivers/usb/host/ehci-ppc-of.c

    92	
    93	
    94	static int ehci_hcd_ppc_of_probe(struct platform_device *op)
    95	{
    96		struct device_node *dn = op->dev.of_node;
    97		struct usb_hcd *hcd;
    98		struct ehci_hcd	*ehci = NULL;
    99		struct resource res;
   100		int irq;
   101		int rv;
   102	
   103		struct device_node *np;
   104	
   105		if (usb_disabled())
   106			return -ENODEV;
   107	
   108		dev_dbg(&op->dev, "initializing PPC-OF USB Controller\n");
   109	
   110		rv = of_address_to_resource(dn, 0, &res);
   111		if (rv)
   112			return rv;
   113	
   114		hcd = usb_create_hcd(&ehci_ppc_of_hc_driver, &op->dev, "PPC-OF USB");
   115		if (!hcd)
   116			return -ENOMEM;
   117	
   118		hcd->rsrc_start = res.start;
   119		hcd->rsrc_len = resource_size(&res);
   120	
   121		irq = irq_of_parse_and_map(dn, 0);
   122		if (!irq) {
   123			dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
   124				__FILE__);
   125			rv = -EBUSY;
   126			goto err_irq;
   127		}
   128	
   129		hcd->regs = devm_ioremap_resource(&op->dev, &res);
   130		if (IS_ERR(hcd->regs)) {
   131			rv = PTR_ERR(hcd->regs);
   132			goto err_ioremap;
   133		}
   134	
   135		ehci = hcd_to_ehci(hcd);
   136		np = of_find_compatible_node(NULL, NULL, "ibm,usb-ohci-440epx");
   137		if (np != NULL) {
   138			/* claim we really affected by usb23 erratum */
   139			if (!of_address_to_resource(np, 0, &res))
   140				ehci->ohci_hcctrl_reg =
   141					devm_ioremap(&op->dev,
   142						     res.start + OHCI_HCCTRL_OFFSET,
   143						     OHCI_HCCTRL_LEN);
   144			else
   145				pr_debug("%s: no ohci offset in fdt\n", __FILE__);
   146			if (!ehci->ohci_hcctrl_reg) {
   147				pr_debug("%s: ioremap for ohci hcctrl failed\n", __FILE__);
   148			} else {
   149				ehci->has_amcc_usb23 = 1;
   150			}
   151			of_node_put(np);
   152		}
   153	
   154		if (of_property_read_bool(dn, "big-endian")) {
   155			ehci->big_endian_mmio = 1;
   156			ehci->big_endian_desc = 1;
   157		}
   158		if (of_property_read_bool(dn, "big-endian-regs"))
   159			ehci->big_endian_mmio = 1;
 > 160		if (of_property_read_bool(dn, "big-endian-desc"))
 > 161			ehci->big_endian_desc = 1;of_property_present
   162	
   163		ehci->caps = hcd->regs;
   164	
   165		if (of_device_is_compatible(dn, "ibm,usb-ehci-440epx")) {
   166			rv = ppc44x_enable_bmt(dn);
   167			ehci_dbg(ehci, "Break Memory Transfer (BMT) is %senabled!\n",
   168					rv ? "NOT ": "");
   169		}
   170	
   171		rv = usb_add_hcd(hcd, irq, 0);
   172		if (rv)
   173			goto err_ioremap;
   174	
   175		device_wakeup_enable(hcd->self.controller);
   176		return 0;
   177	
   178	err_ioremap:
   179		irq_dispose_mapping(irq);
   180	err_irq:
   181		usb_put_hcd(hcd);
   182	
   183		return rv;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
