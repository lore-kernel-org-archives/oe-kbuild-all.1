Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16E1B974
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713737920; cv=none; b=CLRJvgINhmO2zgMM23GZlrb+UiwRejMHsWgGt+qHQtRyINBOsAsm0o7sc/+CQh4QQVKamJ25X115myk6tpWsv9QBLz9jvN5/+mLvGDACItz+zgLZjOhE92PqqyvtKYF8BmhEPXCPQIJG+5nZNSP1Wc+C2fzrGA5WHnzCQL4OsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713737920; c=relaxed/simple;
	bh=xm4K9hXSTe+ylLp+W1roFCHOcriTVg40hDOwg+QLdpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQQIdVXLqkXJVnIeC6xbV3qdB4LNKaGDV8wYzVKduk+IajRkvVPVDq15muD+zAoqhxTRrvkPMpm8HYXZ+q/+5x82MFUxjqRSEa94dBz1JFyIpj+Q8IZF5DHKKSjpygUIXFRRBNHjiW3pY/PFuz7TiG1Ccf1NKTJGxYAZdCu7Ckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+HWJDJ8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+HWJDJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713737918; x=1745273918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xm4K9hXSTe+ylLp+W1roFCHOcriTVg40hDOwg+QLdpI=;
  b=F+HWJDJ8kwKRks2oBznNRSrNnBNGODXqjoghMv9X5q5+m6SBic6VOKb7
   H9xJGwDnQ58QVuYXw5sk1IqkQyys3N1rKV/apDz7RWYQYnHRv5TgjvsVw
   +hrVj4nws1bVzdJkJo/+LZLSOtgxqbPx3XIxtaIVf9sn8Y80TsZsZvOMW
   +JAXX86+2TNZ8wcb/MvsrZKxWj0ZK0M/d17sBXLMdONGMhR9vGXlqc57S
   oaiCkx0rBV3lB+IagprJWkRJ/JCI2hAJQ5JvtCn97zg1juS3d7g5cRdtX
   ShslPVLcZZOkvscNEhrhfGrzDrxlIxPj/c6UwaVIEXOiT7JmVnObg/2qg
   g==;
X-CSE-ConnectionGUID: DfzAaESGSW6+EHFPCKEPWw==
X-CSE-MsgGUID: TL+PR7ZgRBeya6YbGkEl9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9421541"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9421541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 15:18:38 -0700
X-CSE-ConnectionGUID: UzoM7u3iS7S/SKGBh1rbcQ==
X-CSE-MsgGUID: KWkA1eL6SNe+GFhtmnYI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="28616437"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Apr 2024 15:18:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryfW4-000CBm-32;
	Sun, 21 Apr 2024 22:18:33 +0000
Date: Mon, 22 Apr 2024 06:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-inode 3/3] dev.c:undefined reference to
 `__get_user_bad'
Message-ID: <202404220623.w5sAfFxW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-inode
head:   721b0ba2d14b9e1ba63b05d4837b1d3be2a5c8dc
commit: 721b0ba2d14b9e1ba63b05d4837b1d3be2a5c8dc [3/3] fuse: implement FUSE_DEV_IOC_BACKING_{ATTACH,DETACH}
config: arm-randconfig-004-20240422 (https://download.01.org/0day-ci/archive/20240422/202404220623.w5sAfFxW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220623.w5sAfFxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220623.w5sAfFxW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
>> dev.c:(.text+0x4dc): undefined reference to `__get_user_bad'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
