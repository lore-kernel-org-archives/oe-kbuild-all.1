Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B685374D8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB7DvgAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699480085; x=1731016085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgQ4ix/N1zxpmyWcFWas5IYVRS7TFzi8zPyxUQDcIow=;
  b=jB7DvgADDFs+rhUXPxcQEOD6TSi5z5Y9AOfNMJtGGZgHJsdVY/8PTNoE
   oMlFTTbmUCstSC/Og2vbFl+6ou3hR6nURdL4Y0R7yQJpDrCslnhWvy70J
   jY1vajcCYmHAByOERsX5k549POFDGKC+/TQGxr6bnvjhFh9IolGWugRSN
   BDI/eZ2Qms5QZG7HaqagP2Z+f9U09mWvmPbMyrjAmUnWtn45KJ7mPO5dE
   zEHDlgJbcifdcWEnCDFbcDe63PBzUYEsIeL2Y2V4PDyuCjE4kOoJ/vrWS
   8CXP7zHg7X1X+vggTSMVKr/d7Sxq4YGAQtJaeg/cGyTrTRHLRg261/OmB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454164583"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="454164583"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 13:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713075287"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="713075287"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Nov 2023 13:48:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0qP2-0008D2-2a;
	Wed, 08 Nov 2023 21:48:00 +0000
Date: Thu, 9 Nov 2023 05:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.6.y-rt-rebase 132/181]
 kernel/printk/internal.h:137:17: warning: no previous prototype for
 'nbcon_get_default_prio'
Message-ID: <202311090501.wFJrW770-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt-rebase
head:   bc63ae5633ea188364e3a3a635af73771c70c3c7
commit: f7c3038c2eb4a73c0ca6222d4097c55a999c4f49 [132/181] printk: nbcon: Add unsafe flushing on panic
config: arc-randconfig-002-20231109 (https://download.01.org/0day-ci/archive/20231109/202311090501.wFJrW770-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090501.wFJrW770-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311090501.wFJrW770-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:61:
>> kernel/printk/internal.h:137:17: warning: no previous prototype for 'nbcon_get_default_prio' [-Wmissing-prototypes]
     137 | enum nbcon_prio nbcon_get_default_prio(void) { return NBCON_PRIO_NONE; }
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +/nbcon_get_default_prio +137 kernel/printk/internal.h

   130	
   131	static inline bool printk_percpu_data_ready(void) { return false; }
   132	static inline u64 nbcon_seq_read(struct console *con) { return 0; }
   133	static inline void nbcon_seq_force(struct console *con, u64 seq) { }
   134	static inline bool nbcon_alloc(struct console *con) { return false; }
   135	static inline void nbcon_init(struct console *con) { }
   136	static inline void nbcon_free(struct console *con) { }
 > 137	enum nbcon_prio nbcon_get_default_prio(void) { return NBCON_PRIO_NONE; }
   138	static inline void nbcon_atomic_flush_all(void) { }
   139	static bool nbcon_atomic_emit_next_record(struct console *con) { return false; }
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
