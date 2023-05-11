Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349565B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683808928; x=1715344928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmzNDvXl6U5P1AZtl3h5XZGLSPfCQaTuaBVodOgp/D4=;
  b=mnAkWc58V/fwQ0ZR+pPwH1cIvQ71TLggVJ5ioUfqTrVs+U8iU82t8RZe
   yN8rgZ1UzC2RabXm+QEEtgwlLhfGy2mt86eoIZu+cu87GOMOniVWiKyJ1
   QvlsI2FWD9s4LuaxITV4s/eUHNzmLjr8PwZpiGi9DotxNyJf6KKKWhHda
   C3h1wGXt6Tfoacqcv8PuCFg322mJbBax/fBgfpqWhosZSE8PYKgb8nRqC
   lt/+j5Gfh32S2inJd1UvoNL84b0aMLnigKt1l32WCqCi6qloevg7+5syx
   /aREVEtlV4TofdeOL0nJDB6B9HQVSaLJLBYbj5bx5v4PvJDEgNOfiq1o5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378611618"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="378611618"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 05:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702714182"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="702714182"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2023 05:42:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px5cU-000412-0G;
	Thu, 11 May 2023 12:42:06 +0000
Date: Thu, 11 May 2023 20:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/xhci-hub.c:1805:37:
 error: implicit declaration of function 'usb_amd_pt_check_port'
Message-ID: <202305112044.901Gb35D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   7591a40aebcc68208650e4324799df61bed47bb4
commit: 96ffabef0a84bae16aff7e26ac08322a27358e1b [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230511/202305112044.901Gb35D-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=96ffabef0a84bae16aff7e26ac08322a27358e1b
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 96ffabef0a84bae16aff7e26ac08322a27358e1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305112044.901Gb35D-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci-hub.c: In function 'xhci_bus_suspend':
>> drivers/usb/host/xhci-hub.c:1805:37: error: implicit declaration of function 'usb_amd_pt_check_port' [-Werror=implicit-function-declaration]
    1805 |                                 if (usb_amd_pt_check_port(hcd->self.controller,
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/usb_amd_pt_check_port +1805 drivers/usb/host/xhci-hub.c

9777e3ce907d4cb Andiry Xu         2010-10-14  1713  
9777e3ce907d4cb Andiry Xu         2010-10-14  1714  int xhci_bus_suspend(struct usb_hcd *hcd)
9777e3ce907d4cb Andiry Xu         2010-10-14  1715  {
9777e3ce907d4cb Andiry Xu         2010-10-14  1716  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
518e848ea8e2932 Sarah Sharp       2010-12-15  1717  	int max_ports, port_index;
20b67cf51fa6064 Sarah Sharp       2010-12-15  1718  	struct xhci_bus_state *bus_state;
9777e3ce907d4cb Andiry Xu         2010-10-14  1719  	unsigned long flags;
e740b019d7c6b4d Mathias Nyman     2018-05-21  1720  	struct xhci_hub *rhub;
e740b019d7c6b4d Mathias Nyman     2018-05-21  1721  	struct xhci_port **ports;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1722  	u32 portsc_buf[USB_MAXCHILDREN];
2f31a67f01a8beb Mathias Nyman     2018-11-15  1723  	bool wake_enabled;
9777e3ce907d4cb Andiry Xu         2010-10-14  1724  
e740b019d7c6b4d Mathias Nyman     2018-05-21  1725  	rhub = xhci_get_rhub(hcd);
e740b019d7c6b4d Mathias Nyman     2018-05-21  1726  	ports = rhub->ports;
925f349d4dca135 Mathias Nyman     2018-05-21  1727  	max_ports = rhub->num_ports;
f6187f424c10210 Mathias Nyman     2018-12-07  1728  	bus_state = &rhub->bus_state;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1729  	wake_enabled = hcd->self.root_hub->do_remote_wakeup;
9777e3ce907d4cb Andiry Xu         2010-10-14  1730  
9777e3ce907d4cb Andiry Xu         2010-10-14  1731  	spin_lock_irqsave(&xhci->lock, flags);
9777e3ce907d4cb Andiry Xu         2010-10-14  1732  
2f31a67f01a8beb Mathias Nyman     2018-11-15  1733  	if (wake_enabled) {
fac4271d1126c45 Zhuang Jin Can    2015-07-21  1734  		if (bus_state->resuming_ports ||	/* USB2 */
fac4271d1126c45 Zhuang Jin Can    2015-07-21  1735  		    bus_state->port_remote_wakeup) {	/* USB3 */
9777e3ce907d4cb Andiry Xu         2010-10-14  1736  			spin_unlock_irqrestore(&xhci->lock, flags);
669bc5a188b40a4 Mathias Nyman     2021-08-20  1737  			xhci_dbg(xhci, "usb%d bus suspend to fail because a port is resuming\n",
669bc5a188b40a4 Mathias Nyman     2021-08-20  1738  				 hcd->self.busnum);
9777e3ce907d4cb Andiry Xu         2010-10-14  1739  			return -EBUSY;
9777e3ce907d4cb Andiry Xu         2010-10-14  1740  		}
9777e3ce907d4cb Andiry Xu         2010-10-14  1741  	}
2f31a67f01a8beb Mathias Nyman     2018-11-15  1742  	/*
2f31a67f01a8beb Mathias Nyman     2018-11-15  1743  	 * Prepare ports for suspend, but don't write anything before all ports
2f31a67f01a8beb Mathias Nyman     2018-11-15  1744  	 * are checked and we know bus suspend can proceed
2f31a67f01a8beb Mathias Nyman     2018-11-15  1745  	 */
20b67cf51fa6064 Sarah Sharp       2010-12-15  1746  	bus_state->bus_suspended = 0;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1747  	port_index = max_ports;
518e848ea8e2932 Sarah Sharp       2010-12-15  1748  	while (port_index--) {
9777e3ce907d4cb Andiry Xu         2010-10-14  1749  		u32 t1, t2;
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1750  		int retries = 10;
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1751  retry:
e740b019d7c6b4d Mathias Nyman     2018-05-21  1752  		t1 = readl(ports[port_index]->addr);
9777e3ce907d4cb Andiry Xu         2010-10-14  1753  		t2 = xhci_port_state_to_neutral(t1);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1754  		portsc_buf[port_index] = 0;
9777e3ce907d4cb Andiry Xu         2010-10-14  1755  
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1756  		/*
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1757  		 * Give a USB3 port in link training time to finish, but don't
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1758  		 * prevent suspend as port might be stuck
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1759  		 */
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1760  		if ((hcd->speed >= HCD_USB3) && retries-- &&
45f750c16cae362 Mathias Nyman     2018-12-14  1761  		    (t1 & PORT_PLS_MASK) == XDEV_POLLING) {
9777e3ce907d4cb Andiry Xu         2010-10-14  1762  			spin_unlock_irqrestore(&xhci->lock, flags);
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1763  			msleep(XHCI_PORT_POLLING_LFPS_TIME);
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1764  			spin_lock_irqsave(&xhci->lock, flags);
8aaf19b8ec78748 Kai-Heng Feng     2020-07-23  1765  			xhci_dbg(xhci, "port %d-%d polling in bus suspend, waiting\n",
8aaf19b8ec78748 Kai-Heng Feng     2020-07-23  1766  				 hcd->self.busnum, port_index + 1);
d92f2c59cc2cbca Mathias Nyman     2019-03-22  1767  			goto retry;
9777e3ce907d4cb Andiry Xu         2010-10-14  1768  		}
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1769  		/* bail out if port detected a over-current condition */
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1770  		if (t1 & PORT_OC) {
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1771  			bus_state->bus_suspended = 0;
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1772  			spin_unlock_irqrestore(&xhci->lock, flags);
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1773  			xhci_dbg(xhci, "Bus suspend bailout, port over-current detected\n");
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1774  			return -EBUSY;
e9fb08d617bfae5 Mathias Nyman     2020-04-21  1775  		}
2f31a67f01a8beb Mathias Nyman     2018-11-15  1776  		/* suspend ports in U0, or bail out for new connect changes */
2f31a67f01a8beb Mathias Nyman     2018-11-15  1777  		if ((t1 & PORT_PE) && (t1 & PORT_PLS_MASK) == XDEV_U0) {
2f31a67f01a8beb Mathias Nyman     2018-11-15  1778  			if ((t1 & PORT_CSC) && wake_enabled) {
2f31a67f01a8beb Mathias Nyman     2018-11-15  1779  				bus_state->bus_suspended = 0;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1780  				spin_unlock_irqrestore(&xhci->lock, flags);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1781  				xhci_dbg(xhci, "Bus suspend bailout, port connect change\n");
2f31a67f01a8beb Mathias Nyman     2018-11-15  1782  				return -EBUSY;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1783  			}
8aaf19b8ec78748 Kai-Heng Feng     2020-07-23  1784  			xhci_dbg(xhci, "port %d-%d not suspended\n",
8aaf19b8ec78748 Kai-Heng Feng     2020-07-23  1785  				 hcd->self.busnum, port_index + 1);
9777e3ce907d4cb Andiry Xu         2010-10-14  1786  			t2 &= ~PORT_PLS_MASK;
9777e3ce907d4cb Andiry Xu         2010-10-14  1787  			t2 |= PORT_LINK_STROBE | XDEV_U3;
20b67cf51fa6064 Sarah Sharp       2010-12-15  1788  			set_bit(port_index, &bus_state->bus_suspended);
9777e3ce907d4cb Andiry Xu         2010-10-14  1789  		}
4296c70a5ec3169 Sarah Sharp       2012-01-06  1790  		/* USB core sets remote wake mask for USB 3.0 hubs,
ceb6c9c862c8642 Rafael J. Wysocki 2014-11-29  1791  		 * including the USB 3.0 roothub, but only if CONFIG_PM
4296c70a5ec3169 Sarah Sharp       2012-01-06  1792  		 * is enabled, so also enable remote wake here.
4296c70a5ec3169 Sarah Sharp       2012-01-06  1793  		 */
2f31a67f01a8beb Mathias Nyman     2018-11-15  1794  		if (wake_enabled) {
9777e3ce907d4cb Andiry Xu         2010-10-14  1795  			if (t1 & PORT_CONNECT) {
9777e3ce907d4cb Andiry Xu         2010-10-14  1796  				t2 |= PORT_WKOC_E | PORT_WKDISC_E;
9777e3ce907d4cb Andiry Xu         2010-10-14  1797  				t2 &= ~PORT_WKCONN_E;
9777e3ce907d4cb Andiry Xu         2010-10-14  1798  			} else {
9777e3ce907d4cb Andiry Xu         2010-10-14  1799  				t2 |= PORT_WKOC_E | PORT_WKCONN_E;
9777e3ce907d4cb Andiry Xu         2010-10-14  1800  				t2 &= ~PORT_WKDISC_E;
9777e3ce907d4cb Andiry Xu         2010-10-14  1801  			}
bde0716d1f076e4 Joe Lee           2018-02-12  1802  
bde0716d1f076e4 Joe Lee           2018-02-12  1803  			if ((xhci->quirks & XHCI_U2_DISABLE_WAKE) &&
bde0716d1f076e4 Joe Lee           2018-02-12  1804  			    (hcd->speed < HCD_USB3)) {
bde0716d1f076e4 Joe Lee           2018-02-12 @1805  				if (usb_amd_pt_check_port(hcd->self.controller,
bde0716d1f076e4 Joe Lee           2018-02-12  1806  							  port_index))
bde0716d1f076e4 Joe Lee           2018-02-12  1807  					t2 &= ~PORT_WAKE_BITS;
bde0716d1f076e4 Joe Lee           2018-02-12  1808  			}
9777e3ce907d4cb Andiry Xu         2010-10-14  1809  		} else
9777e3ce907d4cb Andiry Xu         2010-10-14  1810  			t2 &= ~PORT_WAKE_BITS;
9777e3ce907d4cb Andiry Xu         2010-10-14  1811  
9777e3ce907d4cb Andiry Xu         2010-10-14  1812  		t1 = xhci_port_state_to_neutral(t1);
9777e3ce907d4cb Andiry Xu         2010-10-14  1813  		if (t1 != t2)
2f31a67f01a8beb Mathias Nyman     2018-11-15  1814  			portsc_buf[port_index] = t2;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1815  	}
2f31a67f01a8beb Mathias Nyman     2018-11-15  1816  
2f31a67f01a8beb Mathias Nyman     2018-11-15  1817  	/* write port settings, stopping and suspending ports if needed */
2f31a67f01a8beb Mathias Nyman     2018-11-15  1818  	port_index = max_ports;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1819  	while (port_index--) {
2f31a67f01a8beb Mathias Nyman     2018-11-15  1820  		if (!portsc_buf[port_index])
2f31a67f01a8beb Mathias Nyman     2018-11-15  1821  			continue;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1822  		if (test_bit(port_index, &bus_state->bus_suspended)) {
2f31a67f01a8beb Mathias Nyman     2018-11-15  1823  			int slot_id;
2f31a67f01a8beb Mathias Nyman     2018-11-15  1824  
2f31a67f01a8beb Mathias Nyman     2018-11-15  1825  			slot_id = xhci_find_slot_id_by_port(hcd, xhci,
2f31a67f01a8beb Mathias Nyman     2018-11-15  1826  							    port_index + 1);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1827  			if (slot_id) {
2f31a67f01a8beb Mathias Nyman     2018-11-15  1828  				spin_unlock_irqrestore(&xhci->lock, flags);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1829  				xhci_stop_device(xhci, slot_id, 1);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1830  				spin_lock_irqsave(&xhci->lock, flags);
2f31a67f01a8beb Mathias Nyman     2018-11-15  1831  			}
2f31a67f01a8beb Mathias Nyman     2018-11-15  1832  		}
2f31a67f01a8beb Mathias Nyman     2018-11-15  1833  		writel(portsc_buf[port_index], ports[port_index]->addr);
9777e3ce907d4cb Andiry Xu         2010-10-14  1834  	}
9777e3ce907d4cb Andiry Xu         2010-10-14  1835  	hcd->state = HC_STATE_SUSPENDED;
20b67cf51fa6064 Sarah Sharp       2010-12-15  1836  	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
9777e3ce907d4cb Andiry Xu         2010-10-14  1837  	spin_unlock_irqrestore(&xhci->lock, flags);
c1373f10479b624 Li Jun            2020-12-08  1838  
c1373f10479b624 Li Jun            2020-12-08  1839  	if (bus_state->bus_suspended)
c1373f10479b624 Li Jun            2020-12-08  1840  		usleep_range(5000, 10000);
c1373f10479b624 Li Jun            2020-12-08  1841  
9777e3ce907d4cb Andiry Xu         2010-10-14  1842  	return 0;
9777e3ce907d4cb Andiry Xu         2010-10-14  1843  }
9777e3ce907d4cb Andiry Xu         2010-10-14  1844  

:::::: The code at line 1805 was first introduced by commit
:::::: bde0716d1f076e4c913c7946bcc858f71243c7a0 xhci: workaround for AMD Promontory disabled ports wakeup

:::::: TO: Joe Lee <asmt.swfae@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
