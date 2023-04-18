Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DCE1C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681831567; x=1713367567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fS5aAMu9Iox5zskQumGKBcOP6IHBc/Vh2OlKLCNBJHU=;
  b=DmnLN6MyW81NNaXghIzhyWoq6tVxz7MtQD4COsZviiR+GPwxSCR+rrj8
   eXMo2ffzTv9aTLYuVe68uam3GraDk+ADUQ2LDCyCyxDyazN86uAAMgJXf
   +7xqGLkc6k3qk14WqbSaVidBvVD/nZpUehgsRk06ExAlFrOtP6xHW2ZTW
   hshxwoiRau6gGqnlKvr+KNV31znWndIF995HFWRLg8grhd2fB7znsHF/z
   N3PabY7ZCmP8eDdFm5xdytadDFerY/sAhVDl2thKbbIdxyTqdH+jLzbuN
   uJSlVStbLG+6Zqxv6u+FnMkGI+cFKtQA4LLKXrATPIvfKMvBmQXE7bBjb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431488251"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431488251"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 08:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815250434"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="815250434"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 08:25:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ponDM-000dg1-0R;
	Tue, 18 Apr 2023 15:25:52 +0000
Date: Tue, 18 Apr 2023 23:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14921/29414]
 drivers/usb/host/xhci-mem.c:1840:6: warning: no previous prototype for
 'xhci_handle_sec_intr_events'
Message-ID: <202304182350.OEW55YRc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hemant,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: 5dfdaa15caebc782d1c90ff6513d4cc9f6ac3663 [14921/29414] ANDROID: GKI: usb: xhci: Add support for secondary interrupters
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230418/202304182350.OEW55YRc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 5dfdaa15caebc782d1c90ff6513d4cc9f6ac3663
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/ kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182350.OEW55YRc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-mem.c:936:6: warning: no previous prototype for 'xhci_free_virt_devices_depth_first' [-Wmissing-prototypes]
     936 | void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:1840:6: warning: no previous prototype for 'xhci_handle_sec_intr_events' [-Wmissing-prototypes]
    1840 | void xhci_handle_sec_intr_events(struct xhci_hcd *xhci, int intr_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:1947:6: warning: no previous prototype for 'xhci_event_ring_cleanup' [-Wmissing-prototypes]
    1947 | void xhci_event_ring_cleanup(struct xhci_hcd *xhci)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:2486:5: warning: no previous prototype for 'xhci_event_ring_setup' [-Wmissing-prototypes]
    2486 | int xhci_event_ring_setup(struct xhci_hcd *xhci, struct xhci_ring **er,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:2590:5: warning: no previous prototype for 'xhci_event_ring_init' [-Wmissing-prototypes]
    2590 | int xhci_event_ring_init(struct xhci_hcd *xhci, gfp_t flags)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'xhci' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'num_segs' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'cycle_state' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'type' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'max_packet' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'flags' not described in 'xhci_ring_alloc'


vim +/xhci_handle_sec_intr_events +1840 drivers/usb/host/xhci-mem.c

  1839	
> 1840	void xhci_handle_sec_intr_events(struct xhci_hcd *xhci, int intr_num)
  1841	{
  1842		union xhci_trb *erdp_trb, *current_trb;
  1843		struct xhci_segment	*seg;
  1844		u64 erdp_reg;
  1845		u32 iman_reg;
  1846		dma_addr_t deq;
  1847		unsigned long segment_offset;
  1848	
  1849		/* disable irq, ack pending interrupt and ack all pending events */
  1850	
  1851		iman_reg =
  1852			readl_relaxed(&xhci->sec_ir_set[intr_num]->irq_pending);
  1853		iman_reg &= ~IMAN_IE;
  1854		writel_relaxed(iman_reg,
  1855				&xhci->sec_ir_set[intr_num]->irq_pending);
  1856		iman_reg =
  1857			readl_relaxed(&xhci->sec_ir_set[intr_num]->irq_pending);
  1858		if (iman_reg & IMAN_IP)
  1859			writel_relaxed(iman_reg,
  1860				&xhci->sec_ir_set[intr_num]->irq_pending);
  1861	
  1862		/* last acked event trb is in erdp reg  */
  1863		erdp_reg =
  1864			xhci_read_64(xhci, &xhci->sec_ir_set[intr_num]->erst_dequeue);
  1865		deq = (dma_addr_t)(erdp_reg & ~ERST_PTR_MASK);
  1866		if (!deq) {
  1867			pr_debug("%s: event ring handling not required\n", __func__);
  1868			return;
  1869		}
  1870	
  1871		seg = xhci->sec_event_ring[intr_num]->first_seg;
  1872		segment_offset = deq - seg->dma;
  1873	
  1874		/* find out virtual address of the last acked event trb */
  1875		erdp_trb = current_trb = &seg->trbs[0] +
  1876					(segment_offset/sizeof(*current_trb));
  1877	
  1878		/* read cycle state of the last acked trb to find out CCS */
  1879		xhci->sec_event_ring[intr_num]->cycle_state =
  1880					(current_trb->event_cmd.flags & TRB_CYCLE);
  1881	
  1882		while (1) {
  1883			/* last trb of the event ring: toggle cycle state */
  1884			if (current_trb == &seg->trbs[TRBS_PER_SEGMENT - 1]) {
  1885				xhci->sec_event_ring[intr_num]->cycle_state ^= 1;
  1886				current_trb = &seg->trbs[0];
  1887			} else {
  1888				current_trb++;
  1889			}
  1890	
  1891			/* cycle state transition */
  1892			if ((le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE) !=
  1893			    xhci->sec_event_ring[intr_num]->cycle_state)
  1894				break;
  1895		}
  1896	
  1897		if (erdp_trb != current_trb) {
  1898			deq =
  1899			xhci_trb_virt_to_dma(xhci->sec_event_ring[intr_num]->deq_seg,
  1900						current_trb);
  1901			if (deq == 0)
  1902				xhci_warn(xhci,
  1903					"WARN invalid SW event ring dequeue ptr.\n");
  1904			/* Update HC event ring dequeue pointer */
  1905			erdp_reg &= ERST_PTR_MASK;
  1906			erdp_reg |= ((u64) deq & (u64) ~ERST_PTR_MASK);
  1907		}
  1908	
  1909		/* Clear the event handler busy flag (RW1C); event ring is empty. */
  1910		erdp_reg |= ERST_EHB;
  1911		xhci_write_64(xhci, erdp_reg,
  1912				&xhci->sec_ir_set[intr_num]->erst_dequeue);
  1913	}
  1914	
  1915	int xhci_sec_event_ring_cleanup(struct usb_hcd *hcd, unsigned int intr_num)
  1916	{
  1917		int size;
  1918		struct xhci_hcd *xhci = hcd_to_xhci(hcd);
  1919		struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
  1920	
  1921		if (intr_num >= xhci->max_interrupters) {
  1922			xhci_err(xhci, "invalid secondary interrupter num %d\n",
  1923				intr_num);
  1924			return -EINVAL;
  1925		}
  1926	
  1927		size =
  1928		sizeof(struct xhci_erst_entry)*(xhci->sec_erst[intr_num].num_entries);
  1929		if (xhci->sec_erst[intr_num].entries) {
  1930			xhci_handle_sec_intr_events(xhci, intr_num);
  1931			dma_free_coherent(dev, size, xhci->sec_erst[intr_num].entries,
  1932					xhci->sec_erst[intr_num].erst_dma_addr);
  1933			xhci->sec_erst[intr_num].entries = NULL;
  1934		}
  1935		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed SEC ERST#%d",
  1936			intr_num);
  1937		if (xhci->sec_event_ring[intr_num])
  1938			xhci_ring_free(xhci, xhci->sec_event_ring[intr_num]);
  1939	
  1940		xhci->sec_event_ring[intr_num] = NULL;
  1941		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
  1942			"Freed sec event ring");
  1943	
  1944		return 0;
  1945	}
  1946	
> 1947	void xhci_event_ring_cleanup(struct xhci_hcd *xhci)
  1948	{
  1949		unsigned int i;
  1950	
  1951		/* sec event ring clean up */
  1952		for (i = 1; i < xhci->max_interrupters; i++)
  1953			xhci_sec_event_ring_cleanup(xhci_to_hcd(xhci), i);
  1954	
  1955		kfree(xhci->sec_ir_set);
  1956		xhci->sec_ir_set = NULL;
  1957		kfree(xhci->sec_erst);
  1958		xhci->sec_erst = NULL;
  1959		kfree(xhci->sec_event_ring);
  1960		xhci->sec_event_ring = NULL;
  1961	
  1962		/* primary event ring clean up */
  1963		xhci_free_erst(xhci, &xhci->erst);
  1964		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary ERST");
  1965		if (xhci->event_ring)
  1966			xhci_ring_free(xhci, xhci->event_ring);
  1967		xhci->event_ring = NULL;
  1968		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed priamry event ring");
  1969	}
  1970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
