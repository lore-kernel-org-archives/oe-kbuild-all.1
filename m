Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2877A19BBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420699; cv=none; b=ITi5/Ic7vXuXpLSPxCkIeDXrJ2JZE1v7OhOzsl3oMY8EEnZlDlt6zEMG+bVjdYG9IrsWqKwO82ndxV5fLDcgcNkJ3ls8HVA819TQWaATkHM8UNEwOdq2txvvl9ZFb7i3bDfkY2M5kcNNr8Fihu+aXuVCxjJ1r6tE/JQityF9zj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420699; c=relaxed/simple;
	bh=jOONSqUBcESxpj1sBblg8jBHHqJvwdtaKbpma854wAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHiO7Tr6HRVymOb2oC+tA/Mxvm7/0dxlCRZbsYbq0/48mhfhyKKPBwNKPb6m3JeHQJ2Gi1tbv7w8oe8hPXeEt2+K1C2X02h0hA5LVVTpOt8x0vJRKfB+CJ1+LxLV95b8zoRjj6QGCY5FHEX/J6SgXwMK4K926L8b8Bu1RPNmfuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV5upHaE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV5upHaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420693; x=1761956693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jOONSqUBcESxpj1sBblg8jBHHqJvwdtaKbpma854wAI=;
  b=TV5upHaEoAKqyYiRO/z+sHN4qJB+f8u6b3feNGLXnElhhlXC9AhijQG0
   dIkusFNGym5v6v1HxI32b3OjUfGX/mdB8rle0T/W9sXJEdFup3bt6FN2c
   fEHezkiEyYDAqo9STUviH9y9dXyZV9xIwtWYNh+NiXM2PJRqdJxpPbs5l
   1JTYtK8PLYYAcLyoGn9zst5bqar+ao90NqxlXcHXwpsXf6824W4DQj4lj
   EcfnMus4dcOSUc8O88srWisYg+T0hbfkA8SEO8n5L/zMLv4JNA1Mb/7f5
   cBN7XYYym3qHSFtHY2DycSzXRWmzhsA/OnGqBEyU2psviuByeWYwUnwge
   A==;
X-CSE-ConnectionGUID: 88CaDd44R+6ydHMSQ/jFpg==
X-CSE-MsgGUID: GYUQPiSTSSiwiAr8aJ7tuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33988262"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="33988262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:24:53 -0700
X-CSE-ConnectionGUID: fXal7EeIR/y4xdNB6p9y7A==
X-CSE-MsgGUID: 6+sw3VvzStimUUU+n5hamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82323060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 17:24:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fT7-000gs8-23;
	Fri, 01 Nov 2024 00:24:49 +0000
Date: Fri, 1 Nov 2024 08:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.kishore.manne@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/1] fpga-region: Add generic IOCTL interface for
 runtime FPGA programming
Message-ID: <202411010840.d7asQAT3-lkp@intel.com>
References: <20241029091734.3288005-2-nava.kishore.manne@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029091734.3288005-2-nava.kishore.manne@amd.com>

Hi Nava,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc5 next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-region-Add-generic-IOCTL-interface-for-runtime-FPGA-programming/20241029-181743
base:   linus/master
patch link:    https://lore.kernel.org/r/20241029091734.3288005-2-nava.kishore.manne%40amd.com
patch subject: [RFC v2 1/1] fpga-region: Add generic IOCTL interface for runtime FPGA programming
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411010840.d7asQAT3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010840.d7asQAT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010840.d7asQAT3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/fpga/fpga-region.c: In function 'fpga_region_device_open':
>> drivers/fpga/fpga-region.c:186:42: error: invalid use of undefined type 'struct file'
     186 |         struct miscdevice *miscdev = file->private_data;
         |                                          ^~
   drivers/fpga/fpga-region.c:189:13: error: invalid use of undefined type 'struct file'
     189 |         file->private_data = region;
         |             ^~
   drivers/fpga/fpga-region.c: In function 'fpga_region_device_ioctl':
   drivers/fpga/fpga-region.c:205:66: error: invalid use of undefined type 'struct file'
     205 |         struct fpga_region *region =  (struct fpga_region *)(file->private_data);
         |                                                                  ^~
>> drivers/fpga/fpga-region.c:209:21: error: implicit declaration of function 'copy_from_user' [-Wimplicit-function-declaration]
     209 |                 if (copy_from_user(&config_info, argp, sizeof(struct fpga_region_config_info)))
         |                     ^~~~~~~~~~~~~~
>> drivers/fpga/fpga-region.c:227:21: error: implicit declaration of function 'copy_to_user' [-Wimplicit-function-declaration]
     227 |                 if (copy_to_user((void __user *)arg, &status, sizeof(status)))
         |                     ^~~~~~~~~~~~
   drivers/fpga/fpga-region.c: At top level:
>> drivers/fpga/fpga-region.c:237:21: error: variable 'fpga_region_fops' has initializer but incomplete type
     237 | static const struct file_operations fpga_region_fops = {
         |                     ^~~~~~~~~~~~~~~
>> drivers/fpga/fpga-region.c:238:10: error: 'const struct file_operations' has no member named 'owner'
     238 |         .owner          = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/fpga/fpga-bridge.h:6,
                    from drivers/fpga/fpga-region.c:8:
   include/linux/init.h:180:21: warning: excess elements in struct initializer
     180 | #define THIS_MODULE (&__this_module)
         |                     ^
   drivers/fpga/fpga-region.c:238:27: note: in expansion of macro 'THIS_MODULE'
     238 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   include/linux/init.h:180:21: note: (near initialization for 'fpga_region_fops')
     180 | #define THIS_MODULE (&__this_module)
         |                     ^
   drivers/fpga/fpga-region.c:238:27: note: in expansion of macro 'THIS_MODULE'
     238 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
>> drivers/fpga/fpga-region.c:239:10: error: 'const struct file_operations' has no member named 'open'
     239 |         .open           = fpga_region_device_open,
         |          ^~~~
>> drivers/fpga/fpga-region.c:239:27: warning: excess elements in struct initializer
     239 |         .open           = fpga_region_device_open,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:239:27: note: (near initialization for 'fpga_region_fops')
>> drivers/fpga/fpga-region.c:240:10: error: 'const struct file_operations' has no member named 'release'
     240 |         .release        = fpga_region_device_release,
         |          ^~~~~~~
   drivers/fpga/fpga-region.c:240:27: warning: excess elements in struct initializer
     240 |         .release        = fpga_region_device_release,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:240:27: note: (near initialization for 'fpga_region_fops')
>> drivers/fpga/fpga-region.c:241:10: error: 'const struct file_operations' has no member named 'unlocked_ioctl'
     241 |         .unlocked_ioctl = fpga_region_device_ioctl,
         |          ^~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:241:27: warning: excess elements in struct initializer
     241 |         .unlocked_ioctl = fpga_region_device_ioctl,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:241:27: note: (near initialization for 'fpga_region_fops')
>> drivers/fpga/fpga-region.c:242:10: error: 'const struct file_operations' has no member named 'compat_ioctl'
     242 |         .compat_ioctl   = fpga_region_device_ioctl,
         |          ^~~~~~~~~~~~
   drivers/fpga/fpga-region.c:242:27: warning: excess elements in struct initializer
     242 |         .compat_ioctl   = fpga_region_device_ioctl,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:242:27: note: (near initialization for 'fpga_region_fops')
>> drivers/fpga/fpga-region.c:237:37: error: storage size of 'fpga_region_fops' isn't known
     237 | static const struct file_operations fpga_region_fops = {
         |                                     ^~~~~~~~~~~~~~~~
--
>> drivers/fpga/of-fpga-region.c:35: warning: Excess struct member 'path' description in 'of_fpga_region_priv'


vim +186 drivers/fpga/fpga-region.c

   183	
   184	static int fpga_region_device_open(struct inode *inode, struct file *file)
   185	{
 > 186		struct miscdevice *miscdev = file->private_data;
   187		struct fpga_region *region = container_of(miscdev, struct fpga_region, miscdev);
   188	
 > 189		file->private_data = region;
   190	
   191		return 0;
   192	}
   193	
   194	static int fpga_region_device_release(struct inode *inode, struct file *file)
   195	{
   196		return 0;
   197	}
   198	
   199	static long fpga_region_device_ioctl(struct file *file, unsigned int cmd,
   200					     unsigned long arg)
   201	{
   202		int err;
   203		void __user *argp = (void __user *)arg;
   204		struct fpga_region_config_info config_info;
 > 205		struct fpga_region *region =  (struct fpga_region *)(file->private_data);
   206	
   207		switch (cmd) {
   208		case FPGA_REGION_IOCTL_LOAD:
 > 209			if (copy_from_user(&config_info, argp, sizeof(struct fpga_region_config_info)))
   210				return -EFAULT;
   211	
   212			err = region->region_ops->region_config_enumeration(region, &config_info);
   213	
   214			break;
   215		case FPGA_REGION_IOCTL_REMOVE:
   216			if (copy_from_user(&config_info, argp, sizeof(struct fpga_region_config_info)))
   217				return -EFAULT;
   218	
   219			err = region->region_ops->region_remove(region, &config_info);
   220	
   221			break;
   222		case FPGA_REGION_IOCTL_STATUS:
   223			unsigned int status;
   224	
   225			status = region->region_ops->region_status(region);
   226	
 > 227			if (copy_to_user((void __user *)arg, &status, sizeof(status)))
   228				err = -EFAULT;
   229			break;
   230		default:
   231			err = -ENOTTY;
   232		}
   233	
   234		return err;
   235	}
   236	
 > 237	static const struct file_operations fpga_region_fops = {
 > 238		.owner		= THIS_MODULE,
 > 239		.open		= fpga_region_device_open,
 > 240		.release	= fpga_region_device_release,
 > 241		.unlocked_ioctl	= fpga_region_device_ioctl,
 > 242		.compat_ioctl	= fpga_region_device_ioctl,
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
