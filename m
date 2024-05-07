Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE253E28
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715100280; cv=none; b=IArZPfrvRhosEQ268ioYyUd+7B0IZuCa60+HWXcsW1enn+D3oS2CAu50V/uCl134pHVG0hiezUcBJBQ8eDhYzwF7XHQ/wMaMOOnqjNOLsunbgelg1ZzyKSjpACPqMbc/yD3mb20Vpb5jcxl9znZbvQVmIaFZ/HqnrFeBnR8FYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715100280; c=relaxed/simple;
	bh=cIAlWcQJfI0nPAYv9cCBgHsf1yQsizkoprBhV8Km3Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHbaoBVnx35sFpAM6IjStqds8B73kGhMePmdc8/nlr4ihFdb/D0N92z0hCgB0xGHBcUmEN5NzDKe4zNrWhiFG/2ncTk7fZCcz4KN3xfv1ljF11CBNzZlGDKm4dVtLm6uF1BL3+Y7LEC4riWbiUGQsAKPYEEGS/gDZp0ScFEX9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+INO7ma; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+INO7ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715100279; x=1746636279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIAlWcQJfI0nPAYv9cCBgHsf1yQsizkoprBhV8Km3Tc=;
  b=U+INO7maHiEmXUJt1Rfc1EN12CnUx1WQc+lQKlvJapiBdVB1IpzAquib
   zFp38QIiIgXMgPGYuFrVCjnwscRP5FJS4CF+bK3UMVKpXQRoOLIvNh0ZT
   1vObQFrvt5tnIgwreHZByha6V0N+myjUzFzcSJ3uc5yI2vx5i3SaEWl1d
   p3BNxAQa0saLrLEY2ho3IQ0uQxfSQ63BSKAUCT+s54zNtLnvCKRiXShNW
   pMzi+VPD4erISa3TyWYx+eSudFsdyAuq0T4SnJVOYzVG8oLcCdyVfwqNp
   hV2XF/kG4X1uNtPZAKs97gz5fQ5J3xmEa4tCXlAzjbAdQXrWAFEEqD8+L
   w==;
X-CSE-ConnectionGUID: x089E1y5RY2qdeRD287d+w==
X-CSE-MsgGUID: Xk80P44ySaqWBLUSxbVu9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10752188"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="10752188"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 09:44:38 -0700
X-CSE-ConnectionGUID: LFhwasUORBWBO/xHwRhhTQ==
X-CSE-MsgGUID: l1i8isJfS2aIetH5jkm1dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="29154839"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2024 09:44:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Nvc-0002Lc-2j;
	Tue, 07 May 2024 16:44:32 +0000
Date: Wed, 8 May 2024 00:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6506/6518]
 drivers/crypto/ccp/hygon/ccp-dev-v5.c:206: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202405080058.0rqclkdl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b294718c76ed688d3272e48c431221a8194cd2d3
commit: 861bd616fbc656a29bb7709ee79f441cf0ed85e4 [6506/6518] ccp: ccp-crypto support sm2 on Hygon generation 4th CPU
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405080058.0rqclkdl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080058.0rqclkdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080058.0rqclkdl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-dev-v5.c:206: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Hygon CCP from 4th generation support both sm2 & ecc,


vim +206 drivers/crypto/ccp/hygon/ccp-dev-v5.c

   204	
   205	/**
 > 206	 * Hygon CCP from 4th generation support both sm2 & ecc,
   207	 * but its input content is different from previous version.
   208	 * the previous requries only one src buffer which include
   209	 * hash + key. Now, hash and key should passed separately. To
   210	 * compatible with previous driver, we parse hash and key
   211	 * from src buffer which same as previous input
   212	 */
   213	#define SM2_ECC_OPERAND_LEN				32
   214	#define SM2_ECC_KG_SRC_SIZE				32
   215	#define SM2_ECC_LP_SRC_SIZE				32
   216	#define SM2_ECC_SIGN_SRC_SIZE			64
   217	#define SM2_ECC_VERIFY_SRC_SIZE			96
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
