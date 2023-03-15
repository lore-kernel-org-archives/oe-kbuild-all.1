Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82718256E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678866992; x=1710402992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9ftHGeRXaLlpkcbh58hf1RiC3roN1mjfGwzEaMGxis=;
  b=VeCQVjIApstQHpuaVA7NJyjT6kr4t8LP+zpf5GNpeOHg6wcnzdiKRPjE
   sL2LtS0DK1vh0WR+oHxHmZL5rjsC0cn9XdkRoNfQZrKTTi7r6NrSY45dx
   e9LGtgkX07AA2fl0WGM+dcHSWoOIjsYkKFloCcq/aGs0XYQF/h/WNLGVi
   UiSB8OG+SKhEM9eoxOHkRaWQ0EblShrQmjCl5vbZMYZUMmaeLrVTZdxFL
   NrnH4XtgTNUYHLoi/F+QJ32SPB0h6R/WtV6lVNUGFJsyVjgEXoPqp1y1P
   TN+cY9cb7072bo7jD3mc91LqzIL9FFKKE3DoVlb9P5rcN4hwD5FXig1lS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402511428"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="402511428"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 00:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629367653"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629367653"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 00:56:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcLzl-0007Wl-1j;
	Wed, 15 Mar 2023 07:56:25 +0000
Date: Wed, 15 Mar 2023 15:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-stable-rc:queue/5.4 63/68] drivers/tty/ehv_bytechan.c:121:27:
 error: 'NO_IRQ' undeclared; did you mean 'do_IRQ'?
Message-ID: <202303151555.yBEhtAp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   88ec32cc649883f1cbb6e0cbdd1be0cc11314709
commit: cd6ffca552d537428e7a4f48b608f76137c59532 [63/68] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230315/202303151555.yBEhtAp3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=cd6ffca552d537428e7a4f48b608f76137c59532
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout cd6ffca552d537428e7a4f48b608f76137c59532
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/tty/ drivers/uio/ drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151555.yBEhtAp3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/ehv_bytechan.c: In function 'find_console_handle':
>> drivers/tty/ehv_bytechan.c:121:27: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     121 |         if (stdout_irq == NO_IRQ) {
         |                           ^~~~~~
         |                           do_IRQ
   drivers/tty/ehv_bytechan.c:121:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/tty/ehv_bytechan.c: In function 'ehv_bc_tty_probe':
   drivers/tty/ehv_bytechan.c:699:28: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     699 |         if ((bc->rx_irq == NO_IRQ) || (bc->tx_irq == NO_IRQ)) {
         |                            ^~~~~~
         |                            do_IRQ
--
   drivers/uio/uio_fsl_elbc_gpcm.c: In function 'uio_fsl_elbc_gpcm_probe':
>> drivers/uio/uio_fsl_elbc_gpcm.c:397:20: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     397 |         if (irq != NO_IRQ) {
         |                    ^~~~~~
         |                    do_IRQ
   drivers/uio/uio_fsl_elbc_gpcm.c:397:20: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from drivers/usb/host/ehci-hcd.c:1292:
   drivers/usb/host/ehci-ppc-of.c: In function 'ehci_hcd_ppc_of_probe':
>> drivers/usb/host/ehci-ppc-of.c:122:20: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     122 |         if (irq == NO_IRQ) {
         |                    ^~~~~~
         |                    do_IRQ
   drivers/usb/host/ehci-ppc-of.c:122:20: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from drivers/usb/host/ohci-hcd.c:1255:
   drivers/usb/host/ohci-ppc-of.c: In function 'ohci_hcd_ppc_of_probe':
>> drivers/usb/host/ohci-ppc-of.c:126:20: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     126 |         if (irq == NO_IRQ) {
         |                    ^~~~~~
         |                    do_IRQ
   drivers/usb/host/ohci-ppc-of.c:126:20: note: each undeclared identifier is reported only once for each function it appears in


vim +121 drivers/tty/ehv_bytechan.c

dcd83aaff1c8cb Timur Tabi   2011-07-08  101  
dcd83aaff1c8cb Timur Tabi   2011-07-08  102  /*
dcd83aaff1c8cb Timur Tabi   2011-07-08  103   * find the byte channel handle to use for the console
dcd83aaff1c8cb Timur Tabi   2011-07-08  104   *
dcd83aaff1c8cb Timur Tabi   2011-07-08  105   * The byte channel to be used for the console is specified via a "stdout"
dcd83aaff1c8cb Timur Tabi   2011-07-08  106   * property in the /chosen node.
dcd83aaff1c8cb Timur Tabi   2011-07-08  107   */
dcd83aaff1c8cb Timur Tabi   2011-07-08  108  static int find_console_handle(void)
dcd83aaff1c8cb Timur Tabi   2011-07-08  109  {
a752ee56ad84bf Grant Likely 2014-03-28  110  	struct device_node *np = of_stdout;
dcd83aaff1c8cb Timur Tabi   2011-07-08  111  	const uint32_t *iprop;
dcd83aaff1c8cb Timur Tabi   2011-07-08  112  
dcd83aaff1c8cb Timur Tabi   2011-07-08  113  	/* We don't care what the aliased node is actually called.  We only
dcd83aaff1c8cb Timur Tabi   2011-07-08  114  	 * care if it's compatible with "epapr,hv-byte-channel", because that
a752ee56ad84bf Grant Likely 2014-03-28  115  	 * indicates that it's a byte channel node.
dcd83aaff1c8cb Timur Tabi   2011-07-08  116  	 */
a752ee56ad84bf Grant Likely 2014-03-28  117  	if (!np || !of_device_is_compatible(np, "epapr,hv-byte-channel"))
dcd83aaff1c8cb Timur Tabi   2011-07-08  118  		return 0;
dcd83aaff1c8cb Timur Tabi   2011-07-08  119  
dcd83aaff1c8cb Timur Tabi   2011-07-08  120  	stdout_irq = irq_of_parse_and_map(np, 0);
dcd83aaff1c8cb Timur Tabi   2011-07-08 @121  	if (stdout_irq == NO_IRQ) {
a73ee8438c6da1 Rob Herring  2017-07-18  122  		pr_err("ehv-bc: no 'interrupts' property in %pOF node\n", np);
dcd83aaff1c8cb Timur Tabi   2011-07-08  123  		return 0;
dcd83aaff1c8cb Timur Tabi   2011-07-08  124  	}
dcd83aaff1c8cb Timur Tabi   2011-07-08  125  
dcd83aaff1c8cb Timur Tabi   2011-07-08  126  	/*
dcd83aaff1c8cb Timur Tabi   2011-07-08  127  	 * The 'hv-handle' property contains the handle for this byte channel.
dcd83aaff1c8cb Timur Tabi   2011-07-08  128  	 */
dcd83aaff1c8cb Timur Tabi   2011-07-08  129  	iprop = of_get_property(np, "hv-handle", NULL);
dcd83aaff1c8cb Timur Tabi   2011-07-08  130  	if (!iprop) {
fff10721d8b819 Rob Herring  2018-08-27  131  		pr_err("ehv-bc: no 'hv-handle' property in %pOFn node\n",
fff10721d8b819 Rob Herring  2018-08-27  132  		       np);
dcd83aaff1c8cb Timur Tabi   2011-07-08  133  		return 0;
dcd83aaff1c8cb Timur Tabi   2011-07-08  134  	}
dcd83aaff1c8cb Timur Tabi   2011-07-08  135  	stdout_bc = be32_to_cpu(*iprop);
dcd83aaff1c8cb Timur Tabi   2011-07-08  136  	return 1;
dcd83aaff1c8cb Timur Tabi   2011-07-08  137  }
dcd83aaff1c8cb Timur Tabi   2011-07-08  138  

:::::: The code at line 121 was first introduced by commit
:::::: dcd83aaff1c8cbd5b48c152b559e0af3ea1a7b65 tty/powerpc: introduce the ePAPR embedded hypervisor byte channel driver

:::::: TO: Timur Tabi <timur@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
