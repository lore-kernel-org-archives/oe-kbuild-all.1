Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971F749D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692659804; x=1724195804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r3VkXBjvjLLtwJlaJspEGoy8NGy+xBUWLGbHJuxLxYg=;
  b=NGV7REfZTGfzSFlP9TLo0L1mdnvniyZxcY0otidGzGJeWG/OYSlW1auy
   pak39tP46Cgcy9Pg/EdzmPr1AftAi7L0jQcJL1agLzqfzuwn//Pm3140l
   tq9qq7RjzrdWs83o7BB9GSwJrZq3gL6OBc83SVc9+uJfpCKa7y336gI0B
   p+L7gUU98mmMmQ77bMjuCjmqyyAkKQvp2l83P12vcHqGthgLqrfc31gOU
   b852ODHIbVQ6XsxENoaosg/t/U2ahCyfREbffMS/dGugW79LL6f8VTG6y
   QrHBjLU3Vug6pBMbGlYUi7wtsC1VlACPee9/MGhecgdqbDLWQx0KU+JXV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460090550"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="460090550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735994386"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="735994386"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 16:16:36 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYE83-00013I-2A;
	Mon, 21 Aug 2023 23:16:20 +0000
Date: Tue, 22 Aug 2023 07:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Valentine Sinitsyn <valesini@yandex-team.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/2] PCI: implement custom llseek method for
 PCI resource entries in sysfs
Message-ID: <202308220648.wcmc5jWq-lkp@intel.com>
References: <20230821072956.114193-2-valesini@yandex-team.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821072956.114193-2-valesini@yandex-team.ru>

Hi Valentine,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc7 next-20230821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentine-Sinitsyn/PCI-implement-custom-llseek-method-for-PCI-resource-entries-in-sysfs/20230821-163118
base:   linus/master
patch link:    https://lore.kernel.org/r/20230821072956.114193-2-valesini%40yandex-team.ru
patch subject: [RESEND PATCH v2 2/2] PCI: implement custom llseek method for PCI resource entries in sysfs
config: powerpc-randconfig-r024-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220648.wcmc5jWq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220648.wcmc5jWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220648.wcmc5jWq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pci-sysfs.c:936:13: warning: no previous prototype for 'pci_adjust_legacy_attr' [-Wmissing-prototypes]
     936 | void __weak pci_adjust_legacy_attr(struct pci_bus *b,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci-sysfs.c: In function 'pci_create_legacy_files':
>> drivers/pci/pci-sysfs.c:971:32: error: 'pci_llseek_resource' undeclared (first use in this function); did you mean 'pci_claim_resource'?
     971 |         b->legacy_io->llseek = pci_llseek_resource;
         |                                ^~~~~~~~~~~~~~~~~~~
         |                                pci_claim_resource
   drivers/pci/pci-sysfs.c:971:32: note: each undeclared identifier is reported only once for each function it appears in


vim +971 drivers/pci/pci-sysfs.c

   940	
   941	/**
   942	 * pci_create_legacy_files - create legacy I/O port and memory files
   943	 * @b: bus to create files under
   944	 *
   945	 * Some platforms allow access to legacy I/O port and ISA memory space on
   946	 * a per-bus basis.  This routine creates the files and ties them into
   947	 * their associated read, write and mmap files from pci-sysfs.c
   948	 *
   949	 * On error unwind, but don't propagate the error to the caller
   950	 * as it is ok to set up the PCI bus without these files.
   951	 */
   952	void pci_create_legacy_files(struct pci_bus *b)
   953	{
   954		int error;
   955	
   956		if (!sysfs_initialized)
   957			return;
   958	
   959		b->legacy_io = kcalloc(2, sizeof(struct bin_attribute),
   960				       GFP_ATOMIC);
   961		if (!b->legacy_io)
   962			goto kzalloc_err;
   963	
   964		sysfs_bin_attr_init(b->legacy_io);
   965		b->legacy_io->attr.name = "legacy_io";
   966		b->legacy_io->size = 0xffff;
   967		b->legacy_io->attr.mode = 0600;
   968		b->legacy_io->read = pci_read_legacy_io;
   969		b->legacy_io->write = pci_write_legacy_io;
   970		/* See pci_create_attr() for motivation */
 > 971		b->legacy_io->llseek = pci_llseek_resource;
   972		b->legacy_io->mmap = pci_mmap_legacy_io;
   973		b->legacy_io->f_mapping = iomem_get_mapping;
   974		pci_adjust_legacy_attr(b, pci_mmap_io);
   975		error = device_create_bin_file(&b->dev, b->legacy_io);
   976		if (error)
   977			goto legacy_io_err;
   978	
   979		/* Allocated above after the legacy_io struct */
   980		b->legacy_mem = b->legacy_io + 1;
   981		sysfs_bin_attr_init(b->legacy_mem);
   982		b->legacy_mem->attr.name = "legacy_mem";
   983		b->legacy_mem->size = 1024*1024;
   984		b->legacy_mem->attr.mode = 0600;
   985		b->legacy_mem->mmap = pci_mmap_legacy_mem;
   986		/* See pci_create_attr() for motivation */
   987		b->legacy_io->llseek = pci_llseek_resource;
   988		b->legacy_mem->f_mapping = iomem_get_mapping;
   989		pci_adjust_legacy_attr(b, pci_mmap_mem);
   990		error = device_create_bin_file(&b->dev, b->legacy_mem);
   991		if (error)
   992			goto legacy_mem_err;
   993	
   994		return;
   995	
   996	legacy_mem_err:
   997		device_remove_bin_file(&b->dev, b->legacy_io);
   998	legacy_io_err:
   999		kfree(b->legacy_io);
  1000		b->legacy_io = NULL;
  1001	kzalloc_err:
  1002		dev_warn(&b->dev, "could not create legacy I/O port and ISA memory resources in sysfs\n");
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
