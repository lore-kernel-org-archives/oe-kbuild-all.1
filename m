Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0033E4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741403876; cv=none; b=NlCXsWFQu2p//d4WQvu+0lWr9jWPugEwgY+OykwU2g13ZJ1BQnlePwVYDtJBnVYznBsquy3lmbIpjCGoljgsyrnSAyuOpaimAZMmf78aJyeh3wwIOW4jHdb7Q2AuJ/kymsmmiAT3iyathek4YZ5rM3zAid7ke7TvFU/njwHTNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741403876; c=relaxed/simple;
	bh=FROj2da7cCYDXd9EyjNSWiNImzmH4wRRl5J8ur3bdNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDIICBvh65LDtFc9nCCuSlF18eWN5NDvhfgJrkeKZbve3rWHj/UCekTet9PLuCxTzLZ5gB7C1FhPT2Kj2ZCT9NboEysmEPHbnlKyN6k9x1DCiae1i9ycd6WAPV7Lqv45rfi2AVlYJlKkJ4X9+U2SxsrG7vjmecyOIbE3b3Z9n1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhucQLct; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhucQLct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741403874; x=1772939874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FROj2da7cCYDXd9EyjNSWiNImzmH4wRRl5J8ur3bdNQ=;
  b=PhucQLctku/TPnBVAxlOgRo6tav5JldmWVtmjQ2MmJpPn0/C1tvqA/np
   Eyt4C237wNvSgpbURNILVmiBC7nZp5b9pkiQ2U7ol3uzCIbWkBG4IV8Fs
   9dsRXaPz10jFbJClZwxByjK6/WUfJZx7KZhkiQmPC+RbNca/VNbmJATc1
   Pg6mNDrI5K1vydVoGdtZ/eEcgcl9unyrkiCTTz696D8tblvKfBSrhKd2A
   sRbYf/39OpHHgpe6tIlhqdlgATZ1hiC8b4EwzayLgNNwincVrMTvkmwOP
   GvNQiZZTN7I0cYmpjdHGt+UH/rAOKDxXx9OMKYX/F2Ww2t0E/zvopITc7
   Q==;
X-CSE-ConnectionGUID: A4ObEHqwT9eggAp77H8ecA==
X-CSE-MsgGUID: 1q2wQRahQ6yQ7HxAlGfpqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41717393"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="41717393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 19:17:53 -0800
X-CSE-ConnectionGUID: 3ZHqKQZcRemRArrkpcgN1Q==
X-CSE-MsgGUID: DN/QHil+TcioIJHb3tYrHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150438011"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 19:17:48 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqkh8-0001Pc-0d;
	Sat, 08 Mar 2025 03:17:46 +0000
Date: Sat, 8 Mar 2025 11:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1461/1461]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.o: warning: objtool: missing
 symbol for section .exit.text
Message-ID: <202503081134.gJtKyv85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   98d5b0444e788687e54a325fc84907a8bacbe635
commit: 7d1756a0d43d1c46e8ab8cc127c3725acff703f8 [1461/1461] net: hns3: add trace events support for hns3 driver
config: x86_64-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081134.gJtKyv85-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081134.gJtKyv85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081134.gJtKyv85-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:15:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   In file included from include/linux/kallsyms.h:13,
                    from include/linux/filter.h:21,
                    from include/net/sock.h:65,
                    from include/linux/tcp.h:23,
                    from include/linux/ipv6.h:105,
                    from drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:10:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'hns3_exit_module': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4540:1: note: in expansion of macro 'module_exit'
    4540 | module_exit(hns3_exit_module);
         | ^~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4534:20: note: 'cleanup_module' target declared here
    4534 | static void __exit hns3_exit_module(void)
         |                    ^~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'hns3_init_module': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4527:1: note: in expansion of macro 'module_init'
    4527 | module_init(hns3_init_module);
         | ^~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4494:19: note: 'init_module' target declared here
    4494 | static int __init hns3_init_module(void)
         |                   ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
