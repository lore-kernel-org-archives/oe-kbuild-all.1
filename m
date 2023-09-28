Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01B16407
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695935495; x=1727471495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZzcF/RE+QQCAwtGUFO42r4634qOfEeUd9jYMeM50JQ=;
  b=gmqQHl/dGdXWeiM41EOE+xhqfxgUuSjXRKO4RmG2kt0a/sYuw5htRrW7
   J32wb6p9YB78oRk0Jv36kxihb7kgsnFFVTTXRw9wRmhbWqPHwfiTa+AH4
   M0Ln8Czox9EkVEvC1whzGzueXPCib9hYn2dtF35l8sQ794xe5lrL3eQGF
   YI4LNjf2c/hk5N4ZBAwCRtNYntdFe3x4BCTQo8fbG9RZ/2voknwyj15eN
   tux/Al1OtTZ9K9erazWjBuq6rGCVPyxBMUvVB/5gNavYpZEpSAlwTvyF9
   HHeyx5lzN8pH2gvnl8Y5U2Fp9ztvE4VS9j5jcP/MA6/RkNVL5cf34SA45
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446338036"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="446338036"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 14:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996712650"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="996712650"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2023 14:11:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlyIC-0001yM-2b;
	Thu, 28 Sep 2023 21:11:28 +0000
Date: Fri, 29 Sep 2023 05:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded
 semicolon
Message-ID: <202309290549.7IPOeLw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9ed22ae6be817d7a3f5c15ca22cbc9d3963b481d
commit: 78a43c7e3b2ff5aed1809f93b4f87a418355789e drm/nouveau/gr/gf100-: make global attrib_cb actually global
date:   11 months ago
config: i386-randconfig-053-20230928 (https://download.01.org/0day-ci/archive/20230929/202309290549.7IPOeLw5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309290549.7IPOeLw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290549.7IPOeLw5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
