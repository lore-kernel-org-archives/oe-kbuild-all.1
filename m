Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C39DF5D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 04:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUgiyEoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705119026; x=1736655026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKX6ELWIIbxvgyZPCwfBcAyQ41ZMYr9iqHmtEXYo1M4=;
  b=HUgiyEoEm0HYKEpyfcbCjkLsKEThmizSlLH8MC6gqfs/0BmjAEYVcUNI
   1i1EhQluj0QyS0tpEFjYItRJ9b2tenschyu03PrpxQtslP6MU0L6qgLQq
   eHRFXsUFuS6v0s6vwR3zNS410h14M8wcPjI9moSh3ai50PfKSnDGJdvAc
   +8o0zvAaYWPlYY8dmB20w5JlIAuBoWWhljYEqh7Lx5web5jAXW3tEZ0R1
   dcFPO2H/dzyRwq3gm+TGRuaEpwsav7xTuH/oqpglNqxTenZIw2/ILFd+L
   oqzqPZAtVnwHivuiDckDdIbCJ0MZ5HFGpdg+Gu1OGxDJ2qqzoeQnOZPzp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="389792707"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="389792707"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 20:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1114415882"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="1114415882"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2024 20:10:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOVLh-000A4e-15;
	Sat, 13 Jan 2024 04:10:21 +0000
Date: Sat, 13 Jan 2024 12:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>
Subject: /tmp/ccGfww2D.s:234: Error: selected processor does not support
 requested special purpose register -- `mrs r1,cpsr'
Message-ID: <202401131221.Hxl4DN46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: c41bd2514184d75db087fe4c1221237fb7922875 kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
date:   4 weeks ago
config: arm-randconfig-003-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131221.Hxl4DN46-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131221.Hxl4DN46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131221.Hxl4DN46-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccGfww2D.s: Assembler messages:
>> /tmp/ccGfww2D.s:234: Error: selected processor does not support requested special purpose register -- `mrs r1,cpsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
