Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D202F46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676833125; x=1708369125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8S0T+6AaFy1oZADNiid+NPY+ypCasDlN+OH72CTyTo0=;
  b=IDhgJV59SSn5Q7ovL1q/eqcmkGLXbqdllX2Nk3y4n3hstfuBePeeRMBp
   JLfv3Ny5t8YKp7via9K3PQLr+O7tQyjxO316qOnxKIYUhh4113eVpe9/N
   xzx2MG19et3kqWx+9vZVsSMq2NjsfDMU7ku+v2ZbXYlYkkNFJo2pW/pZT
   osGhBdhBXHBilqg+GLue+nYl+J912MQy9/VE2cuS5dZMJ8WblLfpRpNYr
   jSyTSzlghAFi2CuVjSe3N/OEnncJZ6r7ZSnuluZHs7h9TEkeOqRqOYw8y
   /kxye4KmzEV3n+SkR+ySeREuMwpiiWc3vG46JAmuHRhbf9f/Mn7vKZ5VM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359737318"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="359737318"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845109007"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="845109007"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Feb 2023 10:58:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTotW-000DQB-1q;
	Sun, 19 Feb 2023 18:58:42 +0000
Date: Mon, 20 Feb 2023 02:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 14/54] drivers/thunderbolt/acpi.c:31:30:
 error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
Message-ID: <202302200257.opvTVAjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: f931e8ca0730986230243c7db38a5e60d9dc9ab7 [14/54] thunderbolt: Remove pci_dev from struct tb_nhi
config: loongarch-randconfig-r006-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200257.opvTVAjH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f931e8ca0730986230243c7db38a5e60d9dc9ab7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout f931e8ca0730986230243c7db38a5e60d9dc9ab7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/pci/ drivers/phy/apple/ drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200257.opvTVAjH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/of.h:22,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/thunderbolt/acpi.c:9:
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_add_link':
>> drivers/thunderbolt/acpi.c:31:30: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      31 |         if (dev_fwnode(&nhi->pdev->dev) != fwnode)
         |                              ^~~~
   include/linux/property.h:39:19: note: in definition of macro 'dev_fwnode'
      39 |         _Generic((dev),                                                 \
         |                   ^~~
>> drivers/thunderbolt/acpi.c:31:30: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      31 |         if (dev_fwnode(&nhi->pdev->dev) != fwnode)
         |                              ^~~~
   include/linux/property.h:41:49: note: in definition of macro 'dev_fwnode'
      41 |                  struct device *: __dev_fwnode)(dev)
         |                                                 ^~~
   drivers/thunderbolt/acpi.c:83:58: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      83 |                 link = device_link_add(&pdev->dev, &nhi->pdev->dev,
         |                                                          ^~~~
         |                                                          dev
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15:
   drivers/thunderbolt/acpi.c:88:39: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      88 |                         dev_dbg(&nhi->pdev->dev, "created link from %s\n",
         |                                       ^~~~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/thunderbolt/acpi.c:88:25: note: in expansion of macro 'dev_dbg'
      88 |                         dev_dbg(&nhi->pdev->dev, "created link from %s\n",
         |                         ^~~~~~~
   drivers/thunderbolt/acpi.c:91:40: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
      91 |                         dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
         |                                        ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/thunderbolt/acpi.c:91:25: note: in expansion of macro 'dev_warn'
      91 |                         dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
         |                         ^~~~~~~~
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_add_links':
   drivers/thunderbolt/acpi.c:115:39: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     115 |         if (!has_acpi_companion(&nhi->pdev->dev))
         |                                       ^~~~
         |                                       dev
   drivers/thunderbolt/acpi.c:125:32: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     125 |                 dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
         |                                ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/thunderbolt/acpi.c:125:17: note: in expansion of macro 'dev_warn'
     125 |                 dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
         |                 ^~~~~~~~
   In file included from include/linux/acpi.h:32:
   drivers/thunderbolt/acpi.c: In function 'tb_acpi_switch_find_companion':
   drivers/thunderbolt/acpi.c:322:52: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                                                    ^~~~
   include/acpi/acpi_bus.h:417:24: note: in definition of macro 'to_acpi_device_node'
     417 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                        ^~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:52: error: 'struct tb_nhi' has no member named 'pdev'; did you mean 'dev'?
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                                                    ^~~~
   include/acpi/acpi_bus.h:417:65: note: in definition of macro 'to_acpi_device_node'
     417 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                                                                 ^~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
>> include/acpi/acpi_bus.h:419:37: warning: passing argument 1 of 'is_acpi_device_node' makes pointer from integer without a cast [-Wint-conversion]
     419 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:407:54: note: expected 'const struct fwnode_handle *' but argument is of type 'int'
     407 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   In file included from include/linux/list.h:5,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17:
>> include/linux/container_of.h:19:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                        ^
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12:
>> include/linux/container_of.h:20:35: error: invalid type argument of unary '*' (have 'int')
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:420:25: note: in expansion of macro 'container_of'
     420 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:43:41: note: in expansion of macro 'to_acpi_device_node'
      43 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/acpi.c:322:31: note: in expansion of macro 'ACPI_COMPANION'
     322 |                 parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
         |                               ^~~~~~~~~~~~~~


vim +31 drivers/thunderbolt/acpi.c

b2be2b05cf3b1c Mika Westerberg   2019-04-02   13  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   14  static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
b2be2b05cf3b1c Mika Westerberg   2019-04-02   15  				    void **return_value)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   16  {
7f7b571becf373 Rafael J. Wysocki 2022-02-01   17  	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   18  	struct fwnode_handle *fwnode;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   19  	struct tb_nhi *nhi = data;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   20  	struct pci_dev *pdev;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   21  	struct device *dev;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   22  
7f7b571becf373 Rafael J. Wysocki 2022-02-01   23  	if (!adev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   24  		return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   25  
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   26  	fwnode = fwnode_find_reference(acpi_fwnode_handle(adev), "usb4-host-interface", 0);
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   27  	if (IS_ERR(fwnode))
b2be2b05cf3b1c Mika Westerberg   2019-04-02   28  		return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   29  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   30  	/* It needs to reference this NHI */
2ae18cc2269fc2 Heikki Krogerus   2022-10-24  @31  	if (dev_fwnode(&nhi->pdev->dev) != fwnode)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   32  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   33  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   34  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   35  	 * Try to find physical device walking upwards to the hierarcy.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   36  	 * We need to do this because the xHCI driver might not yet be
b2be2b05cf3b1c Mika Westerberg   2019-04-02   37  	 * bound so the USB3 SuperSpeed ports are not yet created.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   38  	 */
b2be2b05cf3b1c Mika Westerberg   2019-04-02   39  	dev = acpi_get_first_physical_node(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   40  	while (!dev) {
62fcb99bdf10fe Rafael J. Wysocki 2022-08-24   41  		adev = acpi_dev_parent(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   42  		if (!adev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   43  			break;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   44  		dev = acpi_get_first_physical_node(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   45  	}
b2be2b05cf3b1c Mika Westerberg   2019-04-02   46  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   47  	if (!dev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   48  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   49  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   50  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   51  	 * Check that the device is PCIe. This is because USB3
b2be2b05cf3b1c Mika Westerberg   2019-04-02   52  	 * SuperSpeed ports have this property and they are not power
b2be2b05cf3b1c Mika Westerberg   2019-04-02   53  	 * managed with the xHCI and the SuperSpeed hub so we create the
b2be2b05cf3b1c Mika Westerberg   2019-04-02   54  	 * link from xHCI instead.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   55  	 */
4d395c5e74398f Mario Limonciello 2020-10-26   56  	while (dev && !dev_is_pci(dev))
b2be2b05cf3b1c Mika Westerberg   2019-04-02   57  		dev = dev->parent;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   58  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   59  	if (!dev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   60  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   61  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   62  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   63  	 * Check that this actually matches the type of device we
b2be2b05cf3b1c Mika Westerberg   2019-04-02   64  	 * expect. It should either be xHCI or PCIe root/downstream
b2be2b05cf3b1c Mika Westerberg   2019-04-02   65  	 * port.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   66  	 */
b2be2b05cf3b1c Mika Westerberg   2019-04-02   67  	pdev = to_pci_dev(dev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   68  	if (pdev->class == PCI_CLASS_SERIAL_USB_XHCI ||
b2be2b05cf3b1c Mika Westerberg   2019-04-02   69  	    (pci_is_pcie(pdev) &&
b2be2b05cf3b1c Mika Westerberg   2019-04-02   70  		(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ||
b2be2b05cf3b1c Mika Westerberg   2019-04-02   71  		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   72  		const struct device_link *link;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   73  
f3380cac0c0b3a Mika Westerberg   2021-11-14   74  		/*
f3380cac0c0b3a Mika Westerberg   2021-11-14   75  		 * Make them both active first to make sure the NHI does
f3380cac0c0b3a Mika Westerberg   2021-11-14   76  		 * not runtime suspend before the consumer. The
f3380cac0c0b3a Mika Westerberg   2021-11-14   77  		 * pm_runtime_put() below then allows the consumer to
f3380cac0c0b3a Mika Westerberg   2021-11-14   78  		 * runtime suspend again (which then allows NHI runtime
f3380cac0c0b3a Mika Westerberg   2021-11-14   79  		 * suspend too now that the device link is established).
f3380cac0c0b3a Mika Westerberg   2021-11-14   80  		 */
f3380cac0c0b3a Mika Westerberg   2021-11-14   81  		pm_runtime_get_sync(&pdev->dev);
f3380cac0c0b3a Mika Westerberg   2021-11-14   82  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   83  		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
b2be2b05cf3b1c Mika Westerberg   2019-04-02   84  				       DL_FLAG_AUTOREMOVE_SUPPLIER |
f3380cac0c0b3a Mika Westerberg   2021-11-14   85  				       DL_FLAG_RPM_ACTIVE |
b2be2b05cf3b1c Mika Westerberg   2019-04-02   86  				       DL_FLAG_PM_RUNTIME);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   87  		if (link) {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   88  			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
b2be2b05cf3b1c Mika Westerberg   2019-04-02   89  				dev_name(&pdev->dev));
b2be2b05cf3b1c Mika Westerberg   2019-04-02   90  		} else {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   91  			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
b2be2b05cf3b1c Mika Westerberg   2019-04-02   92  				 dev_name(&pdev->dev));
b2be2b05cf3b1c Mika Westerberg   2019-04-02   93  		}
f3380cac0c0b3a Mika Westerberg   2021-11-14   94  
f3380cac0c0b3a Mika Westerberg   2021-11-14   95  		pm_runtime_put(&pdev->dev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   96  	}
b2be2b05cf3b1c Mika Westerberg   2019-04-02   97  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   98  out_put:
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   99  	fwnode_handle_put(fwnode);
b2be2b05cf3b1c Mika Westerberg   2019-04-02  100  	return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02  101  }
b2be2b05cf3b1c Mika Westerberg   2019-04-02  102  

:::::: The code at line 31 was first introduced by commit
:::::: 2ae18cc2269fc2d05d36bf44a8daa4404fa11dde thunderbolt: ACPI: Use the helper fwnode_find_reference()

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
