Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6A1846
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461847; x=1724997847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=npKcaTpJbL+okEXYDeqqsowl0pWqeRLTMTHepe+PDbI=;
  b=FsYWouKaLKQO3aBO07ZLxB/d2UDZgBAhEhJCgfb2eobPOQFtGXfTkoNU
   pXQIhUoU1gcoh5sNZeyV5IXk7SOZfwKByAkeuJX3IAol+8xf/v86MGMpq
   dtZ0geKmUDy+iF9ld4GApxOqYlFKKWvVeD2YB3oNBDvB8+3EDWKP0ADjQ
   2Ql5ZBRQtFotTaZ7qSWX0VYf4koWFoWaYNpZyvhovRJt5cqepbiTJ/n9w
   LDZKA/Xlwz3FcAGjr02pYmCv1NXYFCfpBFPN6/q/j4oQdhpVW2VSam7Kr
   Ya/nDA0c2xfl7rpS1RBgLiBw/mqioG+9shCYuct29q6dY8pCai3F4gpfl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373225601"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="373225601"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809431482"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="809431482"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 23:03:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbamL-000Ax7-2M;
	Thu, 31 Aug 2023 06:03:43 +0000
Date: Thu, 31 Aug 2023 14:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 6/7] sound/soc/samsung/smdk_wm8994.c:173:12:
 warning: assignment to 'const struct of_device_id *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202308311331.IhfZWq2f-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308311331.IhfZWq2f-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311331.IhfZWq2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311331.IhfZWq2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/samsung/smdk_wm8994.c: In function 'smdk_audio_probe':
   sound/soc/samsung/smdk_wm8994.c:173:14: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
     173 |         id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
         |              ^~~~~~~~~~~~~~~
         |              of_match_node
>> sound/soc/samsung/smdk_wm8994.c:173:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     173 |         id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
         |            ^
   cc1: some warnings being treated as errors
--
   sound/soc/sh/rcar/core.c: In function 'rsnd_parse_connect_graph':
   sound/soc/sh/rcar/core.c:1146:23: error: implicit declaration of function 'of_graph_get_remote_port_parent'; did you mean 'fwnode_graph_get_remote_port_parent'? [-Werror=implicit-function-declaration]
    1146 |         remote_node = of_graph_get_remote_port_parent(endpoint);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       fwnode_graph_get_remote_port_parent
>> sound/soc/sh/rcar/core.c:1146:21: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1146 |         remote_node = of_graph_get_remote_port_parent(endpoint);
         |                     ^
   sound/soc/sh/rcar/core.c: In function 'rsnd_dai_of_node':
   sound/soc/sh/rcar/core.c:1300:43: error: implicit declaration of function 'of_graph_get_endpoint_count'; did you mean 'fwnode_graph_get_endpoint_count'? [-Werror=implicit-function-declaration]
    1300 |                 priv->component_dais[i] = of_graph_get_endpoint_count(ports);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           fwnode_graph_get_endpoint_count
   sound/soc/sh/rcar/core.c: In function 'rsnd_dai_probe':
   sound/soc/sh/rcar/core.c:1512:25: error: implicit declaration of function 'for_each_endpoint_of_node'; did you mean 'for_each_child_of_node'? [-Werror=implicit-function-declaration]
    1512 |                         for_each_endpoint_of_node(ports, dai_np) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         for_each_child_of_node
   sound/soc/sh/rcar/core.c:1512:65: error: expected ';' before '{' token
    1512 |                         for_each_endpoint_of_node(ports, dai_np) {
         |                                                                 ^~
         |                                                                 ;
   sound/soc/sh/rcar/core.c: At top level:
>> sound/soc/sh/rcar/core.c:1136:13: warning: 'rsnd_parse_connect_graph' defined but not used [-Wunused-function]
    1136 | static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +173 sound/soc/samsung/smdk_wm8994.c

96657d33b9ba4e Jassi Brar           2010-12-20  143  
fdca21ad460320 Bill Pemberton       2012-12-07  144  static int smdk_audio_probe(struct platform_device *pdev)
96657d33b9ba4e Jassi Brar           2010-12-20  145  {
96657d33b9ba4e Jassi Brar           2010-12-20  146  	int ret;
28a480583361b8 Padmavathi Venna     2013-01-18  147  	struct device_node *np = pdev->dev.of_node;
9c9acc91561221 Sachin Kamat         2012-07-03  148  	struct snd_soc_card *card = &smdk;
d30c148bb1cab2 Mark Brown           2013-07-26  149  	struct smdk_wm8994_data *board;
d30c148bb1cab2 Mark Brown           2013-07-26  150  	const struct of_device_id *id;
96657d33b9ba4e Jassi Brar           2010-12-20  151  
9c9acc91561221 Sachin Kamat         2012-07-03  152  	card->dev = &pdev->dev;
28a480583361b8 Padmavathi Venna     2013-01-18  153  
d30c148bb1cab2 Mark Brown           2013-07-26  154  	board = devm_kzalloc(&pdev->dev, sizeof(*board), GFP_KERNEL);
d30c148bb1cab2 Mark Brown           2013-07-26  155  	if (!board)
d30c148bb1cab2 Mark Brown           2013-07-26  156  		return -ENOMEM;
d30c148bb1cab2 Mark Brown           2013-07-26  157  
28a480583361b8 Padmavathi Venna     2013-01-18  158  	if (np) {
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  159  		smdk_dai[0].cpus->dai_name = NULL;
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  160  		smdk_dai[0].cpus->of_node = of_parse_phandle(np,
28a480583361b8 Padmavathi Venna     2013-01-18  161  				"samsung,i2s-controller", 0);
2f8ea84e3a8c9d Kuninori Morimoto    2019-06-06  162  		if (!smdk_dai[0].cpus->of_node) {
28a480583361b8 Padmavathi Venna     2013-01-18  163  			dev_err(&pdev->dev,
28a480583361b8 Padmavathi Venna     2013-01-18  164  			   "Property 'samsung,i2s-controller' missing or invalid\n");
28a480583361b8 Padmavathi Venna     2013-01-18  165  			ret = -EINVAL;
fbb123e248c127 Pierre-Louis Bossart 2021-02-19  166  			return ret;
28a480583361b8 Padmavathi Venna     2013-01-18  167  		}
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  168  
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  169  		smdk_dai[0].platforms->name = NULL;
806bfc27ea84e7 Kuninori Morimoto    2019-06-28  170  		smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
28a480583361b8 Padmavathi Venna     2013-01-18  171  	}
28a480583361b8 Padmavathi Venna     2013-01-18  172  
0670c9a7239a47 Krzysztof Kozlowski  2020-11-25 @173  	id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
d30c148bb1cab2 Mark Brown           2013-07-26  174  	if (id)
d30c148bb1cab2 Mark Brown           2013-07-26  175  		*board = *((struct smdk_wm8994_data *)id->data);
d30c148bb1cab2 Mark Brown           2013-07-26  176  
d30c148bb1cab2 Mark Brown           2013-07-26  177  	platform_set_drvdata(pdev, board);
d30c148bb1cab2 Mark Brown           2013-07-26  178  
9a8e0322f0a8c7 Mark Brown           2013-09-16  179  	ret = devm_snd_soc_register_card(&pdev->dev, card);
96657d33b9ba4e Jassi Brar           2010-12-20  180  
27c6eaebcf75e4 Kuninori Morimoto    2021-12-14  181  	if (ret)
27c6eaebcf75e4 Kuninori Morimoto    2021-12-14  182  		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
96657d33b9ba4e Jassi Brar           2010-12-20  183  
96657d33b9ba4e Jassi Brar           2010-12-20  184  	return ret;
96657d33b9ba4e Jassi Brar           2010-12-20  185  }
96657d33b9ba4e Jassi Brar           2010-12-20  186  

:::::: The code at line 173 was first introduced by commit
:::::: 0670c9a7239a478ec9675fa82d7ee0a86ef22fe5 ASoC: samsung: smdk_wm8994: remove redundant of_match_ptr()

:::::: TO: Krzysztof Kozlowski <krzk@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
