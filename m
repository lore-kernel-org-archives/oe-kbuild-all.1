Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E01CF90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695654389; x=1727190389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUWjDSlWrX8xWrBc85JL4lN5tIVKXcw3qOJlVcn0cnY=;
  b=jZ8qTg0D0BYNWxJD3Z5w02LzZZ4Avy+9LE7dMcjvIoeD5FW9qvvJy/q2
   72eXCWR2Xlf88c3OguCRN3SHt582nClr594bDKQj3M6+KBib5i+MdVZb+
   jlCSTZPOeQkrJ1blMPrUmLdStTcTZfvbxpmP37KFFhPRIB3c5x9/QiUBF
   Ie5TVyXbNAAzH3DZ8JgUtnnplER+B12Fk795B5c4P/VOM71iiDu3zXWbT
   TJK6YfBjHcnvRLy7W7Fzz0xEvgTXhapPQpUF6kSfBAlsqAPxSkiIcNb4B
   ki3WG/bc6/LMAKwLxlHK9WiYg3gyF/dlDmnpophO4FafHa7p0VQ8I6tjW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366332912"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="366332912"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 08:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741950756"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="741950756"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Sep 2023 08:06:25 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qknAF-0001dV-0j;
	Mon, 25 Sep 2023 15:06:23 +0000
Date: Mon, 25 Sep 2023 23:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Liming Sun <limings@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	David Thompson <davthompson@nvidia.com>,
	Vadim Pasternak <vadimp@nvidia.com>
Subject: drivers/platform/mellanox/mlxbf-tmfifo.c:148: warning: cannot
 understand function prototype: 'struct mlxbf_tmfifo_io '
Message-ID: <202309252330.saRU491h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6465e260f48790807eef06b583b38ca9789b6072
commit: bc05ea63b39420fd561dcffba00753da90338ea8 platform/mellanox: Add BlueField-3 support in the tmfifo driver
date:   10 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230925/202309252330.saRU491h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252330.saRU491h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252330.saRU491h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/mellanox/mlxbf-tmfifo.c:72: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_vring '
   drivers/platform/mellanox/mlxbf-tmfifo.c:118: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_vdev '
   drivers/platform/mellanox/mlxbf-tmfifo.c:136: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_irq_info '
>> drivers/platform/mellanox/mlxbf-tmfifo.c:148: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_io '
   drivers/platform/mellanox/mlxbf-tmfifo.c:172: warning: cannot understand function prototype: 'struct mlxbf_tmfifo '
   drivers/platform/mellanox/mlxbf-tmfifo.c:198: warning: cannot understand function prototype: 'struct mlxbf_tmfifo_msg_hdr '


vim +148 drivers/platform/mellanox/mlxbf-tmfifo.c

   141	
   142	/**
   143	 * mlxbf_tmfifo_io - Structure of the TmFifo IO resource (for both rx & tx)
   144	 * @ctl: control register offset (TMFIFO_RX_CTL / TMFIFO_TX_CTL)
   145	 * @sts: status register offset (TMFIFO_RX_STS / TMFIFO_TX_STS)
   146	 * @data: data register offset (TMFIFO_RX_DATA / TMFIFO_TX_DATA)
   147	 */
 > 148	struct mlxbf_tmfifo_io {
   149		void __iomem *ctl;
   150		void __iomem *sts;
   151		void __iomem *data;
   152	};
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
