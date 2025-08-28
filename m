Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965C30C633
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376750; cv=none; b=ejXG5ku+kiEw+L5yMSaEjGLB+2pnkVwZJnjTJU9x/D1C2xHc5kjvvGoOXYmbz1VqdFTeAh43MN/FVcU8ato2LsrWzx82dQr/ZhAyVms1Fgp9quyOwdFAUaSAW1twT/nIPCpV88qtOK5wfu0psQX06yLQr5UdUR/hp7BtnnZgNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376750; c=relaxed/simple;
	bh=EdwYtD3WfXyt8eA32UzyrdpD8g6kesbFZ09NTbCkb5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3o3VsLqcb0AwFbZM89iMYHWyk0FFqbyxDPTOh+VrYz9OyDwc6fBRqvZcgnTZtK9/gYtrlR43dOdhpj9a+pUdYD92StmyPzZGrMYKljGI1j3pH5afes+MgcaCBcusCA4W46+HJvAB16rQ0IUTveZAEkHnM0xUau64uECfC9P1fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0LlZUjy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0LlZUjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756376749; x=1787912749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdwYtD3WfXyt8eA32UzyrdpD8g6kesbFZ09NTbCkb5A=;
  b=E0LlZUjydxITyP1sUcN0z+eJONa/+dMmsMA2HOhFoZbK1KCjzvhArvmN
   aORB0PD/gEIL5z3PMWUF4H8Fbvwj2BVeHVRWXpkFqx11QA7x46+O5sTgh
   vsbVH5z9OVX2b/zqLCI0YUqq/lt0XC0cKty4FYVW3ednDzcfaFUMwMk+t
   EpVbWL3fkZLTcqeKbXs11B6P7by+xuJRyKgULvnWVRGry5uSiLfz4uyFn
   mV5jiuboe+g2GqBXhNB99ToUHCiA9fNRS+vrImejHnIJGcjHJ0VG31hcn
   0oRp0ya4m2YbXrk3T79faAGU1iX+hzXdLj9F4LPJE6aZ2Fqvi7eRwC2WL
   Q==;
X-CSE-ConnectionGUID: 5irqKL1BTcuXZKkwMjByIA==
X-CSE-MsgGUID: Odp6V8ZDTHmQA3iiq7olvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61276182"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61276182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:25:48 -0700
X-CSE-ConnectionGUID: nHbXWGnqRhuWOb+A+mdklg==
X-CSE-MsgGUID: h9KcaGXZS0a+aAFVmX6yJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169976502"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Aug 2025 03:25:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urZpA-000Tdt-20;
	Thu, 28 Aug 2025 10:25:44 +0000
Date: Thu, 28 Aug 2025 18:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 15/15] drivers/pci/pcie/aer.c:937:36: error:
 called object 'tlp_header_valid' is not a function or function pointer
Message-ID: <202508281810.XwbQvREr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   30e1036dbdbd6541c82a07b8cff9a73aebd620dc
commit: 30e1036dbdbd6541c82a07b8cff9a73aebd620dc [15/15] PCI/AER: Print TLP Log for errors introduced since PCIe r1.1
config: i386-buildonly-randconfig-004-20250828 (https://download.01.org/0day-ci/archive/20250828/202508281810.XwbQvREr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281810.XwbQvREr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281810.XwbQvREr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'pci_print_aer':
>> drivers/pci/pcie/aer.c:937:36: error: called object 'tlp_header_valid' is not a function or function pointer
     937 |                 tlp_header_valid = tlp_header_valid(status, aer->cap_control);
         |                                    ^~~~~~~~~~~~~~~~
   drivers/pci/pcie/aer.c:922:27: note: declared here
     922 |         int layer, agent, tlp_header_valid = 0;
         |                           ^~~~~~~~~~~~~~~~


vim +/tlp_header_valid +937 drivers/pci/pcie/aer.c

   918	
   919	void pci_print_aer(struct pci_dev *dev, int aer_severity,
   920			   struct aer_capability_regs *aer)
   921	{
   922		int layer, agent, tlp_header_valid = 0;
   923		u32 status, mask;
   924		struct aer_err_info info = {
   925			.severity = aer_severity,
   926			.first_error = PCI_ERR_CAP_FEP(aer->cap_control),
   927		};
   928	
   929		if (aer_severity == AER_CORRECTABLE) {
   930			status = aer->cor_status;
   931			mask = aer->cor_mask;
   932			info.level = KERN_WARNING;
   933		} else {
   934			status = aer->uncor_status;
   935			mask = aer->uncor_mask;
   936			info.level = KERN_ERR;
 > 937			tlp_header_valid = tlp_header_valid(status, aer->cap_control);
   938		}
   939	
   940		info.status = status;
   941		info.mask = mask;
   942	
   943		pci_dev_aer_stats_incr(dev, &info);
   944		trace_aer_event(pci_name(dev), (status & ~mask),
   945				aer_severity, tlp_header_valid, &aer->header_log);
   946	
   947		if (!aer_ratelimit(dev, info.severity))
   948			return;
   949	
   950		layer = AER_GET_LAYER_ERROR(aer_severity, status);
   951		agent = AER_GET_AGENT(aer_severity, status);
   952	
   953		aer_printk(info.level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
   954			   status, mask);
   955		__aer_print_error(dev, &info);
   956		aer_printk(info.level, dev, "aer_layer=%s, aer_agent=%s\n",
   957			   aer_error_layer[layer], aer_agent_string[agent]);
   958	
   959		if (aer_severity != AER_CORRECTABLE)
   960			aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
   961				   aer->uncor_severity);
   962	
   963		if (tlp_header_valid)
   964			pcie_print_tlp_log(dev, &aer->header_log, info.level,
   965					   dev_fmt("  "));
   966	}
   967	EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
   968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
