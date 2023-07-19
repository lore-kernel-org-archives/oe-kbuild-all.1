Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4017D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 02:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689732840; x=1721268840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/A7CzvtNemMtfBGX54ynPnbu+k72OuNd1OJg3KYO6zU=;
  b=NB/xRrvzLi+G6IzBvMN6zcbxoUSL/T3T8f6EAYUU/q+jGVDm14J09svn
   D8LeDTsVTl5HEnPoSNqZDL4q/w1zLcN7y2mRBUAkyyNXibS6p5VvIWDdk
   G/PCTAPDqVc56/a8pyegtoQQ6LbdeUjKuro5b2jW1nJaHVSbW7vyy1XRw
   n0DhjQmbUXJ8ogkZZyvoX2l/hUNEleGAA4Q5vDFoFfZKcAUXrODIo9b8Y
   v21MqgAf/dsAKLKaDJSbGjnxj0yFP4PtHFiRI2TuSJg6yfK9FJ6O7qKb+
   z9VY1ytkz7xk8HYzYUlhdcg601Z93GNoFM1lbzxtXmmJKv6LHYZ9Wsob7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430118258"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="430118258"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897749595"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="897749595"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Jul 2023 19:13:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLwhR-00043B-1Q;
	Wed, 19 Jul 2023 02:13:57 +0000
Date: Wed, 19 Jul 2023 10:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-nobdev-20230714-minorder 6/10]
 readahead.c:undefined reference to `__aeabi_ldivmod'
Message-ID: <202307191006.NCU2CQkc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230714-minorder
head:   037b96adc07c3f2004459646537f6735ec545aca
commit: 2b51ed864d56c86c2c17b6abca4e15e8dd7be055 [6/10] filemap: use minimum order while allocating folios
config: arm-randconfig-r016-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191006.NCU2CQkc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191006.NCU2CQkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191006.NCU2CQkc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/readahead.o: in function `readahead_expand':
>> readahead.c:(.text+0xa70): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
