Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D978DF49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742128829; cv=none; b=aTzY51lCpjWP/pP1Sb7KMiYqREZq+3trwnMmarOf0ZCvlXO6mCxPCO0+FzUqbekFl89tViuusQzc2Wyc8CHGOqBWbG3C9B5stS5q6hHMx3sKzh8rxfF5+MtegldIunnnyJ6tJtZYs3k33/zGPZButjaIw4OXreDeK2bQkGF8rKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742128829; c=relaxed/simple;
	bh=vxDbSIGQs2Os1HiXUKNhVyS/oaY7wyRXtmIqWlzUUbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKS8Gzge9rkuYALIIl4HMK64usCGvBnRzIFRjxBLhA4kNUwNhs3gfV0OhCKZmO+JnsPxLmis51Zl2NRVWC6/9OMcmmnsYdBkn9wEkqRgKxv6bnWRUPF771XxDYbci+ofGqrWkyNnFo5TWWa5bEWkJViZ0t5M0Ax+v+bfeElMR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4nX34tZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4nX34tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742128827; x=1773664827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxDbSIGQs2Os1HiXUKNhVyS/oaY7wyRXtmIqWlzUUbs=;
  b=e4nX34tZEWhyuGV+X5foqyT8xTYiKSrzP98BaeeC0AYLcmZxqanGRPz1
   HDzX787nVyqKpw+ijDC5cMXMSHVENPyeosGUsmDryIfsbGFm0xHYMUnCs
   Pt2yeeSDYrX87ROxQzoVWwDCkROhR5C5Gxi012OySAMq9c5Bktc2UQddU
   tDzr7WT1rQvOB+Hi3LdGxVed2+SfmU3Bd8oEZZHyz/rskBxAICN+MPMp0
   qRmU0OjQZ1RjqY/d+CqA3fgHh7HcZHM82CNque1U8oyQBcrVaHKP2V/6q
   8J/zTF4kK4v2zHiS8ONxNYQnoO2ExJB15pMGgIxZ7M7lO/B2Ppotuz7+/
   Q==;
X-CSE-ConnectionGUID: QW1lg9leQRmNq+RGmGTtZg==
X-CSE-MsgGUID: lfrpFay6RViLUWlxd4Qubg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43102480"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43102480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 05:40:26 -0700
X-CSE-ConnectionGUID: kWswD/I1RlCrxEShLZsNYA==
X-CSE-MsgGUID: nQClWlPgSJe34Bh8e4JRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="126342010"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2025 05:40:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttnHy-000C07-39;
	Sun, 16 Mar 2025 12:40:22 +0000
Date: Sun, 16 Mar 2025 20:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1495/1495]
 drivers/infiniband/hw/mlx5/devx.c:1111:1: sparse: sparse: symbol
 'mlx5_ib_object_MLX5_IB_OBJECT_DEVX_UMEM' was not declared. Should it be
 static?
Message-ID: <202503162045.rwTdUh4F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d734d6bbda17b68dd3979a9f707564a18cf04761
commit: a18da41fb250cfa4191a98958bcd39df2111206f [1495/1495] RDMA/uverbs: Fix typo in string concatenation macro
config: x86_64-randconfig-123-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162045.rwTdUh4F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162045.rwTdUh4F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162045.rwTdUh4F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/hw/mlx5/devx.c:1099:1: sparse: sparse: symbol 'mlx5_ib_object_MLX5_IB_OBJECT_DEVX' was not declared. Should it be static?
   drivers/infiniband/hw/mlx5/devx.c:1104:1: sparse: sparse: symbol 'mlx5_ib_object_MLX5_IB_OBJECT_DEVX_OBJ' was not declared. Should it be static?
>> drivers/infiniband/hw/mlx5/devx.c:1111:1: sparse: sparse: symbol 'mlx5_ib_object_MLX5_IB_OBJECT_DEVX_UMEM' was not declared. Should it be static?
--
>> drivers/infiniband/hw/mlx5/flow.c:236:1: sparse: sparse: symbol 'mlx5_ib_object_MLX5_IB_OBJECT_FLOW_MATCHER' was not declared. Should it be static?

vim +/mlx5_ib_object_MLX5_IB_OBJECT_DEVX_UMEM +1111 drivers/infiniband/hw/mlx5/devx.c

aeae94579caf774 Yishai Hadas    2018-06-17   988  
9a119cd597769e0 Jason Gunthorpe 2018-07-04   989  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04   990  	MLX5_IB_METHOD_DEVX_UMEM_REG,
9a119cd597769e0 Jason Gunthorpe 2018-07-04   991  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_UMEM_REG_HANDLE,
aeae94579caf774 Yishai Hadas    2018-06-17   992  			MLX5_IB_OBJECT_DEVX_UMEM,
aeae94579caf774 Yishai Hadas    2018-06-17   993  			UVERBS_ACCESS_NEW,
83bb4442330f035 Jason Gunthorpe 2018-07-04   994  			UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04   995  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_DEVX_UMEM_REG_ADDR,
9a119cd597769e0 Jason Gunthorpe 2018-07-04   996  			   UVERBS_ATTR_TYPE(u64),
83bb4442330f035 Jason Gunthorpe 2018-07-04   997  			   UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04   998  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_DEVX_UMEM_REG_LEN,
9a119cd597769e0 Jason Gunthorpe 2018-07-04   999  			   UVERBS_ATTR_TYPE(u64),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1000  			   UA_MANDATORY),
bccd06223f21654 Jason Gunthorpe 2018-07-26  1001  	UVERBS_ATTR_FLAGS_IN(MLX5_IB_ATTR_DEVX_UMEM_REG_ACCESS,
bccd06223f21654 Jason Gunthorpe 2018-07-26  1002  			     enum ib_access_flags),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1003  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_DEVX_UMEM_REG_OUT_ID,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1004  			    UVERBS_ATTR_TYPE(u32),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1005  			    UA_MANDATORY));
aeae94579caf774 Yishai Hadas    2018-06-17  1006  
528922afd41cdd1 Yishai Hadas    2018-07-08  1007  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1008  	MLX5_IB_METHOD_DEVX_UMEM_DEREG,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1009  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_UMEM_DEREG_HANDLE,
aeae94579caf774 Yishai Hadas    2018-06-17  1010  			MLX5_IB_OBJECT_DEVX_UMEM,
aeae94579caf774 Yishai Hadas    2018-06-17  1011  			UVERBS_ACCESS_DESTROY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1012  			UA_MANDATORY));
aeae94579caf774 Yishai Hadas    2018-06-17  1013  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1014  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1015  	MLX5_IB_METHOD_DEVX_QUERY_EQN,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1016  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_DEVX_QUERY_EQN_USER_VEC,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1017  			   UVERBS_ATTR_TYPE(u32),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1018  			   UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1019  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_DEVX_QUERY_EQN_DEV_EQN,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1020  			    UVERBS_ATTR_TYPE(u32),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1021  			    UA_MANDATORY));
f6fe01b7181be17 Yishai Hadas    2018-06-17  1022  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1023  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1024  	MLX5_IB_METHOD_DEVX_QUERY_UAR,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1025  	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_DEVX_QUERY_UAR_USER_IDX,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1026  			   UVERBS_ATTR_TYPE(u32),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1027  			   UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1028  	UVERBS_ATTR_PTR_OUT(MLX5_IB_ATTR_DEVX_QUERY_UAR_DEV_IDX,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1029  			    UVERBS_ATTR_TYPE(u32),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1030  			    UA_MANDATORY));
7c043e908a74ae0 Yishai Hadas    2018-06-17  1031  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1032  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1033  	MLX5_IB_METHOD_DEVX_OTHER,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1034  	UVERBS_ATTR_PTR_IN(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1035  		MLX5_IB_ATTR_DEVX_OTHER_CMD_IN,
8aa8c95ce4ccc10 Yishai Hadas    2018-06-17  1036  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_in_cmd_hdr)),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1037  		UA_MANDATORY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1038  		UA_ALLOC_AND_COPY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1039  	UVERBS_ATTR_PTR_OUT(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1040  		MLX5_IB_ATTR_DEVX_OTHER_CMD_OUT,
8aa8c95ce4ccc10 Yishai Hadas    2018-06-17  1041  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_out_cmd_hdr)),
540cd69209682a3 Jason Gunthorpe 2018-07-04  1042  		UA_MANDATORY));
8aa8c95ce4ccc10 Yishai Hadas    2018-06-17  1043  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1044  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1045  	MLX5_IB_METHOD_DEVX_OBJ_CREATE,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1046  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_OBJ_CREATE_HANDLE,
7efce3691d33e1f Yishai Hadas    2018-06-17  1047  			MLX5_IB_OBJECT_DEVX_OBJ,
7efce3691d33e1f Yishai Hadas    2018-06-17  1048  			UVERBS_ACCESS_NEW,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1049  			UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1050  	UVERBS_ATTR_PTR_IN(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1051  		MLX5_IB_ATTR_DEVX_OBJ_CREATE_CMD_IN,
7efce3691d33e1f Yishai Hadas    2018-06-17  1052  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_in_cmd_hdr)),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1053  		UA_MANDATORY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1054  		UA_ALLOC_AND_COPY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1055  	UVERBS_ATTR_PTR_OUT(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1056  		MLX5_IB_ATTR_DEVX_OBJ_CREATE_CMD_OUT,
7efce3691d33e1f Yishai Hadas    2018-06-17  1057  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_out_cmd_hdr)),
540cd69209682a3 Jason Gunthorpe 2018-07-04  1058  		UA_MANDATORY));
7efce3691d33e1f Yishai Hadas    2018-06-17  1059  
528922afd41cdd1 Yishai Hadas    2018-07-08  1060  DECLARE_UVERBS_NAMED_METHOD_DESTROY(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1061  	MLX5_IB_METHOD_DEVX_OBJ_DESTROY,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1062  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_OBJ_DESTROY_HANDLE,
7efce3691d33e1f Yishai Hadas    2018-06-17  1063  			MLX5_IB_OBJECT_DEVX_OBJ,
7efce3691d33e1f Yishai Hadas    2018-06-17  1064  			UVERBS_ACCESS_DESTROY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1065  			UA_MANDATORY));
7efce3691d33e1f Yishai Hadas    2018-06-17  1066  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1067  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1068  	MLX5_IB_METHOD_DEVX_OBJ_MODIFY,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1069  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_OBJ_MODIFY_HANDLE,
e662e14d801b01a Yishai Hadas    2018-06-17  1070  			MLX5_IB_OBJECT_DEVX_OBJ,
e662e14d801b01a Yishai Hadas    2018-06-17  1071  			UVERBS_ACCESS_WRITE,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1072  			UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1073  	UVERBS_ATTR_PTR_IN(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1074  		MLX5_IB_ATTR_DEVX_OBJ_MODIFY_CMD_IN,
e662e14d801b01a Yishai Hadas    2018-06-17  1075  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_in_cmd_hdr)),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1076  		UA_MANDATORY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1077  		UA_ALLOC_AND_COPY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1078  	UVERBS_ATTR_PTR_OUT(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1079  		MLX5_IB_ATTR_DEVX_OBJ_MODIFY_CMD_OUT,
e662e14d801b01a Yishai Hadas    2018-06-17  1080  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_out_cmd_hdr)),
540cd69209682a3 Jason Gunthorpe 2018-07-04  1081  		UA_MANDATORY));
e662e14d801b01a Yishai Hadas    2018-06-17  1082  
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1083  DECLARE_UVERBS_NAMED_METHOD(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1084  	MLX5_IB_METHOD_DEVX_OBJ_QUERY,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1085  	UVERBS_ATTR_IDR(MLX5_IB_ATTR_DEVX_OBJ_QUERY_HANDLE,
e662e14d801b01a Yishai Hadas    2018-06-17  1086  			MLX5_IB_OBJECT_DEVX_OBJ,
e662e14d801b01a Yishai Hadas    2018-06-17  1087  			UVERBS_ACCESS_READ,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1088  			UA_MANDATORY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1089  	UVERBS_ATTR_PTR_IN(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1090  		MLX5_IB_ATTR_DEVX_OBJ_QUERY_CMD_IN,
e662e14d801b01a Yishai Hadas    2018-06-17  1091  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_in_cmd_hdr)),
83bb4442330f035 Jason Gunthorpe 2018-07-04  1092  		UA_MANDATORY,
83bb4442330f035 Jason Gunthorpe 2018-07-04  1093  		UA_ALLOC_AND_COPY),
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1094  	UVERBS_ATTR_PTR_OUT(
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1095  		MLX5_IB_ATTR_DEVX_OBJ_QUERY_CMD_OUT,
e662e14d801b01a Yishai Hadas    2018-06-17  1096  		UVERBS_ATTR_MIN_SIZE(MLX5_ST_SZ_BYTES(general_obj_out_cmd_hdr)),
540cd69209682a3 Jason Gunthorpe 2018-07-04  1097  		UA_MANDATORY));
e662e14d801b01a Yishai Hadas    2018-06-17  1098  
6c61d2a55c4e598 Jason Gunthorpe 2018-07-04  1099  DECLARE_UVERBS_GLOBAL_METHODS(MLX5_IB_OBJECT_DEVX,
7c043e908a74ae0 Yishai Hadas    2018-06-17  1100  			      &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_OTHER),
f6fe01b7181be17 Yishai Hadas    2018-06-17  1101  			      &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_QUERY_UAR),
f6fe01b7181be17 Yishai Hadas    2018-06-17  1102  			      &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_QUERY_EQN));
8aa8c95ce4ccc10 Yishai Hadas    2018-06-17  1103  
6c61d2a55c4e598 Jason Gunthorpe 2018-07-04  1104  DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_DEVX_OBJ,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1105  			    UVERBS_TYPE_ALLOC_IDR(devx_obj_cleanup),
7efce3691d33e1f Yishai Hadas    2018-06-17  1106  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_OBJ_CREATE),
e662e14d801b01a Yishai Hadas    2018-06-17  1107  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_OBJ_DESTROY),
e662e14d801b01a Yishai Hadas    2018-06-17  1108  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_OBJ_MODIFY),
e662e14d801b01a Yishai Hadas    2018-06-17  1109  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_OBJ_QUERY));
7efce3691d33e1f Yishai Hadas    2018-06-17  1110  
6c61d2a55c4e598 Jason Gunthorpe 2018-07-04 @1111  DECLARE_UVERBS_NAMED_OBJECT(MLX5_IB_OBJECT_DEVX_UMEM,
9a119cd597769e0 Jason Gunthorpe 2018-07-04  1112  			    UVERBS_TYPE_ALLOC_IDR(devx_umem_cleanup),
aeae94579caf774 Yishai Hadas    2018-06-17  1113  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_UMEM_REG),
aeae94579caf774 Yishai Hadas    2018-06-17  1114  			    &UVERBS_METHOD(MLX5_IB_METHOD_DEVX_UMEM_DEREG));
aeae94579caf774 Yishai Hadas    2018-06-17  1115  

:::::: The code at line 1111 was first introduced by commit
:::::: 6c61d2a55c4e5980e231fac9bb54e6ff1a5e811b RDMA/uverbs: Simplify UVERBS_OBJECT and _TREE family of macros

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
