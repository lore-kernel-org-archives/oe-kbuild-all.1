Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24426FA8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 04:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707019545; cv=none; b=CAut4n4yIcd7IOYMpmDGVK2OJYJaI5+2ENhyTS0GpH0FsU5ZSXerrl/YeO2Wd+fB+tIsKjbSkMoatE36rj7STvkoW4Kw1wh8lp3YLNJqmbveVnOBehmCWGG76lqwjSKEdyEwfxQYI1qJtRu01i11dOX3Qu/Kae2pK3udQuk3g+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707019545; c=relaxed/simple;
	bh=QGy5jI6rsW3iJsvnEcT0LWngld2wAqdsvMNs5XtXdcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZgQ2ldU+eDw5jXbckSyi5xQwv5LMEKB5X4wQ19Tl1hsPyEr7qL5Ysnk+2lsTQzGBVSeuiaIPQiAGDnPhCszvcw5/M2FBcBsJysCor9R3Xi1ODGn8pVxPnuJvm4fYOb8YL4PQQ8L/xHGNCW8U6Vf5DyX9tL4Mh06CScvSRAN+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEzvlAXz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEzvlAXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707019543; x=1738555543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QGy5jI6rsW3iJsvnEcT0LWngld2wAqdsvMNs5XtXdcQ=;
  b=OEzvlAXzsQz/DlzKZnn0Z9stKVEnxlpmgrjFCUlVDX/gE+Zx6CH4pw3P
   1NJVVvyWI+u0AmMrEL3RnAZHMuGiTsgbfta2ojncZsyygWihGb4H4+huo
   JtN9I0pmCSzhYU87CNJ8VFYf1wSifcULuiEtDJykWm7jXdY9oJmi3641M
   FZVDdQ+yARUng0AmQdmBggWyjqp/hLaQ6CwXvkXJmBiHAzjal/xoJ4557
   68rZYze1eZhZEMhLi1cM7rXA/0L1gO4ePEqaWpAA6erQwkj/bjv1yNb2D
   dAZp8sMEcZ7Ig11cmTnGjmUWrES9r/5mmsowS0vlU1QghAAUaB2lO3HnH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11727314"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11727314"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 20:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="480283"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2024 20:05:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWTlD-0005zs-0S;
	Sun, 04 Feb 2024 04:05:39 +0000
Date: Sun, 4 Feb 2024 12:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kdave-btrfs-devel:fix-6.7-device-scanning 1/1]
 fs/btrfs/super.c:2320:1: warning: the frame size of 4096 bytes is larger
 than 1024 bytes
Message-ID: <202402041126.2gW4nuCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git fix-6.7-device-scanning
head:   c9a96c234f18aeb5d5760a8e90a20971ec75be41
commit: c9a96c234f18aeb5d5760a8e90a20971ec75be41 [1/1] btrfs: fix device name in /proc/self/mountinfo
config: i386-buildonly-randconfig-005-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041126.2gW4nuCE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041126.2gW4nuCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041126.2gW4nuCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/super.c: In function 'btrfs_show_devname':
>> fs/btrfs/super.c:2320:1: warning: the frame size of 4096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2320 | }
         | ^


vim +2320 fs/btrfs/super.c

9e7cc91a6d18a4 Wang Xiaoguang 2016-08-01  2303  
9c5085c147989d Josef Bacik    2012-06-05  2304  static int btrfs_show_devname(struct seq_file *m, struct dentry *root)
9c5085c147989d Josef Bacik    2012-06-05  2305  {
9c5085c147989d Josef Bacik    2012-06-05  2306  	struct btrfs_fs_info *fs_info = btrfs_sb(root->d_sb);
c9a96c234f18ae David Sterba   2024-02-03  2307  	char real[4096] = { "/dev/" };
9c5085c147989d Josef Bacik    2012-06-05  2308  
88c14590cdd6f3 David Sterba   2018-03-16  2309  	/*
6605fd2f394bba Anand Jain     2021-08-24  2310  	 * There should be always a valid pointer in latest_dev, it may be stale
6605fd2f394bba Anand Jain     2021-08-24  2311  	 * for a short moment in case it's being deleted but still valid until
6605fd2f394bba Anand Jain     2021-08-24  2312  	 * the end of RCU grace period.
88c14590cdd6f3 David Sterba   2018-03-16  2313  	 */
88c14590cdd6f3 David Sterba   2018-03-16  2314  	rcu_read_lock();
c9a96c234f18ae David Sterba   2024-02-03  2315  	scnprintf(real + 5, sizeof(real) - 5, "%pg", fs_info->fs_devices->latest_dev->bdev);
c9a96c234f18ae David Sterba   2024-02-03  2316  	seq_puts(m, real);
88c14590cdd6f3 David Sterba   2018-03-16  2317  	rcu_read_unlock();
6605fd2f394bba Anand Jain     2021-08-24  2318  
9c5085c147989d Josef Bacik    2012-06-05  2319  	return 0;
9c5085c147989d Josef Bacik    2012-06-05 @2320  }
9c5085c147989d Josef Bacik    2012-06-05  2321  

:::::: The code at line 2320 was first introduced by commit
:::::: 9c5085c147989d48dfe74194b48affc23f376650 Btrfs: implement ->show_devname

:::::: TO: Josef Bacik <josef@redhat.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
