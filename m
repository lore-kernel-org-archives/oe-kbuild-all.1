Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CC36AF0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696347283; x=1727883283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=amYhNn/eD7POZuSrj5Jl80L6ZktVnDMNth2jkW66bBo=;
  b=QRBPhc2sHe5iIESm5MynaZvCQ0zY7yZlfBk0GfeljKKi1wlz0Wg/8HZl
   XqUFoLwKggilhvRdMYhm7VLB3m+6t4ObJSpFwaWQoMM8J7gqtM585xD4c
   MftoSjnhdy8oS2od+bc8p/mBc4JHNjba+Pe24rpU0yd8dT9EZohoTjF2U
   LgNFcUe4kCtc2afwboxDt72KOngkp1iAQcWzGJx7bzB+H6kWUHRLG6qL3
   XsO8+mzdiZK70j4w0X/tuTw7j8szIOS26Tnlrc6JLZUa0ygawLALOfR7d
   rxD00Cf1jwgGopZRrnf/LkOZA15iLVGKnE3WEJYwaBE/EngpX6nJK6tFj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="469185340"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="469185340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 08:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786125930"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="786125930"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Oct 2023 08:34:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnhPw-0007EK-05;
	Tue, 03 Oct 2023 15:34:36 +0000
Date: Tue, 3 Oct 2023 23:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: vmlinux.o: warning: objtool: ovl_copy_up_tmpfile() falls through to
 next function wacom_bpt3_touch_msg.cold()
Message-ID: <202310032325.XWZZTk8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3
commit: 0babf89c9cca7e074d6e59893e462e4886f481cc hwmon: (f71882fg) prevent possible division by zero
date:   5 months ago
config: x86_64-buildonly-randconfig-r004-20220214 (https://download.01.org/0day-ci/archive/20231003/202310032325.XWZZTk8n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310032325.XWZZTk8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032325.XWZZTk8n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ovl_copy_up_tmpfile() falls through to next function wacom_bpt3_touch_msg.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
