Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11421097C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 23:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6IUZKwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698535845; x=1730071845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OziIarEvYlo0Rp6I9DNl+TQzMUltWKDFGEEUR5Ymias=;
  b=P6IUZKwQ7xSQYPbZfCQ8+jq+4X49N/ID5WHddxdzLQssYIvtlZS2afCf
   Kx9NLfPHJadzhhgHQQR6UFk9n8qoKN9BvLaa81t/9Hm2pbgK+q3vi5TeR
   BzawVgtV6IfipLuDHFGzgl3HF2DqG5e7EWf8H4ruCkwUZgYQHAacuRGb3
   x4k/ww8NmfPTE0iNOYGgo2ghDStFRq5MHW2KkSZbaddgGr+qdGV0rpsJK
   q2BPHqQoReeKi7Q1VqXSQMvh2a6bStDhaRO9tMq3mldzRnQCnMTCYpd+s
   rwn1LAbeFADN1MLvFWTlRAy9R+iBjdcTEhaCbLr69Evm639oN/18SOWy3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="386814458"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="386814458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 16:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="825700541"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="825700541"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Oct 2023 16:30:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwslM-000C9v-2T;
	Sat, 28 Oct 2023 23:30:40 +0000
Date: Sun, 29 Oct 2023 07:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [rw-ubifs:next 1/18] fs/ubifs/file.c:1385: warning: Excess function
 parameter 'time' description in 'ubifs_update_time'
Message-ID: <202310290749.EkmBAiIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
head:   75690493591fe283e4c92a3ba7c4420e9858abdb
commit: 48ec6328de6c153a64474d9e5b6ec95f20f4142b [1/18] ubifs: Fix some kernel-doc comments
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290749.EkmBAiIQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290749.EkmBAiIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290749.EkmBAiIQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/file.c:1385: warning: Excess function parameter 'time' description in 'ubifs_update_time'


vim +1385 fs/ubifs/file.c

1e51764a3c2ac0 Artem Bityutskiy  2008-07-14  1374  
8c1c5f263833ec Dongsheng Yang    2015-11-07  1375  /**
8c1c5f263833ec Dongsheng Yang    2015-11-07  1376   * ubifs_update_time - update time of inode.
8c1c5f263833ec Dongsheng Yang    2015-11-07  1377   * @inode: inode to update
48ec6328de6c15 Yang Li           2023-07-12  1378   * @time:  timespec structure to hold the current time value
48ec6328de6c15 Yang Li           2023-07-12  1379   * @flags: time updating control flag determines updating
48ec6328de6c15 Yang Li           2023-07-12  1380   *	    which time fields of @inode
8c1c5f263833ec Dongsheng Yang    2015-11-07  1381   *
8c1c5f263833ec Dongsheng Yang    2015-11-07  1382   * This function updates time of the inode.
8c1c5f263833ec Dongsheng Yang    2015-11-07  1383   */
913e99287b98fd Jeff Layton       2023-08-07  1384  int ubifs_update_time(struct inode *inode, int flags)
8c1c5f263833ec Dongsheng Yang    2015-11-07 @1385  {
8c1c5f263833ec Dongsheng Yang    2015-11-07  1386  	struct ubifs_inode *ui = ubifs_inode(inode);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1387  	struct ubifs_info *c = inode->i_sb->s_fs_info;
8c1c5f263833ec Dongsheng Yang    2015-11-07  1388  	struct ubifs_budget_req req = { .dirtied_ino = 1,
8c1c5f263833ec Dongsheng Yang    2015-11-07  1389  			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
8c1c5f263833ec Dongsheng Yang    2015-11-07  1390  	int err, release;
8c1c5f263833ec Dongsheng Yang    2015-11-07  1391  
541d4c798a5988 Jeff Layton       2023-08-07  1392  	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
541d4c798a5988 Jeff Layton       2023-08-07  1393  		generic_update_time(inode, flags);
541d4c798a5988 Jeff Layton       2023-08-07  1394  		return 0;
541d4c798a5988 Jeff Layton       2023-08-07  1395  	}
e3d73dead4988f Sascha Hauer      2019-03-26  1396  
8c1c5f263833ec Dongsheng Yang    2015-11-07  1397  	err = ubifs_budget_space(c, &req);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1398  	if (err)
8c1c5f263833ec Dongsheng Yang    2015-11-07  1399  		return err;
8c1c5f263833ec Dongsheng Yang    2015-11-07  1400  
8c1c5f263833ec Dongsheng Yang    2015-11-07  1401  	mutex_lock(&ui->ui_mutex);
97ebfdb7ad089d Jeff Layton       2023-08-07  1402  	inode_update_timestamps(inode, flags);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1403  	release = ui->dirty;
ecf84096a526f2 Christoph Hellwig 2020-04-09  1404  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1405  	mutex_unlock(&ui->ui_mutex);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1406  	if (release)
8c1c5f263833ec Dongsheng Yang    2015-11-07  1407  		ubifs_release_budget(c, &req);
8c1c5f263833ec Dongsheng Yang    2015-11-07  1408  	return 0;
8c1c5f263833ec Dongsheng Yang    2015-11-07  1409  }
8c1c5f263833ec Dongsheng Yang    2015-11-07  1410  

:::::: The code at line 1385 was first introduced by commit
:::::: 8c1c5f263833ec2dc8fd716cf4281265c485d7ad ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs

:::::: TO: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
