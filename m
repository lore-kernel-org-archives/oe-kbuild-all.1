Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0731E833D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681922; cv=none; b=Igjj2wk7fwZAOADTKZX8R1+G0woObsWqYpeC5Z8gODqrkBfbAIgnF4TklCRfAamOaE5iXeUeWFIP3wYTgaHf/jobTF7+gNE6LFsbFQux6AT7PrVi5x90dnYSNDnMPJwlCatEIvCeBBVYG0XpyqWvylq/qYxf4FmB/RX/aptYZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681922; c=relaxed/simple;
	bh=nkTDvsG4L2lI+zJvHJLK/Jo7CKqje5u+Cja7uCaAnpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnQSyDk8BqkZdZyLOXYAvpNvZeC/s4U9CpB8N/Amenrjsi0j6VJ3ggS7afrBNqHPcapZ3yqsL3cKthme/5evHjVY7ECYgECzFOp5l4/KSEfZbfSWKhVhj5+Nw6W9U2NaVee60wDMxFPshiKxQeuzI2ngSEYTk0YEP7J1dydUD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBw+k1oD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBw+k1oD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747681920; x=1779217920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nkTDvsG4L2lI+zJvHJLK/Jo7CKqje5u+Cja7uCaAnpA=;
  b=mBw+k1oDTkeZqJSF5BbrVFSquJApCL1Yx81nskxzITjvzdSRffn1wdsR
   T5dAdwxIfprnY/sUlUHKg+qbVx/LQA1HTu5GTz0w+nBRMO/mpdYynkPvr
   5lSPvM1CvjC9MRTwiTNvCnLMV60IB8PcOyyrGTEDr7uyY0XEoHBIoc/rM
   +PzrFHUGNSgluiDF5OeW3zlyfxAg1NvRq+ApYCGBYgBw0p4dYt/JcPylc
   DvJ3DE3qj5A8ZwCN+DGAM4LSpSNQTPLI39SSZBOS5Mt+pTZ7RutV1UCfH
   dBFrxR677xRhg6N284ESYpZuqODdAiiBaDrt59Gny/zeVtvMTZY5STclW
   A==;
X-CSE-ConnectionGUID: QtAaZU+DRgmlc4UCRUY0sg==
X-CSE-MsgGUID: qBwPEq+HSlm/z73zZebSeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49470336"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49470336"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:11:59 -0700
X-CSE-ConnectionGUID: OiHoIlgtR3aY3SyIQnp/+g==
X-CSE-MsgGUID: YePtw/+/TnaJUIfXhWHJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139345415"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2025 12:11:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH5tz-000Lm8-2I;
	Mon, 19 May 2025 19:11:55 +0000
Date: Tue, 20 May 2025 03:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 2/2] fs/inode.c:2591:47: warning: passing
 argument 2 of 'vfs_inode_is_owned_by_me' discards 'const' qualifier from
 pointer target type
Message-ID: <202505200320.XdIkjBor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   3d7c34e70ff9f9f109feb055469b6a056e07b88b
commit: 3d7c34e70ff9f9f109feb055469b6a056e07b88b [2/2] vfs: Fix inode ownership checks with regard to foreign ownership
config: csky-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200320.XdIkjBor-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200320.XdIkjBor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200320.XdIkjBor-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/inode.c: In function 'inode_owner_or_capable':
>> fs/inode.c:2591:47: warning: passing argument 2 of 'vfs_inode_is_owned_by_me' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2591 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   In file included from fs/inode.c:30:
   fs/internal.h:55:69: note: expected 'struct inode *' but argument is of type 'const struct inode *'
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                       ~~~~~~~~~~~~~~^~~~~
--
   fs/attr.c: In function 'chown_ok':
>> fs/attr.c:101:47: warning: passing argument 2 of 'vfs_inode_is_owned_by_me' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     101 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   In file included from fs/attr.c:19:
   fs/internal.h:55:69: note: expected 'struct inode *' but argument is of type 'const struct inode *'
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                       ~~~~~~~~~~~~~~^~~~~
   fs/attr.c: In function 'chgrp_ok':
   fs/attr.c:130:47: warning: passing argument 2 of 'vfs_inode_is_owned_by_me' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     130 |         ret = vfs_inode_is_owned_by_me(idmap, inode);
         |                                               ^~~~~
   fs/internal.h:55:69: note: expected 'struct inode *' but argument is of type 'const struct inode *'
      55 | int vfs_inode_is_owned_by_me(struct mnt_idmap *idmap, struct inode *inode);
         |                                                       ~~~~~~~~~~~~~~^~~~~


vim +2591 fs/inode.c

  2569	
  2570	/**
  2571	 * inode_owner_or_capable - check current task permissions to inode
  2572	 * @idmap: idmap of the mount the inode was found from
  2573	 * @inode: inode being checked
  2574	 *
  2575	 * Return true if current either has CAP_FOWNER in a namespace with the
  2576	 * inode owner uid mapped, or owns the file.
  2577	 *
  2578	 * If the inode has been found through an idmapped mount the idmap of
  2579	 * the vfsmount must be passed through @idmap. This function will then take
  2580	 * care to map the inode according to @idmap before checking permissions.
  2581	 * On non-idmapped mounts or if permission checking is to be performed on the
  2582	 * raw inode simply pass @nop_mnt_idmap.
  2583	 */
  2584	bool inode_owner_or_capable(struct mnt_idmap *idmap,
  2585				    const struct inode *inode)
  2586	{
  2587		vfsuid_t vfsuid;
  2588		struct user_namespace *ns;
  2589		int ret;
  2590	
> 2591		ret = vfs_inode_is_owned_by_me(idmap, inode);
  2592		if (ret == 0)
  2593			return true;
  2594		if (ret < 0)
  2595			return false;
  2596	
  2597		vfsuid = i_uid_into_vfsuid(idmap, inode);
  2598		ns = current_user_ns();
  2599		if (vfsuid_has_mapping(ns, vfsuid) && ns_capable(ns, CAP_FOWNER))
  2600			return true;
  2601		return false;
  2602	}
  2603	EXPORT_SYMBOL(inode_owner_or_capable);
  2604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
