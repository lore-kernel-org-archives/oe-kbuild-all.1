Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636735AC02
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772864030; cv=none; b=GJYnCjxfpYV/GgQk4mSmtjHB9EQNCKGbBSyyUqx4EsG6kGli4iw4AhgmnUTSZizp5Qq30lskWaGy9vNWQSj90iy/BcqvA7KMg+N9PZyuu6l3FQIJKaQxKe6qBoZ1YQ0C8hmZNK8/7afNSDlgST5Alc/S9t7raGjTjKrVTRMn7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772864030; c=relaxed/simple;
	bh=yydZikvoBqFLTCCTDJC/NgU+pmkBDxQHWHJRMRN75mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyEVGjKTm/LbV+hDr9PQveLlG9ymmGszZD8MPo1QZjHyKglb/t2vRxDdaTLZmDR/iSLBqvq+M1IXhpC5bItrxj0MlLIUfCqo18Wj5Km8EpjbktrW1UAsfZyA9MmTF2sPzo2FRZwWPojFENe9klPE0bt4kOb4q3iN/62Lbhp+PM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dw7XaRFr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dw7XaRFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772864028; x=1804400028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yydZikvoBqFLTCCTDJC/NgU+pmkBDxQHWHJRMRN75mQ=;
  b=dw7XaRFrZhJ8Yba+zWK5k5vdgzC5kBTCxa3dr7rc+SWHYztwQCB1QM46
   n1jOIgkUsf6zUy3zL6dQuOLPFgVHa6YiQT41tEq7gu87GlhaGf8BSJFLl
   5FAxNQ9b2dIbtjZ6nEujT3xauCfsApWdAzxisEmupbYmx+rtjn9wa2kFR
   +gJcow3rzgK0D/OktY3wgnbxadk+DcB4X5ItX/Bjhc4uCUCdkOtFHiQHf
   BBXv8mJQt0orWExVFhmYk3Td8d/xAZGDlIbSkK2gNe9eK9FNE7s7tDfkd
   6lo2Eo0hP08O27/+1ew3zTOJwJsFnv6jmGhqyGg/otX8rZE7naiQtpceF
   Q==;
X-CSE-ConnectionGUID: 6Ylh/lzLSPauXELYLOHLPA==
X-CSE-MsgGUID: HuoYqtHDRu+bT7rI6rjvQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85319790"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="85319790"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 22:13:47 -0800
X-CSE-ConnectionGUID: U/uW3yjtQIqgikzcpe0Y8A==
X-CSE-MsgGUID: /2RVu5fGSVaJeoNMvxKu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223911924"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 22:13:46 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykv1-000000001l3-2vXo;
	Sat, 07 Mar 2026 06:13:43 +0000
Date: Sat, 7 Mar 2026 14:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] PCI: Work around CXL Port PM Init failure when ACS
 SV enabled
Message-ID: <202603071401.Z32VauWN-lkp@intel.com>
References: <20260306195232.388814-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306195232.388814-1-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus cxl/next linus/master v7.0-rc2 next-20260306]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/PCI-Work-around-CXL-Port-PM-Init-failure-when-ACS-SV-enabled/20260307-035826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260306195232.388814-1-fabio.m.de.francesco%40linux.intel.com
patch subject: [RFC PATCH] PCI: Work around CXL Port PM Init failure when ACS SV enabled
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603071401.Z32VauWN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071401.Z32VauWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071401.Z32VauWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:4883:6: warning: no previous prototype for 'cxl_sbr_masked' [-Wmissing-prototypes]
    4883 | bool cxl_sbr_masked(struct pci_dev *dev)
         |      ^~~~~~~~~~~~~~


vim +/cxl_sbr_masked +4883 drivers/pci/pci.c

  4882	
> 4883	bool cxl_sbr_masked(struct pci_dev *dev)
  4884	{
  4885		u16 dvsec, reg;
  4886		int rc;
  4887	
  4888		dvsec = cxl_port_dvsec(dev);
  4889		if (!dvsec)
  4890			return false;
  4891	
  4892		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_PORT_CTL, &reg);
  4893		if (rc || PCI_POSSIBLE_ERROR(reg))
  4894			return false;
  4895	
  4896		/*
  4897		 * Per CXL spec r3.1, sec 8.1.5.2, when "Unmask SBR" is 0, the SBR
  4898		 * bit in Bridge Control has no effect.  When 1, the Port generates
  4899		 * hot reset when the SBR bit is set to 1.
  4900		 */
  4901		if (reg & PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR)
  4902			return false;
  4903	
  4904		return true;
  4905	}
  4906	EXPORT_SYMBOL_NS_GPL(cxl_sbr_masked, "CXL");
  4907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
