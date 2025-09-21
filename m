Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77C2512F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758462995; cv=none; b=qMfQe/BJslWUxn/Lz5kSp8C2ZoO1TAaVhEtXZAHdnlhbn+GxN+yUtDcmwvItT80UDZ2TAHzw+3rZueAwNXasUgWPtLzQZuLhCQvh1VorquCDNLBoRe70A+YTwiBGmcojXQ83Nahi7CKHFHVJba0V3HyTxa1p1NasMaQUN7w2BDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758462995; c=relaxed/simple;
	bh=zlnYUCwKAC5o1rwr5wBLIkhHSXO1h2iZj3n18/4KszM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhhnxKs4EdMkBzyTf3mK3TQblYWj532pMioo/bxInar4pKpV4yn5gl71h1XH1aDt6KSQQ9FwQJALn027NwWB7h/Q22Ozyl5fkkS+6Y92in0c0n4eFa1PuVVd+JxJtapqb4CkI6sNjPXodXRq80C50KkCccytoB4VkjWfM/VeVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4da2iX2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4da2iX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758462993; x=1789998993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zlnYUCwKAC5o1rwr5wBLIkhHSXO1h2iZj3n18/4KszM=;
  b=G4da2iX2DP1sCQKLCERYdd4iJdA7Id2wum2d85zKdxuih9cuAZlCM8CO
   FSl/YVXNadSqzaBAwo86gQgwJgqDk9tt4OOPdqzX2VevN9J1ijWQxMfsX
   tCr4uKBfquEj/VSsyMtN8Rn4pxzr6KrIJUwpEr75VtLzDqNfuooxiuYPg
   Zvcfq5geZAJLpRn/L/5pa7bU9LYqgmViTZDveMIEEISoD1tnWNqIxr/GJ
   NPKvNn361qIWa2Bg/5AUuDirVbxXFjGKrYt2tQZsu7xWmR2ofV3HV0h4E
   snoJP6LxOLH/knBKIVwlEqOpVGIyWdFSv60ni70lIEXRJ4Oh9VYxymUjk
   g==;
X-CSE-ConnectionGUID: 04oYNCj1R+u0Lb9jBRd7dA==
X-CSE-MsgGUID: BWH+X83pQcqSirk5+8nUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71847192"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71847192"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 06:56:32 -0700
X-CSE-ConnectionGUID: TAz2x1XYS1atPS2CvUQJNA==
X-CSE-MsgGUID: qnsO8LH3QYic2nOz546AuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="207006035"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Sep 2025 06:56:30 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0KYH-0000mH-1G;
	Sun, 21 Sep 2025 13:56:29 +0000
Date: Sun, 21 Sep 2025 21:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/6] vduse: return internal vq group struct as map
 token
Message-ID: <202509212126.UafwRleh-lkp@intel.com>
References: <20250919093359.961296-5-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919093359.961296-5-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on next-20250919]
[cannot apply to linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-make-domain_lock-an-rwlock/20250919-174108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250919093359.961296-5-eperezma%40redhat.com
patch subject: [PATCH v3 4/6] vduse: return internal vq group struct as map token
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212126.UafwRleh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509212126.UafwRleh-lkp@intel.com/

smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: unsigned 'vq_group' is never less than zero.
drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: error code type promoted to positive: 'vq_group'

vim +/vq_group +634 drivers/vdpa/vdpa_user/vduse_dev.c

   627	
   628	static union virtio_map vduse_get_vq_map(struct vdpa_device *vdpa, u16 idx)
   629	{
   630		struct vduse_dev *dev = vdpa_to_vduse(vdpa);
   631		u32 vq_group = vduse_get_vq_group(vdpa, idx);
   632		union virtio_map ret;
   633	
 > 634		if (vq_group < 0)
   635			ret.group = NULL;
   636		else
   637			ret.group = &dev->groups[vq_group];
   638	
   639		return ret;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
