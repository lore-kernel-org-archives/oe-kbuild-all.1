Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9C18FDBC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734881301; cv=none; b=dMxVipIHzTVXbguAqT53a5OLCGBneemtBnNC+GJvsNzGVfBMkr/5M6KbTdkNsZdXj4Y3bTBgkm47q4sDadHCUw5QqbSn7zOsJKqinlYOu9/zDfrBOL5Ea1ZQkNxE8jKBYUE7bDHgF8A8jKuNG4/DRsdiyFcorhYwbyNuJLoLbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734881301; c=relaxed/simple;
	bh=UQaO2QcHwRgkQMRjeAV5pIST41MCXlrje+c1o9kEf0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYLLMjz2bTt7b6fbxuDKp4JjL7pZpxlk7uaDuvwS/2e4Vc4i4ieAXAXPDD+jndEMIz9cqgO4f3xPfM2E5YdIXNgA2fYHBwlTDIpbPTBR2wi+q4b6nYl0UUj0wIS77ag5ykTyqX2t72HiXlApcf38dRBasTXVgk1Avtw+LGUZOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPofyf91; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPofyf91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734881299; x=1766417299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQaO2QcHwRgkQMRjeAV5pIST41MCXlrje+c1o9kEf0A=;
  b=JPofyf91yK3Wg+1fV3kuYoRAlJAGEDlbE32xhCjBTxs07Mi4aBlaLYSE
   QJMloO/HflyWGefbFfxgNgF43o2MJ1wmjSzNOG7SOetsnEwNY+mipMrSX
   fwgOjehkbAbDobA7GkWkVOIkK5+AhoOA7I5xJEScpY98/tBo6GOUzS2tN
   iDRhr2bLbNFRjFMc7wHGZfqmr94qgqy7TNgPCmNz0d496k3sMQf5W8EdJ
   06HiAvRLIUhUjHsuBd3MoXLg1KrgQvdGruXpOc1etFwOaqPNxCiXHLfUb
   5/vJ5YBvyRasjsSqjnRL+OrqGpBIRtP38ay0Sa2T+KaoopMQHwhMVIJsS
   A==;
X-CSE-ConnectionGUID: n7H+yJ2fTBqPP1Zc/JgXVg==
X-CSE-MsgGUID: 6IBuVTglQb+u9N/FlkfkBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39300036"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39300036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 07:28:17 -0800
X-CSE-ConnectionGUID: 0LjQW6SQQvewIvW65YuEZA==
X-CSE-MsgGUID: L0Nn7L5OTsyAbvanwuyrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="98790716"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2024 07:28:15 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPNsL-00031O-1P;
	Sun, 22 Dec 2024 15:28:13 +0000
Date: Sun, 22 Dec 2024 23:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>,
	Jan Kara <jack@suse.cz>
Subject: fs/gfs2/super.c:767: warning: Function parameter or struct member
 'who' not described in 'gfs2_freeze_super'
Message-ID: <202412222302.ifHyTVyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 880b9577855edddda1e732748e849c63199d489b fs: distinguish between user initiated freeze and kernel initiated freeze
date:   1 year, 5 months ago
config: nios2-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241222/202412222302.ifHyTVyA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222302.ifHyTVyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222302.ifHyTVyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/super.c:767: warning: Function parameter or struct member 'who' not described in 'gfs2_freeze_super'
>> fs/gfs2/super.c:822: warning: Function parameter or struct member 'who' not described in 'gfs2_thaw_super'


vim +767 fs/gfs2/super.c

2e60d7683c8d2e Benjamin Marzinski  2014-11-13  759  
9e6e0a128bca0a Steven Whitehouse   2009-05-22  760  /**
097cca525adf10 Andreas Gruenbacher 2022-11-14  761   * gfs2_freeze_super - prevent further writes to the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  762   * @sb: the VFS structure for the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  763   *
9e6e0a128bca0a Steven Whitehouse   2009-05-22  764   */
9e6e0a128bca0a Steven Whitehouse   2009-05-22  765  
880b9577855edd Darrick J. Wong     2023-07-17  766  static int gfs2_freeze_super(struct super_block *sb, enum freeze_holder who)
9e6e0a128bca0a Steven Whitehouse   2009-05-22 @767  {
9e6e0a128bca0a Steven Whitehouse   2009-05-22  768  	struct gfs2_sbd *sdp = sb->s_fs_info;
ff132c5f93c06b Bob Peterson        2021-03-25  769  	int error;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  770  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  771  	if (!mutex_trylock(&sdp->sd_freeze_mutex))
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  772  		return -EBUSY;
ff132c5f93c06b Bob Peterson        2021-03-25  773  	error = -EBUSY;
5432af15f8772d Andreas Gruenbacher 2022-08-18  774  	if (test_bit(SDF_FROZEN, &sdp->sd_flags))
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  775  		goto out;
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  776  
60528afa78667b Bob Peterson        2019-11-14  777  	for (;;) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  778  		error = gfs2_freeze_locally(sdp);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  779  		if (error) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  780  			fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  781  				error);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  782  			goto out;
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  783  		}
9e6e0a128bca0a Steven Whitehouse   2009-05-22  784  
52b1cdcb7a84a4 Bob Peterson        2019-11-15  785  		error = gfs2_lock_fs_check_clean(sdp);
9e6e0a128bca0a Steven Whitehouse   2009-05-22  786  		if (!error)
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  787  			break;  /* success */
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  788  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  789  		error = gfs2_do_thaw(sdp);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  790  		if (error)
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  791  			goto out;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  792  
55317f5b00f0dc Bob Peterson        2019-04-29  793  		if (error == -EBUSY)
9e6e0a128bca0a Steven Whitehouse   2009-05-22  794  			fs_err(sdp, "waiting for recovery before freeze\n");
52b1cdcb7a84a4 Bob Peterson        2019-11-15  795  		else if (error == -EIO) {
52b1cdcb7a84a4 Bob Peterson        2019-11-15  796  			fs_err(sdp, "Fatal IO error: cannot freeze gfs2 due "
52b1cdcb7a84a4 Bob Peterson        2019-11-15  797  			       "to recovery error.\n");
52b1cdcb7a84a4 Bob Peterson        2019-11-15  798  			goto out;
52b1cdcb7a84a4 Bob Peterson        2019-11-15  799  		} else {
9e6e0a128bca0a Steven Whitehouse   2009-05-22  800  			fs_err(sdp, "error freezing FS: %d\n", error);
52b1cdcb7a84a4 Bob Peterson        2019-11-15  801  		}
9e6e0a128bca0a Steven Whitehouse   2009-05-22  802  		fs_err(sdp, "retrying...\n");
9e6e0a128bca0a Steven Whitehouse   2009-05-22  803  		msleep(1000);
9e6e0a128bca0a Steven Whitehouse   2009-05-22  804  	}
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  805  
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  806  out:
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  807  	if (!error) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  808  		set_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
5432af15f8772d Andreas Gruenbacher 2022-08-18  809  		set_bit(SDF_FROZEN, &sdp->sd_flags);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  810  	}
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  811  	mutex_unlock(&sdp->sd_freeze_mutex);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  812  	return error;
9e6e0a128bca0a Steven Whitehouse   2009-05-22  813  }
9e6e0a128bca0a Steven Whitehouse   2009-05-22  814  
9e6e0a128bca0a Steven Whitehouse   2009-05-22  815  /**
097cca525adf10 Andreas Gruenbacher 2022-11-14  816   * gfs2_thaw_super - reallow writes to the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  817   * @sb: the VFS structure for the filesystem
9e6e0a128bca0a Steven Whitehouse   2009-05-22  818   *
9e6e0a128bca0a Steven Whitehouse   2009-05-22  819   */
9e6e0a128bca0a Steven Whitehouse   2009-05-22  820  
880b9577855edd Darrick J. Wong     2023-07-17  821  static int gfs2_thaw_super(struct super_block *sb, enum freeze_holder who)
9e6e0a128bca0a Steven Whitehouse   2009-05-22 @822  {
d564053f074634 Steven Whitehouse   2013-01-11  823  	struct gfs2_sbd *sdp = sb->s_fs_info;
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  824  	int error;
d564053f074634 Steven Whitehouse   2013-01-11  825  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  826  	if (!mutex_trylock(&sdp->sd_freeze_mutex))
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  827  		return -EBUSY;
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  828  	error = -EINVAL;
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  829  	if (!test_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags))
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  830  		goto out;
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  831  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  832  	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  833  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  834  	error = gfs2_do_thaw(sdp);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  835  
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  836  	if (!error) {
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  837  		clear_bit(SDF_FREEZE_INITIATOR, &sdp->sd_flags);
5432af15f8772d Andreas Gruenbacher 2022-08-18  838  		clear_bit(SDF_FROZEN, &sdp->sd_flags);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  839  	}
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  840  out:
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  841  	mutex_unlock(&sdp->sd_freeze_mutex);
b77b4a4815a965 Andreas Gruenbacher 2022-11-14  842  	return error;
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  843  }
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  844  

:::::: The code at line 767 was first introduced by commit
:::::: 9e6e0a128bca0a151d8d3fbd9459b22fc21cfebb GFS2: Merge mount.c and ops_super.c into super.c

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
