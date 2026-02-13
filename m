Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19230363C40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994303; cv=none; b=n0T/abm1j9S8L/J56aXPtfvPALV6i7PeXaHk3Enm6QJ5mAB5h3v7u0bMGc53XU3gShkXUAqpG/BYgfoNZhtcOw0Pq7MVwLrmpnHMddjHIdVt3/JLdqEhgvlADeTQBTMtG2CpkZ9OvQbJ5rn4/LNqbopOgKW/23wgKVMJzD1ZxTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994303; c=relaxed/simple;
	bh=Gla484qNz1R+SW3X4zeyqNYKnde64dHOPrkpfsrmPjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPGGzq7Yi9oXIpRAv6oZSnhf3WSiUH0AKXtySdpLRq5lwlp+tLhhrgxnlmAUkB2+eh2DewZ1+l3TD947aeKuujRMWA2BMIXC+cFlCmquxxWfZoZrXy+wYm7t3FZxbxrjcTvBwgclFXVOENu9KsFAIA2TifxJk/RVsiOs+8Fak0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpbMafGx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpbMafGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770994300; x=1802530300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gla484qNz1R+SW3X4zeyqNYKnde64dHOPrkpfsrmPjo=;
  b=HpbMafGxJp6NYQR0xWJ+1fyZjKFfCuXDhpvO4KTC8mFnWQ4xgwL/HNUT
   jWvQtQczF7Xq6cr3H6BXWfS0YvOXnodAVK7RX2xQe6vnZpjBEv5DjtIKF
   I/+p8r093AxYsMYA5Dkvytu4n7Z6BLa92jsaNUui9sajYnmDxyAt+VlG8
   rIQx0bRmStTn7q1h6/jnFwyuSCyEY7VRzQyCfm5gZcXdZmXSgki9EH5SZ
   xHg2SUKGo0qKmzouHM+W8FUYHiWWQH8MGg3PFt7Fa9FDa24ZEiXEmkHRl
   lJvgQjECSSbdnElSlTwbASWpxMMiPe0DTAo1KQcQ8ytffixx9XogYanD/
   w==;
X-CSE-ConnectionGUID: xMsaARspTRiRNOwBZWbBhw==
X-CSE-MsgGUID: Ak8IlbhvRLO1cNkdF/fDLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71375262"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71375262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 06:51:35 -0800
X-CSE-ConnectionGUID: G+ptk6AfQeGGKltq3CPy8A==
X-CSE-MsgGUID: eD3fI7tnQ/yghpX3L2gJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212347184"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 06:51:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vquW3-00000000vaK-1LiE;
	Fri, 13 Feb 2026 14:51:31 +0000
Date: Fri, 13 Feb 2026 22:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Julien ROBIN <julien.robin28@free.fr>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/pci-dma: swiotlb: Fix a regression since 5.19.0
 about iommu=soft kernel parameter
Message-ID: <202602132218.jy0N4aRs-lkp@intel.com>
References: <16c95f65-17ee-4bbd-99b3-93406a7801c4@free.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16c95f65-17ee-4bbd-99b3-93406a7801c4@free.fr>

Hi Julien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core tip/auto-latest linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-ROBIN/x86-pci-dma-swiotlb-Fix-a-regression-since-5-19-0-about-iommu-soft-kernel-parameter/20260213-122547
base:   tip/master
patch link:    https://lore.kernel.org/r/16c95f65-17ee-4bbd-99b3-93406a7801c4%40free.fr
patch subject: [PATCH] x86/pci-dma: swiotlb: Fix a regression since 5.19.0 about iommu=soft kernel parameter
config: i386-randconfig-r132-20260213 (https://download.01.org/0day-ci/archive/20260213/202602132218.jy0N4aRs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132218.jy0N4aRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132218.jy0N4aRs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/pci-dma.c:37:5: sparse: sparse: symbol 'x86_soft_iommu_only' was not declared. Should it be static?

vim +/x86_soft_iommu_only +37 arch/x86/kernel/pci-dma.c

    35	
    36	int no_iommu __read_mostly;
  > 37	int x86_soft_iommu_only __read_mostly;
    38	/* Set this to 1 if there is a HW IOMMU in the system */
    39	int iommu_detected __read_mostly = 0;
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
