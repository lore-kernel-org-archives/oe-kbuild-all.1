Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157BA21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674459303; x=1705995303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DnzTgzfgfUoWxsfbaH6l21SXf0uFmRo3DogYEqoks/Y=;
  b=NZuNlKUUZ4M9mnGX8d8iyiAO5TWGL/FxNbugorsmfdDB+6gdwpAM0rQw
   Cmcxvv6ZOmfh5+u5Lnr3I4aqR3SUpsC7fFM2EWPHOLwKle4rgW2uBh6mI
   IJkA3DUrJe6gcQN5un1x8LUxYTyzf/IKmRA2elDWKEkhYdDU9SgG1KkdX
   BRus+E3mq8etn1ZbW+zzd7tYwEwOIE5nKvmxjXHBy4G8ZXAVVtbUqKkHZ
   +EtLNTcD5i1XWqiOE/YwB062H1iCBjg+rnHDuHngGy4QaYRlLQQM4MsLh
   2SI5fUE9N/U1o1go33ktOG+o3+SXUnZOt0GM/TtaGcowraJoGjbUgElQH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353249228"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="353249228"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 23:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639041051"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="639041051"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2023 23:35:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJrM4-0005V2-07;
	Mon, 23 Jan 2023 07:35:00 +0000
Date: Mon, 23 Jan 2023 15:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 82/123] drivers/gpio/gpio-mxc.c:215:31:
 error: passing argument 1 of '_raw_spin_lock_irqsave' from incompatible
 pointer type
Message-ID: <202301231522.6p2CQxSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   9d3c12f5b9055a30ec40e87af659d368c832dfbe
commit: c22b709904208f0c0b852d52409e96db96eab8b9 [82/123] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
config: arm-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231522.6p2CQxSu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=c22b709904208f0c0b852d52409e96db96eab8b9
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout c22b709904208f0c0b852d52409e96db96eab8b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/rwsem.h:16,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:14,
                    from drivers/gpio/gpio-mxc.c:10:
   drivers/gpio/gpio-mxc.c: In function 'gpio_set_irq_type':
>> drivers/gpio/gpio-mxc.c:215:31: error: passing argument 1 of '_raw_spin_lock_irqsave' from incompatible pointer type [-Werror=incompatible-pointer-types]
     215 |         raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               spinlock_t * {aka struct spinlock *}
   include/linux/spinlock.h:250:48: note: in definition of macro 'raw_spin_lock_irqsave'
     250 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   In file included from include/linux/spinlock.h:316:
   include/linux/spinlock_api_smp.h:32:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                 ~~~~~~~~~~~~~~~~^~~~
>> drivers/gpio/gpio-mxc.c:236:36: error: passing argument 1 of '_raw_spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     236 |         raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    spinlock_t * {aka struct spinlock *}
   include/linux/spinlock.h:288:45: note: in definition of macro 'raw_spin_unlock_irqrestore'
     288 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^~~~
   include/linux/spinlock_api_smp.h:43:45: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
      43 | _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
         |                             ~~~~~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c: In function 'mxc_flip_edge':
   drivers/gpio/gpio-mxc.c:248:31: error: passing argument 1 of '_raw_spin_lock_irqsave' from incompatible pointer type [-Werror=incompatible-pointer-types]
     248 |         raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               spinlock_t * {aka struct spinlock *}
   include/linux/spinlock.h:250:48: note: in definition of macro 'raw_spin_lock_irqsave'
     250 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   include/linux/spinlock_api_smp.h:32:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                 ~~~~~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c:268:36: error: passing argument 1 of '_raw_spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     268 |         raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    spinlock_t * {aka struct spinlock *}
   include/linux/spinlock.h:288:45: note: in definition of macro 'raw_spin_unlock_irqrestore'
     288 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^~~~
   include/linux/spinlock_api_smp.h:43:45: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
      43 | _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
         |                             ~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/_raw_spin_lock_irqsave +215 drivers/gpio/gpio-mxc.c

   171	
   172	static int gpio_set_irq_type(struct irq_data *d, u32 type)
   173	{
   174		struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
   175		struct mxc_gpio_port *port = gc->private;
   176		unsigned long flags;
   177		u32 bit, val;
   178		u32 gpio_idx = d->hwirq;
   179		int edge;
   180		void __iomem *reg = port->base;
   181	
   182		port->both_edges &= ~(1 << gpio_idx);
   183		switch (type) {
   184		case IRQ_TYPE_EDGE_RISING:
   185			edge = GPIO_INT_RISE_EDGE;
   186			break;
   187		case IRQ_TYPE_EDGE_FALLING:
   188			edge = GPIO_INT_FALL_EDGE;
   189			break;
   190		case IRQ_TYPE_EDGE_BOTH:
   191			if (GPIO_EDGE_SEL >= 0) {
   192				edge = GPIO_INT_BOTH_EDGES;
   193			} else {
   194				val = port->gc.get(&port->gc, gpio_idx);
   195				if (val) {
   196					edge = GPIO_INT_LOW_LEV;
   197					pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
   198				} else {
   199					edge = GPIO_INT_HIGH_LEV;
   200					pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
   201				}
   202				port->both_edges |= 1 << gpio_idx;
   203			}
   204			break;
   205		case IRQ_TYPE_LEVEL_LOW:
   206			edge = GPIO_INT_LOW_LEV;
   207			break;
   208		case IRQ_TYPE_LEVEL_HIGH:
   209			edge = GPIO_INT_HIGH_LEV;
   210			break;
   211		default:
   212			return -EINVAL;
   213		}
   214	
 > 215		raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
   216	
   217		if (GPIO_EDGE_SEL >= 0) {
   218			val = readl(port->base + GPIO_EDGE_SEL);
   219			if (edge == GPIO_INT_BOTH_EDGES)
   220				writel(val | (1 << gpio_idx),
   221					port->base + GPIO_EDGE_SEL);
   222			else
   223				writel(val & ~(1 << gpio_idx),
   224					port->base + GPIO_EDGE_SEL);
   225		}
   226	
   227		if (edge != GPIO_INT_BOTH_EDGES) {
   228			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
   229			bit = gpio_idx & 0xf;
   230			val = readl(reg) & ~(0x3 << (bit << 1));
   231			writel(val | (edge << (bit << 1)), reg);
   232		}
   233	
   234		writel(1 << gpio_idx, port->base + GPIO_ISR);
   235	
 > 236		raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
   237	
   238		return 0;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
