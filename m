Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FFC7FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfK1QTBq"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696484690; x=1728020690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZy3M/W6vfjHfMnf2/nF6wq28sifhbvcL2DcvkW8oAo=;
  b=kfK1QTBq506Y8hsgSedrArkgYGpmxqdWCrbxlwB+8/yqeiDw9CO6M7sa
   bnH3cNUhI0FJhx1NO2NnRBS2aHczldv48kiBao0d0J/gNR/CNh03xMR5Y
   XfDEIAtJSAAlYeY6MKwXCQoT1uASupw+B2YrF5Hc3xWMLXn/AHzoA1g6T
   d8q2CcsWGQLEvu4/VFpWJngkHcPSPeFmYMnnn9/i61sAj1SwVUT6QIrQN
   9H+UYgAzE15DlR0Qtewt84IsDaSY5fwGM34oulNNPtLNGfnnyXDavquPd
   wR9R/Fdm5sD0u4bP6UC1zEMfkEea5jZmUJdNaSYAwRmg5wmGz4UQ1tZrL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368477010"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="368477010"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 22:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751666043"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="751666043"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Oct 2023 22:44:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoHAE-000L4u-0n;
	Thu, 05 Oct 2023 05:44:46 +0000
Date: Thu, 5 Oct 2023 13:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:atomics/stats 3/3] lib/atomic_stats.c:72:12: sparse: sparse:
 symbol 'atomic_stats_init' was not declared. Should it be static?
Message-ID: <202310051354.qxm7Id7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/stats
head:   faac67799e50bb8a7b09f56f10128e6718959467
commit: faac67799e50bb8a7b09f56f10128e6718959467 [3/3] HACK/WIP: locking/atomic: allow statistics to be collected for atomics
config: i386-randconfig-062-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051354.qxm7Id7B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051354.qxm7Id7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051354.qxm7Id7B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/atomic_stats.c:72:12: sparse: sparse: symbol 'atomic_stats_init' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
