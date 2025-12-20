Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7151275844
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258208; cv=none; b=hCa0fEco+YF6/ONXhwsaa9hd9O8jihXvWd69iDmEG+Qom3zFy24eVAAzn5QWVxqDs2PEhFXYou7QO7Tude5ITHMs65Vic3ZlByCmhoIswECiTOYpH/Sf3Fj7i0RhRBDXkpDHzOqytiuEWL44N52b6k7SYpP/B4QmrcCdz7AALpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258208; c=relaxed/simple;
	bh=AlMwsGmQJqjTpP8Waf1AWz8+E74NODaB1nv1e3+CC4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt3Tsrg1zvfCJQcAw0KoYX472CTOpl/i5+JQGuBlUt/qPafn6b3UV9PJkvBZGuZkkRJ6mh5j4YnLsQs97etjNV/DGrHokI2v0FT+5gGreRwKQAz1rXp4/4j4FQeqSPjdlNOzXB+JB0RXgSyCUoOkjn+1+q5XtvbyDQfkWRre3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1b1Uygh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1b1Uygh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766258206; x=1797794206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AlMwsGmQJqjTpP8Waf1AWz8+E74NODaB1nv1e3+CC4c=;
  b=F1b1UyghhX5J0G+lUTEYw9YQjL2HH8kJagKwGlvyZZH5sFj21jPDh+KK
   grThLLDQoxlj2SQPP+7iRpRCHst5mVC4uAXxo/loDp8/NjGLOeRoO4aTM
   SjAFnb22R1He55DoN1amh163cz9cMnutuZjhJcVQ7WpGqV3fB78gB579X
   F113YBSDmj0+SgAMC5Y653IoU/LWQEz3SeVFIJuHlnq+uKZk5CfHTNvTH
   VHSBtsGpaHlO1v/dfTsAbYR71vSH14k1XXKe0KNT4LekgLL1/XLJklGPm
   Q1eZjBXI80/US4DB7ucQ6oELdYpVuOz1t54v7xVlbr0JPnstH5vCW7U9K
   g==;
X-CSE-ConnectionGUID: tI2u8vqiS9GCmshrL+dAFA==
X-CSE-MsgGUID: rabXaIVET2u4aNHmx8WoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78900172"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78900172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:16:43 -0800
X-CSE-ConnectionGUID: 4Q5kjRgEQXywYdRJjysyfA==
X-CSE-MsgGUID: hTo/PrToSV60xdeH1gSTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199068930"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 11:16:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2RS-0000000053p-30Cm;
	Sat, 20 Dec 2025 19:16:38 +0000
Date: Sun, 21 Dec 2025 03:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] pci: extend pci-stub to support explicit binding by PCI
 BUSID
Message-ID: <202512210236.u7vwB62h-lkp@intel.com>
References: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Shlyakhov/pci-extend-pci-stub-to-support-explicit-binding-by-PCI-BUSID/20251219-211130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251219131038.21052-1-roman.shlyakhov.rs%40gmail.com
patch subject: [PATCH] pci: extend pci-stub to support explicit binding by PCI BUSID
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210236.u7vwB62h-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210236.u7vwB62h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210236.u7vwB62h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/pci-stub.c:220:13: error: expected declaration specifiers or '...' before string constant
     220 | early_param("pci_stub_busid", pci_stub_early_param);
         |             ^~~~~~~~~~~~~~~~
>> drivers/pci/pci-stub.c:220:31: error: expected declaration specifiers or '...' before 'pci_stub_early_param'
     220 | early_param("pci_stub_busid", pci_stub_early_param);
         |                               ^~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-stub.c:210:19: warning: 'pci_stub_early_param' defined but not used [-Wunused-function]
     210 | static int __init pci_stub_early_param(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +220 drivers/pci/pci-stub.c

   206	
   207	/**
   208	 * early_param "pci_stub_busid" handler for the built-in module.
   209	 */
 > 210	static int __init pci_stub_early_param(char *str)
   211	{
   212		if (!str)
   213			return 0;
   214	
   215		pr_info("pci-stub: parsing early busid param: %s\n", str);
   216		strscpy(busid_param, str, sizeof(busid_param));
   217		return 0;
   218	}
   219	
 > 220	early_param("pci_stub_busid", pci_stub_early_param);
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
