Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285120FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674219486; x=1705755486;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eI50KgSe5OU5hZdwh9GFAFm+1NlZzVFGAL3gcbYd4FM=;
  b=QCX5UEXqTUlZrl9z/nWtb8wWQwxGy+5wmfo7wYSj5nlhE8+2LNOciqnz
   KO6SMnSWlGu8hcLwe/cd6633UL2l8MOdQ+RuzZTw7sxNoS5GP2YYSZ5z6
   Wzh26HVp7ZeGqZj6QtrjOwUVOPBF6ahVPvu3/MRJnHkY/4HJdeSStJM7g
   nccBSZpWKVafQzbHuW2CZn3wYt6WwNSFtNJiIpxN0OklQ/m71nc5of5xw
   Vq67JDZFF/CmMvtTKsZbWDuts/38kS7dUERDw8buwWLeXgtqRoc13T1jj
   hxh/CSA9LtP4jMPPNe6Y8l7MePKfOAy+HNLTcHQhrSkWc0DwN9/dHWMRY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324255527"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324255527"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638152125"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="638152125"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 04:58:01 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIqy0-0002ZB-14;
	Fri, 20 Jan 2023 12:58:00 +0000
Date: Fri, 20 Jan 2023 20:57:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 14/207]
 drivers/clocksource/mmio.c:306:42: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202301202040.8biV9MMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   cf5bf3fab76681ac32341500eb2701aa4b259c1c
commit: 20fd627143e8652ac182ac06627776b10ce234bd [14/207] clocksource: mmio: add user-mappable mmio clocksources
config: openrisc-randconfig-s033-20230119 (https://download.01.org/0day-ci/archive/20230120/202301202040.8biV9MMB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/20fd627143e8652ac182ac06627776b10ce234bd
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout 20fd627143e8652ac182ac06627776b10ce234bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c:306:42: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *map_base @@     got void *regs @@
   drivers/clocksource/mmio.c:306:42: sparse:     expected void [noderef] __user *map_base
   drivers/clocksource/mmio.c:306:42: sparse:     got void *regs
>> drivers/clocksource/mmio.c:312:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *map_base @@     got void * @@
   drivers/clocksource/mmio.c:312:26: sparse:     expected void [noderef] __user *map_base
   drivers/clocksource/mmio.c:312:26: sparse:     got void *
>> drivers/clocksource/mmio.c:321:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] reg_lower @@     got void [noderef] __user * @@
   drivers/clocksource/mmio.c:321:24: sparse:     expected void *[assigned] reg_lower
   drivers/clocksource/mmio.c:321:24: sparse:     got void [noderef] __user *
>> drivers/clocksource/mmio.c:326:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] reg_upper @@     got void [noderef] __user * @@
   drivers/clocksource/mmio.c:326:32: sparse:     expected void *[assigned] reg_upper
   drivers/clocksource/mmio.c:326:32: sparse:     got void [noderef] __user *
>> drivers/clocksource/mmio.c:428:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *const reg_lower @@
   drivers/clocksource/mmio.c:428:33: sparse:     expected void *
   drivers/clocksource/mmio.c:428:33: sparse:     got void [noderef] __iomem *const reg_lower
>> drivers/clocksource/mmio.c:433:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *const reg_upper @@
   drivers/clocksource/mmio.c:433:41: sparse:     expected void *
   drivers/clocksource/mmio.c:433:41: sparse:     got void [noderef] __iomem *const reg_upper
   drivers/clocksource/mmio.c: note: in included file (through arch/openrisc/include/asm/io.h, include/linux/clocksource.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le16

vim +306 drivers/clocksource/mmio.c

   268	
   269	static long
   270	mmio_ucs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   271	{
   272		struct clocksource_user_mapping *mapping;
   273		struct clksrc_user_mmio_info __user *u;
   274		unsigned long upper_pfn, lower_pfn;
   275		struct clksrc_user_mmio_info info;
   276		struct clocksource_user_mmio *ucs;
   277		unsigned int bits_upper;
   278		void __user *map_base;
   279		unsigned long h_key;
   280		size_t size;
   281	
   282		u = (struct clksrc_user_mmio_info __user *)arg;
   283	
   284		switch (cmd) {
   285		case CLKSRC_USER_MMIO_MAP:
   286			break;
   287		default:
   288			return -ENOTTY;
   289		}
   290	
   291		h_key = (unsigned long)current->mm / sizeof(*current->mm);
   292	
   293		ucs = file->private_data;
   294		upper_pfn = ucs->phys_upper >> PAGE_SHIFT;
   295		lower_pfn = ucs->phys_lower >> PAGE_SHIFT;
   296		bits_upper = fls(ucs->mmio.clksrc.mask) - ucs->bits_lower;
   297		size = PAGE_SIZE;
   298		if (bits_upper && upper_pfn != lower_pfn)
   299			size += PAGE_SIZE;
   300	
   301		do {
   302			spin_lock(&ucs->lock);
   303			hash_for_each_possible(ucs->mappings, mapping, link, h_key) {
   304				if (mapping->mm == current->mm) {
   305					spin_unlock(&ucs->lock);
 > 306					map_base = mapping->regs;
   307					goto found;
   308				}
   309			}
   310			spin_unlock(&ucs->lock);
   311	
 > 312			map_base = (void *)
   313				vm_mmap(file, 0, size, PROT_READ, MAP_SHARED, 0);
   314		} while (IS_ERR(map_base) && PTR_ERR(map_base) == -EBUSY);
   315	
   316		if (IS_ERR(map_base))
   317			return PTR_ERR(map_base);
   318	
   319	found:
   320		info.type = ucs->type;
 > 321		info.reg_lower = map_base + offset_in_page(ucs->phys_lower);
   322		info.mask_lower = ucs->mmio.clksrc.mask;
   323		info.bits_lower = ucs->bits_lower;
   324		info.reg_upper = NULL;
   325		if (ucs->phys_upper)
 > 326			info.reg_upper = map_base + (size - PAGE_SIZE)
   327				+ offset_in_page(ucs->phys_upper);
   328		info.mask_upper = ucs->mask_upper;
   329	
   330		return copy_to_user(u, &info, sizeof(*u));
   331	}
   332	
   333	static int mmio_ucs_open(struct inode *inode, struct file *file)
   334	{
   335		struct clocksource_user_mmio *ucs;
   336	
   337		if (file->f_mode & FMODE_WRITE)
   338			return -EINVAL;
   339	
   340		ucs = container_of(inode->i_cdev, typeof(*ucs), cdev);
   341		file->private_data = ucs;
   342	
   343		return 0;
   344	}
   345	
   346	static const struct file_operations mmio_ucs_fops = {
   347		.owner		= THIS_MODULE,
   348		.unlocked_ioctl = mmio_ucs_ioctl,
   349		.open		= mmio_ucs_open,
   350		.mmap		= mmio_ucs_mmap,
   351	};
   352	
   353	static int __init
   354	ucs_create_cdev(struct class *class, struct clocksource_user_mmio *ucs)
   355	{
   356		int err;
   357	
   358		ucs->dev = device_create(class, NULL,
   359					MKDEV(MAJOR(user_mmio_devt), ucs->id),
   360					ucs, "ucs/%d", ucs->id);
   361		if (IS_ERR(ucs->dev))
   362			return PTR_ERR(ucs->dev);
   363	
   364		spin_lock_init(&ucs->lock);
   365		hash_init(ucs->mappings);
   366	
   367		cdev_init(&ucs->cdev, &mmio_ucs_fops);
   368		ucs->cdev.kobj.parent = &ucs->dev->kobj;
   369	
   370		err = cdev_add(&ucs->cdev, ucs->dev->devt, 1);
   371		if (err < 0)
   372			goto err_device_destroy;
   373	
   374		return 0;
   375	
   376	err_device_destroy:
   377		device_destroy(class, MKDEV(MAJOR(user_mmio_devt), ucs->id));
   378		return err;
   379	}
   380	
   381	static unsigned long default_revmap(void *virt)
   382	{
   383		struct vm_struct *vm;
   384	
   385		vm = find_vm_area(virt);
   386		if (!vm)
   387			return 0;
   388	
   389		return vm->phys_addr + (virt - vm->addr);
   390	}
   391	
   392	int __init clocksource_user_mmio_init(struct clocksource_user_mmio *ucs,
   393					      const struct clocksource_mmio_regs *regs,
   394					      unsigned long hz)
   395	{
   396		static u64 (*user_types[CLKSRC_MMIO_TYPE_NR])(struct clocksource *) = {
   397			[CLKSRC_MMIO_L_UP] = clocksource_mmio_readl_up,
   398			[CLKSRC_MMIO_L_DOWN] = clocksource_mmio_readl_down,
   399			[CLKSRC_DMMIO_L_UP] = clocksource_dual_mmio_readl_up,
   400			[CLKSRC_MMIO_W_UP] = clocksource_mmio_readw_up,
   401			[CLKSRC_MMIO_W_DOWN] = clocksource_mmio_readw_down,
   402			[CLKSRC_DMMIO_W_UP] = clocksource_dual_mmio_readw_up,
   403		};
   404		const char *name = ucs->mmio.clksrc.name;
   405		unsigned long phys_upper = 0, phys_lower;
   406		enum clksrc_user_mmio_type type;
   407		unsigned long (*revmap)(void *);
   408		int err;
   409	
   410		if (regs->bits_lower > 32 || regs->bits_lower < 16 ||
   411		    regs->bits_upper > 32)
   412			return -EINVAL;
   413	
   414		for (type = 0; type < ARRAY_SIZE(user_types); type++)
   415			if (ucs->mmio.clksrc.read == user_types[type])
   416				break;
   417	
   418		if (type == ARRAY_SIZE(user_types))
   419			return -EINVAL;
   420	
   421		if (!(ucs->mmio.clksrc.flags & CLOCK_SOURCE_IS_CONTINUOUS))
   422			return -EINVAL;
   423	
   424		revmap = regs->revmap;
   425		if (!revmap)
   426			revmap = default_revmap;
   427	
 > 428		phys_lower = revmap(regs->reg_lower);
   429		if (!phys_lower)
   430			return -EINVAL;
   431	
   432		if (regs->bits_upper) {
 > 433			phys_upper = revmap(regs->reg_upper);
   434			if (!phys_upper)
   435				return -EINVAL;
   436		}
   437	
   438		ucs->mmio.reg = regs->reg_lower;
   439		ucs->type = type;
   440		ucs->bits_lower = regs->bits_lower;
   441		ucs->reg_upper = regs->reg_upper;
   442		ucs->mask_lower = CLOCKSOURCE_MASK(regs->bits_lower);
   443		ucs->mask_upper = CLOCKSOURCE_MASK(regs->bits_upper);
   444		ucs->phys_lower = phys_lower;
   445		ucs->phys_upper = phys_upper;
   446		spin_lock_init(&ucs->lock);
   447	
   448		err = clocksource_register_hz(&ucs->mmio.clksrc, hz);
   449		if (err < 0)
   450			return err;
   451	
   452		spin_lock(&user_clksrcs_lock);
   453	
   454		ucs->id = user_clksrcs_count++;
   455		if (ucs->id < CLKSRC_USER_MMIO_MAX)
   456			list_add_tail(&ucs->link, &user_clksrcs);
   457	
   458		spin_unlock(&user_clksrcs_lock);
   459	
   460		if (ucs->id >= CLKSRC_USER_MMIO_MAX) {
   461			pr_warn("%s: Too many clocksources\n", name);
   462			err = -EAGAIN;
   463			goto fail;
   464		}
   465	
   466		if (user_mmio_class) {
   467			err = ucs_create_cdev(user_mmio_class, ucs);
   468			if (err < 0) {
   469				pr_warn("%s: Failed to add character device\n", name);
   470				goto fail;
   471			}
   472		}
   473	
   474		return 0;
   475	
   476	fail:
   477		clocksource_unregister(&ucs->mmio.clksrc);
   478	
   479		return err;
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
