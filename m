Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9DB15AD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692136037; x=1723672037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s4RnkKZRmjxzcjBk3GgrgM4OPxoBuqBpZBQk6chlUY=;
  b=hPRwrW6hjOIE/QM1QkBYBVm9hztq+ky7SBx2os4qbcg0TRqPOFiEphQE
   mH916ljNiE9H3aNljncXHbZ6/ORl4CT/bMUAgD8b3nM+0Trszwb0PfciJ
   FVMBt25p9Cdl3836rm+wOi0nAarxv9vCsPjK9KmNiv8APtVxx93sd+O5d
   Z4JR550T91p2l63ZN5+z2JWtFf10xD4qHh/J8xIBXQSRsMt06v6yYIljj
   4QV8sJO+YZWyKZosk4dHwvfsqkzKre/OAuJhCByB0H62IYhC6d1zaXcnu
   Q//XvmXhJBn7NdjF19bf5yj0gdbntp9wnShG58yNETx9tznUaEv9iEhE9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403363668"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="403363668"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768967398"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="768967398"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 14:47:13 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW1se-0001Fp-08;
	Tue, 15 Aug 2023 21:47:12 +0000
Date: Wed, 16 Aug 2023 05:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [davejiang:cxl-ide 20/24] htmldocs:
 Documentation/driver-api/acpi/keyp.rst: WARNING: document isn't included in
 any toctree
Message-ID: <202308160511.yQu2B5co-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   a43b30b80446a307847711c68ed284729a3e4cdb
commit: 41909be2f957ba387c3b58c4dd2207758774cb63 [20/24] acpi: Add KEYP documentation
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160511.yQu2B5co-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160511.yQu2B5co-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/acpi/keyp.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
