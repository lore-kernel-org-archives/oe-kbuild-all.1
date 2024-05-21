Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB95208AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716306364; cv=none; b=cOaXMspkN4LLwUfmHOgqRN/dvi+LkoXd2req/kZ51Z0LjpLG+iMwFzbNwH6J4q4XzbROKS6SMVN8jjAhILUgg5K2tmvygtApcXKDpFfVIOdO5wxmpyPHUnpII4toUMd/6YR6XS+ewfOpFwxBBMDuZMWxSC2WducO2iOHA/wJzfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716306364; c=relaxed/simple;
	bh=MOYqpIyTHcQhEowSXCmF5d6zPRCuQIn/+Gsq0JSaqfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2XCs1lKYE46yKONl+hwpQnVtMwS7JTFBsTG3vsL93J865VQWlC/8WLzIrAoKE4TJWdC9TikNDZKf6Cqr7J4itNLP1hfRmgRtmekx5B5gdCpgSTrtVVz9fT3R6U1OmkGlDBv0mNIux1p95wOUM+i1osPdPKeennDTyg9Dyfo+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eM63ynKe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eM63ynKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716306362; x=1747842362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MOYqpIyTHcQhEowSXCmF5d6zPRCuQIn/+Gsq0JSaqfI=;
  b=eM63ynKeATGuTn5VVuXeLB1yF0JQXYhXTwgUGb9JXt5SbWvErj+46BTG
   rXuPOwqHkg4+mS1NND1L4zGUFM08+t2hRQ3bZ3cxep+dZyFw6viUOWV/z
   OdB0q/b91Xx+wj/7JBojR0No6iX+bTO4bARNuRu0nNi8xasB+vTtWTs7W
   pgH4iPihyV6m5WwC/FBIuyG6+SYh79ktg7rhHoesC7yYn8cC0rrisCb16
   8BkmQvJNqrj41dSntiu1S56c2bJYCkNVHYD3cZ5L1UGHGAg7I7U7DWHRU
   FD+rx4oVQejFu6OC44MhmG+uHUzCoeR3XepUfGfoxLmc58ECUT+MmxnvY
   A==;
X-CSE-ConnectionGUID: cYBmB4hPS2msg8yD8ldCoA==
X-CSE-MsgGUID: IDq2obC7TW+vHPuqK7J2Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15459793"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="15459793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 08:46:02 -0700
X-CSE-ConnectionGUID: NDMP6qFGSFq7XsAgJ6OJ3g==
X-CSE-MsgGUID: Ldro2/GCQ6mYjf2suJvVkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="63793459"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2024 08:45:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9RgY-0000UQ-1Q;
	Tue, 21 May 2024 15:45:54 +0000
Date: Tue, 21 May 2024 23:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vidya Sagar <vidyas@nvidia.com>, corbet@lwn.net, bhelgaas@google.com,
	galshalom@nvidia.com, leonro@nvidia.com, jgg@nvidia.com,
	treding@nvidia.com, jonathanh@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, mmoshrefjava@nvidia.com,
	shahafs@nvidia.com, vsethi@nvidia.com, sdonthineni@nvidia.com,
	jan@nvidia.com, tdave@nvidia.com, linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com,
	sagar.tv@gmail.com
Subject: Re: [PATCH V2] PCI: Extend ACS configurability
Message-ID: <202405212300.S6fsze09-lkp@intel.com>
References: <20240521110925.3876786-1-vidyas@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521110925.3876786-1-vidyas@nvidia.com>

Hi Vidya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.9 next-20240521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vidya-Sagar/PCI-Extend-ACS-configurability/20240521-191317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240521110925.3876786-1-vidyas%40nvidia.com
patch subject: [PATCH V2] PCI: Extend ACS configurability
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240521/202405212300.S6fsze09-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405212300.S6fsze09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405212300.S6fsze09-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:1044: warning: Function parameter or struct member 'caps' not described in 'pci_std_enable_acs'


vim +1044 drivers/pci/pci.c

cbe420361f92a31 Rajat Jain      2020-07-07  1038  
cbe420361f92a31 Rajat Jain      2020-07-07  1039  /**
cbe420361f92a31 Rajat Jain      2020-07-07  1040   * pci_std_enable_acs - enable ACS on devices using standard ACS capabilities
cbe420361f92a31 Rajat Jain      2020-07-07  1041   * @dev: the PCI device
cbe420361f92a31 Rajat Jain      2020-07-07  1042   */
a0bcc944f0e307a Vidya Sagar     2024-05-21  1043  static void pci_std_enable_acs(struct pci_dev *dev, struct pci_acs *caps)
cbe420361f92a31 Rajat Jain      2020-07-07 @1044  {
cbe420361f92a31 Rajat Jain      2020-07-07  1045  	/* Source Validation */
a0bcc944f0e307a Vidya Sagar     2024-05-21  1046  	caps->ctrl |= (caps->cap & PCI_ACS_SV);
cbe420361f92a31 Rajat Jain      2020-07-07  1047  
cbe420361f92a31 Rajat Jain      2020-07-07  1048  	/* P2P Request Redirect */
a0bcc944f0e307a Vidya Sagar     2024-05-21  1049  	caps->ctrl |= (caps->cap & PCI_ACS_RR);
cbe420361f92a31 Rajat Jain      2020-07-07  1050  
cbe420361f92a31 Rajat Jain      2020-07-07  1051  	/* P2P Completion Redirect */
a0bcc944f0e307a Vidya Sagar     2024-05-21  1052  	caps->ctrl |= (caps->cap & PCI_ACS_CR);
cbe420361f92a31 Rajat Jain      2020-07-07  1053  
cbe420361f92a31 Rajat Jain      2020-07-07  1054  	/* Upstream Forwarding */
a0bcc944f0e307a Vidya Sagar     2024-05-21  1055  	caps->ctrl |= (caps->cap & PCI_ACS_UF);
cbe420361f92a31 Rajat Jain      2020-07-07  1056  
7cae7849fccee81 Alex Williamson 2021-06-18  1057  	/* Enable Translation Blocking for external devices and noats */
7cae7849fccee81 Alex Williamson 2021-06-18  1058  	if (pci_ats_disabled() || dev->external_facing || dev->untrusted)
a0bcc944f0e307a Vidya Sagar     2024-05-21  1059  		caps->ctrl |= (caps->cap & PCI_ACS_TB);
cbe420361f92a31 Rajat Jain      2020-07-07  1060  }
cbe420361f92a31 Rajat Jain      2020-07-07  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
