Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1611CB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693503915; x=1725039915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7AXg1GzVHIRVPGD2z0CBDLpuuLhaiNARJlRylvXMys=;
  b=bUTeCLRsIr5gydZGi+NDzb6SouRbgCq1ytQDXaNzLNDyEMN9OM0D7c3/
   AoH0uVRjx+XdcjLihT7TAMmn9DcARmcDmkTqtopQ/h52Bpj0Zf/5AgEHP
   cqJjQsuSHD6TYHezlcTR1U6z7frcrZz0DnTWOQaDC0lgONBd7dJRYlhJu
   l07+bIepJKYjjknQEYGKE3GBAxwREzDi2+OPMGMwzYD+cfKvTnNoqHD2i
   7a/EFPcVbjAQzZkhUwUHHBpriVhWFhPajvVVA8p3d68pfo+f9b99DZz+S
   QrFC4xfqmPNZZ68NMxWfGryIh1+aIu8UFoUZ8GYHxc+FI1J0DjeRT2n5c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366246756"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366246756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 10:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805105265"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="805105265"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 10:45:00 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qblj0-0000Pj-2H;
	Thu, 31 Aug 2023 17:44:58 +0000
Date: Fri, 1 Sep 2023 01:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 6/7] sound/soc/sh/rcar/core.c:1146:23: error:
 implicit declaration of function 'of_graph_get_remote_port_parent'; did you
 mean 'fwnode_graph_get_remote_port_parent'?
Message-ID: <202309010126.AtzEDhD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: f4013f411676ad6281f520bdc4ba108b089fc2b8 [6/7] ASoC: Clean-up DT includes
config: riscv-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010126.AtzEDhD6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010126.AtzEDhD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010126.AtzEDhD6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/sh/rcar/core.c: In function 'rsnd_parse_connect_graph':
>> sound/soc/sh/rcar/core.c:1146:23: error: implicit declaration of function 'of_graph_get_remote_port_parent'; did you mean 'fwnode_graph_get_remote_port_parent'? [-Werror=implicit-function-declaration]
    1146 |         remote_node = of_graph_get_remote_port_parent(endpoint);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       fwnode_graph_get_remote_port_parent
>> sound/soc/sh/rcar/core.c:1146:21: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1146 |         remote_node = of_graph_get_remote_port_parent(endpoint);
         |                     ^
   sound/soc/sh/rcar/core.c: In function 'rsnd_dai_of_node':
>> sound/soc/sh/rcar/core.c:1300:43: error: implicit declaration of function 'of_graph_get_endpoint_count'; did you mean 'fwnode_graph_get_endpoint_count'? [-Werror=implicit-function-declaration]
    1300 |                 priv->component_dais[i] = of_graph_get_endpoint_count(ports);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           fwnode_graph_get_endpoint_count
   sound/soc/sh/rcar/core.c: In function 'rsnd_dai_probe':
>> sound/soc/sh/rcar/core.c:1512:25: error: implicit declaration of function 'for_each_endpoint_of_node'; did you mean 'for_each_child_of_node'? [-Werror=implicit-function-declaration]
    1512 |                         for_each_endpoint_of_node(ports, dai_np) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         for_each_child_of_node
>> sound/soc/sh/rcar/core.c:1512:65: error: expected ';' before '{' token
    1512 |                         for_each_endpoint_of_node(ports, dai_np) {
         |                                                                 ^~
         |                                                                 ;
   sound/soc/sh/rcar/core.c: At top level:
>> sound/soc/sh/rcar/core.c:1136:13: warning: 'rsnd_parse_connect_graph' defined but not used [-Wunused-function]
    1136 | static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/sh/rcar/src.c: In function 'rsnd_src_probe':
>> sound/soc/sh/rcar/src.c:694:28: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
     694 |                 src->irq = irq_of_parse_and_map(np, 0);
         |                            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/sh/rcar/ssi.c: In function 'rsnd_ssi_probe':
>> sound/soc/sh/rcar/ssi.c:1220:28: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
    1220 |                 ssi->irq = irq_of_parse_and_map(np, 0);
         |                            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1146 sound/soc/sh/rcar/core.c

2264cf2e5db99c Kuninori Morimoto  2019-02-01  1135  
beed78aeeb1021 Kuninori Morimoto  2018-11-06 @1136  static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1137  				     struct rsnd_dai_stream *io,
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1138  				     struct device_node *endpoint)
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1139  {
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1140  	struct device *dev = rsnd_priv_to_dev(priv);
ef2c695151df54 Kuninori Morimoto  2019-10-23  1141  	struct device_node *remote_node;
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1142  
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1143  	if (!rsnd_io_to_mod_ssi(io))
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1144  		return;
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1145  
ef2c695151df54 Kuninori Morimoto  2019-10-23 @1146  	remote_node = of_graph_get_remote_port_parent(endpoint);
ef2c695151df54 Kuninori Morimoto  2019-10-23  1147  
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1148  	/* HDMI0 */
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1149  	if (strstr(remote_node->full_name, "hdmi@fead0000")) {
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1150  		rsnd_flags_set(io, RSND_STREAM_HDMI0);
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1151  		dev_dbg(dev, "%s connected to HDMI0\n", io->name);
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1152  	}
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1153  
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1154  	/* HDMI1 */
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1155  	if (strstr(remote_node->full_name, "hdmi@feae0000")) {
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1156  		rsnd_flags_set(io, RSND_STREAM_HDMI1);
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1157  		dev_dbg(dev, "%s connected to HDMI1\n", io->name);
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1158  	}
f69f452243e4e1 Kuninori Morimoto  2018-11-06  1159  
2264cf2e5db99c Kuninori Morimoto  2019-02-01  1160  	rsnd_parse_tdm_split_mode(priv, io, endpoint);
ef2c695151df54 Kuninori Morimoto  2019-10-23  1161  
ef2c695151df54 Kuninori Morimoto  2019-10-23  1162  	of_node_put(remote_node);
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1163  }
beed78aeeb1021 Kuninori Morimoto  2018-11-06  1164  
ec02b5a1d1c91b Kuninori Morimoto  2021-05-31  1165  void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
89b66174eca660 Kuninori Morimoto  2015-12-17  1166  		struct rsnd_mod* (*mod_get)(struct rsnd_priv *priv, int id),
89b66174eca660 Kuninori Morimoto  2015-12-17  1167  		struct device_node *node,
89b66174eca660 Kuninori Morimoto  2015-12-17  1168  		struct device_node *playback,
89b66174eca660 Kuninori Morimoto  2015-12-17  1169  		struct device_node *capture)
89b66174eca660 Kuninori Morimoto  2015-12-17  1170  {
89b66174eca660 Kuninori Morimoto  2015-12-17  1171  	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
d09a7db431c65a Kuninori Morimoto  2022-04-21  1172  	struct device *dev = rsnd_priv_to_dev(priv);
89b66174eca660 Kuninori Morimoto  2015-12-17  1173  	struct device_node *np;
89b66174eca660 Kuninori Morimoto  2015-12-17  1174  	int i;
89b66174eca660 Kuninori Morimoto  2015-12-17  1175  
89b66174eca660 Kuninori Morimoto  2015-12-17  1176  	if (!node)
89b66174eca660 Kuninori Morimoto  2015-12-17  1177  		return;
89b66174eca660 Kuninori Morimoto  2015-12-17  1178  
89b66174eca660 Kuninori Morimoto  2015-12-17  1179  	i = 0;
89b66174eca660 Kuninori Morimoto  2015-12-17  1180  	for_each_child_of_node(node, np) {
73919dbe480d0b Kuninori Morimoto  2021-05-31  1181  		struct rsnd_mod *mod;
73919dbe480d0b Kuninori Morimoto  2021-05-31  1182  
d09a7db431c65a Kuninori Morimoto  2022-04-21  1183  		i = rsnd_node_fixed_index(dev, np, name, i);
d09a7db431c65a Kuninori Morimoto  2022-04-21  1184  		if (i < 0) {
d09a7db431c65a Kuninori Morimoto  2022-04-21  1185  			of_node_put(np);
d09a7db431c65a Kuninori Morimoto  2022-04-21  1186  			break;
d09a7db431c65a Kuninori Morimoto  2022-04-21  1187  		}
c413983eb66a0f Kuninori Morimoto  2021-05-31  1188  
73919dbe480d0b Kuninori Morimoto  2021-05-31  1189  		mod = mod_get(priv, i);
e539943c664e58 Kuninori Morimoto  2021-02-25  1190  
89b66174eca660 Kuninori Morimoto  2015-12-17  1191  		if (np == playback)
89b66174eca660 Kuninori Morimoto  2015-12-17  1192  			rsnd_dai_connect(mod, &rdai->playback, mod->type);
89b66174eca660 Kuninori Morimoto  2015-12-17  1193  		if (np == capture)
89b66174eca660 Kuninori Morimoto  2015-12-17  1194  			rsnd_dai_connect(mod, &rdai->capture, mod->type);
89b66174eca660 Kuninori Morimoto  2015-12-17  1195  		i++;
89b66174eca660 Kuninori Morimoto  2015-12-17  1196  	}
89b66174eca660 Kuninori Morimoto  2015-12-17  1197  
89b66174eca660 Kuninori Morimoto  2015-12-17  1198  	of_node_put(node);
89b66174eca660 Kuninori Morimoto  2015-12-17  1199  }
89b66174eca660 Kuninori Morimoto  2015-12-17  1200  
d09a7db431c65a Kuninori Morimoto  2022-04-21  1201  int rsnd_node_fixed_index(struct device *dev, struct device_node *node, char *name, int idx)
c413983eb66a0f Kuninori Morimoto  2021-05-31  1202  {
c413983eb66a0f Kuninori Morimoto  2021-05-31  1203  	char node_name[16];
c413983eb66a0f Kuninori Morimoto  2021-05-31  1204  
c413983eb66a0f Kuninori Morimoto  2021-05-31  1205  	/*
c413983eb66a0f Kuninori Morimoto  2021-05-31  1206  	 * rsnd is assuming each device nodes are sequential numbering,
c413983eb66a0f Kuninori Morimoto  2021-05-31  1207  	 * but some of them are not.
c413983eb66a0f Kuninori Morimoto  2021-05-31  1208  	 * This function adjusts index for it.
c413983eb66a0f Kuninori Morimoto  2021-05-31  1209  	 *
c413983eb66a0f Kuninori Morimoto  2021-05-31  1210  	 * ex)
c413983eb66a0f Kuninori Morimoto  2021-05-31  1211  	 * Normal case,		special case
c413983eb66a0f Kuninori Morimoto  2021-05-31  1212  	 *	ssi-0
c413983eb66a0f Kuninori Morimoto  2021-05-31  1213  	 *	ssi-1
c413983eb66a0f Kuninori Morimoto  2021-05-31  1214  	 *	ssi-2
c413983eb66a0f Kuninori Morimoto  2021-05-31  1215  	 *	ssi-3		ssi-3
c413983eb66a0f Kuninori Morimoto  2021-05-31  1216  	 *	ssi-4		ssi-4
c413983eb66a0f Kuninori Morimoto  2021-05-31  1217  	 *	...
c413983eb66a0f Kuninori Morimoto  2021-05-31  1218  	 *
c413983eb66a0f Kuninori Morimoto  2021-05-31  1219  	 * assume Max 64 node
c413983eb66a0f Kuninori Morimoto  2021-05-31  1220  	 */
c413983eb66a0f Kuninori Morimoto  2021-05-31  1221  	for (; idx < 64; idx++) {
c413983eb66a0f Kuninori Morimoto  2021-05-31  1222  		snprintf(node_name, sizeof(node_name), "%s-%d", name, idx);
c413983eb66a0f Kuninori Morimoto  2021-05-31  1223  
c413983eb66a0f Kuninori Morimoto  2021-05-31  1224  		if (strncmp(node_name, of_node_full_name(node), sizeof(node_name)) == 0)
c413983eb66a0f Kuninori Morimoto  2021-05-31  1225  			return idx;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1226  	}
c413983eb66a0f Kuninori Morimoto  2021-05-31  1227  
d09a7db431c65a Kuninori Morimoto  2022-04-21  1228  	dev_err(dev, "strange node numbering (%s)",
d09a7db431c65a Kuninori Morimoto  2022-04-21  1229  		of_node_full_name(node));
c413983eb66a0f Kuninori Morimoto  2021-05-31  1230  	return -EINVAL;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1231  }
c413983eb66a0f Kuninori Morimoto  2021-05-31  1232  
c413983eb66a0f Kuninori Morimoto  2021-05-31  1233  int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name)
c413983eb66a0f Kuninori Morimoto  2021-05-31  1234  {
c413983eb66a0f Kuninori Morimoto  2021-05-31  1235  	struct device *dev = rsnd_priv_to_dev(priv);
c413983eb66a0f Kuninori Morimoto  2021-05-31  1236  	struct device_node *np;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1237  	int i;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1238  
c413983eb66a0f Kuninori Morimoto  2021-05-31  1239  	i = 0;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1240  	for_each_child_of_node(node, np) {
d09a7db431c65a Kuninori Morimoto  2022-04-21  1241  		i = rsnd_node_fixed_index(dev, np, name, i);
c413983eb66a0f Kuninori Morimoto  2021-05-31  1242  		if (i < 0) {
173632358fde7a Christophe JAILLET 2021-10-18  1243  			of_node_put(np);
c413983eb66a0f Kuninori Morimoto  2021-05-31  1244  			return 0;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1245  		}
c413983eb66a0f Kuninori Morimoto  2021-05-31  1246  		i++;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1247  	}
c413983eb66a0f Kuninori Morimoto  2021-05-31  1248  
c413983eb66a0f Kuninori Morimoto  2021-05-31  1249  	return i;
c413983eb66a0f Kuninori Morimoto  2021-05-31  1250  }
c413983eb66a0f Kuninori Morimoto  2021-05-31  1251  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1252  static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1253  {
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1254  	struct device *dev = rsnd_priv_to_dev(priv);
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1255  	struct device_node *np = dev->of_node;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1256  	struct device_node *ports, *node;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1257  	int nr = 0;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1258  	int i = 0;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1259  
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1260  	*is_graph = 0;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1261  
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1262  	/*
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1263  	 * parse both previous dai (= rcar_sound,dai), and
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1264  	 * graph dai (= ports/port)
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1265  	 */
6328489c135b60 Kuninori Morimoto  2023-07-24  1266  
6328489c135b60 Kuninori Morimoto  2023-07-24  1267  	/*
6328489c135b60 Kuninori Morimoto  2023-07-24  1268  	 * Simple-Card
6328489c135b60 Kuninori Morimoto  2023-07-24  1269  	 */
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1270  	node = of_get_child_by_name(np, RSND_NODE_DAI);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1271  	if (!node)
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1272  		goto audio_graph;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1273  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1274  	of_node_put(node);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1275  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1276  	for_each_child_of_node(np, node) {
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1277  		if (!of_node_name_eq(node, RSND_NODE_DAI))
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1278  			continue;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1279  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1280  		priv->component_dais[i] = of_get_child_count(node);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1281  		nr += priv->component_dais[i];
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1282  		i++;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1283  		if (i >= RSND_MAX_COMPONENT) {
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1284  			dev_info(dev, "reach to max component\n");
1a5ca2aad7b907 Kuninori Morimoto  2023-08-09  1285  			of_node_put(node);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1286  			break;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1287  		}
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1288  	}
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1289  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1290  	return nr;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1291  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1292  audio_graph:
6328489c135b60 Kuninori Morimoto  2023-07-24  1293  	/*
6328489c135b60 Kuninori Morimoto  2023-07-24  1294  	 * Audio-Graph-Card
6328489c135b60 Kuninori Morimoto  2023-07-24  1295  	 */
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1296  	for_each_child_of_node(np, ports) {
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1297  		if (!of_node_name_eq(ports, "ports") &&
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1298  		    !of_node_name_eq(ports, "port"))
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1299  			continue;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24 @1300  		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1301  		nr += priv->component_dais[i];
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1302  		i++;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1303  		if (i >= RSND_MAX_COMPONENT) {
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1304  			dev_info(dev, "reach to max component\n");
1a5ca2aad7b907 Kuninori Morimoto  2023-08-09  1305  			of_node_put(node);
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1306  			break;
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1307  		}
6328489c135b60 Kuninori Morimoto  2023-07-24  1308  	}
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1309  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1310  	*is_graph = 1;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1311  
547b02f74e4ac1 Kuninori Morimoto  2023-07-24  1312  	return nr;
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1313  }
11d0f8ed6dc3e5 Kuninori Morimoto  2017-05-18  1314  

:::::: The code at line 1146 was first introduced by commit
:::::: ef2c695151df54817f92128f96a920ff888c6920 ASoC: rsnd: add missing of_node_put()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
