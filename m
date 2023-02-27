Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E04808
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677490778; x=1709026778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uT9msMwnQO/JIItHG+xBBIb+3wm2uwVRzS8KN9md9uU=;
  b=NqnFZ80fCn2lCOMW507dA3uQqPcX/Vrf2eoxhtlaWie+EGF1/455Nv+U
   XoAs6StdIIOdVZ14lGuVY74qpsJp/iMfvB+PWnoT8VZ5JHFuqW3db88r/
   mntvunSQzSrF6Lnl27wZ04x5TMNDDy+n4o4tGZE7FETTicd2oD4AohKd4
   if6U/eHPey2dcVGCFxKM9m2v67tNsn9GutMtqkF6ZmBu/l5xCWFMNC31d
   8c3gzw4T2ErLODWNwZuSP4EWoAKGhyQGozjD+ar0X7MHnsZ3WMnWUmgiH
   cs5C7u3yrk3HqHDZbwrlZ2dCl10YKMvLRl1UdzX2ilrrcWcOGT6bX0P1C
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336099608"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="336099608"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="762623067"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="762623067"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 01:39:36 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWZyp-0004IY-1i;
	Mon, 27 Feb 2023 09:39:35 +0000
Date: Mon, 27 Feb 2023 17:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 160/9999] drivers/usb/host/xhci-mem.c:1880:56: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202302271707.6ICImpV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   271575bc1159139f841635982e75c891e07ff30a
commit: 5dfdaa15caebc782d1c90ff6513d4cc9f6ac3663 [160/9999] ANDROID: GKI: usb: xhci: Add support for secondary interrupters
config: nios2-randconfig-s053-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271707.6ICImpV4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/5dfdaa15caebc782d1c90ff6513d4cc9f6ac3663
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 5dfdaa15caebc782d1c90ff6513d4cc9f6ac3663
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271707.6ICImpV4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/xhci-mem.c:936:6: sparse: sparse: symbol 'xhci_free_virt_devices_depth_first' was not declared. Should it be static?
>> drivers/usb/host/xhci-mem.c:1880:56: sparse: sparse: restricted __le32 degrades to integer
>> drivers/usb/host/xhci-mem.c:1840:6: sparse: sparse: symbol 'xhci_handle_sec_intr_events' was not declared. Should it be static?
>> drivers/usb/host/xhci-mem.c:1947:6: sparse: sparse: symbol 'xhci_event_ring_cleanup' was not declared. Should it be static?
>> drivers/usb/host/xhci-mem.c:2486:5: sparse: sparse: symbol 'xhci_event_ring_setup' was not declared. Should it be static?
>> drivers/usb/host/xhci-mem.c:2590:5: sparse: sparse: symbol 'xhci_event_ring_init' was not declared. Should it be static?
   drivers/usb/host/xhci-mem.c: note: in included file (through include/linux/irqflags.h, include/asm-generic/bitops.h, arch/nios2/include/generated/asm/bitops.h, ...):
   arch/nios2/include/asm/irqflags.h:25:16: sparse: sparse: undefined identifier '__builtin_rdctl'
   drivers/usb/host/xhci-mem.c:936:6: warning: no previous prototype for 'xhci_free_virt_devices_depth_first' [-Wmissing-prototypes]
     936 | void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:1840:6: warning: no previous prototype for 'xhci_handle_sec_intr_events' [-Wmissing-prototypes]
    1840 | void xhci_handle_sec_intr_events(struct xhci_hcd *xhci, int intr_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:1947:6: warning: no previous prototype for 'xhci_event_ring_cleanup' [-Wmissing-prototypes]
    1947 | void xhci_event_ring_cleanup(struct xhci_hcd *xhci)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2486:5: warning: no previous prototype for 'xhci_event_ring_setup' [-Wmissing-prototypes]
    2486 | int xhci_event_ring_setup(struct xhci_hcd *xhci, struct xhci_ring **er,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2590:5: warning: no previous prototype for 'xhci_event_ring_init' [-Wmissing-prototypes]
    2590 | int xhci_event_ring_init(struct xhci_hcd *xhci, gfp_t flags)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'xhci' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'num_segs' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'cycle_state' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'type' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'max_packet' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'flags' not described in 'xhci_ring_alloc'

vim +1880 drivers/usb/host/xhci-mem.c

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
> 1880					(current_trb->event_cmd.flags & TRB_CYCLE);
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
