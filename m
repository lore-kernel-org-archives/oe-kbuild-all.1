Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4E12B85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axYK8eel"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696505265; x=1728041265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9CTKnWSsh4Kdv/A3XE1Dr5QKdCbOVMSiBXYoiG/qwjs=;
  b=axYK8eelSbPO5p+eA2HsJtKH9z4Wy2xgHR6y4hAYyU9nYcYjQVjy6bIQ
   byWSbFE4JICeJY75P3ErSME/XSg7MMPKEHDdl2UviUGpKV86mRW+N4Mmm
   LI7iIcb7L0zTTAdoXMEFY/CNoDftjIBuagJIXxgbneaIERPztreqMJ9Vv
   0Xx4OM7qky5294uFUdriMXU0lQeIlSUO3etTtkE8Xd6E3Udoas8OrgTY4
   Gjn/h8lPrzoOQswxQqQ7TbAKygJ/91xdgrbe8kXhbPIECmssO0paGVeLw
   AV7VIbN4GkrHI/xTL5vG89CJjftptWoQscXsFHYXa552q4fWuFzPXYs1Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363752802"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="363752802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728418895"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728418895"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 04:27:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoMVw-000LLI-0Y;
	Thu, 05 Oct 2023 11:27:34 +0000
Date: Thu, 5 Oct 2023 19:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/core 6/7] kernel/trace/trace_events.c:2285:5: sparse:
 sparse: symbol 'system_callback' was not declared. Should it be static?
Message-ID: <202310051911.PGscLp5C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   f5d9e8e08f81c9e7c723de7abcce106808f0770c
commit: 5790b1fb3d672d9a1fe3881a7181dfdbe741568f [6/7] eventfs: Remove eventfs_file and just use eventfs_inode
config: i386-randconfig-061-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051911.PGscLp5C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051911.PGscLp5C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051911.PGscLp5C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_events.c:998:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events.c:998:31: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events.c:998:31: sparse:     got struct event_filter [noderef] __rcu *filter
>> kernel/trace/trace_events.c:2285:5: sparse: sparse: symbol 'system_callback' was not declared. Should it be static?
--
>> fs/tracefs/event_inode.c:909:6: sparse: sparse: symbol 'eventfs_remove_events_dir' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
