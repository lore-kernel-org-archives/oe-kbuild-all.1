Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825EC20ADC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949534; cv=none; b=uz8tJHWdGXMQkfnKRAOU+UiHbmXiGgKHgzKvfl6TzsEphgL1EgwE/fa34Y2tnJu4ZuB2NprZM7bMfFrXqQJRztgEknO+c1feMYIb6iROt2WLIu06Utswqy09sET6CrsedfO7PC+YROgSU5Z9KyTV/EHP+GVgHrnC6TQB5aib+zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949534; c=relaxed/simple;
	bh=0j8MO98WS2nWKm2BXfVzcNSGmV29FcQHnbGhPy8wkoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQRloxBT40rTA539eHGRMec5+9wI3SgBnYC0k6NQ9L/OdE7jJwGZIMex3mb8qcFQI/jeYyfj/QSN/CXJz7KQMwtdhT/d0IIUbcBVQSRobGwzXxD/yUJ7yNHR51vlP3/ejYk6R4t3kMKZw9bITzOoJhm+r/Hg5y9Yhf57v6tfINI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/+JSQT2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/+JSQT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733949532; x=1765485532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0j8MO98WS2nWKm2BXfVzcNSGmV29FcQHnbGhPy8wkoY=;
  b=L/+JSQT2pnAkU1AcewwG6z8ic2FFbg+tpUTRK2fyw4GE+6aOYAi+0FD+
   otuTWapYBQ5SWn41FtgCU1Bx5a54QCNTVUYPXKUuvwKt8M9ejl7v1+jyA
   k8B+7ly79K9YJ6PkxXYyFVdrSHyvqIGr3nh6e3eZ2EUs2ziFOGzabljfX
   RCEES2L2KHTky87cnz8OXugmLMAptl5jxzGbSwlfo9Ac668UlWSnBMnZc
   He+ojUAHxMF0Ud8Q+RFuw5w3uO8EHZQFKUePDaXUBtfycL43axewyrLTF
   2CmWhFAp383c9ODmpMvOojaGFbzXhmtLimH1x+T7hbUPehh4AaTRkXgW7
   w==;
X-CSE-ConnectionGUID: LzgAKWl5StCtyY6qYiQTdw==
X-CSE-MsgGUID: RW51f1oSRyyRFksPls3B9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="44960980"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="44960980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 12:38:52 -0800
X-CSE-ConnectionGUID: yFhafPjYQWGcaZ3wzBekiA==
X-CSE-MsgGUID: cs0WqEnSRs+9tQTSL5CDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96445426"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 12:38:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLTTs-000745-0O;
	Wed, 11 Dec 2024 20:38:48 +0000
Date: Thu, 12 Dec 2024 04:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Colberg <peter.colberg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Xu Yilun <yilun.xu@linux.intel.com>,
	Matthew Gerlach <matthew.gerlach@linux.intel.com>,
	Basheer Ahmed Muddebihal <basheer.ahmed.muddebihal@linux.intel.com>
Subject: [linux-next:master 2633/3192] drivers/fpga/dfl.c:165: warning:
 Excess function parameter 'pdev' description in 'dfl_fpga_port_ops_get'
Message-ID: <202412120419.feBcUVKu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 685126c76d55b469737b65d465620a2edcf81a99 [2633/3192] fpga: dfl: pass feature platform data instead of device as argument
config: arc-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120419.feBcUVKu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120419.feBcUVKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120419.feBcUVKu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fpga/dfl.c:165: warning: Function parameter or struct member 'pdata' not described in 'dfl_fpga_port_ops_get'
>> drivers/fpga/dfl.c:165: warning: Excess function parameter 'pdev' description in 'dfl_fpga_port_ops_get'
   drivers/fpga/dfl.c:231: warning: Function parameter or struct member 'pdata' not described in 'dfl_fpga_check_port_id'
>> drivers/fpga/dfl.c:231: warning: Excess function parameter 'pdev' description in 'dfl_fpga_check_port_id'


vim +165 drivers/fpga/dfl.c

6e8fd6e493bfca8 Wu Hao        2018-06-30  156  
6e8fd6e493bfca8 Wu Hao        2018-06-30  157  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  158   * dfl_fpga_port_ops_get - get matched port ops from the global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  159   * @pdev: platform device to match with associated port ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  160   * Return: matched port ops on success, NULL otherwise.
6e8fd6e493bfca8 Wu Hao        2018-06-30  161   *
6e8fd6e493bfca8 Wu Hao        2018-06-30  162   * Please note that must dfl_fpga_port_ops_put after use the port_ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  163   */
685126c76d55b46 Peter Colberg 2024-11-19  164  struct dfl_fpga_port_ops *dfl_fpga_port_ops_get(struct dfl_feature_platform_data *pdata)
6e8fd6e493bfca8 Wu Hao        2018-06-30 @165  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  166  	struct dfl_fpga_port_ops *ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  167  
6e8fd6e493bfca8 Wu Hao        2018-06-30  168  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  169  	if (list_empty(&dfl_port_ops_list))
6e8fd6e493bfca8 Wu Hao        2018-06-30  170  		goto done;
6e8fd6e493bfca8 Wu Hao        2018-06-30  171  
6e8fd6e493bfca8 Wu Hao        2018-06-30  172  	list_for_each_entry(ops, &dfl_port_ops_list, node) {
6e8fd6e493bfca8 Wu Hao        2018-06-30  173  		/* match port_ops using the name of platform device */
685126c76d55b46 Peter Colberg 2024-11-19  174  		if (!strcmp(pdata->dev->name, ops->name)) {
6e8fd6e493bfca8 Wu Hao        2018-06-30  175  			if (!try_module_get(ops->owner))
6e8fd6e493bfca8 Wu Hao        2018-06-30  176  				ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  177  			goto done;
6e8fd6e493bfca8 Wu Hao        2018-06-30  178  		}
6e8fd6e493bfca8 Wu Hao        2018-06-30  179  	}
6e8fd6e493bfca8 Wu Hao        2018-06-30  180  
6e8fd6e493bfca8 Wu Hao        2018-06-30  181  	ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  182  done:
6e8fd6e493bfca8 Wu Hao        2018-06-30  183  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  184  	return ops;
6e8fd6e493bfca8 Wu Hao        2018-06-30  185  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  186  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_get);
6e8fd6e493bfca8 Wu Hao        2018-06-30  187  
6e8fd6e493bfca8 Wu Hao        2018-06-30  188  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  189   * dfl_fpga_port_ops_put - put port ops
6e8fd6e493bfca8 Wu Hao        2018-06-30  190   * @ops: port ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  191   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  192  void dfl_fpga_port_ops_put(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  193  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  194  	if (ops && ops->owner)
6e8fd6e493bfca8 Wu Hao        2018-06-30  195  		module_put(ops->owner);
6e8fd6e493bfca8 Wu Hao        2018-06-30  196  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  197  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_put);
6e8fd6e493bfca8 Wu Hao        2018-06-30  198  
6e8fd6e493bfca8 Wu Hao        2018-06-30  199  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  200   * dfl_fpga_port_ops_add - add port_ops to global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  201   * @ops: port ops to add.
6e8fd6e493bfca8 Wu Hao        2018-06-30  202   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  203  void dfl_fpga_port_ops_add(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  204  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  205  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  206  	list_add_tail(&ops->node, &dfl_port_ops_list);
6e8fd6e493bfca8 Wu Hao        2018-06-30  207  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  208  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  209  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_add);
6e8fd6e493bfca8 Wu Hao        2018-06-30  210  
6e8fd6e493bfca8 Wu Hao        2018-06-30  211  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  212   * dfl_fpga_port_ops_del - remove port_ops from global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  213   * @ops: port ops to del.
6e8fd6e493bfca8 Wu Hao        2018-06-30  214   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  215  void dfl_fpga_port_ops_del(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  216  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  217  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  218  	list_del(&ops->node);
6e8fd6e493bfca8 Wu Hao        2018-06-30  219  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  220  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  221  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_del);
6e8fd6e493bfca8 Wu Hao        2018-06-30  222  
d06b004b99c9608 Wu Hao        2018-06-30  223  /**
d06b004b99c9608 Wu Hao        2018-06-30  224   * dfl_fpga_check_port_id - check the port id
d06b004b99c9608 Wu Hao        2018-06-30  225   * @pdev: port platform device.
d06b004b99c9608 Wu Hao        2018-06-30  226   * @pport_id: port id to compare.
d06b004b99c9608 Wu Hao        2018-06-30  227   *
d06b004b99c9608 Wu Hao        2018-06-30  228   * Return: 1 if port device matches with given port id, otherwise 0.
d06b004b99c9608 Wu Hao        2018-06-30  229   */
685126c76d55b46 Peter Colberg 2024-11-19  230  int dfl_fpga_check_port_id(struct dfl_feature_platform_data *pdata, void *pport_id)
d06b004b99c9608 Wu Hao        2018-06-30 @231  {
69bb18ddfc4331b Wu Hao        2019-08-04  232  	struct dfl_fpga_port_ops *port_ops;
69bb18ddfc4331b Wu Hao        2019-08-04  233  
69bb18ddfc4331b Wu Hao        2019-08-04  234  	if (pdata->id != FEATURE_DEV_ID_UNUSED)
69bb18ddfc4331b Wu Hao        2019-08-04  235  		return pdata->id == *(int *)pport_id;
d06b004b99c9608 Wu Hao        2018-06-30  236  
685126c76d55b46 Peter Colberg 2024-11-19  237  	port_ops = dfl_fpga_port_ops_get(pdata);
d06b004b99c9608 Wu Hao        2018-06-30  238  	if (!port_ops || !port_ops->get_id)
d06b004b99c9608 Wu Hao        2018-06-30  239  		return 0;
d06b004b99c9608 Wu Hao        2018-06-30  240  
685126c76d55b46 Peter Colberg 2024-11-19  241  	pdata->id = port_ops->get_id(pdata);
d06b004b99c9608 Wu Hao        2018-06-30  242  	dfl_fpga_port_ops_put(port_ops);
d06b004b99c9608 Wu Hao        2018-06-30  243  
69bb18ddfc4331b Wu Hao        2019-08-04  244  	return pdata->id == *(int *)pport_id;
d06b004b99c9608 Wu Hao        2018-06-30  245  }
d06b004b99c9608 Wu Hao        2018-06-30  246  EXPORT_SYMBOL_GPL(dfl_fpga_check_port_id);
d06b004b99c9608 Wu Hao        2018-06-30  247  

:::::: The code at line 165 was first introduced by commit
:::::: 6e8fd6e493bfca83021cc6a8fd86d7f69bd14fc6 fpga: dfl: add dfl_fpga_port_ops support.

:::::: TO: Wu Hao <hao.wu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
