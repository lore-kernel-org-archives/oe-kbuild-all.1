Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346415B971
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958028; cv=none; b=d6Z7+8gnsEeP0ZIj6o8AIepUrQXbiCK/FAHIxgXI4wJceSRYJIUODdAeH0MtceL40vEany/kBaTSMtBIMZJHxf0NUNq6shkFhxTbPy3u+M/Q4ZXN6sewTj0SS21/DysOiRPRKnWXeoWGC+848y7FsJPlSOhSznhZ1PXoMiM38Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958028; c=relaxed/simple;
	bh=Aktdd3XUBtzOF9yZQEDf87evYqXJNTX9Nu6KqB3Y+b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6XG/2Gp/X4x/QRVg3P3C+mtjeHj+Clu6jApVVc2U5QflglBgFWRHQIbgXlKoJ3SwLNiCpCKEbinqpH9zC38h3AEBugWqVwSeYQGYd63dVuSZ1kQPviDAJos3R4n3fZcwSW650PdggHeDs/l3AvZ+xkIqAkOlyfSaAVW4rCGui8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeCPwfd3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeCPwfd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739958026; x=1771494026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Aktdd3XUBtzOF9yZQEDf87evYqXJNTX9Nu6KqB3Y+b4=;
  b=HeCPwfd36Yv785NXdq0ROCiIWmpkEPhMXsnuDJXKXezEr5JhoNrWPCyQ
   wfMDPVNHXIUubt0TPChPhz+EfeQ/mYp1He7JG15sDa0X+MshtLHL/o7Or
   c7VnlbBubCZzWswX7MSgdsJV6NSKS9D1SrwiMwDkgNBMkCRSSRmzOlAGe
   +WZGV58euFVu2CJAxvEJNAry6XSc/yiJQmJX9d+v9ypJKleGQit953QPi
   e8AOjdMvm++9sr1NcmyhlB9clrYk9a3fzio5wYd/WEujAOtv8CwVDqHLL
   uQS4x0PY0qJeS44hmqNOA0Hsg8w7ndRc61hokpr6vT5b9u2Cn803nEYhu
   w==;
X-CSE-ConnectionGUID: gT4sZDJYRaWm+TesJkWzdw==
X-CSE-MsgGUID: DYZR3L15RYy/QHcsBGLi3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58093244"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="58093244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 01:40:26 -0800
X-CSE-ConnectionGUID: ebZoyQbSSOu/xmJotJKw7Q==
X-CSE-MsgGUID: zaWb09UWTbi2l2NBsAvpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="115177838"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2025 01:40:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkgZ4-0002gN-15;
	Wed, 19 Feb 2025 09:40:22 +0000
Date: Wed, 19 Feb 2025 17:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 3/3] PCI: amd-mdb: Add AMD MDB Root Port driver
Message-ID: <202502191741.xrVmEAG4-lkp@intel.com>
References: <20250218053039.714208-4-thippeswamy.havalige@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218053039.714208-4-thippeswamy.havalige@amd.com>

Hi Thippeswamy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.14-rc3 next-20250219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thippeswamy-Havalige/dt-bindings-PCI-dwc-Add-AMD-Versal2-mdb-slcr-support/20250218-133550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250218053039.714208-4-thippeswamy.havalige%40amd.com
patch subject: [PATCH v12 3/3] PCI: amd-mdb: Add AMD MDB Root Port driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250219/202502191741.xrVmEAG4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191741.xrVmEAG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191741.xrVmEAG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-amd-mdb.c:67: warning: Function parameter or struct member 'intx_irq' not described in 'amd_mdb_pcie'


vim +67 drivers/pci/controller/dwc/pcie-amd-mdb.c

    40	
    41	#define IMR(x) BIT(AMD_MDB_PCIE_INTR_ ##x)
    42	#define AMD_MDB_PCIE_IMR_ALL_MASK			\
    43		(						\
    44			IMR(CMPL_TIMEOUT)	|		\
    45			IMR(PM_PME_RCVD)	|		\
    46			IMR(PME_TO_ACK_RCVD)	|		\
    47			IMR(MISC_CORRECTABLE)	|		\
    48			IMR(NONFATAL)		|		\
    49			IMR(FATAL)		|		\
    50			AMD_MDB_TLP_PCIE_INTX_MASK		\
    51		)
    52	
    53	#define AMD_MDB_PCIE_INTX_BIT(x) (1U << (2 * (x) + AMD_MDB_PCIE_INTR_INTX))
    54	/**
    55	 * struct amd_mdb_pcie - PCIe port information
    56	 * @pci: DesignWare PCIe controller structure
    57	 * @slcr: MDB System Level Control and Status Register (SLCR) Base
    58	 * @intx_domain: INTx IRQ domain pointer
    59	 * @mdb_domain: MDB IRQ domain pointer
    60	 */
    61	struct amd_mdb_pcie {
    62		struct dw_pcie			pci;
    63		void __iomem			*slcr;
    64		struct irq_domain		*intx_domain;
    65		struct irq_domain		*mdb_domain;
    66		int				intx_irq;
  > 67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
