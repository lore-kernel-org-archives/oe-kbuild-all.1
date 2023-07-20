Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53F1773D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689873327; x=1721409327;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xBOfYuK5/VT1vCU5adDpTd1QIQXg4B2qXgOarPeCITo=;
  b=BDrvXpCJiNtX20FnZJ5499itDF8NY2UzzG1mjd7wFFPlUQVb3TbgzUk9
   A11oQl/eWuaVhiHfEdF8n8Pe7MQQQBSsrsfmQTk2kErOmaFwTxYsGADXC
   DHDGbZLPaHhJWAovyR8clE2/Vpv1qyKlt+gLsxQ4gH063mVDIaxuOn0Dn
   P6MddO00xmp8+NDp3nqJIGJdQRqYTi9TLyNTYrWxvk6MYy1rMm9f1j3He
   lQdQ8F/bIYuMKr086zvjCZ4FZefKmaz0N5gwlsnJW4f3aP33DoxyHbFBT
   eWHRST4sGsI03kVd42UkxYn21eOQHha47F1XroJOxw6lYlQ4WCw/02uJE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346401564"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="346401564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727776409"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="727776409"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2023 10:15:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMXFH-0006JN-2y
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Jul 2023 17:15:21 +0000
Date: Fri, 21 Jul 2023 01:14:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/382] drivers/misc/dma-buf-phys.c:75:
 undefined reference to `dma_buf_get'
Message-ID: <202307210149.uLChTPfk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: vigneshr@ti.com
CC: nm@ti.com
TO: Andrew Davis <afd@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   607bd344fe026c652150d4af0aa1e922b06585ee
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/382] HACK: misc: Add dma-buf to physical address exporter
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230721/202307210149.uLChTPfk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210149.uLChTPfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210149.uLChTPfk-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/vdso/vdso.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_ioctl':
>> drivers/misc/dma-buf-phys.c:75: undefined reference to `dma_buf_get'
>> /usr/bin/ld: drivers/misc/dma-buf-phys.c:80: undefined reference to `dma_buf_attach'
>> /usr/bin/ld: drivers/misc/dma-buf-phys.c:86: undefined reference to `dma_buf_map_attachment'
>> /usr/bin/ld: drivers/misc/dma-buf-phys.c:112: undefined reference to `dma_buf_detach'
>> /usr/bin/ld: drivers/misc/dma-buf-phys.c:114: undefined reference to `dma_buf_put'
>> /usr/bin/ld: drivers/misc/dma-buf-phys.c:110: undefined reference to `dma_buf_unmap_attachment'
   /usr/bin/ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
>> drivers/misc/dma-buf-phys.c:55: undefined reference to `dma_buf_unmap_attachment'
   /usr/bin/ld: drivers/misc/dma-buf-phys.c:57: undefined reference to `dma_buf_detach'
   /usr/bin/ld: drivers/misc/dma-buf-phys.c:59: undefined reference to `dma_buf_put'
>> clang-14: error: linker command failed with exit code 1 (use -v to see invocation)


vim +75 drivers/misc/dma-buf-phys.c

    49	
    50	static int dma_buf_phys_release(struct inode *inode, struct file *file)
    51	{
    52		struct dma_buf_phys_file *priv = file->private_data;
    53	
    54		if (priv->attachment && priv->sgt)
  > 55			dma_buf_unmap_attachment(priv->attachment, priv->sgt, DMA_BIDIRECTIONAL);
    56		if (priv->dma_buf && priv->attachment)
    57			dma_buf_detach(priv->dma_buf, priv->attachment);
    58		if (priv->dma_buf)
    59			dma_buf_put(priv->dma_buf);
    60	
    61		kfree(priv);
    62	
    63		return 0;
    64	}
    65	
    66	static int dma_buf_phys_convert(struct dma_buf_phys_file *priv, int fd, u64 *phys)
    67	{
    68		struct device *dev = priv->dev;
    69		struct dma_buf *dma_buf;
    70		struct dma_buf_attachment *attachment;
    71		struct sg_table *sgt;
    72		dma_addr_t dma_addr;
    73		int ret;
    74	
  > 75		dma_buf = dma_buf_get(fd);
    76		if (IS_ERR(dma_buf))
    77			return PTR_ERR(dma_buf);
    78	
    79		/* Attach as the parent device as it will have the correct DMA ops set */
  > 80		attachment = dma_buf_attach(dma_buf, dev->parent);
    81		if (IS_ERR(attachment)) {
    82			ret = PTR_ERR(attachment);
    83			goto fail_put;
    84		}
    85	
  > 86		sgt = dma_buf_map_attachment(attachment, DMA_BIDIRECTIONAL);
    87		if (IS_ERR(sgt)) {
    88			ret = PTR_ERR(sgt);
    89			goto fail_detach;
    90		}
    91	
    92		/* Without PAT only physically contiguous buffers can be supported */
    93		if (sgt->orig_nents != 1) {
    94			dev_err(dev, "DMA-BUF not contiguous\n");
    95			ret = -EINVAL;
    96			goto fail_unmap;
    97		}
    98	
    99		dma_addr = sg_dma_address(sgt->sgl);
   100	
   101		*phys = dma_addr;
   102	
   103		priv->dma_buf = dma_buf;
   104		priv->attachment = attachment;
   105		priv->sgt = sgt;
   106	
   107		return 0;
   108	
   109	fail_unmap:
 > 110		dma_buf_unmap_attachment(attachment, sgt, DMA_BIDIRECTIONAL);
   111	fail_detach:
 > 112		dma_buf_detach(dma_buf, attachment);
   113	fail_put:
 > 114		dma_buf_put(dma_buf);
   115	
   116		return ret;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
