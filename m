Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95063C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718587646; cv=none; b=jYh2tMgkAR/8EN6FuR3yHOqjlMJTBGKWwfteVyQOwk8oGoBi/ccQoTHnNrN1bRRC3Bbx3xMEDDzT6SHcY0imcsU3uIRHNkx4ZsHhcNnsxSzIMbikBAjLnGGczrXEiAO8tarzryNDX2xjqibHoT62zGa8CY/WOXAggQYVZRTuDrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718587646; c=relaxed/simple;
	bh=SBRdwsyxfjb/QPWBoCI9qEmVkPCRq1HU6GioqEC/JOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3921PllI3OQcf/lrpIAumzcJmmaWhLnSy0DVG1GMR0G+IYfWyKnNH9Y584fnOPHAc8eTjNUPocc6OhynbsR76DBqBTF5dNEqpdap2nImwvZMfJIrsgyCWeUXxBJF3pgD6tnY3xLSYSF+AJ9CsJLLN/ky9xAiaBqQNg+dGTW1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrQnK5Fv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrQnK5Fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718587645; x=1750123645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBRdwsyxfjb/QPWBoCI9qEmVkPCRq1HU6GioqEC/JOM=;
  b=lrQnK5FvrQQZG5Kdhb4TZbD8OgSsWI7kIs/SjaSjX5Z4szf66bTCQZI4
   5MQH2XIuTa6+L4nAEPc7pfKWV6p7yWu4N9/Os5Mopf26/cjze+MHnqxbf
   rflWPTXOInC3t5A2LRgAbhSCXziE1s+WP3V0S6LtT3L9aYVbQ487k2yzT
   DJoLVQseBoKzNiSJyq7R9Q7ArKqfr3rCyoQcuwuUeC5il4jn0TXoicw50
   4771qRybPCVfehTv06auFWgcOGMC9BupmEWHK9oPJSxcG9k2vmmO3Q9TU
   DmCpLdmltw5APnmORcNt9Nmpe7AV9pVmr3XUGxWuQ7+UOwfYH0ETbNWbm
   w==;
X-CSE-ConnectionGUID: Yx/Bo+A/Sm6AHhe7uvZuYw==
X-CSE-MsgGUID: JlAMD8c+SxOED80oOOHdYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26823464"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26823464"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 18:27:22 -0700
X-CSE-ConnectionGUID: HhaxzQXFQvKS6zRGgRvkpQ==
X-CSE-MsgGUID: ThYzoXoyS6Cnzoed+xYmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41526901"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jun 2024 18:27:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ19T-0003c3-0S;
	Mon, 17 Jun 2024 01:27:19 +0000
Date: Mon, 17 Jun 2024 09:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] dcbm: add dma core batch migrator for batch page
 offloading
Message-ID: <202406170931.3zssgTV0-lkp@intel.com>
References: <20240614221525.19170-6-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614221525.19170-6-shivankg@amd.com>

Hi Shivank,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.10-rc4]
[cannot apply to akpm-mm/mm-everything next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivank-Garg/mm-separate-move-undo-doing-on-folio-list-from-migrate_pages_batch/20240615-061917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20240614221525.19170-6-shivankg%40amd.com
patch subject: [RFC PATCH 5/5] dcbm: add dma core batch migrator for batch page offloading
config: nios2-randconfig-r132-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170931.3zssgTV0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406170931.3zssgTV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170931.3zssgTV0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/dcbm/dcbm.c:41:17: sparse: sparse: symbol 'dmigrator' was not declared. Should it be static?

vim +/dmigrator +41 drivers/dma/dcbm/dcbm.c

    39	
    40	/* DMA Core Batch Migrator */
  > 41	struct migrator dmigrator = {
    42		.name = "DCBM\0",
    43		.migrate_dma = folios_copy_dma,
    44		.can_migrate_dma = can_migrate_dma,
    45		.owner = THIS_MODULE,
    46	};
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
