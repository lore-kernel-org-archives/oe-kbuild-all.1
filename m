Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E281946F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 03:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713239551; cv=none; b=o4c5in8BbBdesQimw8Shr3OePel7I7ZVJnodRoQG2r8gGDhJ8EQgHirFp/nVCLmwetM5fTHYGGqq/NQgd48O4+Lj7w61qbF5k1evx1GNGZcTYoHc+Ow/7MIdxPEHjU27FtL33q+MjVfK5kb8UboIVguMzV3ICdQ/hHi3TX0H9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713239551; c=relaxed/simple;
	bh=qg4gLAslfDCzn+630PI+lNKsT8lJW6H6bA3IwdOQkQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4W0qQp3heat7sBB90RvTl230K2tXgkR89uAl9Km1YRt7ZcuogTx5kmo0i6h1JR8q/2gIu+G+O5oz5imdw3qbAYCitSLgOUkqu5W3UCPlRy4UB2Wk46s6CL8vAY3R4SSz0BqIoYW53SUwEjvLthvejtUfeS4f5DftqPoQsM4DfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9Es8sAb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9Es8sAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713239550; x=1744775550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qg4gLAslfDCzn+630PI+lNKsT8lJW6H6bA3IwdOQkQA=;
  b=T9Es8sAbIiYYlp+95Tzb9DoY5WFFbkn1nOq6pcmhLa4IjHTsj72sq9iv
   mMUCSeD7NqfvwB9MP4n/Vpw1TSleO96r4Iajr/hHVE4rthYF3OcSjNZIC
   +HSyWvyAKMv8ggK6qevuGEgFFu+ivyQ8QxP7w+Su10x0ic60U+9+WJP0v
   qgcFtiDYsI1OJTbqJELUQ5zLqJFPBG/iUVcOV793quQ+vDjgwtNNvuPjT
   T765hbUSPPaech0dunZyDbO4+dgRN3R2T3eMbmcECI7GpudScc59iStpo
   aTo6HQzfHWITO5NIXPWrkh5qiiPXylfbfmNT4FEZwRWjavOSIZ7fqakLx
   w==;
X-CSE-ConnectionGUID: rtOLf4hlTfajqB8KfAgxIg==
X-CSE-MsgGUID: VsWTBOavTUSTGIciT/PjVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8823698"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8823698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:52:29 -0700
X-CSE-ConnectionGUID: 38STlW4vSXGeuRQhZ2uxIQ==
X-CSE-MsgGUID: BL1es1dpTcSd8knpvmvLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26779109"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 20:52:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwZrs-0004wB-22;
	Tue, 16 Apr 2024 03:52:24 +0000
Date: Tue, 16 Apr 2024 11:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 1905/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1068:13: sparse: sparse: cast
 removes address space '<asn:1>' of expression
Message-ID: <202404161113.vsudQgbi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   71b63f21a8292ca960a4c363d69d5e95c0265597
commit: dcdab0d72b69b6291d08483c0baf62cf92e2a1bc [1905/30000] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
config: sparc-randconfig-r131-20240406 (https://download.01.org/0day-ci/archive/20240416/202404161113.vsudQgbi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404161113.vsudQgbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161113.vsudQgbi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1068:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1068:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1068:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1068:13: sparse: sparse: cast removes address space '<asn:1>' of expression

vim +1068 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

  1059	
  1060	static int get_v4l2_subdev_routing(struct v4l2_subdev_routing __user *kp,
  1061					   struct v4l2_subdev_routing32 __user *up)
  1062	{
  1063		compat_caddr_t p;
  1064		u32 num_routes;
  1065	
  1066		if (!access_ok(VERIFY_READ, up, sizeof(*up)) ||
  1067		    get_user(p, &up->routes) ||
> 1068		    put_user(compat_ptr(p), &kp->routes) ||
  1069		    get_user(num_routes, &kp->num_routes) ||
  1070		    assign_in_user(&kp->num_routes, &up->num_routes) ||
  1071		    !access_ok(VERIFY_READ, up->reserved, sizeof(*up->reserved)) ||
  1072		    num_routes > U32_MAX / sizeof(*kp->routes))
  1073			return -EFAULT;
  1074	
  1075		if (!access_ok(VERIFY_READ, compat_ptr(p),
  1076			       num_routes * (u32)sizeof(*kp->routes)))
  1077			return -EFAULT;
  1078	
  1079		return 0;
  1080	}
  1081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
