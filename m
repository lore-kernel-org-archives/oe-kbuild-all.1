Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB122560
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675861291; x=1707397291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WIE1M5RXZDr/X6dyK5TfoTmhBDN3vdcI6j/rzpfXUZA=;
  b=gJimYJM44zZYOYOtxEl934mivl1AoRR3xys6Wnzb0bPW3BUNPhnEP3Ym
   U8Qr3AufGklxPuwju66kkR/3Rce9VC03LrugAr6n8lXC0/UG6oI9v8x8i
   tF36Eyl3heUHBsZfoktcx8pUY6+Q5lNxoXLNC5YSwj3f5OclfnjXyRsv0
   B4ohCz8KmzJC8Nyk04EG6r9o9OcX94Am6FG4asdUMndFRo+kCUJIHoGDa
   SMvVoSi45bfTkOjso9klwwpzfutj2UlrHOTef1LIrhTIghdCrvv1mpofo
   nLoyyaW25xUGY7Gj6HJ7+PNMnlBpTGrlQoelgrwWA5IphPblMV09VtAAa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="416011822"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="416011822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 05:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="667229100"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="667229100"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Feb 2023 05:01:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPk4N-0004SA-2k;
	Wed, 08 Feb 2023 13:01:03 +0000
Date: Wed, 8 Feb 2023 21:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/31]
 drivers/gpio/gpiolib-cdev.c:1768:1: warning: the frame size of 1144 bytes is
 larger than 1024 bytes
Message-ID: <202302082050.cgNUdrFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 0facdc348172563db9b913d75c9aab1bf68550f8 [29/31] hack passing kernel_init()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230208/202302082050.cgNUdrFg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0facdc348172563db9b913d75c9aab1bf68550f8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0facdc348172563db9b913d75c9aab1bf68550f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/ drivers/net/usb/ drivers/tty/vt/ net/ethtool/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-cdev.c: In function 'linereq_create':
>> drivers/gpio/gpiolib-cdev.c:1768:1: warning: the frame size of 1144 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1768 | }
         | ^
--
   net/ethtool/ioctl.c: In function 'ethtool_get_per_queue_coalesce':
>> net/ethtool/ioctl.c:2536:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2536 | }
         | ^
--
>> drivers/net/usb/r8152.c:298: warning: "CR_TE" redefined
     298 | #define CR_TE                   0x04
         | 
   In file included from arch/arm/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/usb/r8152.c:9:
   arch/arm/include/asm/cp15.h:41: note: this is the location of the previous definition
      41 | #define CR_TE   (1 << 30)       /* Thumb exception enable               */
         | 
--
   drivers/tty/vt/consolemap.c: In function 'con_get_trans_new':
>> drivers/tty/vt/consolemap.c:411:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     411 | }
         | ^


vim +1768 drivers/gpio/gpiolib-cdev.c

925ca36913fc7d Kent Gibson     2020-06-16  1620  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1621  static int linereq_create(struct gpio_device *gdev, void __user *ip)
925ca36913fc7d Kent Gibson     2020-06-16  1622  {
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1623  	struct gpio_v2_line_request ulr;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1624  	struct gpio_v2_line_config *lc;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1625  	struct linereq *lr;
925ca36913fc7d Kent Gibson     2020-06-16  1626  	struct file *file;
b1a92e94560def Kent Gibson     2022-07-14  1627  	u64 flags, edflags;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1628  	unsigned int i;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1629  	int fd, ret;
925ca36913fc7d Kent Gibson     2020-06-16  1630  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1631  	if (copy_from_user(&ulr, ip, sizeof(ulr)))
925ca36913fc7d Kent Gibson     2020-06-16  1632  		return -EFAULT;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1633  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1634  	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
925ca36913fc7d Kent Gibson     2020-06-16  1635  		return -EINVAL;
925ca36913fc7d Kent Gibson     2020-06-16  1636  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1637  	if (memchr_inv(ulr.padding, 0, sizeof(ulr.padding)))
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1638  		return -EINVAL;
925ca36913fc7d Kent Gibson     2020-06-16  1639  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1640  	lc = &ulr.config;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1641  	ret = gpio_v2_line_config_validate(lc, ulr.num_lines);
925ca36913fc7d Kent Gibson     2020-06-16  1642  	if (ret)
925ca36913fc7d Kent Gibson     2020-06-16  1643  		return ret;
925ca36913fc7d Kent Gibson     2020-06-16  1644  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1645  	lr = kzalloc(struct_size(lr, lines, ulr.num_lines), GFP_KERNEL);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1646  	if (!lr)
925ca36913fc7d Kent Gibson     2020-06-16  1647  		return -ENOMEM;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1648  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1649  	lr->gdev = gdev;
925ca36913fc7d Kent Gibson     2020-06-16  1650  	get_device(&gdev->dev);
925ca36913fc7d Kent Gibson     2020-06-16  1651  
65cff70464068a Kent Gibson     2020-09-28  1652  	for (i = 0; i < ulr.num_lines; i++) {
73e0341992b68b Kent Gibson     2020-09-28  1653  		lr->lines[i].req = lr;
65cff70464068a Kent Gibson     2020-09-28  1654  		WRITE_ONCE(lr->lines[i].sw_debounced, 0);
65cff70464068a Kent Gibson     2020-09-28  1655  		INIT_DELAYED_WORK(&lr->lines[i].work, debounce_work_func);
65cff70464068a Kent Gibson     2020-09-28  1656  	}
73e0341992b68b Kent Gibson     2020-09-28  1657  
f188ac1251b909 Kent Gibson     2020-10-05  1658  	if (ulr.consumer[0] != '\0') {
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1659  		/* label is only initialized if consumer is set */
f188ac1251b909 Kent Gibson     2020-10-05  1660  		lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1,
925ca36913fc7d Kent Gibson     2020-06-16  1661  				     GFP_KERNEL);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1662  		if (!lr->label) {
925ca36913fc7d Kent Gibson     2020-06-16  1663  			ret = -ENOMEM;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1664  			goto out_free_linereq;
925ca36913fc7d Kent Gibson     2020-06-16  1665  		}
925ca36913fc7d Kent Gibson     2020-06-16  1666  	}
925ca36913fc7d Kent Gibson     2020-06-16  1667  
a54756cb24eafa Kent Gibson     2020-09-28  1668  	mutex_init(&lr->config_mutex);
73e0341992b68b Kent Gibson     2020-09-28  1669  	init_waitqueue_head(&lr->wait);
73e0341992b68b Kent Gibson     2020-09-28  1670  	lr->event_buffer_size = ulr.event_buffer_size;
73e0341992b68b Kent Gibson     2020-09-28  1671  	if (lr->event_buffer_size == 0)
73e0341992b68b Kent Gibson     2020-09-28  1672  		lr->event_buffer_size = ulr.num_lines * 16;
73e0341992b68b Kent Gibson     2020-09-28  1673  	else if (lr->event_buffer_size > GPIO_V2_LINES_MAX * 16)
73e0341992b68b Kent Gibson     2020-09-28  1674  		lr->event_buffer_size = GPIO_V2_LINES_MAX * 16;
73e0341992b68b Kent Gibson     2020-09-28  1675  
73e0341992b68b Kent Gibson     2020-09-28  1676  	atomic_set(&lr->seqno, 0);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1677  	lr->num_lines = ulr.num_lines;
883f9198184371 Kent Gibson     2020-07-08  1678  
925ca36913fc7d Kent Gibson     2020-06-16  1679  	/* Request each GPIO */
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1680  	for (i = 0; i < ulr.num_lines; i++) {
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1681  		u32 offset = ulr.offsets[i];
925ca36913fc7d Kent Gibson     2020-06-16  1682  		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
925ca36913fc7d Kent Gibson     2020-06-16  1683  
925ca36913fc7d Kent Gibson     2020-06-16  1684  		if (IS_ERR(desc)) {
925ca36913fc7d Kent Gibson     2020-06-16  1685  			ret = PTR_ERR(desc);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1686  			goto out_free_linereq;
925ca36913fc7d Kent Gibson     2020-06-16  1687  		}
925ca36913fc7d Kent Gibson     2020-06-16  1688  
95a4eed7dd5b7c Andy Shevchenko 2022-02-01  1689  		ret = gpiod_request_user(desc, lr->label);
925ca36913fc7d Kent Gibson     2020-06-16  1690  		if (ret)
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1691  			goto out_free_linereq;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1692  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1693  		lr->lines[i].desc = desc;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1694  		flags = gpio_v2_line_config_flags(lc, i);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1695  		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
925ca36913fc7d Kent Gibson     2020-06-16  1696  
925ca36913fc7d Kent Gibson     2020-06-16  1697  		ret = gpiod_set_transitory(desc, false);
925ca36913fc7d Kent Gibson     2020-06-16  1698  		if (ret < 0)
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1699  			goto out_free_linereq;
925ca36913fc7d Kent Gibson     2020-06-16  1700  
b1a92e94560def Kent Gibson     2022-07-14  1701  		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
925ca36913fc7d Kent Gibson     2020-06-16  1702  		/*
925ca36913fc7d Kent Gibson     2020-06-16  1703  		 * Lines have to be requested explicitly for input
925ca36913fc7d Kent Gibson     2020-06-16  1704  		 * or output, else the line will be treated "as is".
925ca36913fc7d Kent Gibson     2020-06-16  1705  		 */
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1706  		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1707  			int val = gpio_v2_line_config_output_value(lc, i);
925ca36913fc7d Kent Gibson     2020-06-16  1708  
925ca36913fc7d Kent Gibson     2020-06-16  1709  			ret = gpiod_direction_output(desc, val);
925ca36913fc7d Kent Gibson     2020-06-16  1710  			if (ret)
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1711  				goto out_free_linereq;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1712  		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
925ca36913fc7d Kent Gibson     2020-06-16  1713  			ret = gpiod_direction_input(desc);
925ca36913fc7d Kent Gibson     2020-06-16  1714  			if (ret)
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1715  				goto out_free_linereq;
73e0341992b68b Kent Gibson     2020-09-28  1716  
65cff70464068a Kent Gibson     2020-09-28  1717  			ret = edge_detector_setup(&lr->lines[i], lc, i,
b1a92e94560def Kent Gibson     2022-07-14  1718  						  edflags);
73e0341992b68b Kent Gibson     2020-09-28  1719  			if (ret)
73e0341992b68b Kent Gibson     2020-09-28  1720  				goto out_free_linereq;
925ca36913fc7d Kent Gibson     2020-06-16  1721  		}
925ca36913fc7d Kent Gibson     2020-06-16  1722  
b1a92e94560def Kent Gibson     2022-07-14  1723  		lr->lines[i].edflags = edflags;
b1a92e94560def Kent Gibson     2022-07-14  1724  
6accc376a7482e Kent Gibson     2020-07-08  1725  		blocking_notifier_call_chain(&desc->gdev->notifier,
aad955842d1cdf Kent Gibson     2020-09-28  1726  					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
925ca36913fc7d Kent Gibson     2020-06-16  1727  
925ca36913fc7d Kent Gibson     2020-06-16  1728  		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
925ca36913fc7d Kent Gibson     2020-06-16  1729  			offset);
925ca36913fc7d Kent Gibson     2020-06-16  1730  	}
925ca36913fc7d Kent Gibson     2020-06-16  1731  
925ca36913fc7d Kent Gibson     2020-06-16  1732  	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
925ca36913fc7d Kent Gibson     2020-06-16  1733  	if (fd < 0) {
925ca36913fc7d Kent Gibson     2020-06-16  1734  		ret = fd;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1735  		goto out_free_linereq;
925ca36913fc7d Kent Gibson     2020-06-16  1736  	}
925ca36913fc7d Kent Gibson     2020-06-16  1737  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1738  	file = anon_inode_getfile("gpio-line", &line_fileops, lr,
925ca36913fc7d Kent Gibson     2020-06-16  1739  				  O_RDONLY | O_CLOEXEC);
925ca36913fc7d Kent Gibson     2020-06-16  1740  	if (IS_ERR(file)) {
925ca36913fc7d Kent Gibson     2020-06-16  1741  		ret = PTR_ERR(file);
925ca36913fc7d Kent Gibson     2020-06-16  1742  		goto out_put_unused_fd;
925ca36913fc7d Kent Gibson     2020-06-16  1743  	}
925ca36913fc7d Kent Gibson     2020-06-16  1744  
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1745  	ulr.fd = fd;
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1746  	if (copy_to_user(ip, &ulr, sizeof(ulr))) {
925ca36913fc7d Kent Gibson     2020-06-16  1747  		/*
925ca36913fc7d Kent Gibson     2020-06-16  1748  		 * fput() will trigger the release() callback, so do not go onto
925ca36913fc7d Kent Gibson     2020-06-16  1749  		 * the regular error cleanup path here.
925ca36913fc7d Kent Gibson     2020-06-16  1750  		 */
925ca36913fc7d Kent Gibson     2020-06-16  1751  		fput(file);
925ca36913fc7d Kent Gibson     2020-06-16  1752  		put_unused_fd(fd);
925ca36913fc7d Kent Gibson     2020-06-16  1753  		return -EFAULT;
925ca36913fc7d Kent Gibson     2020-06-16  1754  	}
925ca36913fc7d Kent Gibson     2020-06-16  1755  
925ca36913fc7d Kent Gibson     2020-06-16  1756  	fd_install(fd, file);
925ca36913fc7d Kent Gibson     2020-06-16  1757  
925ca36913fc7d Kent Gibson     2020-06-16  1758  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1759  		lr->num_lines);
925ca36913fc7d Kent Gibson     2020-06-16  1760  
925ca36913fc7d Kent Gibson     2020-06-16  1761  	return 0;
925ca36913fc7d Kent Gibson     2020-06-16  1762  
925ca36913fc7d Kent Gibson     2020-06-16  1763  out_put_unused_fd:
925ca36913fc7d Kent Gibson     2020-06-16  1764  	put_unused_fd(fd);
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1765  out_free_linereq:
3c0d9c635ae2b2 Kent Gibson     2020-09-28  1766  	linereq_free(lr);
925ca36913fc7d Kent Gibson     2020-06-16  1767  	return ret;
925ca36913fc7d Kent Gibson     2020-06-16 @1768  }
925ca36913fc7d Kent Gibson     2020-06-16  1769  

:::::: The code at line 1768 was first introduced by commit
:::::: 925ca36913fc7dfee9d0bb7f36d81dd108a7b80f gpiolib: split character device into gpiolib-cdev

:::::: TO: Kent Gibson <warthog618@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
