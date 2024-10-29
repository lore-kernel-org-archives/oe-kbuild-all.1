Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D658318FDC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 22:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730241820; cv=none; b=TObQOi9mX7Q3yjbB8YrhzpchJu/0Yf/9JvnUfKgeEZWavz6O4JeDgH+Ca1mUoUIqXlDiNc9gdtm9hfvSiiEc7b1upWQdlAZ5uy9gsZhRi1fvalgi+VwdXj5RGeYJWWFIdd2tz/U2D+xlppHEH4yev3e3u8OwvchKLO3t3abdTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730241820; c=relaxed/simple;
	bh=w+Q9uqDevlDM2BgQ+Gd4yWj66XEAf/j96JGGhL/1qEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dt2xlMIHuxaMN7Tktesq8Supo7Asbe+TqVTnkp6SmbVQmUtkB42m0V9Yr4OrwvR74C05urMaoE6M+wrJi9KyrXS9NCWsApOp06DO0HOmOIedrPTu3gbewwMvoMTqHBpgox7OzI6gtG6+qhV7Wv64UtyWUohHF2O/vR84gjiOmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+yefnbO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+yefnbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730241818; x=1761777818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+Q9uqDevlDM2BgQ+Gd4yWj66XEAf/j96JGGhL/1qEU=;
  b=m+yefnbOqhTDE1+rJudrrvZ+/KxRJhKMGoC/UVjQ0TLct1ggYNTM9xIW
   M/ydJhaxRHV8iP6WjVLyRZBbPk0ofp3JetYU/5AOSkKPvAHe2MstzHK64
   h4W/x9zxqqeY7xTQDJrOgc14ydihRC/gpYULdUhgmyyra33JzG/qMfWMB
   HpUFwCH3vZiX6lPGNQ+g/hZVpRogok1hWgiioLLoj4tMfNTBxIJgicTos
   H/t4TOf8V7cuC5mQWBX4AWNj/1Y3QOsvkTZpEk4cCSqJEHMaf+XjBR6ZS
   wvk5lShMJ5q+GqX12w8SVCDzP6dIrpLoHL8DMofFr1Iyc1cu3HzsR+/AY
   Q==;
X-CSE-ConnectionGUID: Ae6QWX/hRTm1bnuFX/+q4A==
X-CSE-MsgGUID: 7ooMxHbEQdeXy9iOgvq8Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41016318"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41016318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 15:43:38 -0700
X-CSE-ConnectionGUID: AK6fL12eT3WQJg7aspo5qw==
X-CSE-MsgGUID: NRq5gN1kTPWVNe1FyS0LfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="81661939"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2024 15:43:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5uvz-000eF2-35;
	Tue, 29 Oct 2024 22:43:31 +0000
Date: Wed, 30 Oct 2024 06:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/13046] fs/fcntl.c:289:22: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202410300633.MqPB4AXt-lkp@intel.com>
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
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300633.MqPB4AXt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300633.MqPB4AXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300633.MqPB4AXt-lkp@intel.com/

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
