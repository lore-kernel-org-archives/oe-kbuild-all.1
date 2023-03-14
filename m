Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBB3D8C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678801369; x=1710337369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UButox8DsgHsAktpejVz/McnXXMI5zf9XAuDW8i/fMU=;
  b=BkF/b+Q0LVu4wXebvbJ794ffsxGqWemPBmYufCFQTtXwNi0GSDCcASvC
   zpOzDIoEFzmkly7iMsBTqVFL28Q7kpmOcW6brSKRnqOfuZqPUMqLD+9gM
   /+ueHhr9/bxX1wlQBG1tSf5dFvm3uhFm07Lb2V5JcTwN2h5p4/xdcnn6v
   4SjeOa+RzEP2uzS18OUHezUsaMZbw0U0pDYVUE59o961wZNshKDhdItxw
   bIZfG+odvn9RJucJ4xOV5BiJVsJ3XqH5F4zgiGbh3jacuh2mbvAGZ268Y
   6TvfeHZ1MLAluPHab3nTAWD21XdYJxV58AqqqhbAEqB7n9ppi0cB67ub/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317815138"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317815138"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672341803"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672341803"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 06:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4vG-0006wz-0R;
	Tue, 14 Mar 2023 13:42:38 +0000
Date: Tue, 14 Mar 2023 21:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
	michael.hennerich@analog.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nuno.sa@analog.com, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
Message-ID: <202303142140.ZQsw4C4V-lkp@intel.com>
References: <20230314105257.17345-3-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314105257.17345-3-paul@crapouillou.net>

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230314105257.17345-3-paul%40crapouillou.net
patch subject: [PATCH 2/2] usb: gadget: functionfs: Add DMABUF import interface
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230314/202303142140.ZQsw4C4V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4ee364ed5d112c4550344fd037f4e1ef7cc41878
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/usb-gadget-Support-already-mapped-DMA-SGs/20230314-185522
        git checkout 4ee364ed5d112c4550344fd037f4e1ef7cc41878
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142140.ZQsw4C4V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_fs.c:1401:5: warning: no previous prototype for 'ffs_dma_resv_lock' [-Wmissing-prototypes]
    1401 | int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
         |     ^~~~~~~~~~~~~~~~~


vim +/ffs_dma_resv_lock +1401 drivers/usb/gadget/function/f_fs.c

  1400	
> 1401	int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
  1402	{
  1403		int ret;
  1404	
  1405		ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
  1406		if (ret) {
  1407			if (ret != -EDEADLK)
  1408				goto out;
  1409			if (nonblock) {
  1410				ret = -EBUSY;
  1411				goto out;
  1412			}
  1413	
  1414			ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
  1415		}
  1416	
  1417	out:
  1418		return ret;
  1419	}
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
