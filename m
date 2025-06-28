Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EFE219313
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126506; cv=none; b=grCdBC2+nLic8ulgdznNmaLSxStXgyhhNnPMBFkvlJu3YsjaqeqzIAV/2xqCf926UAoD8JmXmvkFcG5EaGcf4eboR6u98f3tKBkcSrfa5gOueTvSpaAevEdaMo+MPReIM93Q8IQGLHK8o1666/CdGIKiYRALtLoG+IzctMg99ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126506; c=relaxed/simple;
	bh=KJ3XixzatG28JYSLpS2o/7QE9V7IiUgq3N6McJtnJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4F9tYEft84Pmd+tLTOucnJEACzpMr0W1MtpHpKf/m91pxXmvJv80XcyyFuD9U3FNZZETnal91QWmyvsrdFVs5enS0M4nYxWt16pPLPQV1/ix+MRTt4wKNNRnltLX2+IxMqI+rGaYk97SadVc8hTggl5ybuEEv41vnaQTQ85vrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNW2iGp2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNW2iGp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751126504; x=1782662504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KJ3XixzatG28JYSLpS2o/7QE9V7IiUgq3N6McJtnJYg=;
  b=GNW2iGp2iWwchVKa5KDWsQtRO2lnEhhJQnnXM41gDdc4cYxgC54YFNFd
   4g7F45Mga/yJUJyZnp5CJQcljaNFN/kDmlNtkQ4M8bh71fJ9iTWyC6FuJ
   Z77q8shviCz4YO9zf2iaeCF0o2AkjHlBDR3gBzHMtDceRAf3UssEq2bj/
   a54DM6c4pUiqez8rFGSFTux7ybs78sM9mzzSlpAjUHAMye25IaqArgzek
   AFOgbcQU58QYF3LVvUDkyBSgyzdqlsRqU9/sp2oMxc0UwUOw16dJ4BtjA
   qMv7nt2hbXZVFYeA0QccFNBeNt7UPq6ESTqMnavfKA8mPzZwyRjkLMIEO
   g==;
X-CSE-ConnectionGUID: /bgIKX8pQxy0tdmlu0b8RA==
X-CSE-MsgGUID: OFVNiXBqRGOgEmfyFxnx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52530769"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52530769"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:01:39 -0700
X-CSE-ConnectionGUID: BkgfU+e/Tq2wRRtaBnyfwA==
X-CSE-MsgGUID: ZVTHuC/2QE6rPdlahlSrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153768974"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 09:01:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVXzk-000XAA-14;
	Sat, 28 Jun 2025 16:01:36 +0000
Date: Sun, 29 Jun 2025 00:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, phillip@squashfs.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] Squashfs: add page cache share support
Message-ID: <202506282334.A6g9vp33-lkp@intel.com>
References: <20250626003644.3675-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626003644.3675-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.16-rc3]
[also build test WARNING on linus/master next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/Squashfs-add-page-cache-share-support/20250626-084010
base:   v6.16-rc3
patch link:    https://lore.kernel.org/r/20250626003644.3675-1-liubo03%40inspur.com
patch subject: [PATCH] Squashfs: add page cache share support
config: hexagon-randconfig-r073-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282334.A6g9vp33-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282334.A6g9vp33-lkp@intel.com/

New smatch warnings:
fs/squashfs/inode.c:97 squashfs_iget() warn: inconsistent indenting

Old smatch warnings:
fs/squashfs/inode.c:293 squashfs_read_inode() warn: missing unwind goto?

vim +97 fs/squashfs/inode.c

    74	
    75	
    76	struct inode *squashfs_iget(struct super_block *sb, long long ino,
    77					unsigned int ino_number)
    78	{
    79		struct inode *inode = iget_locked(sb, ino_number);
    80		int err;
    81	
    82		TRACE("Entered squashfs_iget\n");
    83	
    84		if (!inode)
    85			return ERR_PTR(-ENOMEM);
    86		if (!(inode->i_state & I_NEW))
    87			return inode;
    88	
    89		err = squashfs_read_inode(inode, ino);
    90		if (err) {
    91			iget_failed(inode);
    92			return ERR_PTR(err);
    93		}
    94		unlock_new_inode(inode);
    95	
    96	#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
  > 97			if ((inode->i_mode & S_IFMT) == S_IFREG) {
    98				if (squashfs_pcs_fill_inode(inode) > 0)
    99					inode->i_fop = &squashfs_pcs_file_fops;
   100			}
   101	#endif
   102	
   103		return inode;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
