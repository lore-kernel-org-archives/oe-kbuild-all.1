Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAA1EC4D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954176; cv=none; b=YUw1qbIA9YQCat29ul0Q5/mtWQYHB4pruSmwKCsc/jRhw700UzCUCeV8d/b5x0jDLJ3N+Vxb9kXuXeu5BY02M2ULNxLlQehgAq4sAzPz2KuZhKqlL54tqqvfWb7V0T/O5dkOlZHsdQ+9m1wpPnLD9VpOPAHFoSELkepBhWKg1bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954176; c=relaxed/simple;
	bh=uzt0sKe3OwIe20ju4ArEyhot0uI91ACFQIGfL40R+EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ayeWe0ldNDVraGinUcCgTNihbK3rgWCG02D0SXmpMzZtC0M6I36zcVCXw6JLTLy6XoY74d3KR8clD7wkke5WLEq/P0JyeInweR/0Ewj4yk8+0TaiQ+jzP3EsQfB1Cz/Qi4GyrOzL+HOCBWIPB+3k2gFwoViT8ckE+idguw6iNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXohWFJf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXohWFJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733954175; x=1765490175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzt0sKe3OwIe20ju4ArEyhot0uI91ACFQIGfL40R+EQ=;
  b=AXohWFJfDqjXOjiMLeFk++fDf16sZq1skpsWfUJdLQgmDUZL+C6u9UKu
   crmcXtHCCcbVxtLPWcL6cQy8j4LMihuz/JpPKfJbOsKnQQ8l19wyg8Vnp
   6dc8R45joTKwOUvKle7tYcxRnHBHg7Bw+ggldraX4epCEaIVZaZd3oD3T
   uov5+ReFiIfH1eahBLrlOfZUigzo4vAcyfNm6gDzkfkcRty0/lCkko1XE
   knywo/aXHb7FGYMFXoeU8v0pKhfcH9Gle/B6JECpSR4sWPp21DtNSWhqn
   D+K0Vah+ruqnRs69yR9LY6ruEQSe8Urdo9vz6F7WPe/yToK8yzaWDYLzf
   A==;
X-CSE-ConnectionGUID: n5H4tU5YQMKBPTxk+lHo4A==
X-CSE-MsgGUID: 9bEhcSEAQpWwjEnlv0kh8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34272978"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34272978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:56:11 -0800
X-CSE-ConnectionGUID: ncDWFKXvSf2qkYF3tDCAEQ==
X-CSE-MsgGUID: pdjdvUgMRauI8hWtqdwlvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96473441"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 13:56:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUgh-000783-0N;
	Wed, 11 Dec 2024 21:56:07 +0000
Date: Thu, 12 Dec 2024 05:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Colberg <peter.colberg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Xu Yilun <yilun.xu@linux.intel.com>,
	Matthew Gerlach <matthew.gerlach@linux.intel.com>,
	Basheer Ahmed Muddebihal <basheer.ahmed.muddebihal@linux.intel.com>
Subject: [linux-next:master 2636/3192] drivers/fpga/dfl.c:154: warning:
 Function parameter or struct member 'fdata' not described in
 'dfl_fpga_port_ops_get'
Message-ID: <202412120500.aF6jnlmu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: a25cd37037c85376db766444f060425d2f55c511 [2636/3192] fpga: dfl: refactor internal DFL APIs to take/return feature device data
config: arc-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120500.aF6jnlmu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120500.aF6jnlmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120500.aF6jnlmu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/dfl.c:154: warning: Function parameter or struct member 'fdata' not described in 'dfl_fpga_port_ops_get'
   drivers/fpga/dfl.c:154: warning: Excess function parameter 'pdev' description in 'dfl_fpga_port_ops_get'
>> drivers/fpga/dfl.c:220: warning: Function parameter or struct member 'fdata' not described in 'dfl_fpga_check_port_id'
   drivers/fpga/dfl.c:220: warning: Excess function parameter 'pdev' description in 'dfl_fpga_check_port_id'


vim +154 drivers/fpga/dfl.c

6e8fd6e493bfca8 Wu Hao        2018-06-30  145  
6e8fd6e493bfca8 Wu Hao        2018-06-30  146  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  147   * dfl_fpga_port_ops_get - get matched port ops from the global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  148   * @pdev: platform device to match with associated port ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  149   * Return: matched port ops on success, NULL otherwise.
6e8fd6e493bfca8 Wu Hao        2018-06-30  150   *
6e8fd6e493bfca8 Wu Hao        2018-06-30  151   * Please note that must dfl_fpga_port_ops_put after use the port_ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  152   */
a25cd37037c8537 Peter Colberg 2024-11-19  153  struct dfl_fpga_port_ops *dfl_fpga_port_ops_get(struct dfl_feature_dev_data *fdata)
6e8fd6e493bfca8 Wu Hao        2018-06-30 @154  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  155  	struct dfl_fpga_port_ops *ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  156  
6e8fd6e493bfca8 Wu Hao        2018-06-30  157  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  158  	if (list_empty(&dfl_port_ops_list))
6e8fd6e493bfca8 Wu Hao        2018-06-30  159  		goto done;
6e8fd6e493bfca8 Wu Hao        2018-06-30  160  
6e8fd6e493bfca8 Wu Hao        2018-06-30  161  	list_for_each_entry(ops, &dfl_port_ops_list, node) {
6e8fd6e493bfca8 Wu Hao        2018-06-30  162  		/* match port_ops using the name of platform device */
a25cd37037c8537 Peter Colberg 2024-11-19  163  		if (!strcmp(fdata->dev->name, ops->name)) {
6e8fd6e493bfca8 Wu Hao        2018-06-30  164  			if (!try_module_get(ops->owner))
6e8fd6e493bfca8 Wu Hao        2018-06-30  165  				ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  166  			goto done;
6e8fd6e493bfca8 Wu Hao        2018-06-30  167  		}
6e8fd6e493bfca8 Wu Hao        2018-06-30  168  	}
6e8fd6e493bfca8 Wu Hao        2018-06-30  169  
6e8fd6e493bfca8 Wu Hao        2018-06-30  170  	ops = NULL;
6e8fd6e493bfca8 Wu Hao        2018-06-30  171  done:
6e8fd6e493bfca8 Wu Hao        2018-06-30  172  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  173  	return ops;
6e8fd6e493bfca8 Wu Hao        2018-06-30  174  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  175  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_get);
6e8fd6e493bfca8 Wu Hao        2018-06-30  176  
6e8fd6e493bfca8 Wu Hao        2018-06-30  177  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  178   * dfl_fpga_port_ops_put - put port ops
6e8fd6e493bfca8 Wu Hao        2018-06-30  179   * @ops: port ops.
6e8fd6e493bfca8 Wu Hao        2018-06-30  180   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  181  void dfl_fpga_port_ops_put(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  182  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  183  	if (ops && ops->owner)
6e8fd6e493bfca8 Wu Hao        2018-06-30  184  		module_put(ops->owner);
6e8fd6e493bfca8 Wu Hao        2018-06-30  185  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  186  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_put);
6e8fd6e493bfca8 Wu Hao        2018-06-30  187  
6e8fd6e493bfca8 Wu Hao        2018-06-30  188  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  189   * dfl_fpga_port_ops_add - add port_ops to global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  190   * @ops: port ops to add.
6e8fd6e493bfca8 Wu Hao        2018-06-30  191   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  192  void dfl_fpga_port_ops_add(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  193  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  194  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  195  	list_add_tail(&ops->node, &dfl_port_ops_list);
6e8fd6e493bfca8 Wu Hao        2018-06-30  196  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  197  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  198  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_add);
6e8fd6e493bfca8 Wu Hao        2018-06-30  199  
6e8fd6e493bfca8 Wu Hao        2018-06-30  200  /**
6e8fd6e493bfca8 Wu Hao        2018-06-30  201   * dfl_fpga_port_ops_del - remove port_ops from global list
6e8fd6e493bfca8 Wu Hao        2018-06-30  202   * @ops: port ops to del.
6e8fd6e493bfca8 Wu Hao        2018-06-30  203   */
6e8fd6e493bfca8 Wu Hao        2018-06-30  204  void dfl_fpga_port_ops_del(struct dfl_fpga_port_ops *ops)
6e8fd6e493bfca8 Wu Hao        2018-06-30  205  {
6e8fd6e493bfca8 Wu Hao        2018-06-30  206  	mutex_lock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  207  	list_del(&ops->node);
6e8fd6e493bfca8 Wu Hao        2018-06-30  208  	mutex_unlock(&dfl_port_ops_mutex);
6e8fd6e493bfca8 Wu Hao        2018-06-30  209  }
6e8fd6e493bfca8 Wu Hao        2018-06-30  210  EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_del);
6e8fd6e493bfca8 Wu Hao        2018-06-30  211  
d06b004b99c9608 Wu Hao        2018-06-30  212  /**
d06b004b99c9608 Wu Hao        2018-06-30  213   * dfl_fpga_check_port_id - check the port id
d06b004b99c9608 Wu Hao        2018-06-30  214   * @pdev: port platform device.
d06b004b99c9608 Wu Hao        2018-06-30  215   * @pport_id: port id to compare.
d06b004b99c9608 Wu Hao        2018-06-30  216   *
d06b004b99c9608 Wu Hao        2018-06-30  217   * Return: 1 if port device matches with given port id, otherwise 0.
d06b004b99c9608 Wu Hao        2018-06-30  218   */
a25cd37037c8537 Peter Colberg 2024-11-19  219  int dfl_fpga_check_port_id(struct dfl_feature_dev_data *fdata, void *pport_id)
d06b004b99c9608 Wu Hao        2018-06-30 @220  {
69bb18ddfc4331b Wu Hao        2019-08-04  221  	struct dfl_fpga_port_ops *port_ops;
69bb18ddfc4331b Wu Hao        2019-08-04  222  
a25cd37037c8537 Peter Colberg 2024-11-19  223  	if (fdata->id != FEATURE_DEV_ID_UNUSED)
a25cd37037c8537 Peter Colberg 2024-11-19  224  		return fdata->id == *(int *)pport_id;
d06b004b99c9608 Wu Hao        2018-06-30  225  
a25cd37037c8537 Peter Colberg 2024-11-19  226  	port_ops = dfl_fpga_port_ops_get(fdata);
d06b004b99c9608 Wu Hao        2018-06-30  227  	if (!port_ops || !port_ops->get_id)
d06b004b99c9608 Wu Hao        2018-06-30  228  		return 0;
d06b004b99c9608 Wu Hao        2018-06-30  229  
a25cd37037c8537 Peter Colberg 2024-11-19  230  	fdata->id = port_ops->get_id(fdata);
d06b004b99c9608 Wu Hao        2018-06-30  231  	dfl_fpga_port_ops_put(port_ops);
d06b004b99c9608 Wu Hao        2018-06-30  232  
a25cd37037c8537 Peter Colberg 2024-11-19  233  	return fdata->id == *(int *)pport_id;
d06b004b99c9608 Wu Hao        2018-06-30  234  }
d06b004b99c9608 Wu Hao        2018-06-30  235  EXPORT_SYMBOL_GPL(dfl_fpga_check_port_id);
d06b004b99c9608 Wu Hao        2018-06-30  236  

:::::: The code at line 154 was first introduced by commit
:::::: 6e8fd6e493bfca83021cc6a8fd86d7f69bd14fc6 fpga: dfl: add dfl_fpga_port_ops support.

:::::: TO: Wu Hao <hao.wu@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
