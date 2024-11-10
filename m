Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559BE2556E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731232311; cv=none; b=T4BKO3ClOmMpN0xX/GBd9HI5mRXawtUJ26zXdJRwNmbormknJCkZVDfzYWCdeVByVnvQvBdj682PfCySkmB95UIkvENkj3Jru8XrwHh9bzhUdCLTKAz2Q9R6w4mNvEWhj1O7eX+mXP3ADTN85jMFJYvtLO8Wmt6Rse9hbYOtBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731232311; c=relaxed/simple;
	bh=+TcDHE+t+Qw5DZ+6dK69QvSiEJGgAQTudZNAm/an7Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhfN53mJ+Sw/GWf6cjiC6sagky5RMqbtRPb39CgiRM2KxzUr+HIczglDCXJN4IEwmvHLSi/i+ZJNlrGQWlkt24cnO50gNjXA0e68EWLMsZxdGdOHUaybE6BU7keb1HvtVk12HKenC9uZB/xKzsCnd304fU8P8tKz2Pq8RnICWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBnMDX0l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBnMDX0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731232309; x=1762768309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+TcDHE+t+Qw5DZ+6dK69QvSiEJGgAQTudZNAm/an7Cc=;
  b=KBnMDX0lIf8q7ps6DYx1BtQCayMMP0hABZfm3AMoOZvt1ltg57PzkJe9
   zupWLK9+6GrBUz/Rs34UZSJmIqbVnf6S8l2smWbob/fj465kxwkqKqFM6
   8mUF5L7BT5EmbUW3rP9UX9yKmbXsOlw2q4ngWq66Cc6+WDHlQazn/iOpA
   wI6L/f+dbN9oSznOn1Bj7ayR7Hmy0LdUiA16ujC5r5ZrN7gVLudclFprb
   Y/UJuFhvIt9BVPf48l/dEv6W2HK3PWqCBTa7ZEsGm8uCYvr808YlvTbgI
   mAOrTQXbsRghf7t8BzlAhcd13JILRJu5aKrRmd4kiSz9ACPQkW++CpWHa
   Q==;
X-CSE-ConnectionGUID: orWpV7M6S0K9ToANlGhThw==
X-CSE-MsgGUID: z8tKhFCsQRux6Fs3Fad2VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="41670377"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="41670377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 01:51:48 -0800
X-CSE-ConnectionGUID: PNGxIDSZTqKJp3ZvnEhb/A==
X-CSE-MsgGUID: A2IkWJnASX6u5tmzeyWABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="117305324"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2024 01:51:46 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA4bg-00004T-0E;
	Sun, 10 Nov 2024 09:51:44 +0000
Date: Sun, 10 Nov 2024 17:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFCv1 6/7] PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
Message-ID: <202411101710.Co5EYmfa-lkp@intel.com>
References: <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>

Hi Nicolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus awilliam-vfio/next tip/irq/core linus/master awilliam-vfio/for-linus v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/genirq-msi-Allow-preset-IOVA-in-struct-msi_desc-for-MSI-doorbell-address/20241109-135311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc%40nvidia.com
patch subject: [PATCH RFCv1 6/7] PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20241110/202411101710.Co5EYmfa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101710.Co5EYmfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101710.Co5EYmfa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/blk-mq-pci.c:8:
   include/linux/pci.h: In function 'pci_alloc_irq_vectors_iovas':
>> include/linux/pci.h:1719:9: error: expected declaration specifiers before 'return'
    1719 |         return -ENOSPC; /* No support if !CONFIG_PCI_MSI */
         |         ^~~~~~
>> include/linux/pci.h:1720:1: error: expected declaration specifiers before '}' token
    1720 | }
         | ^
>> include/linux/pci.h:1724:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1724 | {
         | ^
   include/linux/pci.h:1730:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1730 | { return false; }
         | ^
   include/linux/pci.h:1733:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1733 | {
         | ^
   include/linux/pci.h:1740:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1740 | {
         | ^
   include/linux/pci.h:1744:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1744 | {
         | ^
   include/linux/pci.h:1748:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1748 | {
         | ^
   include/linux/pci.h:1755:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1755 | {
         | ^
   include/linux/pci.h:1782:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1782 | {
         | ^
   include/linux/pci.h:1805:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1805 | {
         | ^
   include/linux/pci.h:1851:44: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1851 | static inline bool pci_aer_available(void) { return false; }
         |                                            ^
   include/linux/pci.h:1862:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1862 | { return -EINVAL; }
         | ^
   include/linux/pci.h:1863:57: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1863 | static inline void pci_disable_ptm(struct pci_dev *dev) { }
         |                                                         ^
   include/linux/pci.h:1865:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1865 | { return false; }
         | ^
   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from block/blk-mq-pci.c:5:
>> include/linux/cleanup.h:244:15: error: storage class specified for parameter 'class_pci_dev_t'
     244 | typedef _type class_##_name##_t;                                        \
         |               ^~~~~~
   include/linux/cleanup.h:291:9: note: in expansion of macro 'DEFINE_CLASS'
     291 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/pci.h:1875:1: note: in expansion of macro 'DEFINE_GUARD'
    1875 | DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | { _type _T = *p; _exit; }                                               \
         | ^
   include/linux/cleanup.h:291:9: note: in expansion of macro 'DEFINE_CLASS'
     291 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/pci.h:1875:1: note: in expansion of macro 'DEFINE_GUARD'
    1875 | DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:248:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     248 | { _type t = _init; return t; }
         | ^
   include/linux/cleanup.h:291:9: note: in expansion of macro 'DEFINE_CLASS'
     291 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/pci.h:1875:1: note: in expansion of macro 'DEFINE_GUARD'
    1875 | DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:291:85: error: expected declaration specifiers before ';' token
     291 |         DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |                                                                                     ^
   include/linux/pci.h:1875:1: note: in expansion of macro 'DEFINE_GUARD'
    1875 | DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:292:55: error: expected declaration specifiers or '...' before 'class_pci_dev_t'
     292 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                                                       ^~~~~~
   include/linux/pci.h:1875:1: note: in expansion of macro 'DEFINE_GUARD'
    1875 | DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
         | ^~~~~~~~~~~~
>> include/linux/pci.h:1883:12: error: storage class specified for parameter 'pci_domains_supported'
    1883 | extern int pci_domains_supported;
         |            ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/pci.h:1911:15: error: storage class specified for parameter 'arch_set_vga_state_t'
    1911 | typedef int (*arch_set_vga_state_t)(struct pci_dev *pdev, bool decode,
         |               ^~~~~~~~~~~~~~~~~~~~
>> include/linux/pci.h:1913:33: error: expected declaration specifiers or '...' before 'arch_set_vga_state_t'
    1913 | void pci_register_set_vga_state(arch_set_vga_state_t func);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1917:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1917 | {
         | ^
   include/linux/pci.h:1924:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1924 | {
         | ^
   include/linux/pci.h:1931:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1931 | {
         | ^
   include/linux/pci.h:1938:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1938 | {
         | ^
   In file included from arch/alpha/include/asm/pci.h:8,
                    from include/linux/pci.h:2102:
>> include/linux/dma-mapping.h:86:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      86 | {
         | ^
   include/linux/dma-mapping.h:90:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      90 | {
         | ^
   include/linux/dma-mapping.h:96:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      96 | {
         | ^
   include/linux/dma-mapping.h:296:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     296 | {
         | ^
   include/linux/dma-mapping.h:303:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     303 | {
         | ^
   include/linux/dma-mapping.h:310:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     310 | {
         | ^
   include/linux/dma-mapping.h:317:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     317 | {
         | ^
   include/linux/dma-mapping.h:324:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     324 | {
         | ^
   include/linux/dma-mapping.h:330:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     330 | {
         | ^
   include/linux/dma-mapping.h:369:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     369 | {
         | ^
   include/linux/dma-mapping.h:376:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     376 | {
         | ^
   include/linux/dma-mapping.h:382:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     382 | {
         | ^
   include/linux/dma-mapping.h:394:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     394 | {
         | ^
   include/linux/dma-mapping.h:401:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     401 | {
         | ^
   include/linux/dma-mapping.h:408:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     408 | {
         | ^
   include/linux/dma-mapping.h:425:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     425 | {
         | ^
   include/linux/dma-mapping.h:443:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     443 | {
         | ^
   include/linux/dma-mapping.h:460:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     460 | {
         | ^
   include/linux/dma-mapping.h:477:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     477 | {
         | ^
   include/linux/dma-mapping.h:484:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     484 | {
         | ^
   include/linux/dma-mapping.h:490:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     490 | {
         | ^
   include/linux/dma-mapping.h:503:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     503 | {
         | ^
   include/linux/dma-mapping.h:515:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     515 | {
         | ^
   include/linux/dma-mapping.h:521:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     521 | {
         | ^
   include/linux/dma-mapping.h:528:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     528 | {
         | ^
   include/linux/dma-mapping.h:535:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     535 | {
         | ^
   include/linux/dma-mapping.h:554:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     554 | {
         | ^
   include/linux/dma-mapping.h:561:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     561 | {
         | ^
   include/linux/dma-mapping.h:568:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     568 | {
         | ^
   include/linux/dma-mapping.h:576:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     576 | {
         | ^
   include/linux/dma-mapping.h:584:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     584 | {
         | ^
   include/linux/dma-mapping.h:594:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     594 | {
         | ^
   include/linux/dma-mapping.h:601:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     601 | {
         | ^
   include/linux/dma-mapping.h:612:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     612 | {
         | ^
   include/linux/dma-mapping.h:621:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     621 | {
         | ^
>> arch/alpha/include/asm/pci.h:16:1: warning: empty declaration
      16 | struct pci_iommu_arena;
         | ^~~~~~
   arch/alpha/include/asm/pci.h:17:1: warning: empty declaration
      17 | struct page;
         | ^~~~~~
   arch/alpha/include/asm/pci.h:21:1: warning: empty declaration
      21 | struct pci_controller {
         | ^~~~~~
>> arch/alpha/include/asm/pci.h:62:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      62 | {
         | ^
>> arch/alpha/include/asm/pci.h:78:24: error: storage class specified for parameter 'isa_bridge'
      78 | extern struct pci_dev *isa_bridge;
         |                        ^~~~~~~~~~
>> arch/alpha/include/asm/pci.h:80:12: error: storage class specified for parameter 'pci_legacy_read'
      80 | extern int pci_legacy_read(struct pci_bus *bus, loff_t port, u32 *val,
         |            ^~~~~~~~~~~~~~~
>> arch/alpha/include/asm/pci.h:82:12: error: storage class specified for parameter 'pci_legacy_write'
      82 | extern int pci_legacy_write(struct pci_bus *bus, loff_t port, u32 val,
         |            ^~~~~~~~~~~~~~~~
>> arch/alpha/include/asm/pci.h:84:12: error: storage class specified for parameter 'pci_mmap_legacy_page_range'
      84 | extern int pci_mmap_legacy_page_range(struct pci_bus *bus,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/alpha/include/asm/pci.h:87:13: error: storage class specified for parameter 'pci_adjust_legacy_attr'
      87 | extern void pci_adjust_legacy_attr(struct pci_bus *bus,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2160:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2160 | {
         | ^
   include/linux/pci.h:2165:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2165 | {
         | ^
   include/linux/pci.h:2170:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2170 | {
         | ^
>> include/linux/pci.h:2185:1: warning: empty declaration
    2185 | struct pci_fixup {
         | ^~~~~~
   include/linux/pci.h:2197:1: warning: empty declaration
    2197 | enum pci_fixup_pass {
         | ^~~~
>> include/linux/pci.h:2332:12: error: storage class specified for parameter 'pci_pci_problems'
    2332 | extern int pci_pci_problems;
         |            ^~~~~~~~~~~~~~~~
   include/linux/pci.h:2341:22: error: storage class specified for parameter 'pci_cardbus_io_size'
    2341 | extern unsigned long pci_cardbus_io_size;
         |                      ^~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2342:22: error: storage class specified for parameter 'pci_cardbus_mem_size'
    2342 | extern unsigned long pci_cardbus_mem_size;
         |                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2343:11: error: storage class specified for parameter 'pci_dfl_cache_line_size'
    2343 | extern u8 pci_dfl_cache_line_size;
         |           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2344:11: error: storage class specified for parameter 'pci_cache_line_size'
    2344 | extern u8 pci_cache_line_size;
         |           ^~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2363:12: error: storage class specified for parameter 'pci_create_resource_files'
    2363 | extern int pci_create_resource_files(struct pci_dev *dev);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2364:13: error: storage class specified for parameter 'pci_remove_resource_files'
    2364 | extern void pci_remove_resource_files(struct pci_dev *dev);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2371:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2371 | static inline void pci_mmcfg_early_init(void) { }
         |                                               ^
   include/linux/pci.h:2372:46: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2372 | static inline void pci_mmcfg_late_init(void) { }
         |                                              ^
   include/linux/pci.h:2405:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2405 | {
         | ^
   include/linux/pci.h:2409:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2409 | {
         | ^
   include/linux/pci.h:2414:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2414 | {
         | ^
   include/linux/pci.h:2420:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2420 | {
         | ^
   include/linux/pci.h:2425:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2425 | { return -ENODEV; }
         | ^
   include/linux/pci.h:2429:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2429 | {
         | ^
   include/linux/pci.h:2433:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2433 | {
         | ^
   include/linux/pci.h:2437:50: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2437 |                                          int id) { }
         |                                                  ^
   include/linux/pci.h:2438:59: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2438 | static inline void pci_disable_sriov(struct pci_dev *dev) { }
         |                                                           ^
   include/linux/pci.h:2439:51: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2439 | static inline int pci_num_vf(struct pci_dev *dev) { return 0; }
         |                                                   ^
   include/linux/pci.h:2441:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2441 | { return 0; }
         | ^
   include/linux/pci.h:2443:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2443 | { return 0; }
         | ^
   include/linux/pci.h:2445:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2445 | { return 0; }
         | ^
   include/linux/pci.h:2448:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2448 | { return 0; }
         | ^
   include/linux/pci.h:2449:78: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2449 | static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
         |                                                                              ^
   include/linux/pci.h:2469:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2469 | {
         | ^
   include/linux/pci.h:2480:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2480 | {
         | ^
   include/linux/pci.h:2489:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2489 | {
         | ^
   include/linux/pci.h:2498:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2498 | {
         | ^
   include/linux/pci.h:2510:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2510 | {
         | ^
   include/linux/pci.h:2522:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2522 | {
         | ^
   include/linux/pci.h:2608:52: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2608 | pci_host_bridge_of_msi_domain(struct pci_bus *bus) { return NULL; }
         |                                                    ^
   include/linux/pci.h:2609:64: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2609 | static inline bool pci_host_of_has_msi_map(struct device *dev) { return false; }
         |                                                                ^
   include/linux/pci.h:2614:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2614 | {
         | ^
   include/linux/pci.h:2619:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    2619 | {
..


vim +/return +1719 include/linux/pci.h

  1704	
  1705	static inline int
  1706	pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
  1707				       unsigned int max_vecs, unsigned int flags,
  1708				       struct irq_affinity *aff_desc)
  1709	{
  1710		if ((flags & PCI_IRQ_INTX) && min_vecs == 1 && dev->irq)
  1711			return 1;
  1712		return -ENOSPC;
  1713	}
  1714	static inline int
> 1715	pci_alloc_irq_vectors_iovas(struct pci_dev *dev, unsigned int min_vecs,
  1716				    unsigned int max_vecs, unsigned int flags,
  1717				    dma_addr_t *msi_iovas)
  1718	
> 1719		return -ENOSPC; /* No support if !CONFIG_PCI_MSI */
> 1720	}
  1721	static inline int
  1722	pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
  1723			      unsigned int max_vecs, unsigned int flags)
> 1724	{
  1725		return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
  1726						      flags, NULL);
  1727	}
  1728	
  1729	static inline bool pci_msix_can_alloc_dyn(struct pci_dev *dev)
  1730	{ return false; }
  1731	static inline struct msi_map pci_msix_alloc_irq_at(struct pci_dev *dev, unsigned int index,
  1732							   const struct irq_affinity_desc *affdesc)
  1733	{
  1734		struct msi_map map = { .index = -ENOSYS, };
  1735	
  1736		return map;
  1737	}
  1738	
  1739	static inline void pci_msix_free_irq(struct pci_dev *pdev, struct msi_map map)
  1740	{
  1741	}
  1742	
  1743	static inline void pci_free_irq_vectors(struct pci_dev *dev)
  1744	{
  1745	}
  1746	
  1747	static inline int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
  1748	{
  1749		if (WARN_ON_ONCE(nr > 0))
  1750			return -EINVAL;
  1751		return dev->irq;
  1752	}
  1753	static inline const struct cpumask *pci_irq_get_affinity(struct pci_dev *pdev,
  1754			int vec)
  1755	{
  1756		return cpu_possible_mask;
  1757	}
  1758	#endif
  1759	
  1760	/**
  1761	 * pci_irqd_intx_xlate() - Translate PCI INTx value to an IRQ domain hwirq
  1762	 * @d: the INTx IRQ domain
  1763	 * @node: the DT node for the device whose interrupt we're translating
  1764	 * @intspec: the interrupt specifier data from the DT
  1765	 * @intsize: the number of entries in @intspec
  1766	 * @out_hwirq: pointer at which to write the hwirq number
  1767	 * @out_type: pointer at which to write the interrupt type
  1768	 *
  1769	 * Translate a PCI INTx interrupt number from device tree in the range 1-4, as
  1770	 * stored in the standard PCI_INTERRUPT_PIN register, to a value in the range
  1771	 * 0-3 suitable for use in a 4 entry IRQ domain. That is, subtract one from the
  1772	 * INTx value to obtain the hwirq number.
  1773	 *
  1774	 * Returns 0 on success, or -EINVAL if the interrupt specifier is out of range.
  1775	 */
  1776	static inline int pci_irqd_intx_xlate(struct irq_domain *d,
  1777					      struct device_node *node,
  1778					      const u32 *intspec,
  1779					      unsigned int intsize,
  1780					      unsigned long *out_hwirq,
  1781					      unsigned int *out_type)
  1782	{
  1783		const u32 intx = intspec[0];
  1784	
  1785		if (intx < PCI_INTERRUPT_INTA || intx > PCI_INTERRUPT_INTD)
  1786			return -EINVAL;
  1787	
  1788		*out_hwirq = intx - PCI_INTERRUPT_INTA;
  1789		return 0;
  1790	}
  1791	
  1792	#ifdef CONFIG_PCIEPORTBUS
  1793	extern bool pcie_ports_disabled;
  1794	extern bool pcie_ports_native;
  1795	
  1796	int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
  1797				  bool use_lt);
  1798	#else
  1799	#define pcie_ports_disabled	true
  1800	#define pcie_ports_native	false
  1801	
  1802	static inline int pcie_set_target_speed(struct pci_dev *port,
  1803						enum pci_bus_speed speed_req,
  1804						bool use_lt)
  1805	{
  1806		return -EOPNOTSUPP;
  1807	}
  1808	#endif
  1809	
  1810	#define PCIE_LINK_STATE_L0S		(BIT(0) | BIT(1)) /* Upstr/dwnstr L0s */
  1811	#define PCIE_LINK_STATE_L1		BIT(2)	/* L1 state */
  1812	#define PCIE_LINK_STATE_L1_1		BIT(3)	/* ASPM L1.1 state */
  1813	#define PCIE_LINK_STATE_L1_2		BIT(4)	/* ASPM L1.2 state */
  1814	#define PCIE_LINK_STATE_L1_1_PCIPM	BIT(5)	/* PCI-PM L1.1 state */
  1815	#define PCIE_LINK_STATE_L1_2_PCIPM	BIT(6)	/* PCI-PM L1.2 state */
  1816	#define PCIE_LINK_STATE_ASPM_ALL	(PCIE_LINK_STATE_L0S		|\
  1817						 PCIE_LINK_STATE_L1		|\
  1818						 PCIE_LINK_STATE_L1_1		|\
  1819						 PCIE_LINK_STATE_L1_2		|\
  1820						 PCIE_LINK_STATE_L1_1_PCIPM	|\
  1821						 PCIE_LINK_STATE_L1_2_PCIPM)
  1822	#define PCIE_LINK_STATE_CLKPM		BIT(7)
  1823	#define PCIE_LINK_STATE_ALL		(PCIE_LINK_STATE_ASPM_ALL	|\
  1824						 PCIE_LINK_STATE_CLKPM)
  1825	
  1826	#ifdef CONFIG_PCIEASPM
  1827	int pci_disable_link_state(struct pci_dev *pdev, int state);
  1828	int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
  1829	int pci_enable_link_state(struct pci_dev *pdev, int state);
  1830	int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
  1831	void pcie_no_aspm(void);
  1832	bool pcie_aspm_support_enabled(void);
  1833	bool pcie_aspm_enabled(struct pci_dev *pdev);
  1834	#else
  1835	static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
  1836	{ return 0; }
  1837	static inline int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
  1838	{ return 0; }
  1839	static inline int pci_enable_link_state(struct pci_dev *pdev, int state)
  1840	{ return 0; }
  1841	static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
  1842	{ return 0; }
  1843	static inline void pcie_no_aspm(void) { }
  1844	static inline bool pcie_aspm_support_enabled(void) { return false; }
  1845	static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
  1846	#endif
  1847	
  1848	#ifdef CONFIG_PCIEAER
  1849	bool pci_aer_available(void);
  1850	#else
  1851	static inline bool pci_aer_available(void) { return false; }
  1852	#endif
  1853	
  1854	bool pci_ats_disabled(void);
  1855	
  1856	#ifdef CONFIG_PCIE_PTM
  1857	int pci_enable_ptm(struct pci_dev *dev, u8 *granularity);
  1858	void pci_disable_ptm(struct pci_dev *dev);
  1859	bool pcie_ptm_enabled(struct pci_dev *dev);
  1860	#else
  1861	static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
  1862	{ return -EINVAL; }
  1863	static inline void pci_disable_ptm(struct pci_dev *dev) { }
  1864	static inline bool pcie_ptm_enabled(struct pci_dev *dev)
  1865	{ return false; }
  1866	#endif
  1867	
  1868	void pci_cfg_access_lock(struct pci_dev *dev);
  1869	bool pci_cfg_access_trylock(struct pci_dev *dev);
  1870	void pci_cfg_access_unlock(struct pci_dev *dev);
  1871	
  1872	void pci_dev_lock(struct pci_dev *dev);
  1873	int pci_dev_trylock(struct pci_dev *dev);
  1874	void pci_dev_unlock(struct pci_dev *dev);
> 1875	DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
  1876	
  1877	/*
  1878	 * PCI domain support.  Sometimes called PCI segment (eg by ACPI),
  1879	 * a PCI domain is defined to be a set of PCI buses which share
  1880	 * configuration space.
  1881	 */
  1882	#ifdef CONFIG_PCI_DOMAINS
> 1883	extern int pci_domains_supported;
  1884	#else
  1885	enum { pci_domains_supported = 0 };
  1886	static inline int pci_domain_nr(struct pci_bus *bus) { return 0; }
  1887	static inline int pci_proc_domain(struct pci_bus *bus) { return 0; }
  1888	#endif /* CONFIG_PCI_DOMAINS */
  1889	
  1890	/*
  1891	 * Generic implementation for PCI domain support. If your
  1892	 * architecture does not need custom management of PCI
  1893	 * domains then this implementation will be used
  1894	 */
  1895	#ifdef CONFIG_PCI_DOMAINS_GENERIC
  1896	static inline int pci_domain_nr(struct pci_bus *bus)
  1897	{
  1898		return bus->domain_nr;
  1899	}
  1900	#ifdef CONFIG_ACPI
  1901	int acpi_pci_bus_find_domain_nr(struct pci_bus *bus);
  1902	#else
  1903	static inline int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
  1904	{ return 0; }
  1905	#endif
  1906	int pci_bus_find_domain_nr(struct pci_bus *bus, struct device *parent);
  1907	void pci_bus_release_domain_nr(struct device *parent, int domain_nr);
  1908	#endif
  1909	
  1910	/* Some architectures require additional setup to direct VGA traffic */
> 1911	typedef int (*arch_set_vga_state_t)(struct pci_dev *pdev, bool decode,
  1912					    unsigned int command_bits, u32 flags);
> 1913	void pci_register_set_vga_state(arch_set_vga_state_t func);
  1914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
