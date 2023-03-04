Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7702567
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677942360; x=1709478360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZOFuIsCxcopSRwdBWvD6AIYApz6x/F/K+jkmPx+1Ik=;
  b=mvribKA8Gq6/TPDqjXKiNcqjQlrfeyIlF3Wa6mmzojdPbuvYlIXQZexM
   qlc6tsDc5Le6DruSMY2g+G++rbF7xBWPW4CcxtlYq4tWxuBYivXpudOrI
   gMdiSPY5r7jAB7cPn7M6ArP3+rikHJSRlzFnYwFsY3ZFb0t8AtDMnZS5g
   0c/f77BCzGCAQ9PKE0REV3TgxP58vQ2qnNFkBcrXVa0Q7hYmb9GC9IIzq
   922jPP8FST+JOc3dRIAy1dvWN1f2lQTWsxA73DBlD6KDrDrQFG/UT6w/J
   citWWN9Y183hXjBE0Dq2xBJR1iK0GYVwNtY7QcX+1dQNLBE1eAWfU/kDW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315662512"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="315662512"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 07:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675677392"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675677392"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 07:05:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYTSN-0002EE-1J;
	Sat, 04 Mar 2023 15:05:55 +0000
Date: Sat, 4 Mar 2023 23:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 26/53] htmldocs:
 Documentation/driver-api/vfio.rst:687: WARNING: Footnote [5] is not
 referenced.
Message-ID: <202303042259.E3DKpB2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: d9de7992535cee937359dad3e4d8234bdd833828 [26/53] docs: vfio: Add vfio device cdev description
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/d9de7992535cee937359dad3e4d8234bdd833828
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout d9de7992535cee937359dad3e4d8234bdd833828
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042259.E3DKpB2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/vfio.rst:687: WARNING: Footnote [5] is not referenced.

vim +687 Documentation/driver-api/vfio.rst

   658	
   659	.. [1] VFIO was originally an acronym for "Virtual Function I/O" in its
   660	   initial implementation by Tom Lyon while as Cisco.  We've since
   661	   outgrown the acronym, but it's catchy.
   662	
   663	.. [2] "safe" also depends upon a device being "well behaved".  It's
   664	   possible for multi-function devices to have backdoors between
   665	   functions and even for single function devices to have alternative
   666	   access to things like PCI config space through MMIO registers.  To
   667	   guard against the former we can include additional precautions in the
   668	   IOMMU driver to group multi-function PCI devices together
   669	   (iommu=group_mf).  The latter we can't prevent, but the IOMMU should
   670	   still provide isolation.  For PCI, SR-IOV Virtual Functions are the
   671	   best indicator of "well behaved", as these are designed for
   672	   virtualization usage models.
   673	
   674	.. [3] As always there are trade-offs to virtual machine device
   675	   assignment that are beyond the scope of VFIO.  It's expected that
   676	   future IOMMU technologies will reduce some, but maybe not all, of
   677	   these trade-offs.
   678	
   679	.. [4] In this case the device is below a PCI bridge, so transactions
   680	   from either function of the device are indistinguishable to the iommu::
   681	
   682		-[0000:00]-+-1e.0-[06]--+-0d.0
   683					\-0d.1
   684	
   685		00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
   686	
 > 687	.. [5] Nested translation is an IOMMU feature which supports two stage
   688	   address translations. This improves the address translation efficiency
   689	   in IOMMU virtualization.
   690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
