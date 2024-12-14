Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699126AC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 03:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734148372; cv=none; b=QIvVw+WkXMwGQei2X6t4/lWL31Td6hpx4jSiTVwaNbspT8EhMVlqEmyyCd48W7tMlpbiWz4bQzo6/HC1yqKDQU+peECSOar555M2xxvxfktvIabXij8ybMkhDgYveC5nqnxQ4+Hrrf+KDlUBVT/tmQ47TFiWvpGyElxBx6fWD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734148372; c=relaxed/simple;
	bh=ZGLPgo/Is8qOu+pCSF5j6KZ7GF1vlues/ateJBXCFUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJjF4MlH42bso96YSZ9Y+bvNVJFfy1xhGb9lcBWZkhQlbYBHakxVZec0/2NNm9bF1+DOxhr6XjoxOQoxrSBrjsR+UwRG2WPAOL6tiiaHTV+Mc06L0dH4Hoq3V4S5rtwypKgzuxsRD9ZQozbu0WpxiMQCc3IOt/nWbKvBAM5GEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wyo9wA07; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wyo9wA07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734148371; x=1765684371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZGLPgo/Is8qOu+pCSF5j6KZ7GF1vlues/ateJBXCFUw=;
  b=Wyo9wA07YyaLuBciJh94Jnz3HkJnkmHa90FY6n/5WRojt7SUilxUNXWn
   KOmxBH2HkR50t6Mz9ByWNHbU7MpnfaRIBxbYbCaC6Kq+99aV1tFEgsb4f
   44yQ0+CUfgacn73SdX1RT9L/6CezD6zbVmqFy0eBHyof05WLeJwRcNsXk
   iU5WKGeU5zOLujVZHCFKZFkXrKAXo7EyJPrvGko/R62hjYVJtYXWL2chz
   6/2QtmWaP39pn/0f6biYyVMK1ElOK3ewBdIlzpf5z69sr6Z4xgz05QJfa
   Q+XHjMe3cAY2esckOx+yCMPeKW86BcdMI2NDFI4T897qvRojKDQSu6iUc
   Q==;
X-CSE-ConnectionGUID: B5c7EOKvQgaBchWtAXT9wQ==
X-CSE-MsgGUID: z1kwQvh7SOOwzlihA9Vx7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38297266"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="38297266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 19:52:48 -0800
X-CSE-ConnectionGUID: 05ujZmeITZKmnJHpKBEWPQ==
X-CSE-MsgGUID: ZxqyfoH0Q/ioAlniqe7roQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127709726"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2024 19:52:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMJCu-000Cgv-1h;
	Sat, 14 Dec 2024 03:52:44 +0000
Date: Sat, 14 Dec 2024 11:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 19/28] sparc-linux-ld: features.c:undefined
 reference to `fwctl_register'
Message-ID: <202412141101.PJBVdtJC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: bd2d1e68312b337e12299a0e542b846daeccb578 [19/28] cxl: Add FWCTL support to the CXL features driver
config: sparc-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141101.PJBVdtJC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141101.PJBVdtJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141101.PJBVdtJC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/cxl/features.o: in function `cxl_features_remove':
   features.c:(.text+0x5c): undefined reference to `fwctl_unregister'
   sparc-linux-ld: drivers/cxl/features.o: in function `cxl_features_probe':
   features.c:(.text+0x4a0): undefined reference to `_fwctl_alloc_device'
>> sparc-linux-ld: features.c:(.text+0x4c8): undefined reference to `fwctl_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
