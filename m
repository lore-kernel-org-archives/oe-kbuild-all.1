Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354552F3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 22:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693174786; x=1724710786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBlFeD81FohK7O9ywkXayQdzqm9ws4At8N392R44gu4=;
  b=mHntL506X/jng3ASNm02ntpcWRArq6PWUpOHUkDLu6oOdxRVkLnDcNmA
   i2OuSF5kHRkQMM9Zk2TkyTL9zFALt4iHQzj+UtqpiIsNh0NSctltPZWU9
   ld47Exal5ke78eg1u7YbPRlr2jvfNJFJYVvMXuya0ir2MD/GabXt5k/LN
   u0k1FfIn0xiekeGn4JWZKfc4Pb1Q+g201dp29eny08mekgAsJKX3WGt5L
   dJG1nDv7rcAXMx39HSkFCzGZmtWkq7lUd5ONDs/0ioRz7KmPrt4fEvpNa
   VCtHuii1+S/8iFvl+Xns19Q8egS2Rjb3qXzCcEOU7LCEt6zrsTolLuLvU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="438926889"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="438926889"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 15:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731629825"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731629825"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 15:19:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaO6f-0006Eh-04;
	Sun, 27 Aug 2023 22:19:41 +0000
Date: Mon, 28 Aug 2023 06:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 10517/12910]
 drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c:1191:14: sparse:
 sparse: restricted __be64 degrades to integer
Message-ID: <202308280642.vMVaQVEO-lkp@intel.com>
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
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 7390762a073743f936bd1b392ec42161d9f2d23e [10517/12910] net/mlx5e: Move MACsec flow steering operations to be used as core library
config: i386-randconfig-063-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280642.vMVaQVEO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280642.vMVaQVEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280642.vMVaQVEO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c:1191:14: sparse: sparse: restricted __be64 degrades to integer

vim +1191 drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c

3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1114  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1115  static union mlx5e_macsec_rule *
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1116  macsec_fs_rx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
9515978eee0b93 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1117  		      struct mlx5_macsec_rule_attrs *attrs,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1118  		      u32 fs_id)
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1119  {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1120  	u8 action[MLX5_UN_SZ_BYTES(set_add_copy_action_in_auto)] = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1121  	struct mlx5e_macsec_rx *rx_fs = macsec_fs->rx_fs;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1122  	struct net_device *netdev = macsec_fs->netdev;
2e50e9bf328fb7 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Nathan Chancellor 2022-09-11  1123  	union mlx5e_macsec_rule *macsec_rule = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1124  	struct mlx5_modify_hdr *modify_hdr = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1125  	struct mlx5_flow_destination dest = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1126  	struct mlx5e_macsec_tables *rx_tables;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1127  	struct mlx5e_macsec_rx_rule *rx_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1128  	struct mlx5_flow_act flow_act = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1129  	struct mlx5e_flow_table *ft_crypto;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1130  	struct mlx5_flow_handle *rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1131  	struct mlx5_flow_spec *spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1132  	int err = 0;
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1133  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1134  	spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1135  	if (!spec)
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1136  		return NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1137  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1138  	err = macsec_fs_rx_ft_get(macsec_fs);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1139  	if (err)
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1140  		goto out_spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1141  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1142  	macsec_rule = kzalloc(sizeof(*macsec_rule), GFP_KERNEL);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1143  	if (!macsec_rule) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1144  		macsec_fs_rx_ft_put(macsec_fs);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1145  		goto out_spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1146  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1147  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1148  	rx_rule = &macsec_rule->rx_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1149  	rx_tables = &rx_fs->tables;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1150  	ft_crypto = &rx_tables->ft_crypto;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1151  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1152  	/* Set bit[31 - 30] macsec marker - 0x01 */
813115c4669d74 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-27  1153  	/* Set bit[15-0] fs id */
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1154  	MLX5_SET(set_action_in, action, action_type, MLX5_ACTION_TYPE_SET);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1155  	MLX5_SET(set_action_in, action, field, MLX5_ACTION_IN_FIELD_METADATA_REG_B);
813115c4669d74 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-27  1156  	MLX5_SET(set_action_in, action, data, MLX5_MACSEC_RX_METADAT_HANDLE(fs_id) | BIT(30));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1157  	MLX5_SET(set_action_in, action, offset, 0);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1158  	MLX5_SET(set_action_in, action, length, 32);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1159  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1160  	modify_hdr = mlx5_modify_header_alloc(macsec_fs->mdev, MLX5_FLOW_NAMESPACE_KERNEL_RX_MACSEC,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1161  					      1, action);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1162  	if (IS_ERR(modify_hdr)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1163  		err = PTR_ERR(modify_hdr);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1164  		netdev_err(netdev, "fail to alloc MACsec set modify_header_id err=%d\n", err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1165  		modify_hdr = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1166  		goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1167  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1168  	rx_rule->meta_modhdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1169  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1170  	/* Rx crypto table with SCI rule */
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1171  	macsec_fs_rx_setup_fte(spec, &flow_act, attrs, true);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1172  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1173  	flow_act.modify_hdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1174  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1175  			  MLX5_FLOW_CONTEXT_ACTION_CRYPTO_DECRYPT |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1176  			  MLX5_FLOW_CONTEXT_ACTION_MOD_HDR;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1177  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1178  	dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1179  	dest.ft = rx_tables->ft_check;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1180  	rule = mlx5_add_flow_rules(ft_crypto->t, spec, &flow_act, &dest, 1);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1181  	if (IS_ERR(rule)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1182  		err = PTR_ERR(rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1183  		netdev_err(netdev,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1184  			   "Failed to add SA with SCI rule to Rx crypto rule, err=%d\n",
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1185  			   err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1186  		goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1187  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1188  	rx_rule->rule[0] = rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1189  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1190  	/* Rx crypto table without SCI rule */
d550956458a83c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-26 @1191  	if ((cpu_to_be64((__force u64)attrs->sci) & 0xFFFF) == ntohs(MACSEC_PORT_ES)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1192  		memset(spec, 0, sizeof(struct mlx5_flow_spec));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1193  		memset(&dest, 0, sizeof(struct mlx5_flow_destination));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1194  		memset(&flow_act, 0, sizeof(flow_act));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1195  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1196  		macsec_fs_rx_setup_fte(spec, &flow_act, attrs, false);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1197  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1198  		flow_act.modify_hdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1199  		flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1200  				  MLX5_FLOW_CONTEXT_ACTION_CRYPTO_DECRYPT |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1201  				  MLX5_FLOW_CONTEXT_ACTION_MOD_HDR;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1202  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1203  		dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1204  		dest.ft = rx_tables->ft_check;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1205  		rule = mlx5_add_flow_rules(ft_crypto->t, spec, &flow_act, &dest, 1);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1206  		if (IS_ERR(rule)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1207  			err = PTR_ERR(rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1208  			netdev_err(netdev,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1209  				   "Failed to add SA without SCI rule to Rx crypto rule, err=%d\n",
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1210  				   err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1211  			goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1212  		}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1213  		rx_rule->rule[1] = rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1214  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1215  
194cc051e29ea1 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Emeel Hakim       2022-11-08  1216  	kvfree(spec);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1217  	return macsec_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1218  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1219  err:
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1220  	macsec_fs_rx_del_rule(macsec_fs, rx_rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1221  	macsec_rule = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1222  out_spec:
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1223  	kvfree(spec);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1224  	return macsec_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1225  }
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1226  

:::::: The code at line 1191 was first introduced by commit
:::::: d550956458a83cf87cb8fe24862f3340065c62c1 net/mlx5e: Fix wrong bitwise comparison usage in macsec_fs_rx_add_rule function

:::::: TO: Raed Salem <raeds@nvidia.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
