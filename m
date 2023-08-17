Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D51B7F3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 21:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692308126; x=1723844126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGOmvZ4uEQ/PrWIryV5MB+cGWBNkiXHzgIYptSq/g0o=;
  b=Eg98sduX1VCidQ61KSrLFXXHgC0WfCjnTyFGkhZzdqcmJhCnoHmyPDIQ
   6qhMAr++e0qt08vBwFPgIZhDgLufA2k1oLFkgh96vTp9I3vXHDj3X1t8x
   zHM0a9f8ogWBq5rqP85utT2d3zZL0RMx4mDEtmtjM7rho4H2IaScR+yI+
   qlTvC0nrzN3Vh82/tl8tyZBiZ3dTAsOQ/WOD6xnvq24CSsGurv8MdAqi0
   h8CaBPx4eQCOeD5orzozYmsJu1VZva3FsG4W7aS73ccbplVWVpsLLf14u
   sON06U/BmeZHfkz6s3KaN047TDrofkBfCaZGDkBUmar4+XxwOItVi9Ry0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459296809"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="459296809"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 14:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908586248"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="908586248"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 14:35:10 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWke5-0001UH-0p;
	Thu, 17 Aug 2023 21:35:09 +0000
Date: Fri, 18 Aug 2023 05:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] drivers/dma-buf/dma-buf.c:366:
 warning: Function parameter or member 'name' not described in
 'dma_buf_set_name'
Message-ID: <202308180520.xIYGzJsi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3ebafb7b468ba6595d9f1a2b899c8555374779aa
commit: 9c6866c99b8a6e6c04753d928233a927bac0c632 [1/1] ANDROID: dma-buf: support users to change dma_buf.name
config: arm-randconfig-r046-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180520.xIYGzJsi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180520.xIYGzJsi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180520.xIYGzJsi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:366: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
>> drivers/dma-buf/dma-buf.c:366: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +366 drivers/dma-buf/dma-buf.c

   351	
   352	/**
   353	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   354	 * It could support changing the name of the dma-buf if the same
   355	 * piece of memory is used for multiple purpose between different devices.
   356	 *
   357	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   358	 * @buf:    [in]     A piece of userspace memory that contains the name of
   359	 *                   the dma-buf.
   360	 *
   361	 * Returns 0 on success. If the dma-buf buffer is already attached to
   362	 * devices, return -EBUSY.
   363	 *
   364	 */
   365	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 366	{
   367		long ret = 0;
   368		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   369	
   370		if (!buf)
   371			return -ENOMEM;
   372	
   373		ret = _dma_buf_set_name(dmabuf, buf);
   374		if (ret)
   375			kfree(buf);
   376	
   377		return ret;
   378	}
   379	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
