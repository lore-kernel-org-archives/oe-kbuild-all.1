Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6246FC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682544072; x=1714080072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSCDz/1GXjHhMJPQ5Aod6S9s1OQC0pdah8taXtRLzqM=;
  b=ieQHYO3Flp8RF34pEr4LWqtPEXrV/ry5lVzlPsRFEj7hc84q67GodDkU
   GGFpxxzwUx5I3z4djtfvgpM3Nay2dZw04NM77UPDR1RvTSrBpl/7YTTGb
   utGLQEds+rWzq/ZFlssRgoJtMQWwQjO7/rv6kSyQq519AnFjjnTnLEWpe
   91n4M4t/BqGinAkA7cVDgL7Wajrv5XoKy9/J7p1g2KMmlKUxzM6m+pIQo
   kePhWK/dh+IMUneBs0j+3LEUN6MtZNOkdpM+iiGIWECI4VVpqf5BAyAIm
   ttdEZ/hnf0rsInTEf1VnjDFGirRHlmFNv0E20JqwAtdBLv13/5WpRvE5h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344688981"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="344688981"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 14:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805677426"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="805677426"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 14:20:53 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prmZJ-0000X3-0P;
	Wed, 26 Apr 2023 21:20:53 +0000
Date: Thu, 27 Apr 2023 05:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:ip_tunnel 8/13]
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5464:60: error: 'TUNNEL_KEY'
 undeclared; did you mean 'TUNNEL_TO_REG'?
Message-ID: <202304270548.9dRemZFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux ip_tunnel
head:   f74bfcd5e2a03cf74e1712f972721fda28d1dcea
commit: fcdcb3cb96f06940e09254b1fbcca0695506193a [8/13] ip_tunnel: convert __be16 tunnel flags to bitmaps
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230427/202304270548.9dRemZFC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/fcdcb3cb96f06940e09254b1fbcca0695506193a
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin ip_tunnel
        git checkout fcdcb3cb96f06940e09254b1fbcca0695506193a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270548.9dRemZFC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c: In function 'mlx5e_tc_restore_tunnel':
>> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5464:60: error: 'TUNNEL_KEY' undeclared (first use in this function); did you mean 'TUNNEL_TO_REG'?
    5464 |                                            key.enc_tp.dst, TUNNEL_KEY,
         |                                                            ^~~~~~~~~~
         |                                                            TUNNEL_TO_REG
   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5464:60: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5493:53: warning: passing argument 4 of 'ip_tunnel_info_opts_set' makes pointer from integer without a cast [-Wint-conversion]
    5493 |                                         enc_opts.key.dst_opt_type);
         |                                         ~~~~~~~~~~~~^~~~~~~~~~~~~
         |                                                     |
         |                                                     u32 {aka unsigned int}
   In file included from include/net/dst_metadata.h:6,
                    from drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:46:
   include/net/ip_tunnels.h:578:65: note: expected 'const long unsigned int *' but argument is of type 'u32' {aka 'unsigned int'}
     578 |                                            const unsigned long *flags)
         |                                            ~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +5464 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c

c75690972228ac Ariel Levkovich 2020-04-29  5417  
93a1ab2c545b88 Paul Blakey     2023-02-18  5418  static bool mlx5e_tc_restore_tunnel(struct mlx5e_priv *priv, struct sk_buff *skb,
93a1ab2c545b88 Paul Blakey     2023-02-18  5419  				    struct mlx5e_tc_update_priv *tc_priv,
93a1ab2c545b88 Paul Blakey     2023-02-18  5420  				    u32 tunnel_id)
c75690972228ac Ariel Levkovich 2020-04-29  5421  {
93a1ab2c545b88 Paul Blakey     2023-02-18  5422  	struct mlx5_eswitch *esw = priv->mdev->priv.eswitch;
93a1ab2c545b88 Paul Blakey     2023-02-18  5423  	struct tunnel_match_enc_opts enc_opts = {};
93a1ab2c545b88 Paul Blakey     2023-02-18  5424  	struct mlx5_rep_uplink_priv *uplink_priv;
93a1ab2c545b88 Paul Blakey     2023-02-18  5425  	struct mlx5e_rep_priv *uplink_rpriv;
93a1ab2c545b88 Paul Blakey     2023-02-18  5426  	struct metadata_dst *tun_dst;
93a1ab2c545b88 Paul Blakey     2023-02-18  5427  	struct tunnel_match_key key;
93a1ab2c545b88 Paul Blakey     2023-02-18  5428  	u32 tun_id, enc_opts_id;
93a1ab2c545b88 Paul Blakey     2023-02-18  5429  	struct net_device *dev;
c75690972228ac Ariel Levkovich 2020-04-29  5430  	int err;
c75690972228ac Ariel Levkovich 2020-04-29  5431  
93a1ab2c545b88 Paul Blakey     2023-02-18  5432  	enc_opts_id = tunnel_id & ENC_OPTS_BITS_MASK;
93a1ab2c545b88 Paul Blakey     2023-02-18  5433  	tun_id = tunnel_id >> ENC_OPTS_BITS;
93a1ab2c545b88 Paul Blakey     2023-02-18  5434  
93a1ab2c545b88 Paul Blakey     2023-02-18  5435  	if (!tun_id)
93a1ab2c545b88 Paul Blakey     2023-02-18  5436  		return true;
c75690972228ac Ariel Levkovich 2020-04-29  5437  
93a1ab2c545b88 Paul Blakey     2023-02-18  5438  	uplink_rpriv = mlx5_eswitch_get_uplink_priv(esw, REP_ETH);
93a1ab2c545b88 Paul Blakey     2023-02-18  5439  	uplink_priv = &uplink_rpriv->uplink_priv;
93a1ab2c545b88 Paul Blakey     2023-02-18  5440  
93a1ab2c545b88 Paul Blakey     2023-02-18  5441  	err = mapping_find(uplink_priv->tunnel_mapping, tun_id, &key);
93a1ab2c545b88 Paul Blakey     2023-02-18  5442  	if (err) {
93a1ab2c545b88 Paul Blakey     2023-02-18  5443  		netdev_dbg(priv->netdev,
93a1ab2c545b88 Paul Blakey     2023-02-18  5444  			   "Couldn't find tunnel for tun_id: %d, err: %d\n",
93a1ab2c545b88 Paul Blakey     2023-02-18  5445  			   tun_id, err);
93a1ab2c545b88 Paul Blakey     2023-02-18  5446  		return false;
93a1ab2c545b88 Paul Blakey     2023-02-18  5447  	}
93a1ab2c545b88 Paul Blakey     2023-02-18  5448  
93a1ab2c545b88 Paul Blakey     2023-02-18  5449  	if (enc_opts_id) {
93a1ab2c545b88 Paul Blakey     2023-02-18  5450  		err = mapping_find(uplink_priv->tunnel_enc_opts_mapping,
93a1ab2c545b88 Paul Blakey     2023-02-18  5451  				   enc_opts_id, &enc_opts);
c75690972228ac Ariel Levkovich 2020-04-29  5452  		if (err) {
c75690972228ac Ariel Levkovich 2020-04-29  5453  			netdev_dbg(priv->netdev,
93a1ab2c545b88 Paul Blakey     2023-02-18  5454  				   "Couldn't find tunnel (opts) for tun_id: %d, err: %d\n",
93a1ab2c545b88 Paul Blakey     2023-02-18  5455  				   enc_opts_id, err);
93a1ab2c545b88 Paul Blakey     2023-02-18  5456  			return false;
93a1ab2c545b88 Paul Blakey     2023-02-18  5457  		}
93a1ab2c545b88 Paul Blakey     2023-02-18  5458  	}
93a1ab2c545b88 Paul Blakey     2023-02-18  5459  
93a1ab2c545b88 Paul Blakey     2023-02-18  5460  	switch (key.enc_control.addr_type) {
93a1ab2c545b88 Paul Blakey     2023-02-18  5461  	case FLOW_DISSECTOR_KEY_IPV4_ADDRS:
93a1ab2c545b88 Paul Blakey     2023-02-18  5462  		tun_dst = __ip_tun_set_dst(key.enc_ipv4.src, key.enc_ipv4.dst,
93a1ab2c545b88 Paul Blakey     2023-02-18  5463  					   key.enc_ip.tos, key.enc_ip.ttl,
93a1ab2c545b88 Paul Blakey     2023-02-18 @5464  					   key.enc_tp.dst, TUNNEL_KEY,
93a1ab2c545b88 Paul Blakey     2023-02-18  5465  					   key32_to_tunnel_id(key.enc_key_id.keyid),
93a1ab2c545b88 Paul Blakey     2023-02-18  5466  					   enc_opts.key.len);
93a1ab2c545b88 Paul Blakey     2023-02-18  5467  		break;
93a1ab2c545b88 Paul Blakey     2023-02-18  5468  	case FLOW_DISSECTOR_KEY_IPV6_ADDRS:
93a1ab2c545b88 Paul Blakey     2023-02-18  5469  		tun_dst = __ipv6_tun_set_dst(&key.enc_ipv6.src, &key.enc_ipv6.dst,
93a1ab2c545b88 Paul Blakey     2023-02-18  5470  					     key.enc_ip.tos, key.enc_ip.ttl,
93a1ab2c545b88 Paul Blakey     2023-02-18  5471  					     key.enc_tp.dst, 0, TUNNEL_KEY,
93a1ab2c545b88 Paul Blakey     2023-02-18  5472  					     key32_to_tunnel_id(key.enc_key_id.keyid),
93a1ab2c545b88 Paul Blakey     2023-02-18  5473  					     enc_opts.key.len);
93a1ab2c545b88 Paul Blakey     2023-02-18  5474  		break;
93a1ab2c545b88 Paul Blakey     2023-02-18  5475  	default:
93a1ab2c545b88 Paul Blakey     2023-02-18  5476  		netdev_dbg(priv->netdev,
93a1ab2c545b88 Paul Blakey     2023-02-18  5477  			   "Couldn't restore tunnel, unsupported addr_type: %d\n",
93a1ab2c545b88 Paul Blakey     2023-02-18  5478  			   key.enc_control.addr_type);
c75690972228ac Ariel Levkovich 2020-04-29  5479  		return false;
c75690972228ac Ariel Levkovich 2020-04-29  5480  	}
c75690972228ac Ariel Levkovich 2020-04-29  5481  
93a1ab2c545b88 Paul Blakey     2023-02-18  5482  	if (!tun_dst) {
93a1ab2c545b88 Paul Blakey     2023-02-18  5483  		netdev_dbg(priv->netdev, "Couldn't restore tunnel, no tun_dst\n");
93a1ab2c545b88 Paul Blakey     2023-02-18  5484  		return false;
93a1ab2c545b88 Paul Blakey     2023-02-18  5485  	}
93a1ab2c545b88 Paul Blakey     2023-02-18  5486  
93a1ab2c545b88 Paul Blakey     2023-02-18  5487  	tun_dst->u.tun_info.key.tp_src = key.enc_tp.src;
93a1ab2c545b88 Paul Blakey     2023-02-18  5488  
93a1ab2c545b88 Paul Blakey     2023-02-18  5489  	if (enc_opts.key.len)
93a1ab2c545b88 Paul Blakey     2023-02-18  5490  		ip_tunnel_info_opts_set(&tun_dst->u.tun_info,
93a1ab2c545b88 Paul Blakey     2023-02-18  5491  					enc_opts.key.data,
93a1ab2c545b88 Paul Blakey     2023-02-18  5492  					enc_opts.key.len,
93a1ab2c545b88 Paul Blakey     2023-02-18 @5493  					enc_opts.key.dst_opt_type);
93a1ab2c545b88 Paul Blakey     2023-02-18  5494  
93a1ab2c545b88 Paul Blakey     2023-02-18  5495  	skb_dst_set(skb, (struct dst_entry *)tun_dst);
93a1ab2c545b88 Paul Blakey     2023-02-18  5496  	dev = dev_get_by_index(&init_net, key.filter_ifindex);
93a1ab2c545b88 Paul Blakey     2023-02-18  5497  	if (!dev) {
93a1ab2c545b88 Paul Blakey     2023-02-18  5498  		netdev_dbg(priv->netdev,
93a1ab2c545b88 Paul Blakey     2023-02-18  5499  			   "Couldn't find tunnel device with ifindex: %d\n",
93a1ab2c545b88 Paul Blakey     2023-02-18  5500  			   key.filter_ifindex);
93a1ab2c545b88 Paul Blakey     2023-02-18  5501  		return false;
93a1ab2c545b88 Paul Blakey     2023-02-18  5502  	}
93a1ab2c545b88 Paul Blakey     2023-02-18  5503  
93a1ab2c545b88 Paul Blakey     2023-02-18  5504  	/* Set fwd_dev so we do dev_put() after datapath */
93a1ab2c545b88 Paul Blakey     2023-02-18  5505  	tc_priv->fwd_dev = dev;
93a1ab2c545b88 Paul Blakey     2023-02-18  5506  
93a1ab2c545b88 Paul Blakey     2023-02-18  5507  	skb->dev = dev;
93a1ab2c545b88 Paul Blakey     2023-02-18  5508  
93a1ab2c545b88 Paul Blakey     2023-02-18  5509  	return true;
93a1ab2c545b88 Paul Blakey     2023-02-18  5510  }
93a1ab2c545b88 Paul Blakey     2023-02-18  5511  

:::::: The code at line 5464 was first introduced by commit
:::::: 93a1ab2c545b88fa70f8c91b60b54e4175008742 net/mlx5: Refactor tc miss handling to a single function

:::::: TO: Paul Blakey <paulb@nvidia.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
