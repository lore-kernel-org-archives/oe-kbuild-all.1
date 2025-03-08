Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA16156230
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741405902; cv=none; b=LgrU0/8B6IuK/6gpZ7HqJiMtaH2he0JGiP0rChSolVMp8jyG68qZHOZBBJnXuSfoV1dHjj8MEqm1tpWCObItf8zEFFsnn809zO/KJ5m4UVqF0QNgLiCwwBzhHYY8iBU2d2wG0B8TlRh8NlZ8uJTz8T6N1/3CvyPJm5H7XXHAWw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741405902; c=relaxed/simple;
	bh=bsNfgHYFpXshAZEGa4w3aOgfz1OlcoEeQ6WrMqThn0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhnY5ykhj0hs6043KRLbybAneyYaW4we5pOdQCK0wEprGgyEx+43WKdM7QL3iTi7wD3zVetptelIGLZEE3YU7INEV0FXT8VliceKRAiflKI53c9bOcJ88TcLVL73LSYmpmFzuB63ubByvCQpDD1NX9YlV3SCp6688CySBUfrplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=galqR8/B; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="galqR8/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741405901; x=1772941901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsNfgHYFpXshAZEGa4w3aOgfz1OlcoEeQ6WrMqThn0E=;
  b=galqR8/B9aEDMvTSdL4URmOQ4+N9DOJStypf3f4oBejSRqQWN/N1YU9M
   imeQNmagtIdM5Rdka8ic0rT+QSIR5x+hW8aBgRwFCgf5K/eaJSK89qFBg
   eJJo95fh6NpLmsxPFUSMYIHRb5GqhHYPaznHUa3o2FV8huH+msZsucGEp
   TIe9Ud662PM2BzuUK8Np8Cv4m8eR17c/xZ1vbRoIlBkYoBm2Ew/353UlE
   re8fdZR6e8OzNi6K5f6isHRgHgWZQk8T/mrHDxCh3MVQrb/3JCo9hPysP
   yzYCG23fqI66StmeKKG6J+zF5y1dhhdAiFaGErPK/S5+hDYyqE4yOIX8J
   Q==;
X-CSE-ConnectionGUID: K1CmAIRkQ72b9FrYPBzRCQ==
X-CSE-MsgGUID: 2aVBwyp0Rpyr4HAtNUvY1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42587967"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42587967"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 19:51:41 -0800
X-CSE-ConnectionGUID: jeGbpzaRRR6QnAW8ubjQ3A==
X-CSE-MsgGUID: OGFbkF9aTMiHysFZU6FhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120398234"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2025 19:51:39 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqlDt-0001Rw-09;
	Sat, 08 Mar 2025 03:51:37 +0000
Date: Sat, 8 Mar 2025 11:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/msi 9/11] drivers/pci/tph.c:307:52: error:
 'msix_idx' undeclared
Message-ID: <202503081120.6H6oRs4y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi
head:   3c18507c3399a1cedf7a102a03c28ffab3e785aa
commit: defb1c68db9bbe478ff9e59d0dcd70a9d0d1376f [9/11] PCI/TPH: Replace the broken MSI-X control word update
config: riscv-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081120.6H6oRs4y-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081120.6H6oRs4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081120.6H6oRs4y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/tph.c: In function 'pcie_tph_set_st_entry':
>> drivers/pci/tph.c:307:52: error: 'msix_idx' undeclared (first use in this function)
     307 |                 err = pci_msix_write_tph_tag(pdev, msix_idx, tag);
         |                                                    ^~~~~~~~
   drivers/pci/tph.c:307:52: note: each undeclared identifier is reported only once for each function it appears in


vim +/msix_idx +307 drivers/pci/tph.c

   267	
   268	/**
   269	 * pcie_tph_set_st_entry() - Set Steering Tag in the ST table entry
   270	 * @pdev: PCI device
   271	 * @index: ST table entry index
   272	 * @tag: Steering Tag to be written
   273	 *
   274	 * Figure out the proper location of ST table, either in the MSI-X table or
   275	 * in the TPH Extended Capability space, and write the Steering Tag into
   276	 * the ST entry pointed by index.
   277	 *
   278	 * Return: 0 if success, otherwise negative value (-errno)
   279	 */
   280	int pcie_tph_set_st_entry(struct pci_dev *pdev, unsigned int index, u16 tag)
   281	{
   282		u32 loc;
   283		int err = 0;
   284	
   285		if (!pdev->tph_cap)
   286			return -EINVAL;
   287	
   288		if (!pdev->tph_enabled)
   289			return -EINVAL;
   290	
   291		/* No need to write tag if device is in "No ST Mode" */
   292		if (pdev->tph_mode == PCI_TPH_ST_NS_MODE)
   293			return 0;
   294	
   295		/*
   296		 * Disable TPH before updating ST to avoid potential instability as
   297		 * cautioned in PCIe r6.2, sec 6.17.3, "ST Modes of Operation"
   298		 */
   299		set_ctrl_reg_req_en(pdev, PCI_TPH_REQ_DISABLE);
   300	
   301		loc = get_st_table_loc(pdev);
   302		/* Convert loc to match with PCI_TPH_LOC_* */
   303		loc = FIELD_PREP(PCI_TPH_CAP_LOC_MASK, loc);
   304	
   305		switch (loc) {
   306		case PCI_TPH_LOC_MSIX:
 > 307			err = pci_msix_write_tph_tag(pdev, msix_idx, tag);
   308			break;
   309		case PCI_TPH_LOC_CAP:
   310			err = write_tag_to_st_table(pdev, index, tag);
   311			break;
   312		default:
   313			err = -EINVAL;
   314		}
   315	
   316		if (err) {
   317			pcie_disable_tph(pdev);
   318			return err;
   319		}
   320	
   321		set_ctrl_reg_req_en(pdev, pdev->tph_req_type);
   322	
   323		pci_dbg(pdev, "set steering tag: %s table, index=%d, tag=%#04x\n",
   324			(loc == PCI_TPH_LOC_MSIX) ? "MSI-X" : "ST", index, tag);
   325	
   326		return 0;
   327	}
   328	EXPORT_SYMBOL(pcie_tph_set_st_entry);
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
