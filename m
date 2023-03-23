Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79AD2F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 21:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679608202; x=1711144202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNaLWXwBB1Qiw2oM0o5jUpTHKR6YtK+qcGXk7SgRkTU=;
  b=ZxlVgaHjGrcs9wegye5Q/LPSP2DJmwxpoFPA5OMF5PbRGVxuOIOwBkXh
   V1pge6Vh4jU4RGqFkTK8eqK8lLJet+4k4EMoMGlbjWFW3NZMwspV36jWk
   40TDv+kScL1qaWHxDXAWY8lEke4Vds8gHk4StlsR5Gv4n78GLjeA7ezKb
   gm95s7FBBzEhUw3LLdY23hCkhem+7YWm1EYLy8RhPs2KDRPI0M7zqOktq
   GH499ADnaGTSZwGfyUBWHq9mVOzw1MNhkXhy7mMF3oGlXsPdV04XNo6Vy
   VbYk+c6Ccc2rJVSb5RQjTTS+MB/Jr8v/dmD/02XMbBKVYsvZKtSDPRDjx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323496836"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="323496836"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928394410"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="928394410"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2023 14:49:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfSob-000EjF-01;
	Thu, 23 Mar 2023 21:49:45 +0000
Date: Fri, 24 Mar 2023 05:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dima Chumak <dchumak@nvidia.com>, Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Leon Romanovsky <leon@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
	Dima Chumak <dchumak@nvidia.com>
Subject: Re: [PATCH net-next 2/4] net/mlx5: Implement devlink port function
 cmds to control ipsec_crypto
Message-ID: <202303240548.WDzL68Ny-lkp@intel.com>
References: <20230323111059.210634-3-dchumak@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323111059.210634-3-dchumak@nvidia.com>

Hi Dima,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20230323]
[cannot apply to net-next/main net/main horms-ipvs/master linus/master v6.3-rc3 v6.3-rc2 v6.3-rc1 v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dima-Chumak/devlink-Expose-port-function-commands-to-control-IPsec-crypto-offloads/20230323-191353
patch link:    https://lore.kernel.org/r/20230323111059.210634-3-dchumak%40nvidia.com
patch subject: [PATCH net-next 2/4] net/mlx5: Implement devlink port function cmds to control ipsec_crypto
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230324/202303240548.WDzL68Ny-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ca580efef4996834c003bf5e8d6d244fe0550415
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dima-Chumak/devlink-Expose-port-function-commands-to-control-IPsec-crypto-offloads/20230323-191353
        git checkout ca580efef4996834c003bf5e8d6d244fe0550415
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240548.WDzL68Ny-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c: In function 'mlx5_devlink_port_fn_ipsec_crypto_set':
>> drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4203:24: error: 'struct net' has no member named 'xfrm'
    4203 |         mutex_lock(&net->xfrm.xfrm_cfg_mutex);
         |                        ^~
   drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:4239:26: error: 'struct net' has no member named 'xfrm'
    4239 |         mutex_unlock(&net->xfrm.xfrm_cfg_mutex);
         |                          ^~


vim +4203 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

  4173	
  4174	int mlx5_devlink_port_fn_ipsec_crypto_set(struct devlink_port *port, bool enable,
  4175						  struct netlink_ext_ack *extack)
  4176	{
  4177		struct mlx5_eswitch *esw;
  4178		struct mlx5_vport *vport;
  4179		int err = -EOPNOTSUPP;
  4180		struct net *net;
  4181	
  4182		esw = mlx5_devlink_eswitch_get(port->devlink);
  4183		if (IS_ERR(esw))
  4184			return PTR_ERR(esw);
  4185	
  4186		if (!mlx5_esw_ipsec_vf_offload_supported(esw->dev)) {
  4187			NL_SET_ERR_MSG_MOD(extack, "Device doesn't support ipsec_crypto");
  4188			return err;
  4189		}
  4190	
  4191		vport = mlx5_devlink_port_fn_get_vport(port, esw);
  4192		if (IS_ERR(vport)) {
  4193			NL_SET_ERR_MSG_MOD(extack, "Invalid port");
  4194			return PTR_ERR(vport);
  4195		}
  4196	
  4197		/* xfrm_cfg lock is needed to avoid races with XFRM state being added to
  4198		 * the PF net device. Netlink stack takes this lock for `ip xfrm` user
  4199		 * commands, so here we need to take it before esw->state_lock to
  4200		 * preserve the order.
  4201		 */
  4202		net = dev_net(esw->dev->mlx5e_res.uplink_netdev);
> 4203		mutex_lock(&net->xfrm.xfrm_cfg_mutex);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
