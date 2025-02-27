Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8ED270047
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665807; cv=none; b=QpYCQHmu2j7Pg46fvaOVwgEpGE0dUL+VIsiydaLlf1qiMdIzjfqh/hLTct++misf1TCEjtMWNmTL7gkllFPaUTm8lDf4dp6axSODfGYFWmM9jxNLcj2vPEiRqjg+ZkUvtJTwmswlS78zM5KcIOavyaVNYzErAu2b2cyeh2MNdUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665807; c=relaxed/simple;
	bh=pFBRyJ4HpSddUnu40ONW84FL3ETeobU/f1ab3JOveog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvAadH9Kcp3xAo9QZreNHfkWTy3k1lE3XWkVBlDXdsxGHHbBKzzjconsqHojbD2kEfSgY3pSF2mnM3fIT5wJxwu+mwTFB5dcA9wUn1wygD0N7Gb1RrUq57O2sjDsQl/WjK4s7cb9JIOyUt6uU1B4OyKKfTPUCugwsIUF+AE75Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4mFPRrF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4mFPRrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740665805; x=1772201805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFBRyJ4HpSddUnu40ONW84FL3ETeobU/f1ab3JOveog=;
  b=W4mFPRrF++HXspdKCu/yBIat8Li1ZyT32e6lXVTBu0dw5b97bYMZce+6
   S67w+BDbUfyX74m/Ql9y+aoS6bdL+KdG6ddmpvmxtuA2qW2w9ODIjNHG0
   YffNOPADOwrL3RMVtkVf3pT8oyUX69TYLOqa2efxxN2JpqX/as7U/m+9z
   OHplzItLVaikzLqzVtj5asJq8qWodpl4fOk3uDpcze12QXYDH3syolPfZ
   54uycrkKXWz8nryNAIZelJ4oFjuwBpXl7bLVnMJ3dp10XKh57jpYywG0s
   +3SdetMvMVr9OKrwRGWEkSKNC2DGWrR+jveXVr/lk+s6E1InannGCSOgt
   w==;
X-CSE-ConnectionGUID: 8vF/ZESUSDeh4eXMnZAWUA==
X-CSE-MsgGUID: joWf3Uy/TciCSFfrOdFSEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40794891"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40794891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:16:44 -0800
X-CSE-ConnectionGUID: BLVEKYG8SamWsN1a0+iZGQ==
X-CSE-MsgGUID: 9hRKNurCR6WnA+LmMM8aKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121980715"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:16:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnegq-000DTA-2z;
	Thu, 27 Feb 2025 14:16:40 +0000
Date: Thu, 27 Feb 2025 22:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent 7/8] net/devlink/core.c:544:
 warning: Function parameter or struct member 'p_inst' not described in
 '__devlink_shared_alloc'
Message-ID: <202502272225.wEKvjPd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent
head:   072b5ae54eec4100c9b75c542e427614a514a694
commit: 9ee2de4c481c352938b4e3ab2bec1405689ef15e [7/8] devlink: introduce shared allocation
config: riscv-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272225.wEKvjPd2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272225.wEKvjPd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272225.wEKvjPd2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/devlink/core.c:544: warning: Function parameter or struct member 'p_inst' not described in '__devlink_shared_alloc'
>> net/devlink/core.c:544: warning: expecting prototype for devlink_shared_shared(). Prototype was for __devlink_shared_alloc() instead
>> net/devlink/core.c:613: warning: Function parameter or struct member 'inst' not described in 'devlink_shared_free'
>> net/devlink/core.c:644: warning: expecting prototype for devl_shared_inst_priv(). Prototype was for devl_shared_first_inst_priv() instead


vim +544 net/devlink/core.c

   526	
   527	/**
   528	 * devlink_shared_shared - Allocate new shared devlink instance resources
   529	 * @ops: ops
   530	 * @priv_size: size of user private data
   531	 * @net: net namespace
   532	 * @module: module owner
   533	 * @per_module_id: uniqueue id within the module
   534	 * @inst_priv: private pointer of calling instance
   535	 *
   536	 * Allocate new devlink instance resources, including devlink index
   537	 * and name. If instance already exists, just take a reference.
   538	 */
   539	struct devlink *__devlink_shared_alloc(const struct devlink_ops *ops,
   540					       size_t priv_size, struct net *net,
   541					       struct module *module, u64 per_module_id,
   542					       void *inst_priv,
   543					       struct devlink_shared_inst **p_inst)
 > 544	{
   545		char per_module_id_str[sizeof(u64) * 2 + 1];
   546		struct devlink_shared_inst *inst;
   547		struct devlink_shared *sh;
   548		struct devlink *devlink;
   549		unsigned long index;
   550	
   551		if (WARN_ON(!module))
   552			return NULL;
   553	
   554		inst = kmalloc(sizeof(*inst), GFP_KERNEL);
   555		if (!inst)
   556			return NULL;
   557		inst->priv = inst_priv;
   558	
   559		sprintf(per_module_id_str, "%016llx", per_module_id);
   560		devlinks_xa_for_each_get(net, index, devlink) {
   561			sh = devlink->sh;
   562			if (sh &&
   563			    !strcmp(sh->module_name, module_name(module)) &&
   564			    !strcmp(sh->per_module_id_str, per_module_id_str)) {
   565				/* Reference was taken. */
   566				goto list_inst;
   567			}
   568			devlink_put(devlink);
   569		}
   570	
   571		sh = kmalloc(sizeof(*sh), GFP_KERNEL);
   572		if (!sh)
   573			goto err_sh_alloc;
   574		INIT_LIST_HEAD(&sh->inst_list);
   575		sh->module_name = kstrdup(module_name(module), GFP_KERNEL);
   576		if (!sh->module_name)
   577			goto err_module_name_alloc;
   578		sh->per_module_id_str = kstrdup(per_module_id_str, GFP_KERNEL);
   579		if (!sh->per_module_id_str)
   580			goto err_per_module_id_str_alloc;
   581	
   582		devlink = __devlink_alloc_ns(ops, priv_size, net, NULL);
   583		if (!devlink)
   584			goto err_devlink_alloc;
   585		devlink->sh = sh;
   586	
   587	list_inst:
   588		devl_lock(devlink);
   589		list_add_tail(&sh->inst_list, &inst->list);
   590		devl_unlock(devlink);
   591		*p_inst = inst;
   592		return devlink;
   593	
   594	err_devlink_alloc:
   595		kfree(sh->per_module_id_str);
   596	err_per_module_id_str_alloc:
   597		kfree(sh->module_name);
   598	err_module_name_alloc:
   599		kfree(sh);
   600	err_sh_alloc:
   601		kfree(inst);
   602		return NULL;
   603	}
   604	EXPORT_SYMBOL_GPL(__devlink_shared_alloc);
   605	
   606	/**
   607	 * devlink_shared_free - Free shared devlink instance resources
   608	 *
   609	 * @devlink: devlink
   610	 */
   611	void devlink_shared_free(struct devlink *devlink,
   612				 struct devlink_shared_inst *inst)
 > 613	{
   614		devl_lock(devlink);
   615		list_del(&inst->list);
   616		devl_unlock(devlink);
   617	
   618		devlink_put(devlink);
   619	}
   620	EXPORT_SYMBOL_GPL(devlink_shared_free);
   621	
   622	static struct devlink_shared_inst *
   623	devl_shared_first_inst(struct devlink *devlink)
   624	{
   625		struct devlink_shared_inst *inst;
   626	
   627		if (!WARN_ON(devlink->sh))
   628			return NULL;
   629		inst = list_first_entry_or_null(&devlink->sh->inst_list,
   630						struct devlink_shared_inst, list);
   631		WARN_ON(!inst);
   632		return inst;
   633	}
   634	
   635	/**
   636	 * devl_shared_inst_priv - Get priv pointer of nested instance
   637	 * @devlink: devlink
   638	 *
   639	 * Returns priv pointer of one of the nested instances sharing
   640	 * this devlink. Callee should not care which, all should be
   641	 * equal from the callee perspective. If not, something is wrong.
   642	 */
   643	void *devl_shared_first_inst_priv(struct devlink *devlink)
 > 644	{
   645		return devl_shared_first_inst(devlink)->priv;
   646	}
   647	EXPORT_SYMBOL_GPL(devl_shared_first_inst_priv);
   648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
