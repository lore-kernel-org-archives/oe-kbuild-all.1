Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110901801D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 19:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693335765; x=1724871765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZssVyiuPrzV8HRbNj+dFM/GZZcr2HnyGAqBT1eeT8yU=;
  b=ZFYpgEazbe2nPr1h2cz8cHR0nsTMdw+nxisfHJSCMRGQY0flCOlTi3eJ
   ufnO8iOQCfmIiT1peBbWUetb9dCO+4Hi5u3BVqpfLigP68Il84e1eOUwN
   uQggpZuD4Ffry/h44/Gxv8xZeUYCycqA5xYUPsun5ldrwnEMsYXauVrwH
   UxOLOw04y0/6RX6Ey3xKFdTLUJn2zE9det8eXWzLD7NHsHB8U27Wb+Sn3
   4k+nKAr8NyDKb9+hYohlRclMLa+xhLuAPouW6aVi9g8WUxe7/+zOk7OSG
   qAHNF7xEmQe3cfq6hU9jcixWDotujw0fXGe6xhEve5+PmdHSbCIhzzk0B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406452259"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="406452259"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808809395"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="808809395"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 12:02:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb3z6-00090T-2L;
	Tue, 29 Aug 2023 19:02:40 +0000
Date: Wed, 30 Aug 2023 03:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dragos Tatulea <dtatulea@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Parav Pandit <parav@mellanox.com>
Cc: oe-kbuild-all@lists.linux.dev, Dragos Tatulea <dtatulea@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vdpa/mlx5: Fix firmware error on creation of 1k VQs
Message-ID: <202308300241.q7t7Ouf3-lkp@intel.com>
References: <20230829174219.928343-1-dtatulea@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829174219.928343-1-dtatulea@nvidia.com>

Hi Dragos,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dragos-Tatulea/vdpa-mlx5-Fix-firmware-error-on-creation-of-1k-VQs/20230830-014600
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829174219.928343-1-dtatulea%40nvidia.com
patch subject: [PATCH] vdpa/mlx5: Fix firmware error on creation of 1k VQs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300241.q7t7Ouf3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300241.q7t7Ouf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300241.q7t7Ouf3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'read_umem_params':
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:658:1: warning: the frame size of 4128 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     658 | }
         | ^


vim +658 drivers/vdpa/mlx5/net/mlx5_vnet.c

   627	
   628	static int read_umem_params(struct mlx5_vdpa_net *ndev)
   629	{
   630		u32 out[MLX5_ST_SZ_DW(query_hca_cap_out)] = {};
   631		u32 in[MLX5_ST_SZ_DW(query_hca_cap_in)] = {};
   632		u16 opmod = (MLX5_CAP_VDPA_EMULATION << 1) | (HCA_CAP_OPMOD_GET_CUR & 0x01);
   633		struct mlx5_core_dev *mdev = ndev->mvdev.mdev;
   634		void *caps;
   635		int err;
   636	
   637		MLX5_SET(query_hca_cap_in, in, opcode, MLX5_CMD_OP_QUERY_HCA_CAP);
   638		MLX5_SET(query_hca_cap_in, in, op_mod, opmod);
   639		err = mlx5_cmd_exec_inout(mdev, query_hca_cap, in, out);
   640		if (err) {
   641			mlx5_vdpa_warn(&ndev->mvdev,
   642				"Failed reading vdpa umem capabilities with err %d\n", err);
   643			return err;
   644		}
   645	
   646		caps =  MLX5_ADDR_OF(query_hca_cap_out, out, capability);
   647	
   648		ndev->umem_1_buffer_param_a = MLX5_GET(virtio_emulation_cap, caps, umem_1_buffer_param_a);
   649		ndev->umem_1_buffer_param_b = MLX5_GET(virtio_emulation_cap, caps, umem_1_buffer_param_b);
   650	
   651		ndev->umem_2_buffer_param_a = MLX5_GET(virtio_emulation_cap, caps, umem_2_buffer_param_a);
   652		ndev->umem_2_buffer_param_b = MLX5_GET(virtio_emulation_cap, caps, umem_2_buffer_param_b);
   653	
   654		ndev->umem_3_buffer_param_a = MLX5_GET(virtio_emulation_cap, caps, umem_3_buffer_param_a);
   655		ndev->umem_3_buffer_param_b = MLX5_GET(virtio_emulation_cap, caps, umem_3_buffer_param_b);
   656	
   657		return 0;
 > 658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
