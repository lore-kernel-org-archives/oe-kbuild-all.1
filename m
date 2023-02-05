Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D422F21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675626092; x=1707162092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QoqMwBGtg0o60vYc523HtJoYcvhAnF53tLIPpRbn6mw=;
  b=PJr3TD154qzEn5h/GKtLpEjdxr0NBkC0kb6/+TJvy4It25YEYYMCa+Wj
   lV6I7nRfyRogQ2WBEMq71fxK+dnTpXJwlfgZnAlKd+e3hGb4sAUtvmfQe
   ky1SdMph2z1LilhB21LkRVkdj1YRZCSRfq/6iXZCsZly7Vq5edd3pHs1r
   N1nvTmK/z/GvaE4U35laaQVJbhQkglLxnWh5Zy/uDNusAyWaP0iVSq69R
   emlY+zOP6HAgsCxn6kk8Ml5LnlnsYSqFsvGWCXSkGrVekh3oGuvuVj3Aa
   w/WyMl/VYETL6OCo94PUuWrfBu15h7S93KAoJz8uMKFpIg0/PFYCO30AL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="330374719"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="330374719"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 11:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840165955"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840165955"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 11:41:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOktF-0002BI-0m;
	Sun, 05 Feb 2023 19:41:29 +0000
Date: Mon, 6 Feb 2023 03:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4145/20208] drivers/rpmsg/imx_rpmsg.c:371:6:
 warning: no previous prototype for function 'imx_rpmsg_restore'
Message-ID: <202302060352.TljjRWpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: dc5690015984c6ba85503e5ead1938de078d38a4 [4145/20208] rpmsg: imx_rpmsg: add partition reset notify
config: riscv-randconfig-r026-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060352.TljjRWpz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/dc5690015984c6ba85503e5ead1938de078d38a4
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout dc5690015984c6ba85503e5ead1938de078d38a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/imx/ drivers/firmware/imx/ drivers/mailbox/ drivers/rpmsg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/rpmsg/imx_rpmsg.c:19:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/rpmsg/imx_rpmsg.c:19:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/rpmsg/imx_rpmsg.c:19:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   drivers/rpmsg/imx_rpmsg.c:163:9: error: implicit declaration of function 'kmalloc' [-Werror,-Wimplicit-function-declaration]
           rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
                  ^
   drivers/rpmsg/imx_rpmsg.c:163:7: error: incompatible integer to pointer conversion assigning to 'struct imx_rpmsg_vq_info *' from 'int' [-Wint-conversion]
           rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/imx_rpmsg.c:168:32: error: implicit declaration of function 'ioremap_nocache' [-Werror,-Wimplicit-function-declaration]
           rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
                                         ^
   drivers/rpmsg/imx_rpmsg.c:168:15: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
           rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/imx_rpmsg.c:203:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
           kfree(rpvq);
           ^
   drivers/rpmsg/imx_rpmsg.c:216:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
                   kfree(rpvq);
                   ^
   drivers/rpmsg/imx_rpmsg.c:307:22: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
                           rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
                                             ^
   drivers/rpmsg/imx_rpmsg.c:307:20: error: incompatible integer to pointer conversion assigning to 'struct imx_virdev *' from 'int' [-Wint-conversion]
                           rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
                                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/imx_rpmsg.c:378:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
                   kfree(rpdev->ivdev[i]);
                   ^
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous prototype for function 'imx_rpmsg_restore' [-Wmissing-prototypes]
   void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
        ^
   drivers/rpmsg/imx_rpmsg.c:371:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   ^
   static 
   drivers/rpmsg/imx_rpmsg.c:556:19: warning: cast to smaller integer type 'enum imx_rpmsg_variants' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           rpdev->variant = (enum imx_rpmsg_variants)of_device_get_match_data(dev);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 warnings and 8 errors generated.


vim +/imx_rpmsg_restore +371 drivers/rpmsg/imx_rpmsg.c

   292	
   293	static int set_vring_phy_buf(struct platform_device *pdev,
   294			       struct imx_rpmsg_vproc *rpdev, int vdev_nums)
   295	{
   296		struct resource *res;
   297		resource_size_t size;
   298		unsigned int start, end;
   299		int i, ret = 0;
   300	
   301		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   302		if (res) {
   303			size = resource_size(res);
   304			start = res->start;
   305			end = res->start + size;
   306			for (i = 0; i < vdev_nums; i++) {
 > 307				rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
   308								GFP_KERNEL);
   309				if (!rpdev->ivdev[i])
   310					return -ENOMEM;
   311	
   312				rpdev->ivdev[i]->vring[0] = start;
   313				rpdev->ivdev[i]->vring[1] = start + 0x8000;
   314				start += 0x10000;
   315				if (start > end) {
   316					dev_err(&pdev->dev,
   317						"Too small memory size %x!\n",
   318						(u32)size);
   319					ret = -EINVAL;
   320					break;
   321				}
   322			}
   323		} else {
   324			return -ENOMEM;
   325		}
   326	
   327		return ret;
   328	}
   329	
   330	static void rpmsg_work_handler(struct work_struct *work)
   331	{
   332		u32 message;
   333		unsigned long flags;
   334		struct imx_virdev *virdev;
   335		struct delayed_work *dwork = to_delayed_work(work);
   336		struct imx_rpmsg_vproc *rpdev = container_of(dwork,
   337				struct imx_rpmsg_vproc, rpmsg_work);
   338		struct circ_buf *cb = &rpdev->rx_buffer;
   339		struct platform_device *pdev = rpdev->pdev;
   340		struct device *dev = &pdev->dev;
   341	
   342		spin_lock_irqsave(&rpdev->mu_lock, flags);
   343		/* handle all incoming mu message */
   344		while (CIRC_CNT(cb->head, cb->tail, PAGE_SIZE)) {
   345			message = cb->buf[cb->tail];
   346			message |= (cb->buf[cb->tail + 1] << 8);
   347			message |= (cb->buf[cb->tail + 2] << 16);
   348			message |= (cb->buf[cb->tail + 3] << 24);
   349			spin_unlock_irqrestore(&rpdev->mu_lock, flags);
   350			virdev = rpdev->ivdev[(message >> 16) / 2];
   351	
   352			dev_dbg(dev, "%s msg: 0x%x\n", __func__, message);
   353			message = message >> 16;
   354			message -= virdev->base_vq_id;
   355	
   356			/*
   357			 * Currently both PENDING_MSG and explicit-virtqueue-index
   358			 * messaging are supported.
   359			 * Whatever approach is taken, at this point message contains
   360			 * the index of the vring which was just triggered.
   361			 */
   362			if (message  < virdev->num_of_vqs)
   363				vring_interrupt(message, virdev->vq[message]);
   364			spin_lock_irqsave(&rpdev->mu_lock, flags);
   365			cb->tail = CIRC_ADD(cb->tail, PAGE_SIZE, 4);
   366		}
   367		spin_unlock_irqrestore(&rpdev->mu_lock, flags);
   368	}
   369	
   370	#ifdef CONFIG_IMX_SCU
 > 371	void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   372	{
   373		int i;
   374		int vdev_nums = rpdev->vdev_nums;
   375	
   376		for (i = 0; i < vdev_nums; i++) {
   377			unregister_virtio_device(&rpdev->ivdev[i]->vdev);
   378			kfree(rpdev->ivdev[i]);
   379		}
   380	
   381		/* Make a double check that remote processor is ready or not */
   382		for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
   383			if (rpdev->flags & REMOTE_IS_READY)
   384				break;
   385			udelay(100);
   386		}
   387		if (unlikely((rpdev->flags & REMOTE_IS_READY) == 0)) {
   388			pr_err("Wait for remote ready timeout, assume it's dead.\n");
   389			/*
   390			 * In order to make the codes to be robust and back compatible.
   391			 * When wait remote ready timeout, use the MU_SendMessageTimeout
   392			 * to send the first kick-off message when register the vdev.
   393			 */
   394			rpdev->first_notify = rpdev->vdev_nums;
   395		}
   396	
   397		/* Allocate and setup ivdev again to register virtio devices */
   398		if (set_vring_phy_buf(rpdev->pdev, rpdev, rpdev->vdev_nums))
   399			pr_err("No vring buffer.\n");
   400	
   401		for (i = 0; i < vdev_nums; i++) {
   402			rpdev->ivdev[i]->vdev.id.device = VIRTIO_ID_RPMSG;
   403			rpdev->ivdev[i]->vdev.config = &imx_rpmsg_config_ops;
   404			rpdev->ivdev[i]->vdev.dev.parent = &rpdev->pdev->dev;
   405			rpdev->ivdev[i]->vdev.dev.release = imx_rpmsg_vproc_release;
   406			rpdev->ivdev[i]->base_vq_id = i * 2;
   407			rpdev->ivdev[i]->rpdev = rpdev;
   408	
   409			if (register_virtio_device(&rpdev->ivdev[i]->vdev))
   410				pr_err("%s failed to register rpdev.\n", __func__);
   411		}
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
