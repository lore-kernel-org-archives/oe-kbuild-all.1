Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF8A4431
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729449666; cv=none; b=Lx1niAGoAQzO0MSF5v0g3gz2A4Oajh5W7h3R0DVXsZP11X6NcmIET+4Z4dHCaSq5dppuWEcDU6fG/Uh0MStguKuJPdzwFyfwnG85EVrGeRmFrxzsrict4x9Or5jcZjxQYyG/bjyhSTxGWCX0Bc15apxZSZz+0T+c7DBCBf5tBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729449666; c=relaxed/simple;
	bh=+2s+FoinvecDbx5NPvlMPBFD0ioj45nB+BDjXGNuay0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzI673jHukjIgGkrSmnzJ6e5xUh2pH1dJDrUBqbxhdz3/zUGlg+2M2lTGK4Q9jK/0hVvBloO/hgEOfxrNczUOp6b6OY/TDR+0hO2lfIIGofb5PGat74YRH7nSjCgEj74SCFqZvGcgOVW+glXbxIBw//eAOJcyE64J0HlA6Hb1CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2+ZvUMU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2+ZvUMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729449665; x=1760985665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2s+FoinvecDbx5NPvlMPBFD0ioj45nB+BDjXGNuay0=;
  b=R2+ZvUMUfF6XJn5v1MHBg8iEArA8lTQ02Or0Pef10vS84H4PAtlmjsUQ
   6GIf8OmpjvPIhRqiTiaGp+mG16x5tbbT2gmBSWcDroUY6ia8AxNlBgJHr
   Zh2/X+l0wZg2QkPnR8XTN5uQihcNgmk8l7YqAINbgerH+0Kkb3EtgX/98
   9N4yneJBOLvgOfTQff4F44hkCmNGwyKqA86d4590xSsol5YHi52w1Hx7s
   uTGdRwPoIJua5ZF96pdqUtCTsF9BsMUQDl4M0BEU4n6IrQXHtaWqc8XFg
   S5YfKMYbMX5lRF0Yx+xBXYzY91vgInMbwEBFch8d4Fylf+KWLYQXZ6hmL
   g==;
X-CSE-ConnectionGUID: meH2IMDOQtiWKhcQqXwTEg==
X-CSE-MsgGUID: 0bi17HWTSEGnpm4bX2PP5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39515118"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39515118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 11:41:04 -0700
X-CSE-ConnectionGUID: d47l3V/qQjuX49i3d9v16Q==
X-CSE-MsgGUID: 1mELwfMbSkiiRuT33KQHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84141976"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2024 11:41:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2arM-000QhL-2F;
	Sun, 20 Oct 2024 18:41:00 +0000
Date: Mon, 21 Oct 2024 02:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 35/50] mm/hmm.c:678: warning: expecting
 prototype for hmm_unmap_free(). Prototype was for hmm_map_free() instead
Message-ID: <202410210220.ThlJHD9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   13682d383a11f330aa1204b53488b695b382c31a
commit: 96a543e9b8715688bc28d28238dbb08e7102d16d [35/50] mm/hmm: generalize managing PFN and DMA lists
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241021/202410210220.ThlJHD9I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210220.ThlJHD9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210220.ThlJHD9I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hmm.c:678: warning: expecting prototype for hmm_unmap_free(). Prototype was for hmm_map_free() instead


vim +678 mm/hmm.c

   669	
   670	/**
   671	 * hmm_unmap_free - iFree HMM map structure
   672	 * @dev: device to free structure from
   673	 * @map: HMM map containing the various lists and state
   674	 *
   675	 * Free the HMM map structure and all the lists it contains.
   676	 */
   677	void hmm_map_free(struct device *dev, struct hmm_map *map)
 > 678	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
