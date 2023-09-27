Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA21A586
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695844593; x=1727380593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEob9OYhlb3C7kDCTQPB68srzWnEwyDGq/zBRYkaO90=;
  b=a8wF5Yz5XFeKxVqluqkzBtM+H+esRfyfrxs3OMBbIHQIURiC0lNKH4EJ
   8qAqMgpgwsJEzBMJrwIeSQAf4dBM+vNEgHdcpDTVuy8yOY3blnLsbfWBL
   UbaQY0oj14jt3bRdG5jz6i0GUnSwp0Xu+CEwNgmgcX3CX9YVhUhKz6LQf
   1xQ2GqVP3duY2zpDKWh37rY8aCk4tdKc7dElKb0Zco0v481iMpsu3gECH
   5FZyiDw1saDep1pYXxDSgy4BkCJa5OuXVUCI3OerhrOXjAM2RsgF1V2oX
   DVrf+Qi718rSPMJYXkUBp1eiOyt1XBUutyuSYUfD39FNVCZaXGGmT5vNR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446057714"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="446057714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 12:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996295035"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="996295035"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 12:56:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlae3-0000bm-2V;
	Wed, 27 Sep 2023 19:56:27 +0000
Date: Thu, 28 Sep 2023 03:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.super 18/30] kernel/power/swap.c:1573: warning:
 Excess function parameter 'exclusive' description in 'swsusp_close'
Message-ID: <202309280353.C3M5Aidp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.super
head:   953863a5a2ff126582a21068485dbf7d8ae1d6dc
commit: b589a66e368838a00e827a62cfff6aac1621de32 [18/30] PM: hibernate: Drop unused snapshot_test argument
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309280353.C3M5Aidp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280353.C3M5Aidp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280353.C3M5Aidp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:544: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
>> kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'


vim +1573 kernel/power/swap.c

61159a314bca64 Rafael J. Wysocki 2006-03-23  1566  
61159a314bca64 Rafael J. Wysocki 2006-03-23  1567  /**
61159a314bca64 Rafael J. Wysocki 2006-03-23  1568   * swsusp_close - close swap device.
40d84e198b0ae6 Chen Yu           2023-09-06  1569   * @exclusive: Close the resume device which is exclusively opened.
61159a314bca64 Rafael J. Wysocki 2006-03-23  1570   */
61159a314bca64 Rafael J. Wysocki 2006-03-23  1571  
b589a66e368838 Jan Kara          2023-09-27  1572  void swsusp_close(void)
61159a314bca64 Rafael J. Wysocki 2006-03-23 @1573  {
105ea4a2fd1848 Jan Kara          2023-09-27  1574  	if (IS_ERR(hib_resume_bdev_handle)) {
64ec72a1ece37d Joe Perches       2017-09-27  1575  		pr_debug("Image device not initialised\n");
61159a314bca64 Rafael J. Wysocki 2006-03-23  1576  		return;
61159a314bca64 Rafael J. Wysocki 2006-03-23  1577  	}
61159a314bca64 Rafael J. Wysocki 2006-03-23  1578  
105ea4a2fd1848 Jan Kara          2023-09-27  1579  	bdev_release(hib_resume_bdev_handle);
61159a314bca64 Rafael J. Wysocki 2006-03-23  1580  }
1b29c1643c0d82 Vivek Goyal       2007-05-02  1581  

:::::: The code at line 1573 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
