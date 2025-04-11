Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67363220698
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390057; cv=none; b=O2tH7ZV+aFOVnDBUSHj3D2phAAbW1zMR1q5rXIAD7DjNK8cbwhfCOclYTY4AG1mXFtzO/KA1crYJ6yG9Pi2LFDEgfiZq/cG54KA75LkAKyysoZkLnwLP6z/55CLtTWIcOXIEcKHc0SnX6UXhAvu6yTV5xMM1bP852YQ8zJDx4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390057; c=relaxed/simple;
	bh=+89tmZ1KcSAUjdBfDLC21HzV865DbsiJ9s8C1AJiEAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqMic2qX5eFk/xH1pXv/tFJuC6q0Td0b6QA8ihlAYFvb9lOyqMxHsBgsZnm8MpYrGzK/6e1zMyDi1h1HxNW4B7MkTVm/9+J5UjT3Jx18TyZNLUaDjjpjrNZtmPju7ZKB54iPL3tIFNTI4smI4p7rdWZF1KgBZjt2+ACxjyKLEF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyaUD5kx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyaUD5kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744390056; x=1775926056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+89tmZ1KcSAUjdBfDLC21HzV865DbsiJ9s8C1AJiEAk=;
  b=fyaUD5kx9aRmRB5kpnxs6QHMuij/cnLQJptVq+HLaCvxJyRaaQ/GhSKd
   v+EvsTtpILlKYCNYWEXl+E+V6279PkwV0Ku84zTQAUGVO0nCiC/i6mwMP
   aUdT4NKB58CZvERrBYiXWk+q/ydRQN5F3ipC841KJOycqvzUmm6kU1ynl
   k7uMzLlsjL4CvNxiZpNCMA9BpyI4CzUUqObEzHKyAAGInYOS9aDdxGMJU
   +/1636fQ/nEzz2t1ZDss+Xt3llOXb01CwOz48OpyvBQuVhS4o4zyPNQXK
   2HlqWE3hWK57HV7Tr1Vbks5WbmDqCI3vV/OysCf+RbPgOPYo9UfImsSAY
   w==;
X-CSE-ConnectionGUID: 2/+c9up3Txy1D2e4E0AVeA==
X-CSE-MsgGUID: xoD4DcVNRsmjxFAtV+l44g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45188764"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="45188764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:47:35 -0700
X-CSE-ConnectionGUID: TpL2YpuiS5qbS/ud9L0amg==
X-CSE-MsgGUID: eAIEBLClT2at38vq1ZfPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="134399728"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Apr 2025 09:47:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3HXP-000BFq-1A;
	Fri, 11 Apr 2025 16:47:31 +0000
Date: Sat, 12 Apr 2025 00:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2858/2858]
 drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6835 ngbe_io_error_detected()
 warn: inconsistent indenting
Message-ID: <202504120007.4O7NSSul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8cf05d37849321b8bb9b74e099fa5bb6164d4f56
commit: a5961b4bc6ce09a70902686ecc848a47493a9251 [2858/2858] openeuler: net: ngbe: add ngbe module support
config: x86_64-randconfig-161-20250411 (https://download.01.org/0day-ci/archive/20250412/202504120007.4O7NSSul-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120007.4O7NSSul-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6835 ngbe_io_error_detected() warn: inconsistent indenting

Old smatch warnings:
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1850 ngbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 1850.
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3931 ngbe_setup_all_rx_resources() warn: inconsistent indenting
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5084 ngbe_reset_subtask() warn: inconsistent indenting
drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5313 ngbe_tso() warn: inconsistent indenting

vim +6835 drivers/net/ethernet/netswift/ngbe/ngbe_main.c

  6819	
  6820	/**
  6821	 * ngbe_io_error_detected - called when PCI error is detected
  6822	 * @pdev: Pointer to PCI device
  6823	 * @state: The current pci connection state
  6824	 *
  6825	 * This function is called after a PCI bus error affecting
  6826	 * this device has been detected.
  6827	 */
  6828	static pci_ers_result_t ngbe_io_error_detected(struct pci_dev *pdev,
  6829							pci_channel_state_t state)
  6830	{
  6831		struct ngbe_adapter *adapter = pci_get_drvdata(pdev);
  6832		struct net_device *netdev = adapter->netdev;
  6833	
  6834	#ifdef CONFIG_PCI_IOV
> 6835			struct ngbe_hw *hw = &adapter->hw;
  6836			struct pci_dev *bdev, *vfdev;
  6837			u32 dw0, dw1, dw2, dw3;
  6838			int vf, pos;
  6839			u16 req_id, pf_func;
  6840	
  6841			if (adapter->num_vfs == 0)
  6842				goto skip_bad_vf_detection;
  6843	
  6844			bdev = pdev->bus->self;
  6845			while (bdev && (pci_pcie_type(bdev) != PCI_EXP_TYPE_ROOT_PORT))
  6846				bdev = bdev->bus->self;
  6847	
  6848			if (!bdev)
  6849				goto skip_bad_vf_detection;
  6850	
  6851			pos = pci_find_ext_capability(bdev, PCI_EXT_CAP_ID_ERR);
  6852			if (!pos)
  6853				goto skip_bad_vf_detection;
  6854	
  6855			dw0 = ngbe_read_pci_cfg_dword(hw, pos + PCI_ERR_HEADER_LOG);
  6856			dw1 = ngbe_read_pci_cfg_dword(hw,
  6857								pos + PCI_ERR_HEADER_LOG + 4);
  6858			dw2 = ngbe_read_pci_cfg_dword(hw,
  6859								pos + PCI_ERR_HEADER_LOG + 8);
  6860			dw3 = ngbe_read_pci_cfg_dword(hw,
  6861								pos + PCI_ERR_HEADER_LOG + 12);
  6862			if (NGBE_REMOVED(hw->hw_addr))
  6863				goto skip_bad_vf_detection;
  6864	
  6865			req_id = dw1 >> 16;
  6866			/* if bit 7 of the requestor ID is set then it's a VF */
  6867			if (!(req_id & 0x0080))
  6868				goto skip_bad_vf_detection;
  6869	
  6870			pf_func = req_id & 0x01;
  6871			if ((pf_func & 1) == (pdev->devfn & 1)) {
  6872				vf = (req_id & 0x7F) >> 1;
  6873				e_dev_err("VF %d has caused a PCIe error\n", vf);
  6874				e_dev_err("TLP: dw0: %8.8x\tdw1: %8.8x\tdw2: %8.8x\tdw3: %8.8x\n",
  6875				dw0, dw1, dw2, dw3);
  6876	
  6877				/* Find the pci device of the offending VF */
  6878				vfdev = pci_get_device(PCI_VENDOR_ID_TRUSTNETIC,
  6879							NGBE_VF_DEVICE_ID, NULL);
  6880				while (vfdev) {
  6881					if (vfdev->devfn == (req_id & 0xFF))
  6882						break;
  6883					vfdev = pci_get_device(PCI_VENDOR_ID_TRUSTNETIC,
  6884							NGBE_VF_DEVICE_ID, vfdev);
  6885				}
  6886				/* There's a slim chance the VF could have been hot
  6887				 * plugged, so if it is no longer present we don't need
  6888				 * to issue the VFLR.Just clean up the AER in that case.
  6889				 */
  6890				if (vfdev) {
  6891					ngbe_issue_vf_flr(adapter, vfdev);
  6892					/* Free device reference count */
  6893					pci_dev_put(vfdev);
  6894				}
  6895	
  6896				pci_aer_clear_nonfatal_status(pdev);
  6897			}
  6898	
  6899			/* Even though the error may have occurred on the other port
  6900			 * we still need to increment the vf error reference count for
  6901			 * both ports because the I/O resume function will be called
  6902			 * for both of them.
  6903			 */
  6904			adapter->vferr_refcount++;
  6905	
  6906			return PCI_ERS_RESULT_RECOVERED;
  6907	
  6908	skip_bad_vf_detection:
  6909	#endif /* CONFIG_PCI_IOV */
  6910	
  6911		if (!test_bit(__NGBE_SERVICE_INITED, &adapter->state))
  6912			return PCI_ERS_RESULT_DISCONNECT;
  6913	
  6914		rtnl_lock();
  6915		netif_device_detach(netdev);
  6916	
  6917		if (state == pci_channel_io_perm_failure) {
  6918			rtnl_unlock();
  6919			return PCI_ERS_RESULT_DISCONNECT;
  6920		}
  6921	
  6922		if (netif_running(netdev))
  6923			ngbe_close(netdev);
  6924	
  6925		if (!test_and_set_bit(__NGBE_DISABLED, &adapter->state))
  6926			pci_disable_device(pdev);
  6927		rtnl_unlock();
  6928	
  6929		/* Request a slot reset. */
  6930		return PCI_ERS_RESULT_NEED_RESET;
  6931	}
  6932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
