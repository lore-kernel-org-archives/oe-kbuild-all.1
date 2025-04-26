Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6957C9F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707307; cv=none; b=NdkrtXRW5hKXdEQgKoZW14ZeGGONwvRkBWJ+xHFHnPA7YzzDS9WSVIfllWPFez1BLW1rbggYMzrGXDyxVeyDbGxnFF9fGeW7K55svFaYN+b+4c7H0viZ20UxjO+FG3tkT442zrS2PKcnITpNl6eEVrjFwIMXTBHHRY2Vv9pshT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707307; c=relaxed/simple;
	bh=+BFM1rRWCMpNjcjTsMEXpXaFizDvkstCh1idpvbPkwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izFSuM0ojUu/OVrztJj3D+xCmZNELwSdBbeHiPch/A0+GESjVnwq/kA6ESwc2gHDAz9rOJpgo1ACZirUYlZ/fP133UNb5o0bHmLdjvtX5AlGoggOnnVOz5j1ff0f1NYokqpjdLClH0aY2SEbkc9yZPl3mPHZ6u/dDwOb+4D2tTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGWNeQtr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGWNeQtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745707306; x=1777243306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+BFM1rRWCMpNjcjTsMEXpXaFizDvkstCh1idpvbPkwY=;
  b=iGWNeQtrbQJlWWIg4PhqLCCBG0lbj0Pi1W3fQglM6zH0hMz44aLwHsFo
   j4esqZQBjIdextbf8YM2Bqp2hjxm6jq/qwGcZhV5sRkLYrbQoe0qwSEFI
   80MoP4mMRITPkk8iffC2g0RDAPoF6QSct7uqvj5bOz54/AHRSgSGEfvM9
   AWB/fEGPPl8LdWBqgpMh+bm0vKqORzfGvinl2XmatAFgRChKf+48HK8k4
   EwkIsfWDD3hKJdifn38aSN3xdAH89JnzwSAvqyt4aY78oHklFiV3PgmN+
   qM9MsfiUn74o94apWuK5muN6eF7WZN7VxNKk42rZzeGn0jAoQPFk3dDMS
   A==;
X-CSE-ConnectionGUID: krDfr9ESRlSE3SA/gBKjEQ==
X-CSE-MsgGUID: qdgvlPosSx6WrUfvOKRJgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47212472"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="47212472"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 15:41:45 -0700
X-CSE-ConnectionGUID: 576fMRc1RfiVUSURvbGkvQ==
X-CSE-MsgGUID: kp6GUKY0QBqqVyTytcNPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="138001857"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2025 15:41:44 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8oDN-00060v-2U;
	Sat, 26 Apr 2025 22:41:41 +0000
Date: Sun, 27 Apr 2025 06:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] audit accesses to unassigned PCI config regions
Message-ID: <202504270605.UOUHjHe8-lkp@intel.com>
References: <20250426212253.40473-3-chath@bu.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426212253.40473-3-chath@bu.edu>

Hi Chathura,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f1a3944c860b0615d0513110d8cf62bb94adbb41]

url:    https://github.com/intel-lab-lkp/linux/commits/Chathura-Rajapaksha/block-accesses-to-unassigned-PCI-config-regions/20250427-052942
base:   f1a3944c860b0615d0513110d8cf62bb94adbb41
patch link:    https://lore.kernel.org/r/20250426212253.40473-3-chath%40bu.edu
patch subject: [RFC PATCH 2/2] audit accesses to unassigned PCI config regions
config: arm-randconfig-002-20250427 (https://download.01.org/0day-ci/archive/20250427/202504270605.UOUHjHe8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270605.UOUHjHe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270605.UOUHjHe8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_config.c: In function 'vfio_audit_access':
>> drivers/vfio/pci/vfio_pci_config.c:2008:62: warning: format '%ld' expects argument of type 'long int', but argument 9 has type 'size_t {aka unsigned int}' [-Wformat=]
        "device=%04x:%02x:%02x.%d access=%s offset=0x%llx size=%ld blocked=%u\n",
                                                               ~~^
                                                               %d


vim +2008 drivers/vfio/pci/vfio_pci_config.c

  1994	
  1995	static void vfio_audit_access(const struct pci_dev *pdev,
  1996				      size_t count, loff_t *ppos, bool blocked, unsigned int op)
  1997	{
  1998		struct audit_buffer *ab;
  1999	
  2000		if (WARN_ON_ONCE(op >= VFIO_AUDIT_MAX))
  2001			return;
  2002		if (audit_enabled == AUDIT_OFF)
  2003			return;
  2004		ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_VFIO);
  2005		if (unlikely(!ab))
  2006			return;
  2007		audit_log_format(ab,
> 2008				 "device=%04x:%02x:%02x.%d access=%s offset=0x%llx size=%ld blocked=%u\n",
  2009				 pci_domain_nr(pdev->bus), pdev->bus->number,
  2010				 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
  2011				 vfio_audit_str[op], *ppos, count, blocked);
  2012		audit_log_end(ab);
  2013	}
  2014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
