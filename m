Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07414882B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715310467; cv=none; b=Yt/XJXrLeYSg7oGTBramN5xXiTbJzHHwwyK1SLVy2rOHQD9cdoxDBiIgsBWIs2iFAb3qk0qXpsR7LhfbK7XEEgfFuYU9cuTgy3+9bWwWJI21tnwRco4S7PdjMqviZgo1mVgEC1my0cIHdzzrTKjldzhOa/t4jco/GnOnu0ew9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715310467; c=relaxed/simple;
	bh=s4Lld+sZVfkD+rXdYBt1CAyO3c7rZMktnDBfsx6v9O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxDXcZf0oIZMW57wJa491n7q6ptCerIaZ9Zq7nUGdXKXXyUM0CkIHZETwvvxuOgOxjJ9EFB+LsHqlrKXXSZ4HCrF7dhmJ2/AzFQFFjUIyxUzMDd+FYKHQIshhPjCYwcG9iJYLP9A5jLDmlC29QbL1ShCMAKnh8Tut1ih5Gw8geY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLEIAR0D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLEIAR0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715310466; x=1746846466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s4Lld+sZVfkD+rXdYBt1CAyO3c7rZMktnDBfsx6v9O0=;
  b=LLEIAR0DTempXpZpj/2awSyOGLDx0YesP0grzJF78HZLLCnvNhgEO70J
   xcRONpak5LYPDK/YcaQtrBsWmMrVYjAF66azqL4PdDf6dc0fH2A9dy/pj
   mc/xdFxznAL+sIGLOOEUsRejPtT3h5k+h6YDdZ+wogj5qsxUXVKy6H13a
   W4sqFcWNQdv+5LFtSh2Q6GgnIH+elItMkpSM9Vzef4Ao/VBFRJD66vmoV
   dHyzmEkButrgF21uvBYCIf38zVFh0p+mVfM/x5TqvNNw1TgpXUs5z9543
   cr9Uxq0dtmmuXtll/gzpE9lyLL2dcjZbgGTY3ryrbpmp0QRS18wIRehOU
   w==;
X-CSE-ConnectionGUID: dtovXU9sTceQSxi7LrYCjQ==
X-CSE-MsgGUID: LN/6MfZlTnCuHCDsblpZAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21847651"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21847651"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 20:07:46 -0700
X-CSE-ConnectionGUID: xw73KJxWT0C6owjg4j2dxQ==
X-CSE-MsgGUID: c4AvYiPiRY21c7uL6knCng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="60634912"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 20:07:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Gbj-0005et-2H;
	Fri, 10 May 2024 03:07:39 +0000
Date: Fri, 10 May 2024 11:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Huang <wei.huang2@amd.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bhelgaas@google.com, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, alex.williamson@redhat.com, gospo@broadcom.com,
	michael.chan@broadcom.com, ajit.khaparde@broadcom.com,
	manoj.panicker2@amd.com, Eric.VanTassell@amd.com,
	wei.huang2@amd.com
Subject: Re: [PATCH V1 5/9] PCI/TPH: Introduce API functions to get/set
 steering tags
Message-ID: <202405101033.2xLAqHIx-lkp@intel.com>
References: <20240509162741.1937586-6-wei.huang2@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509162741.1937586-6-wei.huang2@amd.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/for-linus]
[also build test ERROR on awilliam-vfio/next linus/master awilliam-vfio/for-linus v6.9-rc7 next-20240509]
[cannot apply to pci/next horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Huang/PCI-Introduce-PCIe-TPH-support-framework/20240510-003504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20240509162741.1937586-6-wei.huang2%40amd.com
patch subject: [PATCH V1 5/9] PCI/TPH: Introduce API functions to get/set steering tags
config: parisc-randconfig-r081-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101033.2xLAqHIx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101033.2xLAqHIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101033.2xLAqHIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pcie/tph.c: In function 'tph_msix_table_entry':
>> drivers/pci/pcie/tph.c:95:22: error: 'struct pci_dev' has no member named 'msix_base'; did you mean 'msix_cap'?
      95 |         entry = dev->msix_base + msi_index * PCI_MSIX_ENTRY_SIZE;
         |                      ^~~~~~~~~
         |                      msix_cap


vim +95 drivers/pci/pcie/tph.c

    80	
    81	/*
    82	 * For a given device, return a pointer to the MSI table entry at msi_index.
    83	 */
    84	static void __iomem *tph_msix_table_entry(struct pci_dev *dev,
    85						  __le16 msi_index)
    86	{
    87		void *entry;
    88		u16 tbl_sz;
    89		int ret;
    90	
    91		ret = tph_get_table_size(dev, &tbl_sz);
    92		if (ret || msi_index > tbl_sz)
    93			return NULL;
    94	
  > 95		entry = dev->msix_base + msi_index * PCI_MSIX_ENTRY_SIZE;
    96	
    97		return entry;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
