Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EC246BD2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024599; cv=none; b=rWaOES1UtE8jHVLoJCgeLuaUjLUKkx4gkz4aTskA5UxSZy6A/XcSeD7bjjkgF5AHHpkVw8p8h9L8Iug8bc96qwF8DZEFLSW+nSf5gNCcwJLOmKtyi3Xuklk6jevcXSIylKuVBErHIqRACwjE3MFGKQX+iYboChw65fcUHgLaf+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024599; c=relaxed/simple;
	bh=crhoNIEPU+ru7EPcb+K8SxY12sD3WqVlenEi7kWs8fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXaWcGha7lMOWWW6AaksDyk2bBF+DUY1wpfnp48aDrD9Dre8TTQbrXyBErm+dUDA7Sld5kumnxm4GZ8OW97bjEVaRnufoSb+z7H3kezIGQMt8nEea/7OyjL/gAtiYyeVdLZzvH6FSF0s7mOm8cK69gizGqEZbw4cv/P6MGy/K74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrHrnpXb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrHrnpXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758024598; x=1789560598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crhoNIEPU+ru7EPcb+K8SxY12sD3WqVlenEi7kWs8fY=;
  b=PrHrnpXb5m0P80Ymck6g0nMB10+swDpvfbyQZR1+KtQUjnp60mTnWIdW
   weGmk591hMEdbrg/V2rpEXxl4YzSp69JPxG1P5ofD81qmJ68b/uotTZwm
   gNYOXw1LAjrCQ37oupwRNETouZ/EW+bgh0AqaK2xPDhZ2zL8d4c4YHpgL
   VlKYkvUARp1zdbYJOh5/5My3xk9/EE5LBk/uMoVgOLvaDJGPVh7I7011G
   Wq95gqJtuWp2TcIIpJtd+0KxUD3iDcVsXpFyHGSkaVnZiXyT4GPyWTBlu
   Vs0JERP8sB4ahvDZBw4dx0ej3BcnVycKHFMVyT62vixzZjoay4KRo4/7Y
   A==;
X-CSE-ConnectionGUID: PJpRQentRc6G5T4MO2Y3YA==
X-CSE-MsgGUID: vUfA0qtIRbmn6OWiMKx0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="47878004"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47878004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:09:57 -0700
X-CSE-ConnectionGUID: 5riS8jCqR4aayS+PQVO2rA==
X-CSE-MsgGUID: CeYHMKz7QE6dfRoaMSLhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="180177426"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 05:09:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyUVN-0000FT-2y;
	Tue, 16 Sep 2025 12:09:53 +0000
Date: Tue, 16 Sep 2025 20:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1784/1784]
 drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined
Message-ID: <202509162016.H2iGR5dg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1d593bdfdaff241dea4989a81386a6f45887adf2
commit: 8a64dc868d76ad19b65c65fd8168f46b4cb662cb [1784/1784] xhci: Show ZHAOXIN xHCI root hub speed correctly
config: x86_64-buildonly-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162016.H2iGR5dg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162016.H2iGR5dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509162016.H2iGR5dg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-plat.c:22:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   1 warning generated.
--
   In file included from drivers/usb/host/xhci-ext-caps.c:9:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   1 warning generated.
   In file included from drivers/usb/host/xhci-ext-caps.c:9:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   1 warning generated.
--
   In file included from drivers/usb/host/xhci-mem.c:17:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   drivers/usb/host/xhci-mem.c:936:6: warning: no previous prototype for function 'xhci_free_virt_devices_depth_first' [-Wmissing-prototypes]
     936 | void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
         |      ^
   drivers/usb/host/xhci-mem.c:936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     936 | void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
         | ^
         | static 
   2 warnings generated.
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'xhci' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'num_segs' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'cycle_state' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'type' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'max_packet' not described in 'xhci_ring_alloc'
   drivers/usb/host/xhci-mem.c:365: warning: Function parameter or member 'flags' not described in 'xhci_ring_alloc'
--
   In file included from drivers/usb/host/xhci.c:21:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   1 warning generated.
   drivers/usb/host/xhci.c:1258: warning: Function parameter or member 'desc' not described in 'xhci_get_endpoint_index'
   In file included from drivers/usb/host/xhci.c:21:
>> drivers/usb/host/xhci.h:1877:9: warning: 'XHCI_ZHAOXIN_HOST' macro redefined [-Wmacro-redefined]
    1877 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(46)
         |         ^
   drivers/usb/host/xhci.h:1875:9: note: previous definition is here
    1875 | #define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
         |         ^
   1 warning generated.


vim +/XHCI_ZHAOXIN_HOST +1877 drivers/usb/host/xhci.h

  1732	
  1733	/* There is one xhci_hcd structure per controller */
  1734	struct xhci_hcd {
  1735		struct usb_hcd *main_hcd;
  1736		struct usb_hcd *shared_hcd;
  1737		/* glue to PCI and HCD framework */
  1738		struct xhci_cap_regs __iomem *cap_regs;
  1739		struct xhci_op_regs __iomem *op_regs;
  1740		struct xhci_run_regs __iomem *run_regs;
  1741		struct xhci_doorbell_array __iomem *dba;
  1742		/* Our HCD's current interrupter register set */
  1743		struct	xhci_intr_reg __iomem *ir_set;
  1744	
  1745		/* Cached register copies of read-only HC data */
  1746		__u32		hcs_params1;
  1747		__u32		hcs_params2;
  1748		__u32		hcs_params3;
  1749		__u32		hcc_params;
  1750		__u32		hcc_params2;
  1751	
  1752		spinlock_t	lock;
  1753	
  1754		/* packed release number */
  1755		u8		sbrn;
  1756		u16		hci_version;
  1757		u8		max_slots;
  1758		u8		max_interrupters;
  1759		u8		max_ports;
  1760		u8		isoc_threshold;
  1761		/* imod_interval in ns (I * 250ns) */
  1762		u32		imod_interval;
  1763		int		event_ring_max;
  1764		/* 4KB min, 128MB max */
  1765		int		page_size;
  1766		/* Valid values are 12 to 20, inclusive */
  1767		int		page_shift;
  1768		/* msi-x vectors */
  1769		int		msix_count;
  1770		/* optional clocks */
  1771		struct clk		*clk;
  1772		struct clk		*reg_clk;
  1773		/* data structures */
  1774		struct xhci_device_context_array *dcbaa;
  1775		struct xhci_ring	*cmd_ring;
  1776		unsigned int            cmd_ring_state;
  1777	#define CMD_RING_STATE_RUNNING         (1 << 0)
  1778	#define CMD_RING_STATE_ABORTED         (1 << 1)
  1779	#define CMD_RING_STATE_STOPPED         (1 << 2)
  1780		struct list_head        cmd_list;
  1781		unsigned int		cmd_ring_reserved_trbs;
  1782		struct delayed_work	cmd_timer;
  1783		struct completion	cmd_ring_stop_completion;
  1784		struct xhci_command	*current_cmd;
  1785		struct xhci_ring	*event_ring;
  1786		struct xhci_erst	erst;
  1787		/* Scratchpad */
  1788		struct xhci_scratchpad  *scratchpad;
  1789		/* Store LPM test failed devices' information */
  1790		struct list_head	lpm_failed_devs;
  1791	
  1792		/* slot enabling and address device helpers */
  1793		/* these are not thread safe so use mutex */
  1794		struct mutex mutex;
  1795		/* For USB 3.0 LPM enable/disable. */
  1796		struct xhci_command		*lpm_command;
  1797		/* Internal mirror of the HW's dcbaa */
  1798		struct xhci_virt_device	*devs[MAX_HC_SLOTS];
  1799		/* For keeping track of bandwidth domains per roothub. */
  1800		struct xhci_root_port_bw_info	*rh_bw;
  1801	
  1802		/* DMA pools */
  1803		struct dma_pool	*device_pool;
  1804		struct dma_pool	*segment_pool;
  1805		struct dma_pool	*small_streams_pool;
  1806		struct dma_pool	*medium_streams_pool;
  1807	
  1808		/* Host controller watchdog timer structures */
  1809		unsigned int		xhc_state;
  1810	
  1811		u32			command;
  1812		struct s3_save		s3;
  1813	/* Host controller is dying - not responding to commands. "I'm not dead yet!"
  1814	 *
  1815	 * xHC interrupts have been disabled and a watchdog timer will (or has already)
  1816	 * halt the xHCI host, and complete all URBs with an -ESHUTDOWN code.  Any code
  1817	 * that sees this status (other than the timer that set it) should stop touching
  1818	 * hardware immediately.  Interrupt handlers should return immediately when
  1819	 * they see this status (any time they drop and re-acquire xhci->lock).
  1820	 * xhci_urb_dequeue() should call usb_hcd_check_unlink_urb() and return without
  1821	 * putting the TD on the canceled list, etc.
  1822	 *
  1823	 * There are no reports of xHCI host controllers that display this issue.
  1824	 */
  1825	#define XHCI_STATE_DYING	(1 << 0)
  1826	#define XHCI_STATE_HALTED	(1 << 1)
  1827	#define XHCI_STATE_REMOVING	(1 << 2)
  1828		unsigned long long	quirks;
  1829	#define	XHCI_LINK_TRB_QUIRK	BIT_ULL(0)
  1830	#define XHCI_RESET_EP_QUIRK	BIT_ULL(1)
  1831	#define XHCI_NEC_HOST		BIT_ULL(2)
  1832	#define XHCI_AMD_PLL_FIX	BIT_ULL(3)
  1833	#define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4)
  1834	/*
  1835	 * Certain Intel host controllers have a limit to the number of endpoint
  1836	 * contexts they can handle.  Ideally, they would signal that they can't handle
  1837	 * anymore endpoint contexts by returning a Resource Error for the Configure
  1838	 * Endpoint command, but they don't.  Instead they expect software to keep track
  1839	 * of the number of active endpoints for them, across configure endpoint
  1840	 * commands, reset device commands, disable slot commands, and address device
  1841	 * commands.
  1842	 */
  1843	#define XHCI_EP_LIMIT_QUIRK	BIT_ULL(5)
  1844	#define XHCI_BROKEN_MSI		BIT_ULL(6)
  1845	#define XHCI_RESET_ON_RESUME	BIT_ULL(7)
  1846	#define	XHCI_SW_BW_CHECKING	BIT_ULL(8)
  1847	#define XHCI_AMD_0x96_HOST	BIT_ULL(9)
  1848	#define XHCI_TRUST_TX_LENGTH	BIT_ULL(10)
  1849	#define XHCI_LPM_SUPPORT	BIT_ULL(11)
  1850	#define XHCI_INTEL_HOST		BIT_ULL(12)
  1851	#define XHCI_SPURIOUS_REBOOT	BIT_ULL(13)
  1852	#define XHCI_COMP_MODE_QUIRK	BIT_ULL(14)
  1853	#define XHCI_AVOID_BEI		BIT_ULL(15)
  1854	#define XHCI_PLAT		BIT_ULL(16)
  1855	#define XHCI_SLOW_SUSPEND	BIT_ULL(17)
  1856	#define XHCI_SPURIOUS_WAKEUP	BIT_ULL(18)
  1857	/* For controllers with a broken beyond repair streams implementation */
  1858	#define XHCI_BROKEN_STREAMS	BIT_ULL(19)
  1859	#define XHCI_PME_STUCK_QUIRK	BIT_ULL(20)
  1860	#define XHCI_MTK_HOST		BIT_ULL(21)
  1861	#define XHCI_SSIC_PORT_UNUSED	BIT_ULL(22)
  1862	#define XHCI_NO_64BIT_SUPPORT	BIT_ULL(23)
  1863	#define XHCI_MISSING_CAS	BIT_ULL(24)
  1864	/* For controller with a broken Port Disable implementation */
  1865	#define XHCI_BROKEN_PORT_PED	BIT_ULL(25)
  1866	#define XHCI_LIMIT_ENDPOINT_INTERVAL_7	BIT_ULL(26)
  1867	#define XHCI_U2_DISABLE_WAKE	BIT_ULL(27)
  1868	#define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	BIT_ULL(28)
  1869	#define XHCI_HW_LPM_DISABLE	BIT_ULL(29)
  1870	#define XHCI_SUSPEND_DELAY	BIT_ULL(30)
  1871	#define XHCI_INTEL_USB_ROLE_SW	BIT_ULL(31)
  1872	#define XHCI_ZERO_64B_REGS	BIT_ULL(32)
  1873	#define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
  1874	#define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
  1875	#define XHCI_ZHAOXIN_HOST       BIT_ULL(36)
  1876	#define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45)
> 1877	#define XHCI_ZHAOXIN_HOST	BIT_ULL(46)
  1878	
  1879		unsigned int		num_active_eps;
  1880		unsigned int		limit_active_eps;
  1881		/* There are two roothubs to keep track of bus suspend info for */
  1882		struct xhci_bus_state   bus_state[2];
  1883		struct xhci_port	*hw_ports;
  1884		struct xhci_hub		usb2_rhub;
  1885		struct xhci_hub		usb3_rhub;
  1886		/* support xHCI 0.96 spec USB2 software LPM */
  1887		unsigned		sw_lpm_support:1;
  1888		/* support xHCI 1.0 spec USB2 hardware LPM */
  1889		unsigned		hw_lpm_support:1;
  1890		/* Broken Suspend flag for SNPS Suspend resume issue */
  1891		unsigned		broken_suspend:1;
  1892		/* cached usb2 extened protocol capabilites */
  1893		u32                     *ext_caps;
  1894		unsigned int            num_ext_caps;
  1895		/* cached extended protocol port capabilities */
  1896		struct xhci_port_cap	*port_caps;
  1897		unsigned int		num_port_caps;
  1898		/* Compliance Mode Recovery Data */
  1899		struct timer_list	comp_mode_recovery_timer;
  1900		u32			port_status_u0;
  1901		u16			test_mode;
  1902	/* Compliance Mode Timer Triggered every 2 seconds */
  1903	#define COMP_MODE_RCVRY_MSECS 2000
  1904	
  1905		struct dentry		*debugfs_root;
  1906		struct dentry		*debugfs_slots;
  1907		struct list_head	regset_list;
  1908	
  1909		void			*dbc;
  1910		/* platform-specific data -- must come last */
  1911		unsigned long		priv[0] __aligned(sizeof(s64));
  1912	};
  1913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
