Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A800329376
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846031; cv=none; b=HVpIqtD+oOOtWGjoIDwvsHc980XeXx67zbBRB2slFlN+XJHtbRfn/5SWQhLlVjjTokqFwTvPZG8jDvrSbYbBHm5sX9q4oA2Aa6HtMtIftlvx4biYIVJKJi4maiKfEuXB3T3TYrJ9OAU0RxIJenA/r/OF479GNd+dihZIw8JqIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846031; c=relaxed/simple;
	bh=iLeqM3VnFBhp1qvhZeIL/6bMK9Anv5jHds5oGFJHEsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ClIz4iMMWqZOl0hZYJyBR8cX0aettYHilphGKE1qqWe59G5VuU8O9wxmFd2IgjFo3CGEsvLEWi1hHpWkJMe6Ga8qH+TKNgLMksfdyVuIv4hZebVJ+U8PsntkSXWyE5RhoDPdml8LcMY4HKQU1UUapb+YJOcGatpHh7tWedYd2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORvl9+sg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORvl9+sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768846030; x=1800382030;
  h=date:from:to:cc:subject:message-id;
  bh=iLeqM3VnFBhp1qvhZeIL/6bMK9Anv5jHds5oGFJHEsU=;
  b=ORvl9+sgOPpS624KBPfdfSZ0F4lWOpL08L723mhL7sPyokToAw2rPkeP
   D1s9wjXxwK/epfuRqK07OndWWK451wloJayPIEFQVsLncjLEftGZoF4UA
   XOX/dBNvMKSQufQ7Nv4dVbXWdhLy56CwABar2/aFjZseCKcxLY8fo7B+y
   e9UXybJFyZyU1Y8RF1h/j8ysE+RLcYcBI53IBSKzB7Wdrk6DO3HK/JZys
   9ls/mwRzr8ctW6Uu0R7H2PCZmI5B7YhZxiPBm0d9S0S7xG6CsxM7iPkFP
   iKYtkpPSv7chr14676+yZYkyK6K4exwAEn59fG942uT3zRPdYAt02u9fN
   A==;
X-CSE-ConnectionGUID: gbBrzy44Rm2ezYRGGP7B6g==
X-CSE-MsgGUID: LjNKyBYZS0S47cRhoNkeSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95533151"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95533151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:07:05 -0800
X-CSE-ConnectionGUID: //ucdIEhTHusGyJG3GHVtw==
X-CSE-MsgGUID: yZfvbWwHTmm/WsWGna6zPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210941356"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2026 10:07:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhteW-00000000O9B-1QSf;
	Mon, 19 Jan 2026 18:07:00 +0000
Date: Tue, 20 Jan 2026 02:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/vhost/vhost.c:1580:16: sparse: sparse: restricted __virtio16 degrades
 to integer
Message-ID: <202601200204.WOEIHil0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   daf636da0fc768c0f24be900c6fde801e9da6358
commit: daf636da0fc768c0f24be900c6fde801e9da6358 [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: nios2-randconfig-r113-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200204.WOEIHil0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200204.WOEIHil0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200204.WOEIHil0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vhost/vhost.c:1580:16: sparse: sparse: restricted __virtio16 degrades to integer
>> drivers/vhost/vhost.c:1580:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1580:16: sparse: sparse: cast to restricted __virtio16
>> drivers/vhost/vhost.c:1580:16: sparse: sparse: restricted __virtio16 degrades to integer
>> drivers/vhost/vhost.c:1580:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1580:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1531:13: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1531:13: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1561:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1561:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1561:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1561:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1561:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1561:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1568:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1568:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1568:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1568:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1568:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1568:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1574:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1574:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1574:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1574:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1574:16: sparse: sparse: restricted __virtio16 degrades to integer
   drivers/vhost/vhost.c:1574:16: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16
   drivers/vhost/vhost.c:1531:13: sparse: sparse: cast to restricted __virtio16

vim +1580 drivers/vhost/vhost.c

7b5d753ebc22c5 Jason Wang 2019-05-24  1576  
7b5d753ebc22c5 Jason Wang 2019-05-24  1577  static inline int vhost_get_used_idx(struct vhost_virtqueue *vq,
7b5d753ebc22c5 Jason Wang 2019-05-24  1578  				     __virtio16 *idx)
7b5d753ebc22c5 Jason Wang 2019-05-24  1579  {
7b5d753ebc22c5 Jason Wang 2019-05-24 @1580  	return vhost_get_used(vq, *idx, &vq->used->idx);
7b5d753ebc22c5 Jason Wang 2019-05-24  1581  }
7b5d753ebc22c5 Jason Wang 2019-05-24  1582  

:::::: The code at line 1580 was first introduced by commit
:::::: 7b5d753ebc22c5b6935a70ce9a857dc6220784f8 vhost: fine grain userspace memory accessors

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
