Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928E1867
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687077014; x=1718613014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yr9DgdoAQ619BCVTqUoRTa4bXOXj2yQNFGAWirnvcrg=;
  b=VaUDO4mmkvVbaWWf9QOdGnQcSlwuoMvgN2WnYGMRPrQr4EGNGzdzQ1YC
   dIjKqNZVUJX02oDzdwiYGuv4FPod9KvmaTAAwALnRbZPt0cqXz8ztDnl2
   WS68atHo28ua9fLpbugUHj07lQt/do2YBjQHq3+xTTNAbgj4XFYckYVrq
   317V1s1gIpWjwDNaxK/VV82c0mVrDi6FbJkI6ta4VHjy2ZsGKJWNzxhWW
   7DoOkGASv9H1AlEynub7vi/kIdEnf0uoOY3mLurmyQwY1+AbdRpNg/pEL
   sWGz+DF3mGqzlqnm9a4Wn7eA4lW04WM0WcLFrOZdJmT99YcMhsKBf0Vz4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339076303"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="339076303"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 01:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="887590225"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="887590225"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2023 01:30:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAnnW-0003a0-20;
	Sun, 18 Jun 2023 08:30:10 +0000
Date: Sun, 18 Jun 2023 16:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [linux-next:master 8123/10546] ERROR: modpost: "ip_send_check"
 [drivers/net/ethernet/sfc/sfc.ko] undefined!
Message-ID: <202306181634.mZtLrg9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: a1e82162af0b8ae9e65320ca405c6327edb99648 [8123/10546] sfc: generate encap headers for TC offload
config: arm-randconfig-s042-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181634.mZtLrg9r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181634.mZtLrg9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181634.mZtLrg9r-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "ip_route_output_flow" [drivers/net/ethernet/sfc/sfc.ko] undefined!
>> ERROR: modpost: "ip_send_check" [drivers/net/ethernet/sfc/sfc.ko] undefined!
ERROR: modpost: "arp_tbl" [drivers/net/ethernet/sfc/sfc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
