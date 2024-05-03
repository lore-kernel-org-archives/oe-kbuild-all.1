Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEF15821F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760455; cv=none; b=UimUb9hjf25GyNQ0DiUNzxd9v4AZCuxJy339AcEg6SME9KXluCvtw9Zf8eqkmvKWr8vyOnj0Z0vgQoyNWFbgqdSxyIMz+LJwEn9+LRifJ46ugVdJzpkio1LHZ0OIwAVEyepRKC4xGmQ5akVqDjvGUXhNAlA0T4Km/F28XAqJc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760455; c=relaxed/simple;
	bh=krUy7XMyw7975B8HBfS8SnVRIAQEvxTvcj/M10tng34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCaptCn71pgagtnxb3jA9IvzeFegB8B7EDx02RDiYffp5CUdBEkOMoqNZB+5uKY1VEGAP0dPoUKqbYlzeKzB0vjRiM44z+hLow2B4arE3UumZ4UlmoobBlEdXBz5ucSX1vjf2g4ftD22ii0+h9vh0Ce9T+L6+bgzBGicIVDVd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTXOmrL1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTXOmrL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714760453; x=1746296453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krUy7XMyw7975B8HBfS8SnVRIAQEvxTvcj/M10tng34=;
  b=UTXOmrL1rjf0S3yBLFMjinRzXCTWRLNf+5n7z9JLcOLezJrcbcnTCdZq
   Y72IjFlri9pkviZ7ZIehTVyv1Xz8O/lil4nQjv7w/fAepoTjZS38aIQV7
   UoTFeTtvcShmGlu9vW3ahuY0H8ng5Q0FVwWyVXOX6zp5jV2c2RmR/5Blv
   oCPXpIqWQdbUFWPqBCTq0F6p7vG27BYLbx6URVodjk2IweNWcGcrJG1nC
   YHPOE+/ksGYK/JKzzzj5XeP3nvawnLUHNoZku2dmcRnIiIHv6p1ilOZc+
   bQcywtVZTG1u71xZuCgqm1KuFfwBfUCcTbEYBapGBJCltXNe2gKzQP8J7
   w==;
X-CSE-ConnectionGUID: TLKoiFCeRMyDliabfptXDg==
X-CSE-MsgGUID: FtuA8zdySQqx58dN1Bp13A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10795907"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10795907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:20:48 -0700
X-CSE-ConnectionGUID: +JcT+jK0SF+6AEk7DOBjkw==
X-CSE-MsgGUID: WVeJ9YyiQjyWVodeknfsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27932038"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 11:20:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2xWW-000Bze-0e;
	Fri, 03 May 2024 18:20:44 +0000
Date: Sat, 4 May 2024 02:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 734/1143] drivers/i3c/master.c:2967:18:
 error: dereferencing pointer to incomplete type 'const struct
 i3c_target_ops'
Message-ID: <202405040221.ZlseXtK2-lkp@intel.com>
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
config: i386-randconfig-004-20240503 (https://download.01.org/0day-ci/archive/20240504/202405040221.ZlseXtK2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040221.ZlseXtK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040221.ZlseXtK2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master.c:2869:1: error: version control conflict marker in file
    <<<<<<< HEAD
    ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_bus_cleanup':
   drivers/i3c/master.c:2878:12: error: 'struct i3c_master_controller' has no member named 'target_ops'
     if (master->target_ops->bus_cleanup)
               ^~
   drivers/i3c/master.c:2879:9: error: 'struct i3c_master_controller' has no member named 'target_ops'
      master->target_ops->bus_cleanup(master);
            ^~
   drivers/i3c/master.c: In function 'i3c_target_register_new_i3c_dev':
   drivers/i3c/master.c:2922:25: error: 'i3c_target_device_type' undeclared (first use in this function); did you mean 'i3c_target_device_release'?
     desc->dev->dev.type = &i3c_target_device_type;
                            ^~~~~~~~~~~~~~~~~~~~~~
                            i3c_target_device_release
   drivers/i3c/master.c:2922:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2965:46: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
                                                 ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_check_ops':
>> drivers/i3c/master.c:2967:18: error: dereferencing pointer to incomplete type 'const struct i3c_target_ops'
     if (!ops || !ops->bus_init)
                     ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2974:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *ops)
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_register':
   drivers/i3c/master.c:2980:29: error: passing argument 1 of 'i3c_target_check_ops' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = i3c_target_check_ops(ops);
                                ^~~
   drivers/i3c/master.c:2965:12: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c:2988:8: error: 'struct i3c_master_controller' has no member named 'target_ops'
     master->target_ops = ops;
           ^~
   drivers/i3c/master.c:3006:8: error: implicit declaration of function 'i3c_target_bus_init'; did you mean 'i3c_master_bus_init'? [-Werror=implicit-function-declaration]
     ret = i3c_target_bus_init(master);
           ^~~~~~~~~~~~~~~~~~~
           i3c_master_bus_init
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3032:67: warning: 'struct i3c_target_read_setup' declared inside parameter list will not be visible outside of this definition or declaration
    int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
                                                                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_read_register':
   drivers/i3c/master.c:3034:11: error: 'struct i3c_dev_desc' has no member named 'target_info'
     dev->desc->target_info.read_handler = setup->handler;
              ^~
>> drivers/i3c/master.c:3034:45: error: dereferencing pointer to incomplete type 'const struct i3c_target_read_setup'
     dev->desc->target_info.read_handler = setup->handler;
                                                ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3043:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *target_ops,
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_register':
   drivers/i3c/master.c:3053:9: error: 'struct i3c_master_controller' has no member named 'target'
      master->target = true;
            ^~
   drivers/i3c/master.c:3054:46: error: passing argument 3 of 'i3c_target_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return i3c_target_register(master, parent, target_ops);
                                                 ^~~~~~~~~~
   drivers/i3c/master.c:2973:5: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
        ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_unregister':
   drivers/i3c/master.c:3063:12: error: 'struct i3c_master_controller' has no member named 'target'
     if (master->target)
               ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3072:1: error: version control conflict marker in file
    >>>>>>> i3c: Add BCR and DCR properties
    ^~~~~~~
   cc1: some warnings being treated as errors


vim +2967 drivers/i3c/master.c

  2902	
  2903	static void
  2904	i3c_target_register_new_i3c_dev(struct i3c_master_controller *master, struct i3c_device_info info)
  2905	{
  2906		struct i3c_dev_desc *desc;
  2907		int ret;
  2908	
  2909		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
  2910		if (!desc)
  2911			return;
  2912	
  2913		desc->dev = kzalloc(sizeof(*desc->dev), GFP_KERNEL);
  2914		if (!desc->dev) {
  2915			kfree(desc);
  2916			return;
  2917		}
  2918	
  2919		desc->dev->bus = &master->bus;
  2920		desc->dev->desc = desc;
  2921		desc->dev->dev.parent = &master->dev;
> 2922		desc->dev->dev.type = &i3c_target_device_type;
  2923		desc->dev->dev.bus = &i3c_bus_type;
  2924		desc->dev->dev.release = i3c_target_device_release;
  2925		desc->info = info;
  2926		desc->common.master = master;
  2927		dev_set_name(&desc->dev->dev, "%d-target", master->bus.id);
  2928	
  2929		ret = device_register(&desc->dev->dev);
  2930		if (ret)
  2931			dev_err(&master->dev, "Failed to add I3C target device (err = %d)\n", ret);
  2932	
  2933		master->this = desc;
  2934	}
  2935	
  2936	static void i3c_target_unregister_i3c_dev(struct i3c_master_controller *master)
  2937	{
  2938		struct i3c_dev_desc *i3cdev = master->this;
  2939	
  2940		if (device_is_registered(&i3cdev->dev->dev))
  2941			device_unregister(&i3cdev->dev->dev);
  2942		else
  2943			put_device(&i3cdev->dev->dev);
  2944	}
  2945	
  2946	static void i3c_target_read_device_info(struct device_node *np, struct i3c_device_info *info)
  2947	{
  2948		u64 pid;
  2949		u8 dcr;
  2950		int ret;
  2951	
  2952		ret = of_property_read_u64(np, "pid", &pid);
  2953		if (ret)
  2954			info->pid = 0;
  2955		else
  2956			info->pid = pid;
  2957	
  2958		ret = of_property_read_u8(np, "dcr", &dcr);
  2959		if (ret)
  2960			info->pid = 0;
  2961		else
  2962			info->dcr = dcr;
  2963	}
  2964	
  2965	static int i3c_target_check_ops(const struct i3c_target_ops *ops)
  2966	{
> 2967		if (!ops || !ops->bus_init)
  2968			return -EINVAL;
  2969	
  2970		return 0;
  2971	}
  2972	
  2973	int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
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
  3022	int i3c_target_unregister(struct i3c_master_controller *master)
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
> 3034		dev->desc->target_info.read_handler = setup->handler;
  3035	
  3036		return 0;
  3037	}
  3038	EXPORT_SYMBOL_GPL(i3c_target_read_register);
  3039	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
