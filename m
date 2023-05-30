Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BB206B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 19:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685475221; x=1717011221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HV30SRNr6TuD9f2xAtVKLmnaO2XMVdAA7go/si++uj4=;
  b=HelADt7i09rrbkVtwoR2ZGipyOWfd99wD8DS/uzQVnjnnjT63whC2JIC
   +Txf8pQaw2U6gK0/HSqZxw1JAvBq/MUVy/ks85RULx/X8/9Yz17cMf7dC
   o6FkbHlBsV7XJLxO4gkD1miX/3yvZ+8n9OfxuMSkXczfoc6/cVCv1YtMF
   jVwJqVnE1d/x4LcFLLg20bL36vvbprwP4VQtswqP/utK16p9bL0deFmhd
   9w0wJcpfU94P70oArHo8BxDTu+0KByFiBDs6oPjbjhT+bql7iq6UZrPOk
   vIK3Zgb9Cjbr6rgIAQ0tsA3nwQsyzRtY2ftU86mxS1tS9LwuiG/+eS5We
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357408083"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="357408083"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 12:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776473025"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="776473025"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 12:33:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q456A-0000lX-2p;
	Tue, 30 May 2023 19:33:38 +0000
Date: Wed, 31 May 2023 03:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v11 32/33] htmldocs:
 Documentation/driver-api/vfio.rst:694: WARNING: Footnote [5] is not
 referenced.
Message-ID: <202305310337.HB64Vpvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/vfio_device_cdev_v11
head:   3f4a86f74d631a0b5cdcc3a30018941ffb413e6c
commit: 01cd109fb6734901ac4fc701e3c4188f8b4a84b9 [32/33] docs: vfio: Add vfio device cdev description
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/01cd109fb6734901ac4fc701e3c4188f8b4a84b9
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v11
        git checkout 01cd109fb6734901ac4fc701e3c4188f8b4a84b9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310337.HB64Vpvz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/vfio.rst:694: WARNING: Footnote [5] is not referenced.

vim +694 Documentation/driver-api/vfio.rst

   665	
   666	.. [1] VFIO was originally an acronym for "Virtual Function I/O" in its
   667	   initial implementation by Tom Lyon while as Cisco.  We've since
   668	   outgrown the acronym, but it's catchy.
   669	
   670	.. [2] "safe" also depends upon a device being "well behaved".  It's
   671	   possible for multi-function devices to have backdoors between
   672	   functions and even for single function devices to have alternative
   673	   access to things like PCI config space through MMIO registers.  To
   674	   guard against the former we can include additional precautions in the
   675	   IOMMU driver to group multi-function PCI devices together
   676	   (iommu=group_mf).  The latter we can't prevent, but the IOMMU should
   677	   still provide isolation.  For PCI, SR-IOV Virtual Functions are the
   678	   best indicator of "well behaved", as these are designed for
   679	   virtualization usage models.
   680	
   681	.. [3] As always there are trade-offs to virtual machine device
   682	   assignment that are beyond the scope of VFIO.  It's expected that
   683	   future IOMMU technologies will reduce some, but maybe not all, of
   684	   these trade-offs.
   685	
   686	.. [4] In this case the device is below a PCI bridge, so transactions
   687	   from either function of the device are indistinguishable to the iommu::
   688	
   689		-[0000:00]-+-1e.0-[06]--+-0d.0
   690					\-0d.1
   691	
   692		00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
   693	
 > 694	.. [5] Nested translation is an IOMMU feature which supports two stage
   695	   address translations.  This improves the address translation efficiency
   696	   in IOMMU virtualization.
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
