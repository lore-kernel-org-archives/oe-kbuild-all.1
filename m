Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AECA33D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695800060; x=1727336060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UKu9ONxcGlNcFqkhiwsBAsWnHossgy3WqdaY7twEEI=;
  b=mwNZqpzZguQXZDxPYs0rVqKgVuGwB9+GTVwfqwpOyOCoQF1S+p66RnWG
   +k9gWJ3I5qHW3IX4CNAU5NBd7wa1GgRrgEC7Jr8G3CocFEmC7q02XvSWS
   pT3i/Yv2A4D8lJjh0WOGxL9E+4qyN6th6KQW7NvBOUOuRQALypkp5GSVK
   VxNr31lbH9WfjRVO3Au5YRVGJNhYB33Iz40KgmMqPA+WY7VdSMavWlH3c
   X3OEc28fxvB8rALgSiPAW+qMZKMErs3kWzf24w+7dsK5mFXGgseUrAAsR
   471LZYybv3IsbnadpPP0fTJE2TT9Ywd7HrWAvZ83fnCm+vRP+hRFlz588
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="380620490"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="380620490"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 00:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864704167"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="864704167"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2023 00:34:18 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlP3o-0003s6-0k;
	Wed, 27 Sep 2023 07:34:16 +0000
Date: Wed, 27 Sep 2023 15:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 1/15]
 fs/ext2/inode.c:821:5: warning: no previous declaration for
 'ext2_read_bh_lock'
Message-ID: <202309271555.JvKXA0ba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2_dir_buffer_cache_rfc_wip1
head:   3b878bc4805dd97f67ee17c6450059a4a7f2b261
commit: 47085f278819cf21a8b60c39a9a7d48714eb767c [1/15] ext2: add bh read apis
config: i386-randconfig-141-20230927 (https://download.01.org/0day-ci/archive/20230927/202309271555.JvKXA0ba-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271555.JvKXA0ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271555.JvKXA0ba-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/inode.c:821:5: warning: no previous declaration for 'ext2_read_bh_lock' [-Wmissing-declarations]
    int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
        ^~~~~~~~~~~~~~~~~


vim +/ext2_read_bh_lock +821 fs/ext2/inode.c

   820	
 > 821	int ext2_read_bh_lock(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
   822	{
   823		lock_buffer(bh);
   824		return ext2_read_bh(bh, op_flags, NULL);
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
