Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3642066C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216357; cv=none; b=NW2Yc7DG55hQzsMtFuew+HY4p/Tp+RdcD/BVFliHtxldkpawfMUKb/K/QIbUGleuu8tV3tBhY4XkFW1WTxXH0+sW4GOwWlnR0oyRxIbIk/QbkDK0A5V/j6x9iKHQbrX98/WFRUqzHVn4eo2wE9UbdjtlDHG3fCqvPXxK0Q3Hspk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216357; c=relaxed/simple;
	bh=FaTFpgtPQZ9E7pmnJ3WVdHMZ2JYhzSvBJA0hch/oEgw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aU/B5UoVkBKCMfkqDZRZj5EHgNOIOT7RTCPmmItBT10FpIoc+hIrLD3+bFSO779Hkd2IZGLNcCX7iV36WP6XdHN1NV85SArvCrKFLEetrp42Zz4akeCuhpDwUHFFUfoN4VLTp1LvxxUcH/8tYQpp9gvPrC4u69Lrrh4pLpnXnR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7OTeGXj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7OTeGXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740216355; x=1771752355;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FaTFpgtPQZ9E7pmnJ3WVdHMZ2JYhzSvBJA0hch/oEgw=;
  b=a7OTeGXj7xFpHC7+ORXhzfRaks0EbDSay/ZdUXHJ367NUgb3LX7yZXMA
   NUGFnxZOk8v3npDiZRpjMTJrlRKUXascpmdh5hzkBMPhcEtMGgydH0uHw
   /5A6twKRLgcjeP8gNoVOrG7UuSuSWlhHBRFv5wCA9Bh7rZKSvD8IMBg+4
   gXG09/osAnRKw3OkqAe3mv3dHM4fc9CgSqHvOH5w9dhM6oBZu+YL/JbAc
   Wwncv6bvo2PwKgIClOuD3mbUXs4NHxBQZf7oYWLVzeG4LVyfuWy0x/zmf
   PBi29pLX1vrkNUYwTpVT9JuyAc70GNNZ33SYvnbsy3RzRH5ze0uqbK8d3
   A==;
X-CSE-ConnectionGUID: 5cRc0L04RRSIPcx2C3Ccvw==
X-CSE-MsgGUID: RlcwpMD6QPe3RvBdLoMx4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44686754"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="44686754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:25:53 -0800
X-CSE-ConnectionGUID: IjjgygNfQiCKa3XsrmCAKw==
X-CSE-MsgGUID: 7altQHtQRCm5xZzHK5k10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116083652"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2025 01:25:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tllle-0006RT-1u
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 09:25:50 +0000
Date: Sat, 22 Feb 2025 17:25:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5] fs/ioctl.c:958: warning:
 Function parameter or struct member 'file' not described in
 'compat_ptr_oob_ioctl'
Message-ID: <202502221713.p1YxjNOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: 7ac03b7e6a95406d3097f314f2f65f2f9e59025d [5/5] dovetail: add core support
config: arm-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221713.p1YxjNOo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221713.p1YxjNOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221713.p1YxjNOo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ioctl.c:958: warning: Function parameter or struct member 'file' not described in 'compat_ptr_oob_ioctl'
>> fs/ioctl.c:958: warning: Function parameter or struct member 'cmd' not described in 'compat_ptr_oob_ioctl'
>> fs/ioctl.c:958: warning: Function parameter or struct member 'arg' not described in 'compat_ptr_oob_ioctl'


vim +958 fs/ioctl.c

   949	
   950	/**
   951	 * compat_ptr_oob_ioctl - generic implementation of .compat_oob_ioctl file operation
   952	 *
   953	 * The equivalent of compat_ptr_ioctl, dealing with out-of-band ioctl
   954	 * calls. Management of this handler is delegated to the code
   955	 * implementing the out-of-band ioctl() syscall in the companion core.
   956	 */
   957	long compat_ptr_oob_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 > 958	{
   959		if (!file->f_op->oob_ioctl)
   960			return -ENOIOCTLCMD;
   961	
   962		return file->f_op->oob_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
   963	}
   964	EXPORT_SYMBOL(compat_ptr_oob_ioctl);
   965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
