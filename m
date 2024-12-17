Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C991FCCE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451186; cv=none; b=Gkr6xwlfxBjyiBBBhDczr42fE/3Y6pvQZtDXmwvUvqpYu41MgiFRWMuTrd6o602mi5pElrGA4VO4qF9cum7imsEzfvRhxMLNZh1o3Y9DLzhe92j/I5d90S6FcjMPRjZ0ndWGnFesS8OvC4MbqKW4JEcuZcHMnErjZM6OGy7xIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451186; c=relaxed/simple;
	bh=otz3wqO4ZqeRuN49z+dSK9rbYk/S/n+t50fadtFFwVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOUvjc3GCqj58lGSZd7zHz00QUZ0It/pEehbjpr8BChIUby1poYbAazZ6yQtKSwkZRQ5UQwxyyrX74UbmkMIb36Y0GBVwlyHg2NjXBD+x6bmtQCZOsIZ7m4ILko4TkVDlohogg+hHYsDQuptF48vfcahJ6Zf/f5USgzwTVDujx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/C6f13g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/C6f13g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734451185; x=1765987185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otz3wqO4ZqeRuN49z+dSK9rbYk/S/n+t50fadtFFwVE=;
  b=R/C6f13glJHGjI7VL5hrP6uTS0a4QHzClWtzQqRhoEk9FcinnqAC6NCY
   p3o4NaILiaSwNk40GG25vYhBqKL5I1ZYY+WdMRiPux1ye8PS54Xo+tvbj
   7heSYivfRPvFElGRzJIOrH4XKlpLUTApiVJ753uMBNnnYCl6e6fFBfdQw
   Y1SriqiOkrf8wUslkITmGkI7QN4+CeK2GbGlfli7klrQojT3ZuUfj9JJu
   umEl1BkPyXfmJiRZ09qvLTgI7rYXj2CV1i/Yl/Om0z03Kxfl7FTI2iKT1
   6QbhW+JNumXNmKocYZcwAWv7U6w7Wk7CmZgOyEo4uzxiGEUjwKljYNYsd
   w==;
X-CSE-ConnectionGUID: PAnKd379Rv6/RSSniHHUmQ==
X-CSE-MsgGUID: ZTIyCZOUQXafSNuIjN8NSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34206825"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34206825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:59:44 -0800
X-CSE-ConnectionGUID: 1HxRtq1nTyWf+P8oWltWvg==
X-CSE-MsgGUID: EcqngbfgRkKQ9ALnatB4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134915556"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2024 07:59:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZz2-000F6q-1y;
	Tue, 17 Dec 2024 15:59:40 +0000
Date: Tue, 17 Dec 2024 23:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1640/1640] drivers/crypto/ccp/hygon/hct.c:362
 hct_dev_cmd_queue_init() warn: always true condition '(dev_ctx->q_count >=
 0) => (0-u32max >= 0)'
Message-ID: <202412172322.TKo92WwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [1640/1640] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172322.TKo92WwH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412172322.TKo92WwH-lkp@intel.com/

smatch warnings:
drivers/crypto/ccp/hygon/hct.c:362 hct_dev_cmd_queue_init() warn: always true condition '(dev_ctx->q_count >= 0) => (0-u32max >= 0)'
drivers/crypto/ccp/hygon/hct.c:668 hct_write() warn: potential spectre issue 'dev_ctx->cmd_q' [r]
drivers/crypto/ccp/hygon/hct.c:672 hct_write() warn: potential spectre issue 'mdev_state->trigger' [r]
drivers/crypto/ccp/hygon/hct.c:1384 is_dma_share() warn: always true condition '(dma_iova >= 0) => (0-u64max >= 0)'

vim +362 drivers/crypto/ccp/hygon/hct.c

   295	
   296	static int hct_dev_cmd_queue_init(struct pci_dev *pdev, struct hct_dev_ctx *dev_ctx, int idx)
   297	{
   298		struct hct_cmd_queue *cmd_q;
   299		unsigned long addr, len;
   300		unsigned int retval, qmr;
   301		int i, ret;
   302	
   303		if (!pdev || !dev_ctx)
   304			return -EINVAL;
   305	
   306		memset(dev_ctx, 0, sizeof(*dev_ctx));
   307	
   308		ret = pci_enable_device(pdev);
   309		if (ret)
   310			return -EINVAL;
   311	
   312		addr = pci_resource_start(pdev, PCI_RESOURCE_BAR2);
   313		len = pci_resource_len(pdev, PCI_RESOURCE_BAR2);
   314		dev_ctx->io_regs = ioremap(addr, len);
   315		if (!dev_ctx->io_regs)
   316			return -ENOMEM;
   317	
   318		pci_set_master(pdev);
   319		retval = pci_alloc_irq_vectors(pdev, 1, MCCP_MSIX_ENTRY_SIZE, PCI_IRQ_MSIX);
   320		if (retval != MCCP_NTB_VECTOR_NUM && retval != MCCP_PSP_VECTOR_NUM)
   321			return -ENOMEM;
   322	
   323		snprintf(dev_ctx->devname, MCCP_STRING_LEN, "hct-ccp-%d", idx);
   324		dev_ctx->irq = pci_irq_vector(pdev, retval - 1);
   325		/* To request_irq, the fourth parameter dev_name must be global
   326		 * variable or static variable.
   327		 */
   328		ret = request_irq(dev_ctx->irq, hct_cmd_queue_intr_handler, 0, dev_ctx->devname, dev_ctx);
   329		if (ret) {
   330			pci_free_irq_vectors(pdev);
   331			dev_ctx->irq = 0;
   332			return ret;
   333		}
   334	
   335		tasklet_init(&dev_ctx->irq_tasklet, hct_cmd_queue_intr_task, (unsigned long)dev_ctx);
   336	
   337		qmr = ioread32(dev_ctx->io_regs + Q_MASK_REG);
   338		if (qmr == 0) {
   339			iowrite32(0x1f, dev_ctx->io_regs + Q_MASK_REG);
   340			qmr = ioread32(dev_ctx->io_regs + Q_MASK_REG);
   341		}
   342		for (i = 0; i < MCCP_DEV_QUEUE_MAX; i++) {
   343			if (!(qmr & (1 << i)))
   344				continue;
   345	
   346			cmd_q = &dev_ctx->cmd_q[dev_ctx->q_count++];
   347	
   348			mutex_init(&cmd_q->q_lock);
   349			ret = kfifo_alloc(&cmd_q->ectx_fifo, MCCP_INSTANCE_MAX, GFP_KERNEL);
   350			if (ret)
   351				return -ENOMEM;
   352	
   353			cmd_q->reg_control = dev_ctx->io_regs + MCMD_Q_STATUS_INCR * (i + 1);
   354			cmd_q->reg_tail_lo = cmd_q->reg_control + MCMD_Q_TAIL_LO_BASE;
   355			cmd_q->reg_head_lo = cmd_q->reg_control + MCMD_Q_HEAD_LO_BASE;
   356			cmd_q->reg_int_enable = cmd_q->reg_control + MCMD_Q_INT_ENABLE_BASE;
   357			cmd_q->reg_interrupt_status = cmd_q->reg_control + MCMD_Q_INTERRUPT_STATUS_BASE;
   358			cmd_q->reg_status = cmd_q->reg_control + MCMD_Q_STATUS_BASE;
   359			cmd_q->reg_int_status = cmd_q->reg_control + MCMD_Q_INT_STATUS_BASE;
   360		}
   361	
 > 362		return (dev_ctx->q_count >= 0) ? 0 : -1;
   363	}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
