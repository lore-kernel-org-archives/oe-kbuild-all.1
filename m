Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08631282FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750531420; cv=none; b=hyOvbMfH1H0aKQRSBFOEoqsUYq91dK6V0NsMX+wSGfMfq3lZmpDJ64TMJsGaIO/PqRz46Ndg3IKFCei3XzJ/iQun/OCvIHISgrGQ/GeNdkcwPNTp5CS3jy2xIIlT99ozYh5Wyow500L5ekKXGroB97J/Daqwc9A57MS86BCwcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750531420; c=relaxed/simple;
	bh=RBEsKDsgeQOlpkE88x0JSsHY2WHfDKr9t9Uz/oRMrNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix5aicyhe8ONgDEkeTRXDQ+rujp7z4y/iampbJH8tfDGiNAIyis1lRt3IhpqlMlC/ZdXic1mRpM84dg/fRkeKzeAmKJHdiMPrf4+lzt9EyvIacQKjfTtqdedMETSMlJLcZiwbDgz6MMFwO6bwayADNzHPhggNjFBnvBB1qlNkn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc7PeQrP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc7PeQrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750531419; x=1782067419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBEsKDsgeQOlpkE88x0JSsHY2WHfDKr9t9Uz/oRMrNM=;
  b=Rc7PeQrPxal7G8Nh5fak5TJGL+tItDyxx4Q+FAYzVyH3pQIZUwHO/dvq
   yOiNylr/Cq5KHBAdLOqDiS4hV0LxL7n+PfbhoCgL9a46H6pou8vIyQimU
   b7zgnbHqYk77t94wnduV6zmeqzCT8jbkmvTpCOC/Ra2Y6G60PuDAI033l
   tLFHeyeaR93neRIXW8mUIbNd3kfMNNtRY4K7hrz7pINan4CftFCHrlNjv
   RHYwybBWq/XTOpHOXRUlHppI9WLQTSUQVZZUaVo3SemFoKjiQ6CD+03yE
   l+whNX46nfNSemIHWdGtGG4cyDj7adXXMQvwuEqTwkJl38eEYZFEk3yc4
   w==;
X-CSE-ConnectionGUID: 0JIx9FPlQf2L78W5rDsmVA==
X-CSE-MsgGUID: 8qTi5QivTl+6CZviJBG5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52855098"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="52855098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 11:43:35 -0700
X-CSE-ConnectionGUID: XYHvnMr2QRWAvPQ0TeEJUg==
X-CSE-MsgGUID: dfbuAzU8TmKQrudMsn53qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="174802021"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jun 2025 11:43:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT3BW-000MnK-2X;
	Sat, 21 Jun 2025 18:43:26 +0000
Date: Sun, 22 Jun 2025 02:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Shivank Garg <shivankg@amd.com>, seanjc@google.com,
	david@redhat.com, vbabka@suse.cz, akpm@linux-foundation.org,
	shuah@kernel.org, pbonzini@redhat.com, brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: oe-kbuild-all@lists.linux.dev, ackerleytng@google.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	pvorel@suse.cz, bfoster@redhat.com, tabba@google.com,
	vannapurve@google.com, chao.gao@intel.com, bharata@amd.com,
	nikunj@amd.com, michael.day@amd.com, yan.y.zhao@intel.com,
	Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com,
	michael.roth@amd.com, aik@amd.com, jgg@nvidia.com,
	kalyazin@amazon.com, peterx@redhat.com
Subject: Re: [PATCH 2/2] filemap: Add __filemap_get_folio_mpol()
Message-ID: <202506220254.yx1jEeTK-lkp@intel.com>
References: <20250620143502.3055777-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620143502.3055777-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on kdave/for-next brauner-vfs/vfs.all xiang-erofs/dev-test xiang-erofs/fixes jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.16-rc2 next-20250620]
[cannot apply to xiang-erofs/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/filemap-Add-__filemap_get_folio_mpol/20250620-223721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250620143502.3055777-2-willy%40infradead.org
patch subject: [PATCH 2/2] filemap: Add __filemap_get_folio_mpol()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20250622/202506220254.yx1jEeTK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220254.yx1jEeTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506220254.yx1jEeTK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol '__filemap_get_folio' was exported
>> ERROR: modpost: "__filemap_get_folio_mpol" [fs/netfs/netfs.ko] undefined!
ERROR: modpost: "__filemap_get_folio_mpol" [fs/nfs/nfs.ko] undefined!
ERROR: modpost: "__filemap_get_folio_mpol" [fs/smb/client/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
