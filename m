Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087517F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 04:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692676968; x=1724212968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GzHcxH9wDTbR8wx5RKVUNHXzoJIaAVj8QrftgUcL0c=;
  b=LJqVuiTLSa/gKrQJm84xIpcwcRxdDrmwXn02kaO4RPY26GgvfR9AWpdy
   WPA3pvVLPFk8lZ0ZqBDvxKC0EUay6grCCsdarJNhvo9LTChasBdibN47O
   Y5PVtVTl9Y+XzkASWHx+UjCETJc8FXdi7fh3HK7qVtRGYf79KmZdajpSE
   om+SX64Cz9EiPfndeU9Wn4Wz33VpXfgX1EvSCFP+lw/h2gjRJMsctMfgw
   Lz3mmMeYGi8rk+8a6OCXcDQ+puD0uAEGnUwpbyIJIJJvXdrNSg01t187K
   MekF7ehp4p5ovRgPju2NEYkrC91G1j4qyASskhQ4OxhPtxx94wl/v/n6L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358761841"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="358761841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 21:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066878006"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="1066878006"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 21:02:24 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYIaX-0001KG-1h;
	Tue, 22 Aug 2023 04:02:04 +0000
Date: Tue, 22 Aug 2023 11:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 51/63] drivers/dma-buf/dma-buf.c:375:
 warning: Function parameter or member 'name' not described in
 'dma_buf_set_name'
Message-ID: <202308221149.QIXTz9cT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3ca64f2c1d4a9c43702fb81c557480d6e43870f2
commit: af2ae8657c9a8123c333a5301278b68168a18a15 [51/63] FROMLIST: dma-buf: support users to change dma_buf.name
config: i386-randconfig-063-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221149.QIXTz9cT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221149.QIXTz9cT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221149.QIXTz9cT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:375: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
>> drivers/dma-buf/dma-buf.c:375: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +375 drivers/dma-buf/dma-buf.c

   358	
   359	/**
   360	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   361	 * The name of the dma-buf buffer can only be set when the dma-buf is not
   362	 * attached to any devices. It could theoritically support changing the
   363	 * name of the dma-buf if the same piece of memory is used for multiple
   364	 * purpose between different devices.
   365	 *
   366	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   367	 * @buf:    [in]     A piece of userspace memory that contains the name of
   368	 *                   the dma-buf.
   369	 *
   370	 * Returns 0 on success. If the dma-buf buffer is already attached to
   371	 * devices, return -EBUSY.
   372	 *
   373	 */
   374	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 375	{
   376		long ret = 0;
   377		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   378	
   379		if (!buf)
   380			return -ENOMEM;
   381	
   382		ret = _dma_buf_set_name(dmabuf, buf);
   383		if (ret)
   384			kfree(buf);
   385	
   386		return ret;
   387	}
   388	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
