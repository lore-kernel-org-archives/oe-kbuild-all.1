Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71479179BC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729407867; cv=none; b=BmoBkR04yPXY0IEI6O7RUuyeA/biNEH5J2rUkj+BIOaEhcUwkTLDgwWzvUmks4/21MHyR3Q4HACg0R2GpQUiY4I/SaygX889iWkbXj+dOFi/I0gJofhDChDNIhYJ0G+6Oav/gFtJLQny/q9nm19hG4uYgHtUjo6wF8Ss98N0/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729407867; c=relaxed/simple;
	bh=pzNJI/8qDlSaeLJMr6T4MBZi4jR1JswtTpJtLrBrlSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UopSSH1oMcIMLvewJbUdRLXxDXWdlaZ2ZU2Y/Dbl5yURshhc+EwWRGt9bb6rfqF1c2b9ousFP2R0f65qt6fPEDWulSWSvFAtXm8UZDq6x0NSvpUtCQZ7v3TT0ws0xBeG+qbndUH/jJrp/hZBYTshDQQP6F5aRdMzBUQtobOvt2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3LF7IVo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3LF7IVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729407865; x=1760943865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzNJI/8qDlSaeLJMr6T4MBZi4jR1JswtTpJtLrBrlSM=;
  b=D3LF7IVo8ngiqCrAnJcAnhHtBWifAHpV0MbFOThwkw5Q16VHXJnjbssa
   r6feXve3/DFBgy/XkBubbMx0vh+1ubE7fp0VJjqUW8JrQyJBMrJJGmJyY
   AARNWDUdKKcUyPr85w/w59RCFfnDbNnddVMhYHKJs9HQ/Pb+9GGVBQg7X
   t/MrB8LBGshqL56Y+kwaOqUqpyUCfYcqyYshqptACf6tsgI/tZHEVKcPX
   4wET9lE6SIMaINLA24oNYYnHZevGqB1WDbQ6YlXYG9syAJA9Nu2VpkBzP
   Q7hLqkw0nX8CgE+VL0lW8G4VZgqmQQCUCgzwB/R1KiyOcWaLrX98DPvnj
   g==;
X-CSE-ConnectionGUID: vrIjYfoGRtm9Zzy9G2F02Q==
X-CSE-MsgGUID: 2613WPP9TqWBog6QsS/pEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29016764"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29016764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 00:04:25 -0700
X-CSE-ConnectionGUID: VJjJC3EYTJCnwgmpS7TpJg==
X-CSE-MsgGUID: RFbF5ww/RI6thIAus7OnxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110071201"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Oct 2024 00:04:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2PzA-000Q13-2D;
	Sun, 20 Oct 2024 07:04:20 +0000
Date: Sun, 20 Oct 2024 15:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>, bhelgaas@google.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: optimize proc sequential file read
Message-ID: <202410201436.9i93qAYF-lkp@intel.com>
References: <20241018054728.116519-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018054728.116519-1-kanie@linux.alibaba.com>

Hi Guixin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guixin-Liu/PCI-optimize-proc-sequential-file-read/20241018-135026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241018054728.116519-1-kanie%40linux.alibaba.com
patch subject: [PATCH] PCI: optimize proc sequential file read
config: x86_64-randconfig-122-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201436.9i93qAYF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201436.9i93qAYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201436.9i93qAYF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/proc.c:22:1: sparse: sparse: symbol 'pci_seq_tree' was not declared. Should it be static?

vim +/pci_seq_tree +22 drivers/pci/proc.c

    21	
  > 22	DEFINE_XARRAY_FLAGS(pci_seq_tree, 0);
    23	static unsigned long pci_max_idx;
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
