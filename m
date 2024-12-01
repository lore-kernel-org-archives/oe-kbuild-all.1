Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628518654
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733040510; cv=none; b=JsxzluttnU9Hd/vLXhkCeWLqr+mbA1pvOAsGMEVCTyQh8vI7uNNP7oGbe9FXbhhJgWdEJ+ynZ0L4IWigZOxxeyWFXVKfYZEH+d9tZ80gxEhEYMqQ98W7/FrEQ/wAxusLMpn4Ibf3JO0enUJhLBORb2I0gbd7pe6AtXpvG0gCzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733040510; c=relaxed/simple;
	bh=h1mSCap/s2OhdrYEqnWMWFsO62k3wvZHKEPwQE3nA0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvGilzXSCDpAjf6OkqcJM+fE9YR1Fh4SXJ3BH/Dp4W/mxzhdWvwC8BOt/XF30P22nhRfB6izjpVCxcBbZALBa2XTDMZctI/1YjptlvG+llsquC/cb0E/0aflrqQ9UV5rxqhSauWa8Y0htjiWi0N59geuzN8hLXNYofQb6yy/tfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aov2tq2t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aov2tq2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733040508; x=1764576508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1mSCap/s2OhdrYEqnWMWFsO62k3wvZHKEPwQE3nA0c=;
  b=aov2tq2tXPm+/ty153EDRUJIbtLctr6UoCwqe4GQJIyOuzhkH+ntd/FV
   AwHTUoldMsEeI+/0Eub2DDoH0gCnFJpWQrlpLHfWzk7G2mhRoaPP03US6
   pKXaNW/+oZlqKgOFW58EEVcqXXvBGZGSuQozGC2bNWLhjGV8vHARGUqlV
   DdsdsxPjJ+NhUH3Km88kUKZNrqOvCJchBHmnS5UrF/lDN6LGxn7VynNht
   kkaUWBhH10YiQ6hlYtZtYUfRSS7CY8Bq77JlkB5fgfzGxZ+fRAPiFGZxQ
   Kgq1GNEGUwEnnOEFbowjmLg1OuJTYNVNEyUFDAhXHTNMRulj/DVGk1oCj
   g==;
X-CSE-ConnectionGUID: h3kr4A+aTfq07NE7Nc+jMw==
X-CSE-MsgGUID: OwAnw4wzQoqNsSYbDt5AHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43696837"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="43696837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:08:26 -0800
X-CSE-ConnectionGUID: lHgt1pULRr2Tj6J7lTe7bA==
X-CSE-MsgGUID: NTQ6FfOQTJiIagVs/qoVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92911250"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Dec 2024 00:08:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHeyn-0001Mv-17;
	Sun, 01 Dec 2024 08:07:09 +0000
Date: Sun, 1 Dec 2024 16:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 25/30] drivers/of/resolver.c:420:9:
 error: implicit declaration of function 'of_changeset_init'
Message-ID: <202412011642.q74M4sGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 6432b35945fe3f299f755399ffb8b0101e508866 [25/30] of: resolver: Add helper to add to __symbols__
config: xtensa-randconfig-r051-20241201 (https://download.01.org/0day-ci/archive/20241201/202412011642.q74M4sGf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011642.q74M4sGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011642.q74M4sGf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/resolver.c:391:5: error: redefinition of 'of_add_resolver_symbol'
     391 | int of_add_resolver_symbol(const char *prefix, const struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/of/resolver.c:15:
   include/linux/of.h:1775:19: note: previous definition of 'of_add_resolver_symbol' with type 'int(const char *, const struct device *, const char *)'
    1775 | static inline int of_add_resolver_symbol(const char *name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/of/resolver.c: In function 'of_add_resolver_symbol':
>> drivers/of/resolver.c:420:9: error: implicit declaration of function 'of_changeset_init' [-Wimplicit-function-declaration]
     420 |         of_changeset_init(cset);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/of/resolver.c:422:15: error: implicit declaration of function 'of_changeset_add_prop_string' [-Wimplicit-function-declaration]
     422 |         ret = of_changeset_add_prop_string(cset, tree_symbols,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/resolver.c:428:15: error: implicit declaration of function 'of_changeset_apply' [-Wimplicit-function-declaration]
     428 |         ret = of_changeset_apply(cset);
         |               ^~~~~~~~~~~~~~~~~~
>> drivers/of/resolver.c:439:9: error: implicit declaration of function 'of_changeset_destroy' [-Wimplicit-function-declaration]
     439 |         of_changeset_destroy(cset);
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/of_changeset_init +420 drivers/of/resolver.c

   375	
   376	/**
   377	 * of_add_resolver_symbol - Add to /__symbols__
   378	 *
   379	 * @prefix: 	First part of symbol
   380	 * @dev:	Device to take the name from
   381	 * @path: 	Path of the symbol in the device tree
   382	 *
   383	 * In order that the overlay resolver can resolve phandles in the
   384	 * overlay to nodes in the base tree, the phandle needs an entry in
   385	 * __symbols__.  When a dynamic node is added, use this helper to add
   386	 * such an entry. The symbol is constructed from the prefix and the
   387	 * device name, which is then mangled to make it DT confirming.
   388	 *
   389	 * Return: %0 on success or a negative error value on error.
   390	 */
 > 391	int of_add_resolver_symbol(const char *prefix, const struct device *dev,
   392				   const char *path)
   393	{
   394		struct device_node *tree_symbols;
   395		struct of_changeset *cset;
   396		char *label, *abs_path = NULL;
   397		int ret;
   398	
   399		tree_symbols = of_find_node_by_path("/__symbols__");
   400		if (!tree_symbols) {
   401			pr_err("no symbols in root of device tree.\n");
   402			return -EINVAL;
   403		}
   404	
   405		label = of_construct_label(prefix, dev);
   406		if (IS_ERR(label))
   407			return PTR_ERR(label);
   408	
   409		if (path[0] != '/') {
   410			abs_path = kasprintf(GFP_KERNEL, "/%s", path);
   411			if (!abs_path)
   412				return -ENOMEM;
   413			path = abs_path;
   414		}
   415	
   416		cset = kmalloc(sizeof(*cset), GFP_KERNEL);
   417		if (!cset)
   418			return -ENOMEM;
   419	
 > 420		of_changeset_init(cset);
   421	
 > 422		ret = of_changeset_add_prop_string(cset, tree_symbols,
   423						   label, path);
   424	
   425		if (ret)
   426			goto out_destroy_cset;
   427	
 > 428	        ret = of_changeset_apply(cset);
   429	        if (ret)
   430	                goto out_destroy_cset;
   431	
   432		of_node_put(tree_symbols);
   433		kfree(label);
   434		kfree(abs_path);
   435	
   436	       return 0;
   437	
   438	 out_destroy_cset:
 > 439	        of_changeset_destroy(cset);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
