Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7A186A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275499; cv=none; b=rVxqB//XR8gG8Egcfu3eAXeCH3yvwkqen7Vaqu1wEhxuDcFGMioo5+3XblIi0s437T0kDGln4+akFtd4DmOtrFEgrEPoJvlnQxGb24oeRHnrG+DNyBjJz7Y2mKLNvzshRlZ3TkVe3ZDlmcs5Y7R6bLJTy+1jHEjajL7jS8RCLQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275499; c=relaxed/simple;
	bh=lfEHiZVlVIqMv7bJpw1Z8Wv56L3+AltgrXL7vaPDHRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDSG57GhX0t3gmxjO5UhxFt0FyYl5VcqLjxuBrg/D0Ir6AG2iAecMc2EvnTgU+Pn0kjZVcnUfZf9flSGbHnOSow/kmhuwgWWkFuQHjqa+mD3NP6ecj8jUFYOY4PaV00wIW5pmDOdIlELha43gSECjMm/7mAAi2fhD41gfugnOe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etQ45HPI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etQ45HPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742275497; x=1773811497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfEHiZVlVIqMv7bJpw1Z8Wv56L3+AltgrXL7vaPDHRE=;
  b=etQ45HPISkBH0elYi9+Fs0JReFpj/amyzkxia+CiPd2Trlk80/xwwh8A
   Y9UH1LuGEbk0kBhc/NJYJbYVWT8H0q1vpBjJJALTT2kKBqMMFZIy7Ch+4
   DoE7mxKZP+bVX18secuzJjUtNONF8c4MmotrdnHA01enWiLnAfwHscg5l
   0BIHQ/vYwCQgXw999xy2a3XcTPL19C19jq5qj8+zjQMOy+uRhlge/bD6d
   sky+HtCxeqQFcXgtjrnpbHJejH8U81mW5y/ERDueihBMfkxkcZXClmobW
   lTAI7qQFgeQUTMJgs+HS7AUHegwL2Mdo4CecZRYfyGI58TQA3JCE+M+xa
   w==;
X-CSE-ConnectionGUID: bUvk3v6DQMOJrIFvkeqGyQ==
X-CSE-MsgGUID: F1kP5AB7Ql2l9GPCZ8oWVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="46162039"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="46162039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 22:24:54 -0700
X-CSE-ConnectionGUID: pWfsYrHqSE+P4QNPniGpjA==
X-CSE-MsgGUID: nkk2BOWiQmqh//C2GH1gFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122168684"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2025 22:24:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuPRB-000DQi-07;
	Tue, 18 Mar 2025 05:24:48 +0000
Date: Tue, 18 Mar 2025 13:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 21/21] drivers/cxl/pci.c:208:1:
 warning: no previous prototype for 'cxl_pci_quirk_lookup_id'
Message-ID: <202503181339.dAuxrCx6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   0e71e11c7c57c6a824d6a2a6d48ef99568a94b3b
commit: 544db78fe9233c27927a75b535b83b53b1ee3b00 [21/21] anolis: driver/cxl: remove the sanitize limit and fix the return code bug
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250318/202503181339.dAuxrCx6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181339.dAuxrCx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181339.dAuxrCx6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/pci.c:208:1: warning: no previous prototype for 'cxl_pci_quirk_lookup_id' [-Wmissing-prototypes]
     208 | cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/pci.c:223:1: warning: no previous prototype for 'cxl_pci_quirk_lookup' [-Wmissing-prototypes]
     223 | cxl_pci_quirk_lookup(struct pci_dev *pci, const struct cxl_pci_quirk *list)
         | ^~~~~~~~~~~~~~~~~~~~


vim +/cxl_pci_quirk_lookup_id +208 drivers/cxl/pci.c

   206	
   207	const struct cxl_pci_quirk *
 > 208	cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
   209				const struct cxl_pci_quirk *list)
   210	{
   211		const struct cxl_pci_quirk *q;
   212	
   213		for (q = list; q->vendor || q->device; q++) {
   214			if (q->vendor != vendor)
   215				continue;
   216			if (!q->device || device == q->device)
   217				return q;
   218		}
   219		return NULL;
   220	}
   221	
   222	const struct cxl_pci_quirk *
 > 223	cxl_pci_quirk_lookup(struct pci_dev *pci, const struct cxl_pci_quirk *list)
   224	{
   225		if (!pci)
   226			return NULL;
   227		return cxl_pci_quirk_lookup_id(pci->vendor,
   228					       pci->device,
   229					       list);
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
