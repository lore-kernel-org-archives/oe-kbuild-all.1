Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85738EEAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727400594; cv=none; b=kp+uInBuH6aJ1wAByGhWfR0kBLHbg+cSKjOOGguXdCN/YhqDIsWCkI3pK3lQdH70VtJ1jmUPQfkdBXOaIwsa3+1LkvcFTVuPM/hCtfPEuhQ2XjjtaCr8eiaGTgdte2RPV62LC0bTCVuB+dBlbRGaz2DdYt/VPE5uIbmmK7vB9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727400594; c=relaxed/simple;
	bh=wKJLtlql2+X1g3syRnY/hbfACnhmtK0SGUVskjObhQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VamZpoAkE8Zcf9Pg/itD3Lf1Cc5BO5/xZpnje6xfNEjkY2TiEtZZm+VdAUWMdL2BgSRLuF0QanSQVaTihO8CoKzLy2DlGvwTCnJvZy39nqC3gA5oL+XXbW32Bf9nnOweazZ0xFHRm5F0Flv6wexBztDY6Eg+4gjD/SLrMcH7a60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrFJRqWH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrFJRqWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727400593; x=1758936593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKJLtlql2+X1g3syRnY/hbfACnhmtK0SGUVskjObhQA=;
  b=QrFJRqWHeiySYDH3tk8XgYFyissaQ1tDKbt7tvzOVhXh+ADekt1E7v1t
   yW2abZBr6hRlZhr8WnnRff6hfF6TOxexN113fPNEpBfg1YL7JgRhK6uaK
   themNojR3RmZmEaMCzMpEpEwla+djNchIntGRqyOeKX6g+MFV2BPOHBx+
   gxlm3KDTWPQTzGibQid4mIrO9z6KmsrTjvtdkDAgn0jU0F28XQxb1MssP
   f/OxQG2+X5/c7Xr+pFSM1sOIQum0qVVQ4tUrBtb2J/1ldYgnkz7bhC3XT
   z1K+PulEefvyxEE735fZyCBaL+mkUwIc7e1SHiYI1C0Y1U5GgoB7i9APm
   g==;
X-CSE-ConnectionGUID: iq6JpCjrQYO8I7AAihKVvg==
X-CSE-MsgGUID: GWMnnu0DTJGrnirsmbkkyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37202815"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37202815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 18:29:52 -0700
X-CSE-ConnectionGUID: GBRHpyXUQ4i4wvA47gVf3g==
X-CSE-MsgGUID: nHORW2AKTu+IhlwuuOE7oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103142215"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 18:29:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzno-000LM7-1G;
	Fri, 27 Sep 2024 01:29:48 +0000
Date: Fri, 27 Sep 2024 09:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 21/25] drivers/fwctl/cxl/cxl.c:44:14: error:
 assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202409270948.3XBRgxKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 69c31732e72a4e65881d0894e34b8f16a9d529c2 [21/25] fwctl/cxl: Add support for get driver information
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240927/202409270948.3XBRgxKS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270948.3XBRgxKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270948.3XBRgxKS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
   drivers/fwctl/cxl/cxl.c:44:16: error: implicit declaration of function 'kzalloc'; did you mean 'key_alloc'? [-Wimplicit-function-declaration]
      44 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
         |                key_alloc
>> drivers/fwctl/cxl/cxl.c:44:14: error: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      44 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^


vim +44 drivers/fwctl/cxl/cxl.c

    37	
    38	static void *cxlctl_info(struct fwctl_uctx *uctx, size_t *length)
    39	{
    40		struct cxlctl_uctx *cxlctl_uctx =
    41			container_of(uctx, struct cxlctl_uctx, uctx);
    42		struct fwctl_info_cxl *info;
    43	
  > 44		info = kzalloc(sizeof(*info), GFP_KERNEL);
    45		if (!info)
    46			return ERR_PTR(-ENOMEM);
    47	
    48		info->uctx_caps = cxlctl_uctx->uctx_caps;
    49	
    50		return info;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
