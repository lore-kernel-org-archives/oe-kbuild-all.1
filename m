Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447A1632D8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938720; cv=none; b=hGFA/GiXV8R6Qfbn03UWF/tBgQG1io7zEX0QpwI+yrJXsZaVVEcU0MTttSkjYoPWS2Joz2S74xP5QmzyfxKsP9d8cefezSDItPIdCHCv3N33Ak9VvDJsfpWbZwtu+n6NJe2sO4vgkUBFuR7l4esZL1ebt3q7Cg2x4ubiejzyTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938720; c=relaxed/simple;
	bh=a/FRvCWJYJweqBNE7cM6iryp4mf5aEWsbrwDT+ZsRRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlSUzcMDI0Gpe2vUgbDl/FSLDPc/XNGPHH+K2QcbAaUaRFj4iA1+QMAo10ZlzRinValC5OB8f5q8cNT/tX0avgm/HJtE9yhtB517k4uj5lEQGlY4tV/ywJbrLFRwJhWoAZrV+IZL/FiEZbIDXOOviMT+XzC1a1zWWUVa5cU3meg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQAbh6Lf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQAbh6Lf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729938718; x=1761474718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/FRvCWJYJweqBNE7cM6iryp4mf5aEWsbrwDT+ZsRRc=;
  b=lQAbh6LfBD7/mSoTrut4PVqLeTTHMFknCx2A9eIbjBbmnjjJOyEmuj82
   WfU2V45MF8OCPaGUW+S1pHp/mo93KlV7ojfAWdLRm2COdYIzTli4zWHIO
   9eGKsFTlSVVSsbMMDRynUUcizTt7fVykEo3ZtmvMkPSdMMOzYusLbSA/7
   /Dhu2YP0NYVfg1YAWb0fYYy2dvncwysGD4X87nsvyZyT/qe1//9zv1Ek1
   CWd4/TIIHvdTyVhRtMQYCtNU7WU+NsMANjtakvulOJMkqC4CgD7EKWjUl
   u2U6b8WCz2Xle3SgzSr2Xl9GG5R0NqPSGGcMHNhhmwim4Nj4t01ie8uut
   A==;
X-CSE-ConnectionGUID: hSVjBnGvSRyRPiAK6wgp9A==
X-CSE-MsgGUID: qdUY6PZlT/G8aIWksdd8JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29790332"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29790332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:31:58 -0700
X-CSE-ConnectionGUID: vXpj8PmCSHuMAKfxMNoEkQ==
X-CSE-MsgGUID: q0WJdw+PQgO12ADGqyLOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81318344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2024 03:31:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4e5K-000ZW4-24;
	Sat, 26 Oct 2024 10:31:54 +0000
Date: Sat, 26 Oct 2024 18:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 2/10] drivers/virtio/virtio_msg_mmio.c:57:37:
 sparse: sparse: restricted __le32 degrades to integer
Message-ID: <202410261806.fAEVVD8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1ee7d4424b5fb877c9020b7426879470c2d47125
commit: bea6928905ca9df686467ece8a8d226a11eeda75 [2/10] virtio: Add support for MMIO based channel bus
config: powerpc64-randconfig-r123-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261806.fAEVVD8t-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261806.fAEVVD8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261806.fAEVVD8t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_mmio.c:57:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/virtio/virtio_msg_mmio.c:76:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *addr @@     got void [noderef] __iomem *base @@
   drivers/virtio/virtio_msg_mmio.c:76:27: sparse:     expected unsigned long long [usertype] *addr
   drivers/virtio/virtio_msg_mmio.c:76:27: sparse:     got void [noderef] __iomem *base
>> drivers/virtio/virtio_msg_mmio.c:79:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/virtio/virtio_msg_mmio.c:79:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/virtio/virtio_msg_mmio.c:79:42: sparse:     got unsigned long long [usertype] *
>> drivers/virtio/virtio_msg_mmio.c:87:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/virtio/virtio_msg_mmio.c:87:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/virtio/virtio_msg_mmio.c:87:42: sparse:     got unsigned long long [usertype] *
>> drivers/virtio/virtio_msg_mmio.c:163:25: sparse: sparse: symbol 'virtio_msg_mmio_pm_ops' was not declared. Should it be static?

vim +57 drivers/virtio/virtio_msg_mmio.c

    35	
    36	#define to_virtio_msg_mmio_device(_vmdev) \
    37		container_of(_vmdev, struct virtio_msg_mmio_device, vmdev)
    38	
    39	static irqreturn_t vm_interrupt(int irq, void *opaque)
    40	{
    41		struct virtio_msg_mmio_device *vmmdev = opaque;
    42		struct virtio_msg_vq *info;
    43		struct virtio_msg msg;
    44		bool handled = false;
    45	
    46		/* We don't have any msg here, lets create one to make it work */
    47		memset(&msg, 0, sizeof(msg));
    48		msg.id = VIRTIO_MSG_EVENT_USED;
    49		msg.event_used.index = 0;
    50	
    51		/* Call the interrupt handler for each virtqueue */
    52		list_for_each_entry(info, &vmmdev->vmdev.virtqueues, node) {
    53			if (!virtio_msg_receive(&vmmdev->vmdev, &msg)) {
    54				handled = true;
    55				break;
    56			}
  > 57			msg.event_used.index++;
    58		}
    59	
    60		/* Interrupt should belong to one of the virtqueues at least */
    61		if (!handled) {
    62			pr_err("%s: Failed to find virtqueue for message", __func__);
    63			return IRQ_NONE;
    64		}
    65	
    66		return IRQ_HANDLED;
    67	}
    68	
    69	static int virtio_msg_mmio_send(struct virtio_msg_device *vmdev,
    70					struct virtio_msg *request,
    71					struct virtio_msg *response)
    72	{
    73		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    74		int i, len = sizeof(*request) / sizeof(u64);
    75		u64 *data = (u64 *) request;
  > 76		u64 *addr = vmmdev->base;
    77	
    78		for (i = 0; i < len; i++)
  > 79			writeq(*(data + i), addr + i);
    80	
    81		if (!response)
    82			return 0;
    83	
    84		data = (u64 *) response;
    85	
    86		for (i = 0; i < len; i++)
  > 87			*(data + i) = readq(addr + i);
    88	
    89		return 0;
    90	}
    91	
    92	static const char *virtio_msg_mmio_bus_name(struct virtio_msg_device *vmdev)
    93	{
    94		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    95	
    96		return vmmdev->pdev->name;
    97	}
    98	
    99	static void virtio_msg_mmio_synchronize_cbs(struct virtio_msg_device *vmdev)
   100	{
   101		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
   102	
   103		synchronize_irq(platform_get_irq(vmmdev->pdev, 0));
   104	}
   105	
   106	static void virtio_msg_mmio_release(struct virtio_msg_device *vmdev)
   107	{
   108		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
   109	
   110		kfree(vmmdev);
   111	}
   112	
   113	static int virtio_msg_mmio_vqs_prepare(struct virtio_msg_device *vmdev)
   114	{
   115		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
   116		int ret, irq = platform_get_irq(vmmdev->pdev, 0);
   117	
   118		if (irq < 0)
   119			return irq;
   120	
   121		ret = request_irq(irq, vm_interrupt, IRQF_SHARED, dev_name(&vmdev->vdev.dev),
   122				  vmmdev);
   123		if (ret)
   124			return ret;
   125	
   126		if (of_property_read_bool(vmmdev->pdev->dev.of_node, "wakeup-source"))
   127			enable_irq_wake(irq);
   128	
   129		return 0;
   130	}
   131	
   132	static void virtio_msg_mmio_vqs_release(struct virtio_msg_device *vmdev)
   133	{
   134		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
   135	
   136		free_irq(platform_get_irq(vmmdev->pdev, 0), vmmdev);
   137	}
   138	
   139	static struct virtio_msg_ops vmm_ops = {
   140		.send = virtio_msg_mmio_send,
   141		.bus_name = virtio_msg_mmio_bus_name,
   142		.synchronize_cbs = virtio_msg_mmio_synchronize_cbs,
   143		.release = virtio_msg_mmio_release,
   144		.prepare_vqs = virtio_msg_mmio_vqs_prepare,
   145		.release_vqs = virtio_msg_mmio_vqs_release,
   146	};
   147	
   148	#ifdef CONFIG_PM_SLEEP
   149	static int virtio_msg_mmio_freeze(struct device *dev)
   150	{
   151		struct virtio_msg_mmio_device *vmmdev = dev_get_drvdata(dev);
   152	
   153		return virtio_msg_freeze(&vmmdev->vmdev);
   154	}
   155	
   156	static int virtio_msg_mmio_restore(struct device *dev)
   157	{
   158		struct virtio_msg_mmio_device *vmmdev = dev_get_drvdata(dev);
   159	
   160		return virtio_msg_restore(&vmmdev->vmdev);
   161	}
   162	
 > 163	const struct dev_pm_ops virtio_msg_mmio_pm_ops = {
   164		SET_SYSTEM_SLEEP_PM_OPS(virtio_msg_mmio_freeze, virtio_msg_mmio_restore)
   165	};
   166	#endif
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
