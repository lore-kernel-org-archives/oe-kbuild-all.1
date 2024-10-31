Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514E1991CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370914; cv=none; b=tZZtrQvR4SYceE0NneGo7OvW3nPwVq2a9atgkZ85OpcagsXnSkbFBv+abMDfUpWMPY4Em6GGvp85hTJqcO6/fP1h9CFkztFmFH+aTD2KOvtx9SvXQnDxeTQ0KUIRVZR8altZCk25hpXjKtHuA5OMrOT20mQ+Pn1+LD+qbJ6CaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370914; c=relaxed/simple;
	bh=VgCRDN9RtFXhLSXWLLMR+hsowjUsOpNClGphHemuH2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xch6lHvYj5kGFYJr0JuKmvvhm0vH6zh+ZRCd/frIDsRdOGzSAy/ult1QcibtIEZoMNWsNMr/idlVJ2KwUtzHAJNMO3gWa7k0xinFdvlO44InrT2BB4G4kLqmvhul7TOavVoCghKfB0rg+2mr54BJBYcotjK8CtrQzT2hwKbKIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwuvhT/o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwuvhT/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730370912; x=1761906912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VgCRDN9RtFXhLSXWLLMR+hsowjUsOpNClGphHemuH2g=;
  b=LwuvhT/o4GCbsmW1T0e0cmhgaoifxyKBIZhu/xSGuc+91swsfUwOeYD5
   R04X7Wo8D37I3K1XdyE1RVxUJf7DzKH6uaVoCGkRFguLVg7tCgvx+jDPW
   +Q86ie03+NK60o938+Gbwh8yN9ba4rgeJ8lf4OvmM6i/dbAc82tvc6uFK
   N1n15keMZlq5uNmXv6w99WVv07B9jNqIB5d5ZUjAIIgtxwTO7wTeNh6U/
   GignzyZjRsBFGFmkJdThzcMNDpplImsD0URxzZjYEVeKxCENsdL3hgyHD
   WcaA3EHDwQboxbL6BfvDWfk6mVTQwpoENu3IGd9npyriBjvxB4a3j6h7g
   g==;
X-CSE-ConnectionGUID: ifZ2s2gRS3ONUqEaaHkFLA==
X-CSE-MsgGUID: W58i4nPQS1yjlyF0bhdavg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30208798"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30208798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:35:12 -0700
X-CSE-ConnectionGUID: Z0B6rFTFT5moSB9y3fU1xg==
X-CSE-MsgGUID: rjxzEZtdRr+sIiV5CAuFeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82709803"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 03:35:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6SWA-000fym-1H;
	Thu, 31 Oct 2024 10:35:06 +0000
Date: Thu, 31 Oct 2024 18:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/13046] fs/fcntl.c:289:22: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202410311837.OCDhmFWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 62b6061f5714aa71e2d5fdb14db9d1341bb82dd4 [9880/13046] [PATCH] security: add security hook point
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241031/202410311837.OCDhmFWK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311837.OCDhmFWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311837.OCDhmFWK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fcntl.c:289:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *argp @@     got unsigned long long [noderef] [usertype] __user * @@
   fs/fcntl.c:289:22: sparse:     expected unsigned long long [usertype] *argp
   fs/fcntl.c:289:22: sparse:     got unsigned long long [noderef] [usertype] __user *
>> fs/fcntl.c:295:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned long long [usertype] *argp @@
   fs/fcntl.c:295:34: sparse:     expected void [noderef] __user *to
   fs/fcntl.c:295:34: sparse:     got unsigned long long [usertype] *argp
>> fs/fcntl.c:299:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] *argp @@
   fs/fcntl.c:299:44: sparse:     expected void const [noderef] __user *from
   fs/fcntl.c:299:44: sparse:     got unsigned long long [usertype] *argp
   fs/fcntl.c:960:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:960:9: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:960:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1035:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1035:22: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1035:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1046:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1046:33: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1046:33: sparse:    struct fasync_struct *

vim +289 fs/fcntl.c

   285	
   286	static long fcntl_rw_hook(struct file *file, unsigned int cmd,
   287				  unsigned long arg)
   288	{
 > 289		u64 *argp = (u64 __user *)arg;
   290		u64 flags;
   291	
   292		switch (cmd) {
   293		case F_GET_FILE_HOOK_FLAG:
   294			flags = file->hook_flags;
 > 295			if (copy_to_user(argp, &flags, sizeof(*argp)))
   296				return -EFAULT;
   297			return 0;
   298		case F_SET_FILE_HOOK_FLAG:
 > 299			if (copy_from_user(&flags, argp, sizeof(flags)))
   300				return -EFAULT;
   301	
   302			spin_lock(&file->f_lock);
   303			file->hook_flags = flags;
   304			spin_unlock(&file->f_lock);
   305			return 0;
   306		default:
   307			return -EINVAL;
   308		}
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
