Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015261684A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317953; cv=none; b=sMOIrUpXeJNOpEdiO3PNtprp7kvWUK2OlUhvJ/SCt/vMCF+mBIltS+f2LPCta6k3naMk9nu42qWTpI1m7ahTBYPjENIEu1xOe0i6h88WV2W0WhYUOfD+X4q6IdHQ/tcpgtHPe55RNGxTUfBU5WmDuewrkGLhOG2HWz6nQjOzXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317953; c=relaxed/simple;
	bh=V4r6erMPXS2bpqdNveT8DnmhPloeephkRPnW/wUPLRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3MbuYfRrpIizCAqmFWF/8S/F769ygS91sBLqQf9+lE+i3j+cw+8SCXwCwc2x1KR98ywTVUnfffQfwa3Yub047GOJn1ePoxpzp+pMxq+xdVZWnniOmDJ8d2EyY6Ic8tAvD4IUMqLy4ZI3+rsrdF8U5C1fa7ZFYAQPjmJLjiny9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhW83eub; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhW83eub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317952; x=1778853952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4r6erMPXS2bpqdNveT8DnmhPloeephkRPnW/wUPLRc=;
  b=HhW83eubi5+mC+ctOjM3EuBZyvUjDUAX61XgFrHyyO6rNxhOQgyPlv/8
   nZWrUmoQNEb5tlBAhBTyt4D7yodCwOKdjLs+EJPgoYyg+iDaBQZ/OIK4H
   I3fQgv/XhH3VBu1aOqbEST5W60WXiVQ0rXMVo0E0uyEyk9oPX0Z8U692r
   CYydrV+33LnLsdBp1/3irIbM9E0jVbGc7hqPDQWu+jk6JMxzrc8AMpJ+S
   FybIvYrnG2MW3yf6TC3IEYB3j3msWawrGHIuhjmy76r1ev23R0losyZeg
   ayqdva8lsJ/mrBiVt5wqHMOBDX+OC6xIDYfjGPO1vSNTlpBFRtlNk/F6M
   g==;
X-CSE-ConnectionGUID: xK25c2H2T4SMEix7pbCiBw==
X-CSE-MsgGUID: TTKoSAj/SZCaY7Z5atmdJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59889271"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59889271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:05:51 -0700
X-CSE-ConnectionGUID: Rk3cP84KQvuxPhqUeB4H7Q==
X-CSE-MsgGUID: AqjaR/Z+TNCOrYhS1dxgkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169453513"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 07:05:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZDY-0000FZ-2D;
	Thu, 15 May 2025 14:05:48 +0000
Date: Thu, 15 May 2025 22:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/crypto/ccp/hygon/ccp-dev-v5.c:206: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202505151352.6rtSDM7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 641a2595f7f5a1b8c5a8ef8ae44b7318c7a6108e [2229/2229] crypto: ccp: support sm2 on Hygon generation 4th CPU
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505151352.6rtSDM7m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151352.6rtSDM7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151352.6rtSDM7m-lkp@intel.com/

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
