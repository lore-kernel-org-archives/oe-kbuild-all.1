Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F112F375
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728924719; cv=none; b=BD2+JNzNafGk8m+FEJaO5YBAV8CMqS15h09RlJZzq/KaExAPHsgkqirXbD4LAwekUWqnzxpSYxJj5fSlK1kRuMsxVLHJd9D00JF/RVzNW/Z6X18PeDza3U4sf2cEedkAD575SaWk4UXdfmYODDGs2Aayk8q7g92A0JFBM/umEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728924719; c=relaxed/simple;
	bh=1/+1ZvHaeogr2OsrvVkIJqB8tW2woNuRu9+qGMFW8fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6a72SC0ZB1KKIXFFJtWXwRq5taVFxNRTfrslxUUUW4DK4cJadzzsbOJ9zlbCCCXEpRa4fRZJgFVmUuU1YW2spYl9ZS5tVCXsydt4Z8OX3Rk6hIbrqH9zwbWBTvoI5NrYtMGjr3RKNR1xEbT44hRupVEKABONXSIcdYXi34YaVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmmxgJZb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmmxgJZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728924716; x=1760460716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/+1ZvHaeogr2OsrvVkIJqB8tW2woNuRu9+qGMFW8fI=;
  b=OmmxgJZbLHuEApC13x7SngxnQBlcwG00N0DtDF3oMH7bGwfSC9AbGsA0
   wMi9HskEbWgnD5Hk/HL84mjDRBloAeW2u8lxvMdV74KJs/CTim13X7RA2
   B5njjTJ5irmaeuBNIzB32I8yMGBlM2o5PHGxQ6QUK0gy0p8pXaId/WPpx
   wtQwML+YOzxxQdNTZweYTSmqJUogP6uhob8HSTbLka1GGMPmIcOeHFRSV
   ONKsOVdUJlvsw4Ze9nL2bX6GnOttmQCAKCdwpnQNrmMBfn2OAzsJynbmK
   zWlB0tbmMbJJz0r7WhpC2JFaXfsM6a1RjaCEuezuzVzzxvwKtY/+fzFa9
   w==;
X-CSE-ConnectionGUID: DOf9hJJ+QF2gRr3/l+XH2Q==
X-CSE-MsgGUID: akRGk/4iT8ivUBrsW31n7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38839815"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38839815"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 09:51:56 -0700
X-CSE-ConnectionGUID: HdJ6UpLkTdGPBZh1KTCaSA==
X-CSE-MsgGUID: PLrcdc9WTjOE3DEuEnvVTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="100968504"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 09:51:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0OIS-000GuF-1I;
	Mon, 14 Oct 2024 16:51:52 +0000
Date: Tue, 15 Oct 2024 00:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pci-dma-mapping.h 1/1] drivers/usb/host/ehci-pci.c:130:8:
 error: call to undeclared function 'dma_set_coherent_mask'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202410150058.n52eGKyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git pci-dma-mapping.h
head:   c195cf19ee228a0e49465bc91e2d3700b6bce5d1
commit: c195cf19ee228a0e49465bc91e2d3700b6bce5d1 [1/1] pci.h: don't include dma-mapping.h
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241015/202410150058.n52eGKyG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150058.n52eGKyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150058.n52eGKyG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/ehci-pci.c:130:8: error: call to undeclared function 'dma_set_coherent_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |                         if (dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(31)) < 0)
         |                             ^
>> drivers/usb/host/ehci-pci.c:130:42: error: call to undeclared function 'DMA_BIT_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |                         if (dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(31)) < 0)
         |                                                               ^
   2 errors generated.


vim +/dma_set_coherent_mask +130 drivers/usb/host/ehci-pci.c

188075211cc75a David Brownell         2005-11-23   88  
8926bfa7462d4c David Brownell         2005-11-28   89  /* called during probe() after chip reset completes */
8926bfa7462d4c David Brownell         2005-11-28   90  static int ehci_pci_setup(struct usb_hcd *hcd)
7ff71d6adf81a4 Matt Porter            2005-09-22   91  {
7ff71d6adf81a4 Matt Porter            2005-09-22   92  	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
abcc94480634f6 David Brownell         2005-11-23   93  	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
7ff71d6adf81a4 Matt Porter            2005-09-22   94  	u32			temp;
188075211cc75a David Brownell         2005-11-23   95  	int			retval;
7ff71d6adf81a4 Matt Porter            2005-09-22   96  
1a49e2ac9651df Alan Stern             2012-07-09   97  	ehci->caps = hcd->regs;
1a49e2ac9651df Alan Stern             2012-07-09   98  
1a49e2ac9651df Alan Stern             2012-07-09   99  	/*
1a49e2ac9651df Alan Stern             2012-07-09  100  	 * ehci_init() causes memory for DMA transfers to be
1a49e2ac9651df Alan Stern             2012-07-09  101  	 * allocated.  Thus, any vendor-specific workarounds based on
1a49e2ac9651df Alan Stern             2012-07-09  102  	 * limiting the type of memory used for DMA transfers must
1a49e2ac9651df Alan Stern             2012-07-09  103  	 * happen before ehci_setup() is called.
1a49e2ac9651df Alan Stern             2012-07-09  104  	 *
1a49e2ac9651df Alan Stern             2012-07-09  105  	 * Most other workarounds can be done either before or after
1a49e2ac9651df Alan Stern             2012-07-09  106  	 * init and reset; they are located here too.
1a49e2ac9651df Alan Stern             2012-07-09  107  	 */
083522d76662cd Benjamin Herrenschmidt 2006-12-15  108  	switch (pdev->vendor) {
083522d76662cd Benjamin Herrenschmidt 2006-12-15  109  	case PCI_VENDOR_ID_TOSHIBA_2:
083522d76662cd Benjamin Herrenschmidt 2006-12-15  110  		/* celleb's companion chip */
083522d76662cd Benjamin Herrenschmidt 2006-12-15  111  		if (pdev->device == 0x01b5) {
083522d76662cd Benjamin Herrenschmidt 2006-12-15  112  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
083522d76662cd Benjamin Herrenschmidt 2006-12-15  113  			ehci->big_endian_mmio = 1;
083522d76662cd Benjamin Herrenschmidt 2006-12-15  114  #else
083522d76662cd Benjamin Herrenschmidt 2006-12-15  115  			ehci_warn(ehci,
083522d76662cd Benjamin Herrenschmidt 2006-12-15  116  				  "unsupported big endian Toshiba quirk\n");
083522d76662cd Benjamin Herrenschmidt 2006-12-15  117  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  118  		}
083522d76662cd Benjamin Herrenschmidt 2006-12-15  119  		break;
c32ba30f76eb18 Paul Serice            2006-06-07  120  	case PCI_VENDOR_ID_NVIDIA:
c32ba30f76eb18 Paul Serice            2006-06-07  121  		/* NVidia reports that certain chips don't handle
c32ba30f76eb18 Paul Serice            2006-06-07  122  		 * QH, ITD, or SITD addresses above 2GB.  (But TD,
c32ba30f76eb18 Paul Serice            2006-06-07  123  		 * data buffer, and periodic schedule are normal.)
c32ba30f76eb18 Paul Serice            2006-06-07  124  		 */
c32ba30f76eb18 Paul Serice            2006-06-07  125  		switch (pdev->device) {
c32ba30f76eb18 Paul Serice            2006-06-07  126  		case 0x003c:	/* MCP04 */
c32ba30f76eb18 Paul Serice            2006-06-07  127  		case 0x005b:	/* CK804 */
c32ba30f76eb18 Paul Serice            2006-06-07  128  		case 0x00d8:	/* CK8 */
c32ba30f76eb18 Paul Serice            2006-06-07  129  		case 0x00e8:	/* CK8S */
48025b4f3fa4a5 Suraj Upadhyay         2020-07-14 @130  			if (dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(31)) < 0)
c32ba30f76eb18 Paul Serice            2006-06-07  131  				ehci_warn(ehci, "can't enable NVidia "
c32ba30f76eb18 Paul Serice            2006-06-07  132  					"workaround for >2GB RAM\n");
c32ba30f76eb18 Paul Serice            2006-06-07  133  			break;
7ff71d6adf81a4 Matt Porter            2005-09-22  134  
1a49e2ac9651df Alan Stern             2012-07-09  135  		/* Some NForce2 chips have problems with selective suspend;
1a49e2ac9651df Alan Stern             2012-07-09  136  		 * fixed in newer silicon.
3d091a6f703906 Andiry Xu              2010-11-08  137  		 */
1a49e2ac9651df Alan Stern             2012-07-09  138  		case 0x0068:
1a49e2ac9651df Alan Stern             2012-07-09  139  			if (pdev->revision < 0xa4)
1a49e2ac9651df Alan Stern             2012-07-09  140  				ehci->no_selective_suspend = 1;
1a49e2ac9651df Alan Stern             2012-07-09  141  			break;
3d091a6f703906 Andiry Xu              2010-11-08  142  		}
3681d8f3ee8f47 David Miller           2010-04-06  143  		break;
403dbd36739e34 Alek Du                2009-07-13  144  	case PCI_VENDOR_ID_INTEL:
1a49e2ac9651df Alan Stern             2012-07-09  145  		if (pdev->device == PCI_DEVICE_ID_INTEL_CE4100_USB)
4f6838436915fd Dirk Brandewie         2010-11-17  146  			hcd->has_tt = 1;
403dbd36739e34 Alek Du                2009-07-13  147  		break;
7ff71d6adf81a4 Matt Porter            2005-09-22  148  	case PCI_VENDOR_ID_TDI:
1a49e2ac9651df Alan Stern             2012-07-09  149  		if (pdev->device == PCI_DEVICE_ID_TDI_EHCI)
7329e211b987a4 Alan Stern             2008-04-03  150  			hcd->has_tt = 1;
7ff71d6adf81a4 Matt Porter            2005-09-22  151  		break;
7ff71d6adf81a4 Matt Porter            2005-09-22  152  	case PCI_VENDOR_ID_AMD:
ad93562bdeecdd Andiry Xu              2011-03-01  153  		/* AMD PLL quirk */
4fbb8aa75836c3 Ryan Kennedy           2019-07-04  154  		if (usb_amd_quirk_pll_check())
ad93562bdeecdd Andiry Xu              2011-03-01  155  			ehci->amd_pll_fix = 1;
7ff71d6adf81a4 Matt Porter            2005-09-22  156  		/* AMD8111 EHCI doesn't work, according to AMD errata */
7ff71d6adf81a4 Matt Porter            2005-09-22  157  		if (pdev->device == 0x7463) {
7ff71d6adf81a4 Matt Porter            2005-09-22  158  			ehci_info(ehci, "ignoring AMD8111 (errata)\n");
8926bfa7462d4c David Brownell         2005-11-28  159  			retval = -EIO;
8926bfa7462d4c David Brownell         2005-11-28  160  			goto done;
7ff71d6adf81a4 Matt Porter            2005-09-22  161  		}
a85b4e7f4481c5 Brian J. Tarricone     2010-11-21  162  
1a49e2ac9651df Alan Stern             2012-07-09  163  		/*
1a49e2ac9651df Alan Stern             2012-07-09  164  		 * EHCI controller on AMD SB700/SB800/Hudson-2/3 platforms may
1a49e2ac9651df Alan Stern             2012-07-09  165  		 * read/write memory space which does not belong to it when
1a49e2ac9651df Alan Stern             2012-07-09  166  		 * there is NULL pointer with T-bit set to 1 in the frame list
1a49e2ac9651df Alan Stern             2012-07-09  167  		 * table. To avoid the issue, the frame list link pointer
1a49e2ac9651df Alan Stern             2012-07-09  168  		 * should always contain a valid pointer to a inactive qh.
a85b4e7f4481c5 Brian J. Tarricone     2010-11-21  169  		 */
1a49e2ac9651df Alan Stern             2012-07-09  170  		if (pdev->device == 0x7808) {
1a49e2ac9651df Alan Stern             2012-07-09  171  			ehci->use_dummy_qh = 1;
1a49e2ac9651df Alan Stern             2012-07-09  172  			ehci_info(ehci, "applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround\n");
7ff71d6adf81a4 Matt Porter            2005-09-22  173  		}
7ff71d6adf81a4 Matt Porter            2005-09-22  174  		break;
055b93c9e32a44 Rene Herman            2008-03-20  175  	case PCI_VENDOR_ID_VIA:
055b93c9e32a44 Rene Herman            2008-03-20  176  		if (pdev->device == 0x3104 && (pdev->revision & 0xf0) == 0x60) {
055b93c9e32a44 Rene Herman            2008-03-20  177  			u8 tmp;
055b93c9e32a44 Rene Herman            2008-03-20  178  
055b93c9e32a44 Rene Herman            2008-03-20  179  			/* The VT6212 defaults to a 1 usec EHCI sleep time which
055b93c9e32a44 Rene Herman            2008-03-20  180  			 * hogs the PCI bus *badly*. Setting bit 5 of 0x4B makes
055b93c9e32a44 Rene Herman            2008-03-20  181  			 * that sleep time use the conventional 10 usec.
055b93c9e32a44 Rene Herman            2008-03-20  182  			 */
055b93c9e32a44 Rene Herman            2008-03-20  183  			pci_read_config_byte(pdev, 0x4b, &tmp);
055b93c9e32a44 Rene Herman            2008-03-20  184  			if (tmp & 0x20)
055b93c9e32a44 Rene Herman            2008-03-20  185  				break;
055b93c9e32a44 Rene Herman            2008-03-20  186  			pci_write_config_byte(pdev, 0x4b, tmp | 0x20);
055b93c9e32a44 Rene Herman            2008-03-20  187  		}
055b93c9e32a44 Rene Herman            2008-03-20  188  		break;
b09bc6cbae4dd3 Andiry Xu              2008-11-14  189  	case PCI_VENDOR_ID_ATI:
ad93562bdeecdd Andiry Xu              2011-03-01  190  		/* AMD PLL quirk */
4fbb8aa75836c3 Ryan Kennedy           2019-07-04  191  		if (usb_amd_quirk_pll_check())
ad93562bdeecdd Andiry Xu              2011-03-01  192  			ehci->amd_pll_fix = 1;
1a49e2ac9651df Alan Stern             2012-07-09  193  
1a49e2ac9651df Alan Stern             2012-07-09  194  		/*
1a49e2ac9651df Alan Stern             2012-07-09  195  		 * EHCI controller on AMD SB700/SB800/Hudson-2/3 platforms may
1a49e2ac9651df Alan Stern             2012-07-09  196  		 * read/write memory space which does not belong to it when
1a49e2ac9651df Alan Stern             2012-07-09  197  		 * there is NULL pointer with T-bit set to 1 in the frame list
1a49e2ac9651df Alan Stern             2012-07-09  198  		 * table. To avoid the issue, the frame list link pointer
1a49e2ac9651df Alan Stern             2012-07-09  199  		 * should always contain a valid pointer to a inactive qh.
1a49e2ac9651df Alan Stern             2012-07-09  200  		 */
1a49e2ac9651df Alan Stern             2012-07-09  201  		if (pdev->device == 0x4396) {
1a49e2ac9651df Alan Stern             2012-07-09  202  			ehci->use_dummy_qh = 1;
1a49e2ac9651df Alan Stern             2012-07-09  203  			ehci_info(ehci, "applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround\n");
1a49e2ac9651df Alan Stern             2012-07-09  204  		}
0a99e8ac430a27 Shane Huang            2008-11-25  205  		/* SB600 and old version of SB700 have a bug in EHCI controller,
b09bc6cbae4dd3 Andiry Xu              2008-11-14  206  		 * which causes usb devices lose response in some cases.
b09bc6cbae4dd3 Andiry Xu              2008-11-14  207  		 */
3ad145b62a15c8 Huang Rui              2013-10-03  208  		if ((pdev->device == 0x4386 || pdev->device == 0x4396) &&
3ad145b62a15c8 Huang Rui              2013-10-03  209  				usb_amd_hang_symptom_quirk()) {
b09bc6cbae4dd3 Andiry Xu              2008-11-14  210  			u8 tmp;
3ad145b62a15c8 Huang Rui              2013-10-03  211  			ehci_info(ehci, "applying AMD SB600/SB700 USB freeze workaround\n");
b09bc6cbae4dd3 Andiry Xu              2008-11-14  212  			pci_read_config_byte(pdev, 0x53, &tmp);
b09bc6cbae4dd3 Andiry Xu              2008-11-14  213  			pci_write_config_byte(pdev, 0x53, tmp | (1<<3));
b09bc6cbae4dd3 Andiry Xu              2008-11-14  214  		}
b09bc6cbae4dd3 Andiry Xu              2008-11-14  215  		break;
68aa95d5d4de31 Alan Stern             2011-10-12  216  	case PCI_VENDOR_ID_NETMOS:
68aa95d5d4de31 Alan Stern             2011-10-12  217  		/* MosChip frame-index-register bug */
68aa95d5d4de31 Alan Stern             2011-10-12  218  		ehci_info(ehci, "applying MosChip frame-index workaround\n");
68aa95d5d4de31 Alan Stern             2011-10-12  219  		ehci->frame_index_bug = 1;
68aa95d5d4de31 Alan Stern             2011-10-12  220  		break;
1ddcb71a3edf0e Longfang Liu           2020-06-08  221  	case PCI_VENDOR_ID_HUAWEI:
1ddcb71a3edf0e Longfang Liu           2020-06-08  222  		/* Synopsys HC bug */
1ddcb71a3edf0e Longfang Liu           2020-06-08  223  		if (pdev->device == 0xa239) {
1ddcb71a3edf0e Longfang Liu           2020-06-08  224  			ehci_info(ehci, "applying Synopsys HC workaround\n");
1ddcb71a3edf0e Longfang Liu           2020-06-08  225  			ehci->has_synopsys_hc_bug = 1;
1ddcb71a3edf0e Longfang Liu           2020-06-08  226  		}
1ddcb71a3edf0e Longfang Liu           2020-06-08  227  		break;
c3c9cee5928285 Neal Liu               2022-02-08  228  	case PCI_VENDOR_ID_ASPEED:
c3c9cee5928285 Neal Liu               2022-02-08  229  		if (pdev->device == PCI_DEVICE_ID_ASPEED_EHCI) {
c3c9cee5928285 Neal Liu               2022-02-08  230  			ehci_info(ehci, "applying Aspeed HC workaround\n");
c3c9cee5928285 Neal Liu               2022-02-08  231  			ehci->is_aspeed = 1;
c3c9cee5928285 Neal Liu               2022-02-08  232  		}
c3c9cee5928285 Neal Liu               2022-02-08  233  		break;
f085bd4bfe0907 Weitao Wango           2022-03-24  234  	case PCI_VENDOR_ID_ZHAOXIN:
f085bd4bfe0907 Weitao Wango           2022-03-24  235  		if (pdev->device == 0x3104 && (pdev->revision & 0xf0) == 0x90)
f085bd4bfe0907 Weitao Wango           2022-03-24  236  			ehci->zx_wakeup_clear_needed = 1;
f085bd4bfe0907 Weitao Wango           2022-03-24  237  		break;
7ff71d6adf81a4 Matt Porter            2005-09-22  238  	}
7ff71d6adf81a4 Matt Porter            2005-09-22  239  
75e1a2ae1f61ce Jan Beulich            2012-12-19  240  	/* optional debug port, normally in the first BAR */
75e1a2ae1f61ce Jan Beulich            2012-12-19  241  	temp = pci_find_capability(pdev, PCI_CAP_ID_DBG);
75e1a2ae1f61ce Jan Beulich            2012-12-19  242  	if (temp) {
75e1a2ae1f61ce Jan Beulich            2012-12-19  243  		pci_read_config_dword(pdev, temp, &temp);
75e1a2ae1f61ce Jan Beulich            2012-12-19  244  		temp >>= 16;
75e1a2ae1f61ce Jan Beulich            2012-12-19  245  		if (((temp >> 13) & 7) == 1) {
75e1a2ae1f61ce Jan Beulich            2012-12-19  246  			u32 hcs_params = ehci_readl(ehci,
75e1a2ae1f61ce Jan Beulich            2012-12-19  247  						    &ehci->caps->hcs_params);
75e1a2ae1f61ce Jan Beulich            2012-12-19  248  
75e1a2ae1f61ce Jan Beulich            2012-12-19  249  			temp &= 0x1fff;
75e1a2ae1f61ce Jan Beulich            2012-12-19  250  			ehci->debug = hcd->regs + temp;
75e1a2ae1f61ce Jan Beulich            2012-12-19  251  			temp = ehci_readl(ehci, &ehci->debug->control);
75e1a2ae1f61ce Jan Beulich            2012-12-19  252  			ehci_info(ehci, "debug port %d%s\n",
75e1a2ae1f61ce Jan Beulich            2012-12-19  253  				  HCS_DEBUG_PORT(hcs_params),
75e1a2ae1f61ce Jan Beulich            2012-12-19  254  				  (temp & DBGP_ENABLED) ? " IN USE" : "");
75e1a2ae1f61ce Jan Beulich            2012-12-19  255  			if (!(temp & DBGP_ENABLED))
75e1a2ae1f61ce Jan Beulich            2012-12-19  256  				ehci->debug = NULL;
75e1a2ae1f61ce Jan Beulich            2012-12-19  257  		}
75e1a2ae1f61ce Jan Beulich            2012-12-19  258  	}
75e1a2ae1f61ce Jan Beulich            2012-12-19  259  
1a49e2ac9651df Alan Stern             2012-07-09  260  	retval = ehci_setup(hcd);
1a49e2ac9651df Alan Stern             2012-07-09  261  	if (retval)
1a49e2ac9651df Alan Stern             2012-07-09  262  		return retval;
1a49e2ac9651df Alan Stern             2012-07-09  263  
1a49e2ac9651df Alan Stern             2012-07-09  264  	/* These workarounds need to be applied after ehci_setup() */
1a49e2ac9651df Alan Stern             2012-07-09  265  	switch (pdev->vendor) {
1a49e2ac9651df Alan Stern             2012-07-09  266  	case PCI_VENDOR_ID_NEC:
1a49e2ac9651df Alan Stern             2012-07-09  267  	case PCI_VENDOR_ID_INTEL:
5c2ad982fb422a Lucas Stach            2016-10-23  268  	case PCI_VENDOR_ID_AMD:
1a49e2ac9651df Alan Stern             2012-07-09  269  		ehci->need_io_watchdog = 0;
1a49e2ac9651df Alan Stern             2012-07-09  270  		break;
1a49e2ac9651df Alan Stern             2012-07-09  271  	case PCI_VENDOR_ID_NVIDIA:
1a49e2ac9651df Alan Stern             2012-07-09  272  		switch (pdev->device) {
1a49e2ac9651df Alan Stern             2012-07-09  273  		/* MCP89 chips on the MacBookAir3,1 give EPROTO when
1a49e2ac9651df Alan Stern             2012-07-09  274  		 * fetching device descriptors unless LPM is disabled.
1a49e2ac9651df Alan Stern             2012-07-09  275  		 * There are also intermittent problems enumerating
1a49e2ac9651df Alan Stern             2012-07-09  276  		 * devices with PPCD enabled.
1a49e2ac9651df Alan Stern             2012-07-09  277  		 */
1a49e2ac9651df Alan Stern             2012-07-09  278  		case 0x0d9d:
4968f951913997 Alan Stern             2012-10-31  279  			ehci_info(ehci, "disable ppcd for nvidia mcp89\n");
1a49e2ac9651df Alan Stern             2012-07-09  280  			ehci->has_ppcd = 0;
1a49e2ac9651df Alan Stern             2012-07-09  281  			ehci->command &= ~CMD_PPCEE;
1a49e2ac9651df Alan Stern             2012-07-09  282  			break;
1a49e2ac9651df Alan Stern             2012-07-09  283  		}
1a49e2ac9651df Alan Stern             2012-07-09  284  		break;
1a49e2ac9651df Alan Stern             2012-07-09  285  	}
1a49e2ac9651df Alan Stern             2012-07-09  286  
7ff71d6adf81a4 Matt Porter            2005-09-22  287  	/* at least the Genesys GL880S needs fixup here */
7ff71d6adf81a4 Matt Porter            2005-09-22  288  	temp = HCS_N_CC(ehci->hcs_params) * HCS_N_PCC(ehci->hcs_params);
7ff71d6adf81a4 Matt Porter            2005-09-22  289  	temp &= 0x0f;
7ff71d6adf81a4 Matt Porter            2005-09-22  290  	if (temp && HCS_N_PORTS(ehci->hcs_params) > temp) {
7ff71d6adf81a4 Matt Porter            2005-09-22  291  		ehci_dbg(ehci, "bogus port configuration: "
7ff71d6adf81a4 Matt Porter            2005-09-22  292  			"cc=%d x pcc=%d < ports=%d\n",
7ff71d6adf81a4 Matt Porter            2005-09-22  293  			HCS_N_CC(ehci->hcs_params),
7ff71d6adf81a4 Matt Porter            2005-09-22  294  			HCS_N_PCC(ehci->hcs_params),
7ff71d6adf81a4 Matt Porter            2005-09-22  295  			HCS_N_PORTS(ehci->hcs_params));
7ff71d6adf81a4 Matt Porter            2005-09-22  296  
7ff71d6adf81a4 Matt Porter            2005-09-22  297  		switch (pdev->vendor) {
7ff71d6adf81a4 Matt Porter            2005-09-22  298  		case 0x17a0:		/* GENESYS */
7ff71d6adf81a4 Matt Porter            2005-09-22  299  			/* GL880S: should be PORTS=2 */
7ff71d6adf81a4 Matt Porter            2005-09-22  300  			temp |= (ehci->hcs_params & ~0xf);
7ff71d6adf81a4 Matt Porter            2005-09-22  301  			ehci->hcs_params = temp;
7ff71d6adf81a4 Matt Porter            2005-09-22  302  			break;
7ff71d6adf81a4 Matt Porter            2005-09-22  303  		case PCI_VENDOR_ID_NVIDIA:
7ff71d6adf81a4 Matt Porter            2005-09-22  304  			/* NF4: should be PCC=10 */
7ff71d6adf81a4 Matt Porter            2005-09-22  305  			break;
7ff71d6adf81a4 Matt Porter            2005-09-22  306  		}
7ff71d6adf81a4 Matt Porter            2005-09-22  307  	}
7ff71d6adf81a4 Matt Porter            2005-09-22  308  
7ff71d6adf81a4 Matt Porter            2005-09-22  309  	/* Serial Bus Release Number is at PCI 0x60 offset */
3a0bac0676d7f4 Alessandro Rubini      2012-01-06  310  	if (pdev->vendor == PCI_VENDOR_ID_STMICRO
3a0bac0676d7f4 Alessandro Rubini      2012-01-06  311  	    && pdev->device == PCI_DEVICE_ID_STMICRO_USB_HOST)
1a49e2ac9651df Alan Stern             2012-07-09  312  		;	/* ConneXT has no sbrn register */
26b75952ca0b8b Longfang Liu           2021-04-09  313  	else if (pdev->vendor == PCI_VENDOR_ID_HUAWEI
26b75952ca0b8b Longfang Liu           2021-04-09  314  			 && pdev->device == 0xa239)
26b75952ca0b8b Longfang Liu           2021-04-09  315  		;	/* HUAWEI Kunpeng920 USB EHCI has no sbrn register */
1a49e2ac9651df Alan Stern             2012-07-09  316  	else
1a49e2ac9651df Alan Stern             2012-07-09  317  		pci_read_config_byte(pdev, 0x60, &ehci->sbrn);
7ff71d6adf81a4 Matt Porter            2005-09-22  318  
6fd9086a518d4f Alan Stern             2008-12-17  319  	/* Keep this around for a while just in case some EHCI
6fd9086a518d4f Alan Stern             2008-12-17  320  	 * implementation uses legacy PCI PM support.  This test
6fd9086a518d4f Alan Stern             2008-12-17  321  	 * can be removed on 17 Dec 2009 if the dev_warn() hasn't
6fd9086a518d4f Alan Stern             2008-12-17  322  	 * been triggered by then.
2c1c3c4cd5f796 David Brownell         2005-11-07  323  	 */
2c1c3c4cd5f796 David Brownell         2005-11-07  324  	if (!device_can_wakeup(&pdev->dev)) {
2c1c3c4cd5f796 David Brownell         2005-11-07  325  		u16	port_wake;
2c1c3c4cd5f796 David Brownell         2005-11-07  326  
2c1c3c4cd5f796 David Brownell         2005-11-07  327  		pci_read_config_word(pdev, 0x62, &port_wake);
6fd9086a518d4f Alan Stern             2008-12-17  328  		if (port_wake & 0x0001) {
6fd9086a518d4f Alan Stern             2008-12-17  329  			dev_warn(&pdev->dev, "Enabling legacy PCI PM\n");
bcca06efea883b Alan Stern             2009-01-13  330  			device_set_wakeup_capable(&pdev->dev, 1);
2c1c3c4cd5f796 David Brownell         2005-11-07  331  		}
6fd9086a518d4f Alan Stern             2008-12-17  332  	}
7ff71d6adf81a4 Matt Porter            2005-09-22  333  

:::::: The code at line 130 was first introduced by commit
:::::: 48025b4f3fa4a599921c1dc231983f41f9eecbc5 USB: Remove pci-dma-compat wrapper APIs.

:::::: TO: Suraj Upadhyay <usuraj35@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
