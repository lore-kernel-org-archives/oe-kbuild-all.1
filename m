Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86FE27468
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491651; cv=none; b=p+S+nis0yxji+mzjmAuyZeKigCaK/UXQb23ZeenCmV+YiiTr1PgAWETwSvu1P9R8GSBjbspwA05zGDA3mIFBd0/wvoGBcS+nC/dHhxgYMJS/n+jTQS2InEL9NYtq0ECUZJSMlptrZ74ueNp0Oz7Y20tlQfyE/l3X7dyMGmVGXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491651; c=relaxed/simple;
	bh=/MgNQna63b1puyizgZLAN7X29c4IK/bR4TFT+AaO/kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBVz14QLNb3MM9NDQoUElkppz0+pWLK+Bc2AAIB+gunpI3J6WBT+6+obsC6VCzkMs45ayM+Gz5c+4ZLZ2HYxy5R7FMBiwQOY8InpYAHAqvsec2i9ZlAnt3wYTARZ++A4vQ7bWjESCVp5GczTl28BhxpVNWHfa9eI4zDpfNAmjo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wqo+Ghl8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wqo+Ghl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743491650; x=1775027650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MgNQna63b1puyizgZLAN7X29c4IK/bR4TFT+AaO/kk=;
  b=Wqo+Ghl81X96DbBrLSOAcuOFass7LKGjNINz9H+A2Q/AMDL0VZFDFesp
   +t9FpCP9maN6MYRjOJ3xIbV0lpqeHeLIYzM63bMIwEIMlEgwQR6MA7j7I
   vHnGKTSzvmnqq49YIwW5msyjo+uMAnyIkoMVjV92Umtup+Yyn6xCoHA5E
   vxaTuLzpYB8HLXnZT+sUm3gM2XW+LGBbSxLVa392XRN/01wAiO/kpxz5n
   j0SaxvAR3zcC/b17XKfBtr+575qQLJgZjuX/IVMpQrBbYwhwuBHhoaHga
   YATeqajCNZKgg5T3EbS6DnaFjVvwxhe1af9pqSzVKXEHlzCUTFahB9onv
   g==;
X-CSE-ConnectionGUID: TLJ+zGCfTNqG/RC2MFvkjA==
X-CSE-MsgGUID: 8FpNCFiFSyWsw1Pg7PSzlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62194763"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="62194763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:14:09 -0700
X-CSE-ConnectionGUID: c2fsvsXMT2yeU6YWUa/eLQ==
X-CSE-MsgGUID: OsgCaUFAQdmEue8LAhiXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="131438606"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2025 00:14:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzVoz-0009hP-29;
	Tue, 01 Apr 2025 07:14:05 +0000
Date: Tue, 1 Apr 2025 15:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.freeze 6/10] fs/gfs2/super.c:736: warning:
 Function parameter or struct member 'freeze_owner' not described in
 'gfs2_freeze_super'
Message-ID: <202504011534.vdAvwQJx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.freeze
head:   1592f7ceb2f7481c70017dc90e3ebb39801a9d32
commit: f15a9ae05a7144ff3bc3ce58622dfb7043acb138 [6/10] fs: add owner of freeze/thaw
config: arm-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011534.vdAvwQJx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011534.vdAvwQJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011534.vdAvwQJx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/gfs2/super.c:736: warning: Function parameter or struct member 'who' not described in 'gfs2_freeze_super'
>> fs/gfs2/super.c:736: warning: Function parameter or struct member 'freeze_owner' not described in 'gfs2_freeze_super'
   fs/gfs2/super.c:805: warning: Function parameter or struct member 'who' not described in 'gfs2_thaw_super'
>> fs/gfs2/super.c:805: warning: Function parameter or struct member 'freeze_owner' not described in 'gfs2_thaw_super'


vim +736 fs/gfs2/super.c

2e60d7683c8d2e Benjamin Marzinski  2014-11-13  727  
9e6e0a128bca0a Steven Whitehouse   2009-05-22  728  /**
097cca525adf10 Andreas Gruenbacher 2022-11-14  729   * gfs2_freeze_super - prevent further writes to the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  730   * @sb: the VFS structure for the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  731   *
9e6e0a128bca0a Steven Whitehouse   2009-05-22  732   */
9e6e0a128bca0a Steven Whitehouse   2009-05-22  733  
f15a9ae05a7144 Christian Brauner   2025-03-31  734  static int gfs2_freeze_super(struct super_block *sb, enum freeze_holder who,
f15a9ae05a7144 Christian Brauner   2025-03-31  735  			     const void *freeze_owner)
9e6e0a128bca0a Steven Whitehouse   2009-05-22 @736  {
9e6e0a128bca0a Steven Whitehouse   2009-05-22  737  	struct gfs2_sbd *sdp = sb->s_fs_info;
ff132c5f93c06b Bob Peterson        2021-03-25  738  	int error;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  739  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  740  	if (!mutex_trylock(&sdp->sd_freeze_mutex))
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  741  		return -EBUSY;
5a7a964689b78b Andreas Gruenbacher 2023-12-25  742  	if (test_bit(SDF_FROZEN, &sdp->sd_flags)) {
5a7a964689b78b Andreas Gruenbacher 2023-12-25  743  		mutex_unlock(&sdp->sd_freeze_mutex);
5a7a964689b78b Andreas Gruenbacher 2023-12-25  744  		return -EBUSY;
5a7a964689b78b Andreas Gruenbacher 2023-12-25  745  	}
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  746  
60528afa78667b Bob Peterson        2019-11-14  747  	for (;;) {
f15a9ae05a7144 Christian Brauner   2025-03-31  748  		error = freeze_super(sb, who, freeze_owner);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  749  		if (error) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  750  			fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  751  				error);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  752  			goto out;
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  753  		}
9e6e0a128bca0a Steven Whitehouse   2009-05-22  754  
52b1cdcb7a84a4 Bob Peterson        2019-11-15  755  		error = gfs2_lock_fs_check_clean(sdp);
5a7a964689b78b Andreas Gruenbacher 2023-12-25  756  		if (!error) {
5a7a964689b78b Andreas Gruenbacher 2023-12-25  757  			set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
5a7a964689b78b Andreas Gruenbacher 2023-12-25  758  			set_bit(SDF_FROZEN, &sdp->sd_flags);
5a7a964689b78b Andreas Gruenbacher 2023-12-25  759  			break;
5a7a964689b78b Andreas Gruenbacher 2023-12-25  760  		}
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  761  
f15a9ae05a7144 Christian Brauner   2025-03-31  762  		error = gfs2_do_thaw(sdp, who, freeze_owner);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  763  		if (error)
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  764  			goto out;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  765  
55317f5b00f0dc Bob Peterson        2019-04-29  766  		if (error == -EBUSY)
9e6e0a128bca0a Steven Whitehouse   2009-05-22  767  			fs_err(sdp, "waiting for recovery before freeze\n");
52b1cdcb7a84a4 Bob Peterson        2019-11-15  768  		else if (error == -EIO) {
52b1cdcb7a84a4 Bob Peterson        2019-11-15  769  			fs_err(sdp, "Fatal IO error: cannot freeze gfs2 due "
52b1cdcb7a84a4 Bob Peterson        2019-11-15  770  			       "to recovery error.\n");
52b1cdcb7a84a4 Bob Peterson        2019-11-15  771  			goto out;
52b1cdcb7a84a4 Bob Peterson        2019-11-15  772  		} else {
9e6e0a128bca0a Steven Whitehouse   2009-05-22  773  			fs_err(sdp, "error freezing FS: %d\n", error);
52b1cdcb7a84a4 Bob Peterson        2019-11-15  774  		}
9e6e0a128bca0a Steven Whitehouse   2009-05-22  775  		fs_err(sdp, "retrying...\n");
9e6e0a128bca0a Steven Whitehouse   2009-05-22  776  		msleep(1000);
9e6e0a128bca0a Steven Whitehouse   2009-05-22  777  	}
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  778  
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  779  out:
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  780  	mutex_unlock(&sdp->sd_freeze_mutex);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  781  	return error;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  782  }
9e6e0a128bca0a Steven Whitehouse   2009-05-22  783  
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  784  static int gfs2_freeze_fs(struct super_block *sb)
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  785  {
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  786  	struct gfs2_sbd *sdp = sb->s_fs_info;
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  787  
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  788  	if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  789  		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_FREEZE |
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  790  			       GFS2_LFC_FREEZE_GO_SYNC);
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  791  		if (gfs2_withdrawing_or_withdrawn(sdp))
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  792  			return -EIO;
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  793  	}
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  794  	return 0;
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  795  }
e345b87b0b0444 Andreas Gruenbacher 2023-12-19  796  
9e6e0a128bca0a Steven Whitehouse   2009-05-22  797  /**
097cca525adf10 Andreas Gruenbacher 2022-11-14  798   * gfs2_thaw_super - reallow writes to the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  799   * @sb: the VFS structure for the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  800   *
9e6e0a128bca0a Steven Whitehouse   2009-05-22  801   */
9e6e0a128bca0a Steven Whitehouse   2009-05-22  802  
f15a9ae05a7144 Christian Brauner   2025-03-31  803  static int gfs2_thaw_super(struct super_block *sb, enum freeze_holder who,
f15a9ae05a7144 Christian Brauner   2025-03-31  804  			   const void *freeze_owner)
9e6e0a128bca0a Steven Whitehouse   2009-05-22 @805  {
d564053f074634 Steven Whitehouse   2013-01-11  806  	struct gfs2_sbd *sdp = sb->s_fs_info;
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  807  	int error;
d564053f074634 Steven Whitehouse   2013-01-11  808  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  809  	if (!mutex_trylock(&sdp->sd_freeze_mutex))
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  810  		return -EBUSY;
5a7a964689b78b Andreas Gruenbacher 2023-12-25  811  	if (!test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags)) {
5a7a964689b78b Andreas Gruenbacher 2023-12-25  812  		mutex_unlock(&sdp->sd_freeze_mutex);
5a7a964689b78b Andreas Gruenbacher 2023-12-25  813  		return -EINVAL;
5a7a964689b78b Andreas Gruenbacher 2023-12-25  814  	}
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  815  
4e58543e7da485 Andreas Gruenbacher 2023-12-25  816  	atomic_inc(&sb->s_active);
fcd63086bc14b1 Andreas Gruenbacher 2024-04-07  817  	gfs2_freeze_unlock(sdp);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  818  
f15a9ae05a7144 Christian Brauner   2025-03-31  819  	error = gfs2_do_thaw(sdp, who, freeze_owner);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  820  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  821  	if (!error) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  822  		clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
5432af15f8772d Andreas Gruenbacher 2022-08-18  823  		clear_bit(SDF_FROZEN, &sdp->sd_flags);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  824  	}
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  825  	mutex_unlock(&sdp->sd_freeze_mutex);
4e58543e7da485 Andreas Gruenbacher 2023-12-25  826  	deactivate_super(sb);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  827  	return error;
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  828  }
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  829  

:::::: The code at line 736 was first introduced by commit
:::::: 9e6e0a128bca0a151d8d3fbd9459b22fc21cfebb GFS2: Merge mount.c and ops_super.c into super.c

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
