Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760916FF27
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714672253; cv=none; b=noxUIszgYPcYElwU5kRRgNgbfXe715dprYLc98W8PsZ+Af1udkq3Qaf67Jy/QKpZaELcg9OjxP3gfnyrMM1YdDy+ijl0Lxr+kcxsZCCu2sLeuuAHSyaRNCjygkF7F4kZRLqBNpo0gnq/mSfF7ZwkH65QWTINYRcoUr3xTvMbPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714672253; c=relaxed/simple;
	bh=ulD2EVygoNqP41pB82a2jtNcBvtuX7CZOK9id56+lKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZM/ifXxa3zLPON0NNhE1MnCm/LZONVcuM1h7Mf+o/KPC2ApkkVXAmao6q1PYuQe2SHljbtT58cMYk128nLdSWXioHfoZy7Ddf6kazcPM4T6XO3k6N4WEEqwibjt7WuEmrP5IoJZIeNgluGzRqMGfVrnL53NDkBciYktiRlu0mss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEWKh4EQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEWKh4EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714672252; x=1746208252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulD2EVygoNqP41pB82a2jtNcBvtuX7CZOK9id56+lKM=;
  b=ZEWKh4EQqWo9GL9A9AJU/LygOZGxRi8o2Av0nxg4zQNnA3i9bY2JFW25
   WRlkju+uNJh8HLseqaJDp98OGfRyxezbkZ43yuGsuNOMHoZkZnh8pgfIp
   Oj30P0mR/KUnY3SFnWPN1nwbGvCOb13tf731+FQo6gTSVQf4M+WQX1vQA
   s0MgRf28IB+ZnOhLAQFM9EgFyssHUe/uksEKApLEDwZ2DOl9vUiBC9l0m
   CRW/uDh9KkKtxg5MLQ1VeqOGoB9/Ycu/a5yFuqGZrlvMInvAd6KtkLrd5
   BxD/OVgInuP7h7lOR3MqgBeB2HHh4LpbPVGS++ZxxxnZ6dK2c9fRVwQfo
   A==;
X-CSE-ConnectionGUID: s36H1xnkTZy98uH4igGb3g==
X-CSE-MsgGUID: HXV0qMXhRfeehA6AkQMiwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10620034"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10620034"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 10:50:51 -0700
X-CSE-ConnectionGUID: PFcLw9PVQ+mPZ1IUT21aMQ==
X-CSE-MsgGUID: x4hvr1kURLy6m/qwfBQTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31685342"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2024 10:50:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2aa0-000AsC-0D;
	Thu, 02 May 2024 17:50:48 +0000
Date: Fri, 3 May 2024 01:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:fwctl 2/7] drivers/fwctl/main.c:61 fwctl_fops_ioctl()
 warn: unsigned 'nr' is never less than zero.
Message-ID: <202405030154.MrXK0L9P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   569ad7099a1954a033af70c41f63f5423a270cef
commit: e75353c4b41460da294d129e398a477b9995608e [2/7] fwctl: Basic ioctl dispatch for the character device
config: m68k-randconfig-r071-20240502 (https://download.01.org/0day-ci/archive/20240503/202405030154.MrXK0L9P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030154.MrXK0L9P-lkp@intel.com/

New smatch warnings:
drivers/fwctl/main.c:61 fwctl_fops_ioctl() warn: unsigned 'nr' is never less than zero.

Old smatch warnings:
drivers/fwctl/main.c:62 fwctl_fops_ioctl() warn: always true condition '((nr - 0) >= (0 / 16 + (0))) => (0-u32max >= 0)'

vim +/nr +61 drivers/fwctl/main.c

    49	
    50	static long fwctl_fops_ioctl(struct file *filp, unsigned int cmd,
    51				       unsigned long arg)
    52	{
    53		struct fwctl_uctx *uctx = filp->private_data;
    54		const struct fwctl_ioctl_op *op;
    55		struct fwctl_ucmd ucmd = {};
    56		union ucmd_buffer buf;
    57		unsigned int nr;
    58		int ret;
    59	
    60		nr = _IOC_NR(cmd);
  > 61		if (nr < FWCTL_CMD_BASE ||
    62		    (nr - FWCTL_CMD_BASE) >= ARRAY_SIZE(fwctl_ioctl_ops))
    63			return -ENOIOCTLCMD;
    64		op = &fwctl_ioctl_ops[nr - FWCTL_CMD_BASE];
    65		if (op->ioctl_num != cmd)
    66			return -ENOIOCTLCMD;
    67	
    68		ucmd.uctx = uctx;
    69		ucmd.cmd = &buf;
    70		ucmd.ubuffer = (void __user *)arg;
    71		ret = get_user(ucmd.user_size, (u32 __user *)ucmd.ubuffer);
    72		if (ret)
    73			return ret;
    74	
    75		if (ucmd.user_size < op->min_size)
    76			return -EINVAL;
    77	
    78		ret = copy_struct_from_user(ucmd.cmd, op->size, ucmd.ubuffer,
    79					    ucmd.user_size);
    80		if (ret)
    81			return ret;
    82	
    83		guard(rwsem_read)(&uctx->fwctl->registration_lock);
    84		if (!uctx->fwctl->ops)
    85			return -ENODEV;
    86		return op->execute(&ucmd);
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
