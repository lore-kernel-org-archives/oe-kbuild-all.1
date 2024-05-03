Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6453154421
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744359; cv=none; b=R/cufMHv3pYcczntGALip249AGPfUoFgM1Ch0Aj98kGFld/cPv05sPZSIxiSAGHs2yEHJ5TsGF+CVR6veBo+q+L/5WNi28pzJPBQXMIW1vo3R7rG1GLI1f1hvn79KL5cV7O+a9Up4zcyo9aYihivJXz5Yn9+YMrrzb2oTkiVcz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744359; c=relaxed/simple;
	bh=R1rdVEDwtFq4VcJrSY0nNmqls+MgMmMkrv0tno1bSvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLF5bD7YLurB5Hkg03M9cRzXAJOLB6fEWsgiE4u2lrycmU+BV7S6hDRk3bONsbDJv2l/4BlOSigPCOz1Sj575b2scRzWpDq+LwNvc8tX3Kzmn/dNut/h4wa5G6qtsXFKAdHD3k5fe7/g4ZQHjFmo3pTs0IUSTJWWJ4zniOnCMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtieOID5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtieOID5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744358; x=1746280358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1rdVEDwtFq4VcJrSY0nNmqls+MgMmMkrv0tno1bSvI=;
  b=dtieOID5K5vvjrFHphR+k7Gvh2UwSPMorcKc2KeHPZ/LLDwVvFBPppbs
   khudN9hzPPcGLh/cC+Q7N2aIOwf3XBnW7eGFOU6dsLcM9EDy430/t9Fc3
   RgN9Kib8up+/yXpO9oVRTgqjpUF/yoXhHrmwXdNkUqeGngWHaxmgAnVl8
   Eg5u4H6CLIDH9c97w2YY96LgoXp2yGizif+gGefxY4OS4svElmmWLSu6D
   O0licyVWWgRy9SbZp8SEc6Xd3qS2SbcSjvP8wHhTRSUdz+qR03w9SFa7I
   bU55f0sAgJD5c8vu7G2qCG5FqlIpfUk3wUU6fcJLe9bkC89FDCSYcsV8O
   g==;
X-CSE-ConnectionGUID: U9v8sJdNRbmSb1p2y8dAUQ==
X-CSE-MsgGUID: krFCnCvcS6qTh826vSAD1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10714418"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10714418"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:36 -0700
X-CSE-ConnectionGUID: 3w+nzlMYS9unUmolHg1f0A==
X-CSE-MsgGUID: fn4JWNhnR+KI6sfroOFmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27481252"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 06:52:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tKy-000Bk9-1k;
	Fri, 03 May 2024 13:52:32 +0000
Date: Fri, 3 May 2024 21:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 734/1143] drivers/i3c/master.c:2965:46:
 warning: 'struct i3c_target_ops' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202405032116.as36qvxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 5214fc6577c9205367510a3e0e6b80200bf47fe7 [734/1143] i3c: Add BCR and DCR properties
config: arc-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032116.as36qvxq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032116.as36qvxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032116.as36qvxq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master.c:2869:1: error: version control conflict marker in file
    2869 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_bus_cleanup':
   drivers/i3c/master.c:2878:19: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2878 |         if (master->target_ops->bus_cleanup)
         |                   ^~
   drivers/i3c/master.c:2879:23: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2879 |                 master->target_ops->bus_cleanup(master);
         |                       ^~
   drivers/i3c/master.c: In function 'i3c_target_register_new_i3c_dev':
   drivers/i3c/master.c:2922:32: error: 'i3c_target_device_type' undeclared (first use in this function); did you mean 'i3c_target_device_release'?
    2922 |         desc->dev->dev.type = &i3c_target_device_type;
         |                                ^~~~~~~~~~~~~~~~~~~~~~
         |                                i3c_target_device_release
   drivers/i3c/master.c:2922:32: note: each undeclared identifier is reported only once for each function it appears in
   drivers/i3c/master.c: At top level:
>> drivers/i3c/master.c:2965:46: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    2965 | static int i3c_target_check_ops(const struct i3c_target_ops *ops)
         |                                              ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_check_ops':
   drivers/i3c/master.c:2967:25: error: invalid use of undefined type 'const struct i3c_target_ops'
    2967 |         if (!ops || !ops->bus_init)
         |                         ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2974:38: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    2974 |                         const struct i3c_target_ops *ops)
         |                                      ^~~~~~~~~~~~~~
>> drivers/i3c/master.c:2973:5: warning: no previous prototype for 'i3c_target_register' [-Wmissing-prototypes]
    2973 | int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_register':
   drivers/i3c/master.c:2980:36: error: passing argument 1 of 'i3c_target_check_ops' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2980 |         ret = i3c_target_check_ops(ops);
         |                                    ^~~
         |                                    |
         |                                    const struct i3c_target_ops *
   drivers/i3c/master.c:2965:62: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    2965 | static int i3c_target_check_ops(const struct i3c_target_ops *ops)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/i3c/master.c:2988:15: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2988 |         master->target_ops = ops;
         |               ^~
   drivers/i3c/master.c:3006:15: error: implicit declaration of function 'i3c_target_bus_init'; did you mean 'i3c_master_bus_init'? [-Werror=implicit-function-declaration]
    3006 |         ret = i3c_target_bus_init(master);
         |               ^~~~~~~~~~~~~~~~~~~
         |               i3c_master_bus_init
   drivers/i3c/master.c: At top level:
>> drivers/i3c/master.c:3022:5: warning: no previous prototype for 'i3c_target_unregister' [-Wmissing-prototypes]
    3022 | int i3c_target_unregister(struct i3c_master_controller *master)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/i3c/master.c:3032:67: warning: 'struct i3c_target_read_setup' declared inside parameter list will not be visible outside of this definition or declaration
    3032 | int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/i3c/master.c:3032:5: warning: no previous prototype for 'i3c_target_read_register' [-Wmissing-prototypes]
    3032 | int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_read_register':
   drivers/i3c/master.c:3034:18: error: 'struct i3c_dev_desc' has no member named 'target_info'
    3034 |         dev->desc->target_info.read_handler = setup->handler;
         |                  ^~
   drivers/i3c/master.c:3034:52: error: invalid use of undefined type 'const struct i3c_target_read_setup'
    3034 |         dev->desc->target_info.read_handler = setup->handler;
         |                                                    ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3043:31: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    3043 |                  const struct i3c_target_ops *target_ops,
         |                               ^~~~~~~~~~~~~~
>> drivers/i3c/master.c:3040:5: warning: no previous prototype for 'i3c_register' [-Wmissing-prototypes]
    3040 | int i3c_register(struct i3c_master_controller *master,
         |     ^~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_register':
   drivers/i3c/master.c:3053:23: error: 'struct i3c_master_controller' has no member named 'target'
    3053 |                 master->target = true;
         |                       ^~
   drivers/i3c/master.c:3054:60: error: passing argument 3 of 'i3c_target_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3054 |                 return i3c_target_register(master, parent, target_ops);
         |                                                            ^~~~~~~~~~
         |                                                            |
         |                                                            const struct i3c_target_ops *
   drivers/i3c/master.c:2974:54: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    2974 |                         const struct i3c_target_ops *ops)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/i3c/master.c: At top level:
>> drivers/i3c/master.c:3061:5: warning: no previous prototype for 'i3c_unregister' [-Wmissing-prototypes]
    3061 | int i3c_unregister(struct i3c_master_controller *master)
         |     ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_unregister':
   drivers/i3c/master.c:3063:19: error: 'struct i3c_master_controller' has no member named 'target'
    3063 |         if (master->target)
         |                   ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3072:1: error: version control conflict marker in file
    3072 | >>>>>>> i3c: Add BCR and DCR properties
         | ^~~~~~~
   cc1: some warnings being treated as errors


vim +2965 drivers/i3c/master.c

  2964	
> 2965	static int i3c_target_check_ops(const struct i3c_target_ops *ops)
  2966	{
  2967		if (!ops || !ops->bus_init)
  2968			return -EINVAL;
  2969	
  2970		return 0;
  2971	}
  2972	
> 2973	int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
  2974				const struct i3c_target_ops *ops)
  2975	{
  2976		struct i3c_bus *i3cbus = i3c_master_get_bus(master);
  2977		struct i3c_device_info info;
  2978		int ret;
  2979	
  2980		ret = i3c_target_check_ops(ops);
  2981		if (ret)
  2982			return ret;
  2983	
  2984		master->dev.parent = parent;
  2985		master->dev.of_node = of_node_get(parent->of_node);
  2986		master->dev.bus = &i3c_bus_type;
  2987		master->dev.release = i3c_targetdev_release;
  2988		master->target_ops = ops;
  2989		i3cbus->mode = I3C_BUS_MODE_PURE;
  2990	
  2991		ret = i3c_bus_init(i3cbus, master->dev.of_node);
  2992		if (ret)
  2993			return ret;
  2994	
  2995		device_initialize(&master->dev);
  2996		dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
  2997	
  2998		ret = device_add(&master->dev);
  2999		if (ret)
  3000			goto err_put_device;
  3001	
  3002		i3c_target_read_device_info(master->dev.of_node, &info);
  3003	
  3004		i3c_target_register_new_i3c_dev(master, info);
  3005	
  3006		ret = i3c_target_bus_init(master);
  3007		if (ret)
  3008			goto err_cleanup_bus;
  3009	
  3010		return 0;
  3011	
  3012	err_cleanup_bus:
  3013		i3c_target_bus_cleanup(master);
  3014	
  3015	err_put_device:
  3016		put_device(&master->dev);
  3017	
  3018		return ret;
  3019	}
  3020	EXPORT_SYMBOL_GPL(i3c_target_register);
  3021	
> 3022	int i3c_target_unregister(struct i3c_master_controller *master)
  3023	{
  3024		i3c_target_unregister_i3c_dev(master);
  3025		i3c_target_bus_cleanup(master);
  3026		device_unregister(&master->dev);
  3027	
  3028		return 0;
  3029	}
  3030	EXPORT_SYMBOL_GPL(i3c_target_unregister);
  3031	
> 3032	int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
  3033	{
  3034		dev->desc->target_info.read_handler = setup->handler;
  3035	
  3036		return 0;
  3037	}
  3038	EXPORT_SYMBOL_GPL(i3c_target_read_register);
  3039	
> 3040	int i3c_register(struct i3c_master_controller *master,
  3041			 struct device *parent,
  3042			 const struct i3c_master_controller_ops *master_ops,
  3043			 const struct i3c_target_ops *target_ops,
  3044			 bool secondary)
  3045	{
  3046		const char *role;
  3047		int ret;
  3048	
  3049		ret = of_property_read_string(parent->of_node, "initial-role", &role);
  3050		if (ret || !strcmp("primary", role)) {
  3051			return i3c_master_register(master, parent, master_ops, secondary);
  3052		} else if (!strcmp("target", role)) {
  3053			master->target = true;
  3054			return i3c_target_register(master, parent, target_ops);
  3055		} else {
  3056			return -EOPNOTSUPP;
  3057		}
  3058	}
  3059	EXPORT_SYMBOL_GPL(i3c_register);
  3060	
> 3061	int i3c_unregister(struct i3c_master_controller *master)
  3062	{
  3063		if (master->target)
  3064			i3c_target_unregister(master);
  3065		else
  3066			i3c_master_unregister(master);
  3067	
  3068		return 0;
  3069	}
  3070	EXPORT_SYMBOL_GPL(i3c_unregister);
  3071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
