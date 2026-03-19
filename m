Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13237DE9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773957121; cv=none; b=sBF3FrRWuFFUCxD+HxfHiw/K7McMutOBdggQFlRRrPFVWjwWxWOmQsPxsAc3hG8UmjszBWXUgefw0XEXDamIEVpYVoXRPvcxO8ySTo66gq1HPALcms7DpcSvJV4Qzbs5F8g3p6dNQ1CCJ2x5MZ0jbVROYSSJ/47CR98PKpZONnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773957121; c=relaxed/simple;
	bh=hNnIk7naFuuvA/qsBQzvLMJsZ3N9gt2/YmIdjwVjZA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LjMZQ87Ys+IV7PYseDhpjgpMWOKZ/yQIUxICU2DI3Htkl2xjr7KwBJ8ozDyeR4cL1AZBS6uxWBiRcVxYLAZ1pAVL/dM5NYBPkoSmDbdSQpCLI2uZ+1hzwInQdRW6hQyA7QIR8w4FtR2Y8PUPWt7I4VTLwTX6vHVlKKGgSB8kDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJl1fYBr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJl1fYBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773957120; x=1805493120;
  h=date:from:to:cc:subject:message-id;
  bh=hNnIk7naFuuvA/qsBQzvLMJsZ3N9gt2/YmIdjwVjZA8=;
  b=FJl1fYBrKuOL4fYlw1jEa5d1kJuSFc/tdyhosoZXx65GKwcY6MlV+Mp9
   l45J+70ciNLaN6Mr8vO8pgKT2HBIrIOINLSOk3ufDwGt8GA3H9WFbvfIl
   rVIw2I/tcSSxNccKJpx6nnnVSVSj16Ym8KLNtEcdsb6wbuAIDqakusP/n
   GLQswsu/HjvshYnxer60ZwbM9HK+MvYFZN9WsN4b85EbOS6G2SHN50oRG
   QCUfq0tYfOuVQygTJwRV73BzRvJEIcWn1xwKl2w8TujZz2cM92GfwWMzV
   bt5Ge+gOhjh3E9cA+1tsbPdpo7I7uJPGICKzzJjEkPPjyRppO8XCCzg8J
   Q==;
X-CSE-ConnectionGUID: Z1E2XSCPQVKhUCfG++IHxw==
X-CSE-MsgGUID: SxZGtCWvRISpx+/6ekbgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75074218"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75074218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:51:59 -0700
X-CSE-ConnectionGUID: D8AnBEP8SHqV1Z0E1rDQ1g==
X-CSE-MsgGUID: HmLB1Hy6Ru2A1OWPCXAc+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223122872"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2026 14:51:58 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3LHX-000000001h1-3Xjr;
	Thu, 19 Mar 2026 21:51:55 +0000
Date: Fri, 20 Mar 2026 05:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 3/8] Warning:
 drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in
 'nvme_auth_extract_key'
Message-ID: <202603200555.Zszkfio7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: c565ba283d6746247485bb78e72220029586a0d1 [3/8] nvme-auth: switch to use 'struct key'
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200555.Zszkfio7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200555.Zszkfio7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200555.Zszkfio7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'
>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
