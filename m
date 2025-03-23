Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD60225D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742763019; cv=none; b=rKrY4ix6NwNnMGk37lpzSYiHrTBomFOIo1WtcmJdMcF2IKspMUSuw3KSZBfiBflEeF+PRyr2teaRQ8YyHOhdOEK2T/KSEBJUeJSUCKbJcae6qmNq2n5H0eS5XEwz/h3qoMj8Hy7oFw4fHcL1+sGW2KeaCLYl46cN2RmrYqABIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742763019; c=relaxed/simple;
	bh=BUgEwUKHwym24LK6VRrPMBGCPH9+QzwtbSzqSXVLOmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+R0OrindINfTrURWpp7WKUYJP1Fvb8qsHVIDsHnV6kbuxQmfbm7Xrd8McEsELZDs1fNnqxtcDrJ+ADHWA2kewNfwqbDWhRhUrLFN3edwsNI9p0hJI9NEKPs4ZEeduMdguFLstthC4RZ7U+75xTw3dg01lAiUsx111yfvXx3Gik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gml9dbzH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gml9dbzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742763017; x=1774299017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUgEwUKHwym24LK6VRrPMBGCPH9+QzwtbSzqSXVLOmk=;
  b=gml9dbzHy34nbTlD5O7FCIj62mnwrTu/37caHLbe3Bc0vagBA6rwE6Bq
   CL+Q69+g5laOAlWZpn4UONIjpyvwSGJ5UDjbUXfrW/pWGDHwfaI+ZgEPW
   qrcNhWaRcxeYTc75AlsfbjvT+EkrhRVWGKmo4ikKC/fJprV1MOjlLoVJS
   DiFhypGl9/lZGRHLPesz7jGJy/01OZZrwQ9tvQXkDvU3VDBnGMX8gXIaT
   lEQa6/rOwG8xop4hLrF6MgSygrQNJgn05lIDJPBGCdjv9FzB6qC3kWLe/
   LtDnP9EfaUu8uMKp7KtPrvHPxhcTIE6hFPpe+gYcxKByOGFwakmwH2JG/
   g==;
X-CSE-ConnectionGUID: uPNSOmg+R4Wgsog7nW1t0w==
X-CSE-MsgGUID: yoGEkgupRaW0jwjUl8YZKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44123167"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="44123167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 13:50:16 -0700
X-CSE-ConnectionGUID: yFcDCaQHS9yLUNfXjCCn4w==
X-CSE-MsgGUID: eUPY67IJTOSXtBKFVmz4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="128554126"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2025 13:50:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twSGl-0002x6-1F;
	Sun, 23 Mar 2025 20:50:09 +0000
Date: Mon, 24 Mar 2025 04:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 11542/13068]
 drivers/infiniband/hw/mlx5/fs.c:26:28: warning:
 'mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR' defined but not used
Message-ID: <202503240432.5h2dqbfN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrisious,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 36e0d433672f1e65400d69e7eaf7150752c45e29 [11542/13068] RDMA/mlx5: Compile fs.c regardless of INFINIBAND_USER_ACCESS config
config: openrisc-randconfig-r061-20250323 (https://download.01.org/0day-ci/archive/20250324/202503240432.5h2dqbfN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240432.5h2dqbfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240432.5h2dqbfN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/mlx5/fs.c:27:
>> drivers/infiniband/hw/mlx5/fs.c:26:28: warning: 'mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR' defined but not used [-Wunused-const-variable=]
      26 | #define UVERBS_MODULE_NAME mlx5_ib
         |                            ^~~~~~~
   include/rdma/uverbs_named_ioctl.h:15:33: note: in definition of macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^
   include/rdma/uverbs_named_ioctl.h:19:33: note: in expansion of macro '_UVERBS_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:46: note: in expansion of macro 'UVERBS_MODULE_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                              ^~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:52:47: note: in expansion of macro 'UVERBS_OBJECT'
      52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/fs.c:3026:1: note: in expansion of macro 'DECLARE_UVERBS_NAMED_OBJECT'
    3026 | DECLARE_UVERBS_NAMED_OBJECT(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/fs.c:26:28: warning: 'mlx5_ib_object_MLX5_IB_OBJECT_FLOW_MATCHER' defined but not used [-Wunused-const-variable=]
      26 | #define UVERBS_MODULE_NAME mlx5_ib
         |                            ^~~~~~~
   include/rdma/uverbs_named_ioctl.h:15:33: note: in definition of macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^
   include/rdma/uverbs_named_ioctl.h:19:33: note: in expansion of macro '_UVERBS_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:46: note: in expansion of macro 'UVERBS_MODULE_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                              ^~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:52:47: note: in expansion of macro 'UVERBS_OBJECT'
      52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/fs.c:2998:1: note: in expansion of macro 'DECLARE_UVERBS_NAMED_OBJECT'
    2998 | DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_FLOW_MATCHER,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/fs.c:2960:9: warning: 'mlx5_ib_flow_actions' defined but not used [-Wunused-const-variable=]
    2960 |         mlx5_ib_flow_actions,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:78:47: note: in definition of macro 'ADD_UVERBS_METHODS'
      78 |         static const struct uverbs_object_def _name = {                        \
         |                                               ^~~~~
>> drivers/infiniband/hw/mlx5/fs.c:2922:20: warning: 'mlx5_ib_fs' defined but not used [-Wunused-const-variable=]
    2922 | ADD_UVERBS_METHODS(mlx5_ib_fs,
         |                    ^~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:78:47: note: in definition of macro 'ADD_UVERBS_METHODS'
      78 |         static const struct uverbs_object_def _name = {                        \
         |                                               ^~~~~


vim +/mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR +26 drivers/infiniband/hw/mlx5/fs.c

f7c4ffda0cbf782 Leon Romanovsky 2020-07-02  25  
f7c4ffda0cbf782 Leon Romanovsky 2020-07-02 @26  #define UVERBS_MODULE_NAME mlx5_ib
f7c4ffda0cbf782 Leon Romanovsky 2020-07-02  27  #include <rdma/uverbs_named_ioctl.h>
f7c4ffda0cbf782 Leon Romanovsky 2020-07-02  28  

:::::: The code at line 26 was first introduced by commit
:::::: f7c4ffda0cbf7823915cbfebdbbe8460e7eeca67 RDMA/mlx5: Separate flow steering logic from main.c

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
