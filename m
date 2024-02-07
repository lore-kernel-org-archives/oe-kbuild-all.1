Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954C3D71
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707264568; cv=none; b=JukKBrykKOSHscA7LNxcz+v+nsXbPtPFz8v51F+Nx1CPFf/e0OmeGU9H1Iu0D/CFIXyUqncTekKbaNX6PDPDPuz16AXnEmQRIGVOm/5JM5qkD5vSXDFcTHBp3P/4JAauUVJ1GQKiLo32KXqSzjSqtVGF6IyzxdcisxDQTacIkNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707264568; c=relaxed/simple;
	bh=tP60nHUsBEiMEWbXvIjIIoyzDTTxvdSXaXnW3tuGLxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvQ2lk2aT0/S+rsKohQT52+AOzuGa5AYYXEqDdmXdn7Qd0bmqLIIjNRixLZcsCLGeaUWBGznXEsBFoL+UI/eGrdJuFyAfLkPInVj/4i+ANPCP4XMc2nOVr+nCBL+aSUjE46P/eOAy/SvC7V9rH/36zxGJo/RtDt9R8l7J9AsSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/D9/2BZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/D9/2BZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707264566; x=1738800566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tP60nHUsBEiMEWbXvIjIIoyzDTTxvdSXaXnW3tuGLxg=;
  b=U/D9/2BZO3K6KhZwj+I5+snTmR8lWZNX1MLKzz8LF9VUs8DE7i+Wi9Fz
   AaIMZk/YMeNFLf/fHOr4o5vvOiEzK1rA9I/vPwpXwpa1PkqnQTYDLKqk4
   Cg9UKKZyVb6zQziDaPjIG5NYu3bdMpVT9PwluNpi/oKdQDqwg0A4mhM1v
   V5CHeZMTQQDe2+WmEZeJYrw3A4y9ctXsqueH3usvrwDkUtdpTiHkfMbGz
   rD44a8BlYXr0O1hwx43BU2PC//N1bQpQTS6TzhxSa/IulL2MfWmMoOpdH
   YbhQ2P/7eVjl5rg1D3dhr8NSBOaoY8kBK8zDAonjnq3+RwTPrxvNRevhJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1014047"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1014047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5775759"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2024 16:09:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXVVB-0001uK-2p;
	Wed, 07 Feb 2024 00:09:21 +0000
Date: Wed, 7 Feb 2024 08:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7838/21616]
 drivers/net/phy/.tmp_swphy.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202402070744.YorkcsyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [7838/21616] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-buildonly-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240207/202402070744.YorkcsyM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070744.YorkcsyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070744.YorkcsyM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/.tmp_swphy.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
