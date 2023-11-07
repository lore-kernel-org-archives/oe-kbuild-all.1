Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4030CF2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtZsSVGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699364876; x=1730900876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEWV3Qs7Fr3aKbNYbovqVJwsfqhYPaHOMYmXQolIuRs=;
  b=dtZsSVGS2rX5LWHyf/DUZka7U6qXKUhj7puXbdPXU5pKoEqwNj4IlzaZ
   2bwnatRTv5/SoLJaiQC1HDtvDiy2QeSQ2GtV+iM73Jtn6oBe9w8ac2a4j
   AePLKSnwQQ+jHV8jAGKS+cGFXP5nsFRB7rLSsBgcN/UuITrXJnhnbmsz1
   OyukQfUV8zT5vk63rbtRwdHB1HpSbNgovEX5R11FpOH9usv6nVukSYK+C
   JgPkJSAvxOjZ/UGnJxXD/SO2Z6UC70OjP1pKS9DiFPsiHJlSxowKx5NF2
   K0ad+iUPgJbzuJ15cRVtf/6PojiY9ejjEzugNQXgj14zP+odW4pOUTeb0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374540246"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="374540246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 05:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="828620004"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="828620004"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2023 05:47:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0MQr-00077j-08;
	Tue, 07 Nov 2023 13:47:53 +0000
Date: Tue, 7 Nov 2023 21:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 2/15]
 arm-linux-gnueabi-ld: fs/verity/init.o:undefined reference to
 `fsverity_require_signatures'
Message-ID: <202311072105.KYapwEoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   107fa261565f93b888f89afa60d3c75914955461
commit: 85625dae2927fcd9cff9620b68fb09c6367587d0 [2/15] aio: rm sentinel element from ctl_table array
config: arm-randconfig-004-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072105.KYapwEoT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072105.KYapwEoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072105.KYapwEoT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: fs/verity/init.o:(.data+0x4): undefined reference to `fsverity_require_signatures'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
