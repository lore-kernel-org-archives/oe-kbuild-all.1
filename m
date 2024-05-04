Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8ED4A1C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 05:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714801941; cv=none; b=ElKk3WmHpsYQdJtcNCE/PsG/K424WpqicZvlQ6MnJAUvC4n8ZOg11p3+9msm+NK0YNxkO8KVEOIlU+5XnPWd16AL8JtQl74FMq9QusZPjsNRD40LOrogWewA8UGwMUuHq/1RNSFWr2/IuoUI7Zpy+MEG7j+2Ie4dRTP+2eacR80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714801941; c=relaxed/simple;
	bh=pUQFekvUgJ+eVBQlmYRhUqNZwio0GGDCEC2qkuVIp78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fTMzNpjLbbK7u+7YvsGA+m5wIdIbXY8wkVCmvsUioXMj2kpZQ8BD/uvg4C8J4jnlHW5sye6I8u5+qDT0eJQZfJ845rQIdO7GKsC/CM28Pje5URnDiFC42d+r/HicjXgYRr8eSz60b9QoVv+tLX1TOqNpV3VbCQT6pcKaG6OJBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JH+LlZHJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JH+LlZHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714801939; x=1746337939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUQFekvUgJ+eVBQlmYRhUqNZwio0GGDCEC2qkuVIp78=;
  b=JH+LlZHJfMPK4qBywJHkqxH+4eCXlgqz2vuyrjtdYy60yAqXL1mVmRRi
   jJ2NqaIzYCRWSlL54JBEznoNrbnS/KCtOIvSDjQf3HqIHEJL2fn56dTdF
   ViCNxgCwAMmJBfQSiCC7M47K/uOd2563Y4919eoPSn5rV1HqSkX6kUkTw
   9gtZCMGLojx/iZ7KtItqic1jLoAz9X58uTWanyjTdwen+akqT4QtBicO8
   L3sBkYPMzYYRZzxpzChRDMt/C6zIFulzbeacui3H3yW01Mg8W2mZz4JBN
   wsdOdT2sCcL4DXBzs8NTuNiROGM4jdicipHNgBqtzZ8v/9rQ/rjE2jume
   A==;
X-CSE-ConnectionGUID: nx4eJeY0REu2uzAHGopACA==
X-CSE-MsgGUID: FK4YIWR3T7W5gYepb5Qb5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10465552"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10465552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 22:52:19 -0700
X-CSE-ConnectionGUID: JluPqg1sT0eSE8RkRF606g==
X-CSE-MsgGUID: 1Y8fGS/hRLGUVYjEq9pDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="27673685"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 22:52:17 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s38Jj-000CTZ-21;
	Sat, 04 May 2024 05:52:15 +0000
Date: Sat, 4 May 2024 13:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 735/1143]
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts:657:10: fatal error:
 'dt-bindings/i3c/i3c.h' file not found
Message-ID: <202405041354.9U7dklMZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: a3b83282ac2740e6b114866adbe83b323f389a2f [735/1143] dts: arm: move dts to aspeed folder with dtsi fixed.
config: arm-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240504/202405041354.9U7dklMZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041354.9U7dklMZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041354.9U7dklMZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts:4:
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts:657:10: fatal error: 'dt-bindings/i3c/i3c.h' file not found
     657 | #include <dt-bindings/i3c/i3c.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +657 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts

801cf43756cb83 Dylan Hung 2023-08-21  656  
801cf43756cb83 Dylan Hung 2023-08-21 @657  #include <dt-bindings/i3c/i3c.h>
801cf43756cb83 Dylan Hung 2023-08-21  658  

:::::: The code at line 657 was first introduced by commit
:::::: 801cf43756cb83f6dcd12c8d7cf212a58f31bd19 ARM: dts: ast2600-evb: Enable I3C0 ~ I3C3 controllers

:::::: TO: Dylan Hung <dylan_hung@aspeedtech.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
