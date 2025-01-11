Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4D18FDBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736609850; cv=none; b=Owf4IvlesCwbRVaMjqiYFpbGHe33fbmsUhAdHdoBo/3iZKUkwC07c1OQYIj24Ml7Tizji842B8sSh4pHN1EWv5UDXKPa7aARTpKycR4n5go4YbjahWj1xw5cuYBhgOKATR6YGfq1jExhnipZ1mnxfrodjIL+XhUTGExtt2Nddbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736609850; c=relaxed/simple;
	bh=3mG22oYlbhxVW0EzPotRbdq+Nl1j5J+FU8wJ3driDlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPzehYWzFXb+WfWteH5Q2khxSAKz0H6NejbIRPWvKqH4s7NE9wiojpKe3VWFlzD91AjhPbu7sEH7sn/MTmhF90sgQrgPahk8oRQx24c96U007pCGGf5+Exdm0QWcqmxFaTe0I4/GFsgnzNPWba53nJM+CqMyE5TgyK8Ya2SgB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCqgGgZc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCqgGgZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736609848; x=1768145848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mG22oYlbhxVW0EzPotRbdq+Nl1j5J+FU8wJ3driDlo=;
  b=WCqgGgZckIBHybPcAkwjCETlgC8C7I36hOFklmvn0zxf/Ojo4BAkLTC/
   7pzACGzsQ3y4sD8zz8/aK6bvp5MR7gNCu8FCGHb5AEriLLPwItHZJgMsU
   y5nXBgr10wV4q0NBZH9zAr5gW+tSP/oz4AqhrY4dLLvFTdasUrozlAz5v
   ZJhJaeRIWfw4E5/RtZtVc44Ui0Ien7XI7zB2xlxhaQyQIbmJ2XuDAbGQJ
   k+M3G24S5wbQnB5h2TGF18/1g6GJbhUNLBEuexzKKND3rIBXgJzTdR3TE
   BJObVRLv4dMj4fEhIww8/Uh45cCRNQnqHY01TP9AwdFONNMjBEjD631un
   w==;
X-CSE-ConnectionGUID: UICj7ycnSVuByIxj/i9bdw==
X-CSE-MsgGUID: 3Ng0IN/GTO+oUUPa8HjFnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="54306509"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="54306509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 07:37:28 -0800
X-CSE-ConnectionGUID: Aiq1YGdITTKoca9CbFoTkA==
X-CSE-MsgGUID: uGEWTF8XSGKwP/98Gjx8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103800617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jan 2025 07:37:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWdYB-000KqB-30;
	Sat, 11 Jan 2025 15:37:23 +0000
Date: Sat, 11 Jan 2025 23:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 325/504] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_USER_API_AEAD when selected by
 CRYPTO_DEV_ZYNQMP_AES
Message-ID: <202501120103.G7eJ7t9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 262c5273ae76cc1369917d11a74ff5c9587be208 [325/504] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: nios2-kismet-CONFIG_CRYPTO_USER_API_AEAD-CONFIG_CRYPTO_DEV_ZYNQMP_AES-0-0 (https://download.01.org/0day-ci/archive/20250112/202501120103.G7eJ7t9E-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120103.G7eJ7t9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120103.G7eJ7t9E-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD when selected by CRYPTO_DEV_ZYNQMP_AES
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
     Depends on [n]: CRYPTO [=y] && NET [=n]
     Selected by [y]:
     - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
