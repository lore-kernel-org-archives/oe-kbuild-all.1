Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C93C27
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 05:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692078815; x=1723614815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5b3irMTvfnhB9DLIiblknNu6vjysukdAmJRmAaSxsaw=;
  b=e+wpODezqe/uBiVdkjV/qu7n0mV1hNDYhixwo8I5GnChNznk+YdjXGld
   9zaGshSldUeP3wgVvvXUuW+UhL8UzBFQAolalnc2ca2ORnZUMZ0FUnNi6
   K03dPOY/D6sybHcSl02r3JLuiW1tfjCaBbrCLXUJjYPDNlJf4wXIzHPop
   iyls/+Z76A4J96h3GFJVbSM/NdnxFrgPK7QlJ4hwHLJQScEeikTM14Kj4
   tMBlbFYQ3BXGUCmWyqB2dGLOMCwC903AGXFkrGcW0Me4n2YDgO+rrNiOr
   TfGVYTSoexC34NRPwXN9YaKwY5SrejZt0By1UoRXP6gKW9ftA/Qtrw+jf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438548478"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="438548478"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 22:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736792890"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="736792890"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Aug 2023 22:53:31 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVmzf-0000hP-2z;
	Tue, 15 Aug 2023 05:53:28 +0000
Date: Tue, 15 Aug 2023 13:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:xfrm-next 12/35]
 drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c:1192:14: sparse:
 sparse: restricted __be64 degrades to integer
Message-ID: <202308151349.KzwxACId-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git xfrm-next
head:   75aa50e260cb6a3d3cb4419725095628bc2f7656
commit: 826c6ccd8a2e3168237c717abf67039feb00d334 [12/35] net/mlx5e: Move MACsec flow steering operations to be used as core library
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230815/202308151349.KzwxACId-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151349.KzwxACId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151349.KzwxACId-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c:1192:14: sparse: sparse: restricted __be64 degrades to integer

vim +1192 drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c

3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1115  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1116  static union mlx5e_macsec_rule *
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1117  macsec_fs_rx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
9515978eee0b93 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1118  		      struct mlx5_macsec_rule_attrs *attrs,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1119  		      u32 fs_id)
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1120  {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1121  	u8 action[MLX5_UN_SZ_BYTES(set_add_copy_action_in_auto)] = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1122  	struct mlx5e_macsec_rx *rx_fs = macsec_fs->rx_fs;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1123  	struct net_device *netdev = macsec_fs->netdev;
2e50e9bf328fb7 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Nathan Chancellor 2022-09-11  1124  	union mlx5e_macsec_rule *macsec_rule = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1125  	struct mlx5_modify_hdr *modify_hdr = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1126  	struct mlx5_flow_destination dest = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1127  	struct mlx5e_macsec_tables *rx_tables;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1128  	struct mlx5e_macsec_rx_rule *rx_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1129  	struct mlx5_flow_act flow_act = {};
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1130  	struct mlx5e_flow_table *ft_crypto;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1131  	struct mlx5_flow_handle *rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1132  	struct mlx5_flow_spec *spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1133  	int err = 0;
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1134  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1135  	spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1136  	if (!spec)
e467b283ffd50c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1137  		return NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1138  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1139  	err = macsec_fs_rx_ft_get(macsec_fs);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1140  	if (err)
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1141  		goto out_spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1142  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1143  	macsec_rule = kzalloc(sizeof(*macsec_rule), GFP_KERNEL);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1144  	if (!macsec_rule) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1145  		macsec_fs_rx_ft_put(macsec_fs);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1146  		goto out_spec;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1147  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1148  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1149  	rx_rule = &macsec_rule->rx_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1150  	rx_tables = &rx_fs->tables;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1151  	ft_crypto = &rx_tables->ft_crypto;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1152  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1153  	/* Set bit[31 - 30] macsec marker - 0x01 */
813115c4669d74 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-27  1154  	/* Set bit[15-0] fs id */
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1155  	MLX5_SET(set_action_in, action, action_type, MLX5_ACTION_TYPE_SET);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1156  	MLX5_SET(set_action_in, action, field, MLX5_ACTION_IN_FIELD_METADATA_REG_B);
813115c4669d74 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-27  1157  	MLX5_SET(set_action_in, action, data, MLX5_MACSEC_RX_METADAT_HANDLE(fs_id) | BIT(30));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1158  	MLX5_SET(set_action_in, action, offset, 0);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1159  	MLX5_SET(set_action_in, action, length, 32);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1160  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1161  	modify_hdr = mlx5_modify_header_alloc(macsec_fs->mdev, MLX5_FLOW_NAMESPACE_KERNEL_RX_MACSEC,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1162  					      1, action);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1163  	if (IS_ERR(modify_hdr)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1164  		err = PTR_ERR(modify_hdr);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1165  		netdev_err(netdev, "fail to alloc MACsec set modify_header_id err=%d\n", err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1166  		modify_hdr = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1167  		goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1168  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1169  	rx_rule->meta_modhdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1170  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1171  	/* Rx crypto table with SCI rule */
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1172  	macsec_fs_rx_setup_fte(spec, &flow_act, attrs, true);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1173  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1174  	flow_act.modify_hdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1175  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1176  			  MLX5_FLOW_CONTEXT_ACTION_CRYPTO_DECRYPT |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1177  			  MLX5_FLOW_CONTEXT_ACTION_MOD_HDR;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1178  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1179  	dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1180  	dest.ft = rx_tables->ft_check;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1181  	rule = mlx5_add_flow_rules(ft_crypto->t, spec, &flow_act, &dest, 1);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1182  	if (IS_ERR(rule)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1183  		err = PTR_ERR(rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1184  		netdev_err(netdev,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1185  			   "Failed to add SA with SCI rule to Rx crypto rule, err=%d\n",
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1186  			   err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1187  		goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1188  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1189  	rx_rule->rule[0] = rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1190  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1191  	/* Rx crypto table without SCI rule */
d550956458a83c drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Raed Salem        2022-10-26 @1192  	if ((cpu_to_be64((__force u64)attrs->sci) & 0xFFFF) == ntohs(MACSEC_PORT_ES)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1193  		memset(spec, 0, sizeof(struct mlx5_flow_spec));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1194  		memset(&dest, 0, sizeof(struct mlx5_flow_destination));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1195  		memset(&flow_act, 0, sizeof(flow_act));
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1196  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1197  		macsec_fs_rx_setup_fte(spec, &flow_act, attrs, false);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1198  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1199  		flow_act.modify_hdr = modify_hdr;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1200  		flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1201  				  MLX5_FLOW_CONTEXT_ACTION_CRYPTO_DECRYPT |
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1202  				  MLX5_FLOW_CONTEXT_ACTION_MOD_HDR;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1203  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1204  		dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1205  		dest.ft = rx_tables->ft_check;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1206  		rule = mlx5_add_flow_rules(ft_crypto->t, spec, &flow_act, &dest, 1);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1207  		if (IS_ERR(rule)) {
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1208  			err = PTR_ERR(rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1209  			netdev_err(netdev,
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1210  				   "Failed to add SA without SCI rule to Rx crypto rule, err=%d\n",
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1211  				   err);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1212  			goto err;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1213  		}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1214  		rx_rule->rule[1] = rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1215  	}
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1216  
194cc051e29ea1 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Emeel Hakim       2022-11-08  1217  	kvfree(spec);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1218  	return macsec_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1219  
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1220  err:
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1221  	macsec_fs_rx_del_rule(macsec_fs, rx_rule);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1222  	macsec_rule = NULL;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1223  out_spec:
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1224  	kvfree(spec);
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1225  	return macsec_rule;
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1226  }
3b20949cb21bac drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c Lior Nahmanson    2022-09-05  1227  

:::::: The code at line 1192 was first introduced by commit
:::::: d550956458a83cf87cb8fe24862f3340065c62c1 net/mlx5e: Fix wrong bitwise comparison usage in macsec_fs_rx_add_rule function

:::::: TO: Raed Salem <raeds@nvidia.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
