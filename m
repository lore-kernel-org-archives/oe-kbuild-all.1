Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159D375
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 03:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690687340; x=1722223340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+uDOCQsvLIbGm8SSGkthnjDykufZPdqEkTZi3YY8+nE=;
  b=UDqxey37O2pDSV8rxpMpgH2FAbNxTN09hg84GtRDm67ZBfUf6WDc8Fov
   6RiBAVS+Jj2DIVniO8eOJO7gyaHTPc6D0CKMoRsZnyUWuCy3EMiKFbFqs
   Bb9ArphvNw6l2Sbnl7zfD7puPm/ttLyL+dTfafLz+wYkAaMHQ83FvaB8N
   Y32ELg74vp/s9aIhdiquTIz5iNQ9pZiJgj0Nh36pSSFS/FREOm2Olw8Cw
   cEUngHdnFUNrudmDK6HQNT6+nPrmklERj4IQgjVgPo+vkXOWaq95glJib
   qCxHpdndB5zZTEkZ+u2D4t7Dn3kn8af8IzxoLhKbWNPlf6ZSDFcKw5nOK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="372439098"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="372439098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 20:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727874228"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727874228"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 20:22:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPx0b-0004Pv-2h;
	Sun, 30 Jul 2023 03:22:17 +0000
Date: Sun, 30 Jul 2023 11:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 275/757] htmldocs:
 Warning: Documentation/filesystems/erofs.rst references a file that doesn't
 exist: Documentation/filesystems/dax.rst
Message-ID: <202307301122.Qbz0S3vq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.10.y
head:   aa1da5e725e58f84703aa2b66a717c15891cf67f
commit: e9de2f5d7502211fea93e88391c39853068a15c5 [275/757] erofs: dax support for non-tailpacking regular file
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301122.Qbz0S3vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301122.Qbz0S3vq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/filesystems/erofs.rst references a file that doesn't exist: Documentation/filesystems/dax.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
