Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025061E2852
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742498543; cv=none; b=AeOK+kSKm3aAs54V4Nz/rlyCEhjFo+f1eQZCeg3NzldX+zyv374F5x5y9fYNTTvnIoCE7VzQ3meBkNhDwJ0cSXwVP0rbm0S5EMQrJFGmcac79VmjSR8mVBmhAdNNVFYLGTpSSsEw9ivoxR42wmfRv53ov5zqNyFFx+0UunPEuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742498543; c=relaxed/simple;
	bh=Z5emhnEMdq2lSv+8dbYypasxMBOl9Z3QA9yhnAZiqmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lif/ZAX3us4hDsw6ce9AZ37p+UNhtrZnihnHHi3xqt+CgkhGdOh5jv/5xzCYFnExcxNxopgdWDLe02a+z4zBwIoHIhUvycemCNHolv9C3dmC14djQxvH3Qjt8tcTyLmBltKvQvYPwnVdX0s0yKoqqDudy4xWKyh4ec2f3/GRwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPibq2u7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPibq2u7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742498541; x=1774034541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5emhnEMdq2lSv+8dbYypasxMBOl9Z3QA9yhnAZiqmg=;
  b=RPibq2u7D0qFWbTtBGay1WW2pzfFsOpBV9voPdAuxdG2wY+fraO74jVH
   DwtnQ2P5JB1soPemRHGvI6wJLLpDDpEoSvKyLTA6/G90s2c6X6Btmzjnt
   uEOdJYqpQZsJedYd1G4qe7YI1B0xmQPZhskd9w71Bo8v92HngUjZ6lNIa
   0hr9xMMVMA0+iOghP6UC7NtpTjB+xbEnP2N9Oc/iHlNqdkb+viKVfV8pS
   gt9RqieY2YJJOnkrBv70h5z4KyazTl4ugjH5z7ed3WOG3DyZ+N8NcptpQ
   czOe3PgObkzK0luKVfHPx4kgc3BV8+TPHbb8AawiPr2cbYxz788kW4SQX
   w==;
X-CSE-ConnectionGUID: Vm53PkrVRP++CSlVlrOxtg==
X-CSE-MsgGUID: h3V5N3xxRvOqBAo+ktc6Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43867827"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43867827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 12:22:20 -0700
X-CSE-ConnectionGUID: CQFWzBDWT82LfvmI6DtVTA==
X-CSE-MsgGUID: OZpcgA+KT+uTLlyKlTa1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="146418991"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2025 12:22:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvLT6-0000hf-22;
	Thu, 20 Mar 2025 19:22:16 +0000
Date: Fri, 21 Mar 2025 03:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 11557/12769]
 drivers/infiniband/hw/mlx5/fs.c:2922:20: warning: unused variable
 'mlx5_ib_fs'
Message-ID: <202503210304.BOpeuyCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: 36e0d433672f1e65400d69e7eaf7150752c45e29 [11557/12769] RDMA/mlx5: Compile fs.c regardless of INFINIBAND_USER_ACCESS config
config: x86_64-randconfig-103-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210304.BOpeuyCK-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210304.BOpeuyCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210304.BOpeuyCK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/fs.c:2922:20: warning: unused variable 'mlx5_ib_fs' [-Wunused-const-variable]
    2922 | ADD_UVERBS_METHODS(mlx5_ib_fs,
         |                    ^~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:78:40: note: expanded from macro 'ADD_UVERBS_METHODS'
      78 |         static const struct uverbs_object_def _name = {                        \
         |                                               ^~~~~
>> drivers/infiniband/hw/mlx5/fs.c:2960:2: warning: unused variable 'mlx5_ib_flow_actions' [-Wunused-const-variable]
    2960 |         mlx5_ib_flow_actions,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:78:40: note: expanded from macro 'ADD_UVERBS_METHODS'
      78 |         static const struct uverbs_object_def _name = {                        \
         |                                               ^~~~~
>> drivers/infiniband/hw/mlx5/fs.c:2998:1: warning: unused variable 'mlx5_ib_object_MLX5_IB_OBJECT_FLOW_MATCHER' [-Wunused-const-variable]
    2998 | DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_FLOW_MATCHER,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2999 |                             UVERBS_TYPE_ALLOC_IDR(flow_matcher_cleanup),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3000 |                             &UVERBS_METHOD(MLX5_IB_METHOD_FLOW_MATCHER_CREATE),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3001 |                             &UVERBS_METHOD(MLX5_IB_METHOD_FLOW_MATCHER_DESTROY));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:52:40: note: expanded from macro 'DECLARE_UVERBS_NAMED_OBJECT'
      52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:27: note: expanded from macro 'UVERBS_OBJECT'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:16:28: note: expanded from macro '_UVERBS_NAME'
      16 | #define _UVERBS_NAME(x, y)      _UVERBS_PASTE(x, y)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:15:29: note: expanded from macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^~~~~~
   <scratch space>:20:1: note: expanded from here
      20 | mlx5_ib_object_MLX5_IB_OBJECT_FLOW_MATCHER
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/fs.c:3026:1: warning: unused variable 'mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR' [-Wunused-const-variable]
    3026 | DECLARE_UVERBS_NAMED_OBJECT(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3027 |         MLX5_IB_OBJECT_STEERING_ANCHOR,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3028 |         UVERBS_TYPE_ALLOC_IDR(steering_anchor_cleanup),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3029 |         &UVERBS_METHOD(MLX5_IB_METHOD_STEERING_ANCHOR_CREATE),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3030 |         &UVERBS_METHOD(MLX5_IB_METHOD_STEERING_ANCHOR_DESTROY));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:52:40: note: expanded from macro 'DECLARE_UVERBS_NAMED_OBJECT'
      52 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:27: note: expanded from macro 'UVERBS_OBJECT'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:16:28: note: expanded from macro '_UVERBS_NAME'
      16 | #define _UVERBS_NAME(x, y)      _UVERBS_PASTE(x, y)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:15:29: note: expanded from macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^~~~~~
   <scratch space>:47:1: note: expanded from here
      47 | mlx5_ib_object_MLX5_IB_OBJECT_STEERING_ANCHOR
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/mlx5_ib_fs +2922 drivers/infiniband/hw/mlx5/fs.c

f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2873  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2874  DECLARE_UVERBS_NAMED_METHOD(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2875  	MLX5_IB_METHOD_CREATE_FLOW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2876  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_FLOW_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2877  			UVERBS_OBJECT_FLOW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2878  			UVERBS_ACCESS_NEW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2879  			UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2880  	UVERBS_ATTR_PTR_IN(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2881  		MLX5_IB_ATTR_CREATE_FLOW_MATCH_VALUE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2882  		UVERBS_ATTR_SIZE(1, sizeof(struct mlx5_ib_match_params)),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2883  		UA_MANDATORY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2884  		UA_ALLOC_AND_COPY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2885  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_FLOW_MATCHER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2886  			MLX5_IB_OBJECT_FLOW_MATCHER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2887  			UVERBS_ACCESS_READ,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2888  			UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2889  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_FLOW_DEST_QP,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2890  			UVERBS_OBJECT_QP,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2891  			UVERBS_ACCESS_READ),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2892  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_FLOW_DEST_DEVX,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2893  			MLX5_IB_OBJECT_DEVX_OBJ,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2894  			UVERBS_ACCESS_READ),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2895  	UVERBS_ATTR_IDRS_ARR(MLX5_IB_ATTR_CREATE_FLOW_ARR_FLOW_ACTIONS,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2896  			     UVERBS_OBJECT_FLOW_ACTION,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2897  			     UVERBS_ACCESS_READ, 1,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2898  			     MLX5_IB_CREATE_FLOW_MAX_FLOW_ACTIONS,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2899  			     UA_OPTIONAL),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2900  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_CREATE_FLOW_TAG,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2901  			   UVERBS_ATTR_TYPE(u32),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2902  			   UA_OPTIONAL),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2903  	UVERBS_ATTR_IDRS_ARR(MLX5_IB_ATTR_CREATE_FLOW_ARR_COUNTERS_DEVX,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2904  			     MLX5_IB_OBJECT_DEVX_OBJ,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2905  			     UVERBS_ACCESS_READ, 1, 1,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2906  			     UA_OPTIONAL),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2907  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_CREATE_FLOW_ARR_COUNTERS_DEVX_OFFSET,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2908  			   UVERBS_ATTR_MIN_SIZE(sizeof(u32)),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2909  			   UA_OPTIONAL,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2910  			   UA_ALLOC_AND_COPY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2911  	UVERBS_ATTR_FLAGS_IN(MLX5_IB_ATTR_CREATE_FLOW_FLAGS,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2912  			     enum mlx5_ib_create_flow_flags,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2913  			     UA_OPTIONAL));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2914  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2915  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2916  	MLX5_IB_METHOD_DESTROY_FLOW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2917  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_FLOW_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2918  			UVERBS_OBJECT_FLOW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2919  			UVERBS_ACCESS_DESTROY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2920  			UA_MANDATORY));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2921  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02 @2922  ADD_UVERBS_METHODS(mlx5_ib_fs,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2923  		   UVERBS_OBJECT_FLOW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2924  		   &UVERBS_METHOD(MLX5_IB_METHOD_CREATE_FLOW),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2925  		   &UVERBS_METHOD(MLX5_IB_METHOD_DESTROY_FLOW));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2926  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2927  DECLARE_UVERBS_NAMED_METHOD(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2928  	MLX5_IB_METHOD_FLOW_ACTION_CREATE_MODIFY_HEADER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2929  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_MODIFY_HEADER_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2930  			UVERBS_OBJECT_FLOW_ACTION,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2931  			UVERBS_ACCESS_NEW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2932  			UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2933  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_CREATE_MODIFY_HEADER_ACTIONS_PRM,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2934  			   UVERBS_ATTR_MIN_SIZE(MLX5_UN_SZ_BYTES(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2935  				   set_add_copy_action_in_auto)),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2936  			   UA_MANDATORY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2937  			   UA_ALLOC_AND_COPY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2938  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_CREATE_MODIFY_HEADER_FT_TYPE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2939  			     enum mlx5_ib_uapi_flow_table_type,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2940  			     UA_MANDATORY));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2941  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2942  DECLARE_UVERBS_NAMED_METHOD(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2943  	MLX5_IB_METHOD_FLOW_ACTION_CREATE_PACKET_REFORMAT,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2944  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_CREATE_PACKET_REFORMAT_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2945  			UVERBS_OBJECT_FLOW_ACTION,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2946  			UVERBS_ACCESS_NEW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2947  			UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2948  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_CREATE_PACKET_REFORMAT_DATA_BUF,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2949  			   UVERBS_ATTR_MIN_SIZE(1),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2950  			   UA_ALLOC_AND_COPY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2951  			   UA_OPTIONAL),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2952  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_CREATE_PACKET_REFORMAT_TYPE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2953  			     enum mlx5_ib_uapi_flow_action_packet_reformat_type,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2954  			     UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2955  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_CREATE_PACKET_REFORMAT_FT_TYPE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2956  			     enum mlx5_ib_uapi_flow_table_type,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2957  			     UA_MANDATORY));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2958  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2959  ADD_UVERBS_METHODS(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02 @2960  	mlx5_ib_flow_actions,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2961  	UVERBS_OBJECT_FLOW_ACTION,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2962  	&UVERBS_METHOD(MLX5_IB_METHOD_FLOW_ACTION_CREATE_MODIFY_HEADER),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2963  	&UVERBS_METHOD(MLX5_IB_METHOD_FLOW_ACTION_CREATE_PACKET_REFORMAT));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2964  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2965  DECLARE_UVERBS_NAMED_METHOD(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2966  	MLX5_IB_METHOD_FLOW_MATCHER_CREATE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2967  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_FLOW_MATCHER_CREATE_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2968  			MLX5_IB_OBJECT_FLOW_MATCHER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2969  			UVERBS_ACCESS_NEW,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2970  			UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2971  	UVERBS_ATTR_PTR_IN(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2972  		MLX5_IB_ATTR_FLOW_MATCHER_MATCH_MASK,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2973  		UVERBS_ATTR_SIZE(1, sizeof(struct mlx5_ib_match_params)),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2974  		UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2975  	UVERBS_ATTR_ENUM_IN(MLX5_IB_ATTR_FLOW_MATCHER_FLOW_TYPE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2976  			    mlx5_ib_flow_type,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2977  			    UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2978  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_FLOW_MATCHER_MATCH_CRITERIA,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2979  			   UVERBS_ATTR_TYPE(u8),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2980  			   UA_MANDATORY),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2981  	UVERBS_ATTR_FLAGS_IN(MLX5_IB_ATTR_FLOW_MATCHER_FLOW_FLAGS,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2982  			     enum ib_flow_flags,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2983  			     UA_OPTIONAL),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2984  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_FLOW_MATCHER_FT_TYPE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2985  			     enum mlx5_ib_uapi_flow_table_type,
74934ddf124a6f Patrisious Haddad 2025-03-06  2986  			     UA_OPTIONAL),
74934ddf124a6f Patrisious Haddad 2025-03-06  2987  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_FLOW_MATCHER_IB_PORT,
74934ddf124a6f Patrisious Haddad 2025-03-06  2988  			   UVERBS_ATTR_TYPE(u32),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2989  			   UA_OPTIONAL));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2990  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2991  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2992  	MLX5_IB_METHOD_FLOW_MATCHER_DESTROY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2993  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_FLOW_MATCHER_DESTROY_HANDLE,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2994  			MLX5_IB_OBJECT_FLOW_MATCHER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2995  			UVERBS_ACCESS_DESTROY,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2996  			UA_MANDATORY));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2997  
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02 @2998  DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_FLOW_MATCHER,
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  2999  			    UVERBS_TYPE_ALLOC_IDR(flow_matcher_cleanup),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  3000  			    &UVERBS_METHOD(MLX5_IB_METHOD_FLOW_MATCHER_CREATE),
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  3001  			    &UVERBS_METHOD(MLX5_IB_METHOD_FLOW_MATCHER_DESTROY));
f7c4ffda0cbf78 Leon Romanovsky   2020-07-02  3002  
0c6ab0ca9a662d Mark Bloch        2022-07-03  3003  DECLARE_UVERBS_NAMED_METHOD(
0c6ab0ca9a662d Mark Bloch        2022-07-03  3004  	MLX5_IB_METHOD_STEERING_ANCHOR_CREATE,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3005  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_STEERING_ANCHOR_CREATE_HANDLE,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3006  			MLX5_IB_OBJECT_STEERING_ANCHOR,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3007  			UVERBS_ACCESS_NEW,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3008  			UA_MANDATORY),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3009  	UVERBS_ATTR_CONST_IN(MLX5_IB_ATTR_STEERING_ANCHOR_FT_TYPE,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3010  			     enum mlx5_ib_uapi_flow_table_type,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3011  			     UA_MANDATORY),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3012  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_STEERING_ANCHOR_PRIORITY,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3013  			   UVERBS_ATTR_TYPE(u16),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3014  			   UA_MANDATORY),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3015  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_STEERING_ANCHOR_FT_ID,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3016  			   UVERBS_ATTR_TYPE(u32),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3017  			   UA_MANDATORY));
0c6ab0ca9a662d Mark Bloch        2022-07-03  3018  
0c6ab0ca9a662d Mark Bloch        2022-07-03  3019  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
0c6ab0ca9a662d Mark Bloch        2022-07-03  3020  	MLX5_IB_METHOD_STEERING_ANCHOR_DESTROY,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3021  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_STEERING_ANCHOR_DESTROY_HANDLE,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3022  			MLX5_IB_OBJECT_STEERING_ANCHOR,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3023  			UVERBS_ACCESS_DESTROY,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3024  			UA_MANDATORY));
0c6ab0ca9a662d Mark Bloch        2022-07-03  3025  
0c6ab0ca9a662d Mark Bloch        2022-07-03 @3026  DECLARE_UVERBS_NAMED_OBJECT(
0c6ab0ca9a662d Mark Bloch        2022-07-03  3027  	MLX5_IB_OBJECT_STEERING_ANCHOR,
0c6ab0ca9a662d Mark Bloch        2022-07-03  3028  	UVERBS_TYPE_ALLOC_IDR(steering_anchor_cleanup),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3029  	&UVERBS_METHOD(MLX5_IB_METHOD_STEERING_ANCHOR_CREATE),
0c6ab0ca9a662d Mark Bloch        2022-07-03  3030  	&UVERBS_METHOD(MLX5_IB_METHOD_STEERING_ANCHOR_DESTROY));
0c6ab0ca9a662d Mark Bloch        2022-07-03  3031  

:::::: The code at line 2922 was first introduced by commit
:::::: f7c4ffda0cbf7823915cbfebdbbe8460e7eeca67 RDMA/mlx5: Separate flow steering logic from main.c

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
