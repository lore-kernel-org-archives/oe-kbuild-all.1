Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0370B2C3245
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 02:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878010; cv=none; b=hxseymKND+NDH7Th9KoEF7wcEnVkiGWKvpM0ZOq5voiJm4OKCV06nEV7hoTDUmqk/RL5ieW8QtAeiHzbCpk+3Spm/QNukkHpWljOdVYGOUH+0i8nuDxXys8s1H2xk8JsDFZyGO6+mZKG3fwAWTqZ0j38maBglKpTTuxMAYdFQss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878010; c=relaxed/simple;
	bh=0Sa3rtsMcnlHD+Wq/u6YrsmUls5CACSdsMlW42snsuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZKpPjd8XZxu5JNlN8g8wv/2t9nN7P5ClrvzrJeROt1Km4lwdRm5xJwnoXLWBzKJ8JTAM9FFYv/u14GhA8b6Dt1NlSRbo8SneJfb5hrsB6QwLBDAMOvh5hqvnoKtfEmiUrTyvZoLIp5Y2W0B/s3Sy+54daJYSeUWHCbBwUqux7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHQ0Pltb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHQ0Pltb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761878006; x=1793414006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Sa3rtsMcnlHD+Wq/u6YrsmUls5CACSdsMlW42snsuE=;
  b=MHQ0PltbBIrg/dEo/cOhCr0MM+GlkQ1Y6ghl6KrJELnIt4SoEfU0gC4c
   HZcETENBfYkkeNlbauSxBwbnPcipm2t3nSApPlUbD3kV1aiysL/l2nKxC
   57o2NXtE0XStU6o9wceLUptjCA6jQs02s8gaI/2iO6Cocm9hDsZBwsiNq
   nRO5gk0s86I2dqoYncWEYNnEyRvyJOFNPWrqfZ6qDSwmGUAEJ1Mt+BCBz
   T331t700F4VPULePnseikUNOJgR4TcOmB0yqp17bYyyz66Ixp07J2uV5F
   GVo4nT5Rllyy4AtDQatUwfBdbMZoiOJJscE7YIrPlZcWdIysbGCa/Al5O
   Q==;
X-CSE-ConnectionGUID: ynQ92Rd/QECHiM6lmlYEXQ==
X-CSE-MsgGUID: Tk0WEyNBR4SMpGGL8OKzeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51605765"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="51605765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:33:24 -0700
X-CSE-ConnectionGUID: EDF7bJyUS52lsT1dCQ3xbw==
X-CSE-MsgGUID: Czchs6IpQFm0Uk2OjKwZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190461412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 19:33:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEex6-000MhW-1U;
	Fri, 31 Oct 2025 02:33:20 +0000
Date: Fri, 31 Oct 2025 10:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/ubus_driver.c:52:28:
 warning: no previous prototype for function 'ub_match_id'
Message-ID: <202510311006.ySzc8kCo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: e42bc00975898c42b4b9f1dc88fbb3f0748de8a5 [3075/3075] ub:ubus: Support for ub bus driver framework
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251031/202510311006.ySzc8kCo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311006.ySzc8kCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311006.ySzc8kCo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/ubus_driver.c:52:28: warning: no previous prototype for function 'ub_match_id' [-Wmissing-prototypes]
      52 | const struct ub_device_id *ub_match_id(const struct ub_device_id *ids,
         |                            ^
   drivers/ub/ubus/ubus_driver.c:52:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | const struct ub_device_id *ub_match_id(const struct ub_device_id *ids,
         |       ^
         | static 
>> drivers/ub/ubus/ubus_driver.c:224:6: warning: no previous prototype for function 'ub_bus_type_init' [-Wmissing-prototypes]
     224 | void ub_bus_type_init(void)
         |      ^
   drivers/ub/ubus/ubus_driver.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void ub_bus_type_init(void)
         | ^
         | static 
>> drivers/ub/ubus/ubus_driver.c:233:6: warning: no previous prototype for function 'ub_bus_type_uninit' [-Wmissing-prototypes]
     233 | void ub_bus_type_uninit(void)
         |      ^
   drivers/ub/ubus/ubus_driver.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     233 | void ub_bus_type_uninit(void)
         | ^
         | static 
   3 warnings generated.


vim +/ub_match_id +52 drivers/ub/ubus/ubus_driver.c

    51	
  > 52	const struct ub_device_id *ub_match_id(const struct ub_device_id *ids,
    53					       struct ub_entity *dev)
    54	{
    55		if (ids && dev) {
    56			while (ids->vendor || ids->mod_vendor || ids->class_mask) {
    57				if (ub_match_one_device(ids, dev))
    58					return ids;
    59				ids++;
    60			}
    61		}
    62		return NULL;
    63	}
    64	
    65	static const struct ub_device_id *ub_match_device(struct ub_driver *drv,
    66							  struct ub_entity *dev)
    67	{
    68		const struct ub_device_id *found_id = NULL, *ids;
    69	
    70		/* When driver_override is set, only bind to the matching driver */
    71		if (dev->driver_override && strcmp(dev->driver_override, drv->name))
    72			return NULL;
    73	
    74		for (ids = drv->id_table; (found_id = ub_match_id(ids, dev));
    75		     ids = found_id + 1) {
    76			if (found_id->override_only) {
    77				if (dev->driver_override)
    78					return found_id;
    79			} else {
    80				return found_id;
    81			}
    82		}
    83	
    84		/* driver_override will always match, send a dummy id */
    85		if (dev->driver_override)
    86			return &ub_entity_id_any;
    87	
    88		return NULL;
    89	}
    90	
    91	static int ub_bus_match(struct device *dev, struct device_driver *drv)
    92	{
    93		struct ub_driver *ub_drv = to_ub_driver(drv);
    94		struct ub_entity *ub_entity = to_ub_entity(dev);
    95		const struct ub_device_id *found_id;
    96	
    97		if (!ub_entity->match_driver)
    98			return 0;
    99	
   100		found_id = ub_match_device(ub_drv, ub_entity);
   101		if (found_id)
   102			return 1;
   103	
   104		return 0;
   105	}
   106	
   107	static int ub_call_probe(struct ub_driver *drv, struct ub_entity *dev,
   108				 const struct ub_device_id *id)
   109	{
   110		int ret;
   111	
   112		dev->driver = drv;
   113		/*
   114		 * Probe function should return < 0 for failure, 0 for success
   115		 * Treat values > 0 as success, but warn.
   116		 */
   117		ret = drv->probe(dev, id);
   118		if (ret < 0) {
   119			dev->driver = NULL;
   120			return ret;
   121		} else if (ret > 0) {
   122			ub_warn(dev, "Driver probe function unexpectedly, ret=%d\n",
   123				ret);
   124		}
   125	
   126		return 0;
   127	}
   128	
   129	static int __ub_entity_probe(struct ub_driver *drv, struct ub_entity *dev)
   130	{
   131		const struct ub_device_id *id;
   132		int ret = 0;
   133	
   134		if (drv->probe) {
   135			ret = -ENODEV;
   136	
   137			id = ub_match_device(drv, dev);
   138			if (id)
   139				ret = ub_call_probe(drv, dev, id);
   140		}
   141	
   142		return ret;
   143	}
   144	
   145	static int ub_entity_probe(struct device *dev)
   146	{
   147		struct ub_driver *drv = to_ub_driver(dev->driver);
   148		struct ub_entity *ub_entity = to_ub_entity(dev);
   149		int ret;
   150	
   151		ub_entity_get(ub_entity);
   152		ret = __ub_entity_probe(drv, ub_entity);
   153		if (ret)
   154			ub_entity_put(ub_entity);
   155		return ret;
   156	}
   157	
   158	static void ub_entity_remove(struct device *dev)
   159	{
   160		struct ub_entity *ub_entity = to_ub_entity(dev);
   161		struct ub_driver *drv = ub_entity->driver;
   162	
   163		if (drv->remove)
   164			drv->remove(ub_entity);
   165	
   166		ub_entity->driver = NULL;
   167	
   168		ub_entity_put(ub_entity);
   169	}
   170	
   171	static void ub_entity_shutdown(struct device *dev)
   172	{
   173		struct ub_entity *uent = to_ub_entity(dev);
   174		struct ub_driver *drv = uent->driver;
   175	
   176		ub_dbg(uent, "come shutdown\n");
   177	
   178		pm_runtime_resume(dev);
   179	
   180		if (drv && drv->shutdown)
   181			drv->shutdown(uent);
   182	}
   183	
   184	static int ub_uevent(const struct device *dev, struct kobj_uevent_env *env)
   185	{
   186		struct ub_entity *uent;
   187	
   188		if (!dev)
   189			return -ENODEV;
   190	
   191		uent = to_ub_entity(dev);
   192	
   193		if (add_uevent_var(env, "UB_ID=%04X:%04X", uent_vendor(uent),
   194				   uent_device(uent)))
   195			return -ENOMEM;
   196	
   197		if (add_uevent_var(env, "UB_MODULE=%04X:%04X", uent->mod_vendor,
   198				   uent->module))
   199			return -ENOMEM;
   200	
   201		if (add_uevent_var(env, "UB_TYPE=%01X", uent_type(uent)))
   202			return -ENOMEM;
   203	
   204		if (add_uevent_var(env, "UB_CLASS=%04X", uent_class(uent)))
   205			return -ENOMEM;
   206	
   207		if (add_uevent_var(env, "UB_VERSION=%01X", uent_version(uent)))
   208			return -ENOMEM;
   209	
   210		if (add_uevent_var(env, "UB_SEQ_NUM=%016llX", uent_seq(uent)))
   211			return -ENOMEM;
   212	
   213		if (add_uevent_var(env, "UB_ENTITY_NAME=%s", ub_name(uent)))
   214			return -ENOMEM;
   215	
   216		if (add_uevent_var(env, "MODALIAS=ub:v%04Xd%04Xmv%04Xm%04Xc%04X",
   217				   uent_vendor(uent), uent_device(uent),
   218				   uent->mod_vendor, uent->module, uent_class(uent)))
   219			return -ENOMEM;
   220	
   221		return 0;
   222	}
   223	
 > 224	void ub_bus_type_init(void)
   225	{
   226		ub_bus_type.match = ub_bus_match;
   227		ub_bus_type.uevent = ub_uevent;
   228		ub_bus_type.probe = ub_entity_probe;
   229		ub_bus_type.remove = ub_entity_remove;
   230		ub_bus_type.shutdown = ub_entity_shutdown;
   231	}
   232	
 > 233	void ub_bus_type_uninit(void)
   234	{
   235		ub_bus_type.match = NULL;
   236		ub_bus_type.uevent = NULL;
   237		ub_bus_type.probe = NULL;
   238		ub_bus_type.remove = NULL;
   239		ub_bus_type.shutdown = NULL;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
