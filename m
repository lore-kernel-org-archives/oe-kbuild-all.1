Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F81849
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqgniwLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702800521; x=1734336521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NXzoIRSDAl/OjSr6xbYZNe+bA/fxCKfexV2BaBHuD8=;
  b=JqgniwLX9UHcSdSRYm7eIPsi/r3gXcpWVgHxX2HhDhrtD3UjIAjelgTp
   ACv841soDjZqvZZWwskpk1jUAmMFZ3Jp2aD+FpKI8rei4TL/N0JLbcgf8
   +Y/89FWBDtuIJDUu5plwABU18MzuzGaeXLlqqtto9OjHgKg1jJpWS4TDt
   E3AGOuz6ccVs1zq5rIsBpkuOI9XWGBeZdF/GljQ/IJZnN9ToqBjjU9i3l
   KQPsTex6m6mpUzuGSXMTGzJxx585Vc8lBoexCy1woD2cahsZxpU0wLifg
   5f3yVsqYXeh47RGTkg+i2qTa3Bx2l7dmKuDF1SYS7U/BgI7fq7ksluBhS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2244015"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2244015"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 00:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="865881832"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="865881832"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2023 00:08:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEmCN-0002qG-25;
	Sun, 17 Dec 2023 08:08:34 +0000
Date: Sun, 17 Dec 2023 16:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7696/8213] drivers/bus/mhi/ep/main.c:519:22:
 warning: format '%ld' expects argument of type 'long int', but argument 5
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202312171537.W9d6tX7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: e59bba2cc6c746942c7c2d83ebcd9b92ae0a1aca [7696/8213] bus: mhi: ep: Add support for async DMA write operation
config: arm-randconfig-r081-20231214 (https://download.01.org/0day-ci/archive/20231217/202312171537.W9d6tX7p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171537.W9d6tX7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171537.W9d6tX7p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/mhi.h:9,
                    from include/linux/mhi_ep.h:10,
                    from drivers/bus/mhi/ep/main.c:15:
   drivers/bus/mhi/ep/main.c: In function 'mhi_ep_skb_completion':
>> drivers/bus/mhi/ep/main.c:519:22: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     519 |         dev_dbg(dev, "Sending completion for ring (%d) rd_offset: %ld\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/bus/mhi/ep/main.c:519:9: note: in expansion of macro 'dev_dbg'
     519 |         dev_dbg(dev, "Sending completion for ring (%d) rd_offset: %ld\n",
         |         ^~~~~~~
   drivers/bus/mhi/ep/main.c:519:69: note: format string is defined here
     519 |         dev_dbg(dev, "Sending completion for ring (%d) rd_offset: %ld\n",
         |                                                                   ~~^
         |                                                                     |
         |                                                                     long int
         |                                                                   %d
   drivers/bus/mhi/ep/main.c: In function 'mhi_ep_queue_skb':
   drivers/bus/mhi/ep/main.c:600:30: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     600 |                 dev_dbg(dev, "rd_offset at the end of queue_skb: %ld\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/bus/mhi/ep/main.c:600:17: note: in expansion of macro 'dev_dbg'
     600 |                 dev_dbg(dev, "rd_offset at the end of queue_skb: %ld\n",
         |                 ^~~~~~~
   drivers/bus/mhi/ep/main.c:600:68: note: format string is defined here
     600 |                 dev_dbg(dev, "rd_offset at the end of queue_skb: %ld\n",
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long int
         |                                                                  %d


vim +519 drivers/bus/mhi/ep/main.c

   499	
   500	static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
   501	{
   502		struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
   503		struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
   504		struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
   505		struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
   506		struct mhi_ring_element *el = &ring->ring_cache[ring->rd_offset];
   507		struct device *dev = &mhi_dev->dev;
   508		struct mhi_result result = {};
   509		int ret;
   510	
   511		if (mhi_chan->xfer_cb) {
   512			result.buf_addr = buf_info->cb_buf;
   513			result.dir = mhi_chan->dir;
   514			result.bytes_xferd = buf_info->size;
   515	
   516			mhi_chan->xfer_cb(mhi_dev, &result);
   517		}
   518	
 > 519		dev_dbg(dev, "Sending completion for ring (%d) rd_offset: %ld\n",
   520	ring->er_index, ring->rd_offset);
   521		ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el, buf_info->size,
   522						   buf_info->code);
   523		if (ret) {
   524			dev_err(dev, "Error sending transfer completion event\n");
   525			return;
   526		}
   527	
   528		mhi_ep_ring_inc_index(ring);
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
