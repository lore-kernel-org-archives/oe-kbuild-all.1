Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6116613AC0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711006302; cv=none; b=jW8EhlqQVX50yAXw6aBjqFdM40/+q0EzqNsGeMF8FHqZclxbpayU7WNZf2gsl12ZmuqqxMWEtexACp98k+tipVFW1Wg2yEoA/A/3u+sg/xCzkFcySYy/mOWsVDQ5O4AvYmqkxdJG4YPmiAG0AVmReodDcjkMlZtvAvRUGn5vED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711006302; c=relaxed/simple;
	bh=ogDhRnRbUGC+8huCgRLrtR6/IqIApWUOr5akA/hjGcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Veim+fERnelRhvOK9p4UvLYt6lmTvqIeyDw5kK0pVgDWzW+KKwTK6IEjHjVlv59Nb8JsKmE8cllvYjq1IWFay4edRh96PN7GLGCyqT/aRhJkHx3WLWiA6KhBvjnawo+x+yWQGDVxZt0w6egi5AzQSM1rIw5PnimlVqJpg8rdNyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYb6eZSQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYb6eZSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711006301; x=1742542301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ogDhRnRbUGC+8huCgRLrtR6/IqIApWUOr5akA/hjGcQ=;
  b=TYb6eZSQVJt5DqNFgXUkkmUMeHgOrq0hOqGQzGhNwvrAxbD3kBljz9Pn
   81gNb/0RoQJ/JCXqhqD6wyG/F6CLqm30L+OF6Ki3VeDr0uCWbHpDBMgOe
   m32sSprGxTrgy6oHhc//SiBs8xbTozbgwTv60y435GwybYGDhLQ2A/JGD
   5EIoLmbDC3LKsKk+JMhUmKKLRWxWIGnRj4mSQ5K9UIWQcimyVLwkxZOC7
   ZNhA7WSVedLLl83vfAm1SaBXbPBR4hvHyMorSPZ+wYW2XIDj588iYoNxC
   s4L+dNMFn5JSYpOQpfGhnNEke3ZClatrxflCYRqIy5pCC0nLQfJCcG4WN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5863309"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5863309"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 00:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14409137"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2024 00:31:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnCtj-000JF9-2k;
	Thu, 21 Mar 2024 07:31:35 +0000
Date: Thu, 21 Mar 2024 15:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4225/4226] ld.lld: error: duplicate symbol:
 rnp10_netdev_ops
Message-ID: <202403211514.7Z9ZUvEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1fbfc27b811b42bafdbe80c46f1fd2d9dfb1e976
commit: eba3cbcfeafedc65b74eea8faf68aae00aebd5b6 [4225/4226] drivers: initial support for rnpgbe drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403211514.7Z9ZUvEW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211514.7Z9ZUvEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211514.7Z9ZUvEW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: rnp10_netdev_ops
   >>> defined at rnp_main.c
   >>>            drivers/net/ethernet/mucse/rnp/rnp_main.o:(rnp10_netdev_ops) in archive vmlinux.a
   >>> defined at rnpgbe_main.c
   >>>            drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.o:(.rodata+0x1B8) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: mbx_cookie_zalloc
   >>> defined at rnpm_mbx_fw.c
   >>>            drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.o:(mbx_cookie_zalloc) in archive vmlinux.a
   >>> defined at rnpgbe_mbx_fw.c
   >>>            drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_mbx_cookie_zalloc
   >>> defined at rnpm_mbx_fw.c
   >>>            drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.o:(__cfi_mbx_cookie_zalloc) in archive vmlinux.a
   >>> defined at rnpgbe_mbx_fw.c
   >>>            drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: check_ari_mode
   >>> defined at rnp_sriov.c
   >>>            drivers/net/ethernet/mucse/rnp/rnp_sriov.o:(check_ari_mode) in archive vmlinux.a
   >>> defined at rnpgbe_sriov.c
   >>>            drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.o:(.text+0x1500) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_check_ari_mode
   >>> defined at rnp_sriov.c
   >>>            drivers/net/ethernet/mucse/rnp/rnp_sriov.o:(__cfi_check_ari_mode) in archive vmlinux.a
   >>> defined at rnpgbe_sriov.c
   >>>            drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.o:(.text+0x14C0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
