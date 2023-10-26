Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E235882
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+m0p3FN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698333991; x=1729869991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kikgUvwNXiB4HBTw9e8kPU08CidPRB2du8zifAChJdg=;
  b=Y+m0p3FNcS5LMnXTCGyfd1iwtkFgXgm6cGUbi1V0rmL+XbNeWPl21Kuy
   3HiRnoHVEX46P2lUv58W7dOxt6xTsBZlcpn0DdGFF50jIEmLTnlV23VHB
   EWCVn4mRrqpaK3j5gvfhABmF2odrntaygdQnhNqTUt2zIskBYSo84qtqq
   Q6o9Wqsr0BQJcbBrIlleMwC8BQCO5qBOvfBPhrzeKi1U28LpqBXQz3c83
   ZFCmIWX2NqYMeVEofcrpZm3B9tEq9L2axIrurK/uc7gjR/TY0banzYXrl
   j3QUTaaPvNZACFEEb9a+1glOPd3SZXwyr+xFg6ccnBelD9ja5Z888U+eo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377940146"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377940146"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 08:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="902943388"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902943388"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2023 08:24:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw2Fc-0009tE-0c;
	Thu, 26 Oct 2023 15:26:24 +0000
Date: Thu, 26 Oct 2023 23:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1004/1018] io_uring/zc_rx.c:144:5: sparse: sparse:
 symbol 'io_zc_rx_create_pool' was not declared. Should it be static?
Message-ID: <202310262356.BTeLgc7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: de471788991400859db2362ac41d6f1d2662820a [1004/1018] io_uring: add ZC buf and pool
config: i386-randconfig-061-20231026 (https://download.01.org/0day-ci/archive/20231026/202310262356.BTeLgc7v-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262356.BTeLgc7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262356.BTeLgc7v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/zc_rx.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:308:48: sparse: sparse: array of flexible structures
>> io_uring/zc_rx.c:144:5: sparse: sparse: symbol 'io_zc_rx_create_pool' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
