Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD5212B31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 06:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750141318; cv=none; b=aWV8sjb24SIsSfgg/ErY4wnle0aZu4Fqqk0vKDJPv9Mb+SVJkEFdEcQoJ/X58RzQ/LOh23GVTnyzNVioVz1aA3+97K9yzLBddzeLrSs4c+VEgKqLy9vtVDM8rAQJcCIJ1tBXq5bd+iQHuy018R+Qna9X6A+B9nkUO0slhQdsjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750141318; c=relaxed/simple;
	bh=7WMnIAB52I00dnpzMybWE815AWl4bKC3OBG2ss/MyDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWA27Gl1Y5ShzO+xjJorLMbfhuB27M4VVy6rjnyJ4iJz6gGuuj156ErUJiCXWHtiudGN+nE9ZgxTFQOgwZW6isoaVuvaDCEKHMpxoytjIaR3YhEOAo0/GtsfUbCUPxctA7IllpcFmegO1zIqmqqGgqmJuhH0SeNXP1pENtQcEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9RJ2Rz0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9RJ2Rz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750141316; x=1781677316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7WMnIAB52I00dnpzMybWE815AWl4bKC3OBG2ss/MyDg=;
  b=K9RJ2Rz0UfwXs3ntf4V8tn737S+7Aecx3JpnAO3WJmDMYPKhi6XdUtsZ
   /pFqMU+thEsD6RktukIi95K64ZqpyZjAXGkPvW9CxMUJU8BX/nGvFyiJ6
   Nip0fn8VAJSR9m5kJEfl2X2XzpBi41CxajspdShC2+osAQk8BeuIj034S
   48n03pOLI3L7iSQdeuuoEwJaJb2Ij8MNqQlDW1QVPqT3+J5j+zwmdaVQe
   f8cxPwS813SyNViXaVcumUwi768sF7zZbk/92Ctgg4PAGJMmKp3d9O/u7
   NGv/Agd2yzZn0/jj4QWvmz7ZkLSm0XH0bwdKUyYONhdKzmnCHFSiIuNDN
   g==;
X-CSE-ConnectionGUID: rKXLkKEhTMucdE15wnv2xQ==
X-CSE-MsgGUID: IjCSxBzmS0W8pnQXrzrqqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77698160"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="77698160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 23:21:56 -0700
X-CSE-ConnectionGUID: EZlHW9uoR9Whd36m92cfMg==
X-CSE-MsgGUID: 2W3a49RCS/KbjciADHmnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153857607"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2025 23:21:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRPhf-000Fg0-0v;
	Tue, 17 Jun 2025 06:21:51 +0000
Date: Tue, 17 Jun 2025 14:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	mani@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	ilpo.jarvinen@linux.intel.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH] PCI: endpoint: Use common PCI host bridge APIs for
 finding the capabilities
Message-ID: <202506171435.UiUpSaqs-lkp@intel.com>
References: <20250616152515.966480-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616152515.966480-1-18255117159@163.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-endpoint-Use-common-PCI-host-bridge-APIs-for-finding-the-capabilities/20250616-232735
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250616152515.966480-1-18255117159%40163.com
patch subject: [PATCH] PCI: endpoint: Use common PCI host bridge APIs for finding the capabilities
config: powerpc-randconfig-r073-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171435.UiUpSaqs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171435.UiUpSaqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171435.UiUpSaqs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-designware-ep.c:90:9: error: call to undeclared function 'PCI_FIND_NEXT_CAP_TTL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         return PCI_FIND_NEXT_CAP_TTL(dw_pcie_ep_read_cfg, PCI_CAPABILITY_LIST,
         |                ^
   1 error generated.


vim +/PCI_FIND_NEXT_CAP_TTL +90 drivers/pci/controller/dwc/pcie-designware-ep.c

    87	
    88	static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
    89	{
  > 90		return PCI_FIND_NEXT_CAP_TTL(dw_pcie_ep_read_cfg, PCI_CAPABILITY_LIST,
    91					     cap, ep, func_no);
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
