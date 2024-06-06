Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAC1C68E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 03:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717643239; cv=none; b=c7Y1d8H4twkUxWZ5CuBw9s3IwJC5w6uAtVGk8MKbTrtQBRuDI5KBJlB1mxUwB5py1dmOuEeZLpPA0DBo5WPUAUJGhv18bI1KSxQfyx0VJyXiAxZS2iusbMJEultvycGFwxwci0iZk/ZDRLCjFBbJqblK+72UQ/ElwBXsc+slMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717643239; c=relaxed/simple;
	bh=AKHLfXSvrGRb4hwraSM71/6M4jI/tz0aHGASz8s9L/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjxD+d6+osf+8nB1g+ajcaY8l0gbPxx9sviBL7nh+VoG27Y/sfqTlqzVXybxDjQ6ChI+fzZv3bDxi2+0nVBNSDg5PrBNJCkX5AioTwDEJgtqf0yr4azuiT9E9/KR6AHgv1Ry0jSc/ZWX0DaDTKkrds3gaud2T52q7U89iKcBHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaINDK/C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaINDK/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717643238; x=1749179238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKHLfXSvrGRb4hwraSM71/6M4jI/tz0aHGASz8s9L/o=;
  b=iaINDK/CLmRAueCki5BLb4iAVMSeDxa7QWeCZhNcFJzhJDiXrRDL37+d
   xaWWhF8D18rJh1DwQHbyoAsuOnt8JGYGTt5OBOwcJ0gZSwE0Vg3L+wNfN
   8mWrMmUiATXH+j+5vBMn0niwSQ+l51j9IMe0Zt+x9M97qy/R2Ue5Sb9ck
   Pivr8BvEFO9F/P1kcVZB3RMfFaxKVt0q6uZcPkDcaoEn1HN8pJLi3Bge2
   VTtt3gzpoGBeaZg1HGUSIh60337xZfM3yeTgZt9L1Z4w/YLUxRKDmZxiI
   bhW5LCVu0WAxBwCzSf2JNW/Le80grVQu9Kl8dpSG9HB0jMyHFkhgjU5o1
   g==;
X-CSE-ConnectionGUID: XgD9uLwEQRWYiRSKhVyJpg==
X-CSE-MsgGUID: l/t7iTByRumPegFLoEZCdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11932776"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="11932776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 20:07:18 -0700
X-CSE-ConnectionGUID: u60AwyGMQwqLAHOyjdqmmA==
X-CSE-MsgGUID: uPw+iC2fQ12aa1G3PeqpRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42225704"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2024 20:07:13 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF3T5-0002c0-0D;
	Thu, 06 Jun 2024 03:07:11 +0000
Date: Thu, 6 Jun 2024 11:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Jeff Layton <jeff.layton@primarydata.com>,
	Peng Tao <tao.peng@primarydata.com>,
	Lance Shelton <lance.shelton@hammerspace.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11 10/29]
 include/linux/seqlock.h:1075:20: warning: 'seq' is used uninitialized
Message-ID: <202406061016.xrRg1yWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 1db309e3046ff4d7bc50071001f56700fec36d46 [10/29] nfs/nfsd: add "local io" support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406061016.xrRg1yWL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061016.xrRg1yWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061016.xrRg1yWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/nfs/localio.c:8:
   In function 'read_seqbegin_or_lock',
       inlined from 'nfs_copy_boot_verifier' at fs/nfs/localio.c:515:3:
>> include/linux/seqlock.h:1075:20: warning: 'seq' is used uninitialized [-Wuninitialized]
    1075 |         if (!(*seq & 1))        /* Even */
         |              ~~~~~~^~~~
   fs/nfs/localio.c: In function 'nfs_copy_boot_verifier':
   fs/nfs/localio.c:512:13: note: 'seq' was declared here
     512 |         int seq;
         |             ^~~


vim +/seq +1075 include/linux/seqlock.h

1370e97bb2eb1e Waiman Long      2013-09-12  1041  
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1042  /**
89b88845e05752 Ahmed S. Darwish 2020-07-20  1043   * read_seqbegin_or_lock() - begin a seqlock_t lockless or locking reader
89b88845e05752 Ahmed S. Darwish 2020-07-20  1044   * @lock: Pointer to seqlock_t
89b88845e05752 Ahmed S. Darwish 2020-07-20  1045   * @seq : Marker and return parameter. If the passed value is even, the
89b88845e05752 Ahmed S. Darwish 2020-07-20  1046   * reader will become a *lockless* seqlock_t reader as in read_seqbegin().
89b88845e05752 Ahmed S. Darwish 2020-07-20  1047   * If the passed value is odd, the reader will become a *locking* reader
89b88845e05752 Ahmed S. Darwish 2020-07-20  1048   * as in read_seqlock_excl().  In the first call to this function, the
89b88845e05752 Ahmed S. Darwish 2020-07-20  1049   * caller *must* initialize and pass an even value to @seq; this way, a
89b88845e05752 Ahmed S. Darwish 2020-07-20  1050   * lockless read can be optimistically tried first.
89b88845e05752 Ahmed S. Darwish 2020-07-20  1051   *
89b88845e05752 Ahmed S. Darwish 2020-07-20  1052   * read_seqbegin_or_lock is an API designed to optimistically try a normal
89b88845e05752 Ahmed S. Darwish 2020-07-20  1053   * lockless seqlock_t read section first.  If an odd counter is found, the
89b88845e05752 Ahmed S. Darwish 2020-07-20  1054   * lockless read trial has failed, and the next read iteration transforms
89b88845e05752 Ahmed S. Darwish 2020-07-20  1055   * itself into a full seqlock_t locking reader.
89b88845e05752 Ahmed S. Darwish 2020-07-20  1056   *
89b88845e05752 Ahmed S. Darwish 2020-07-20  1057   * This is typically used to avoid seqlock_t lockless readers starvation
89b88845e05752 Ahmed S. Darwish 2020-07-20  1058   * (too much retry loops) in the case of a sharp spike in write side
89b88845e05752 Ahmed S. Darwish 2020-07-20  1059   * activity.
89b88845e05752 Ahmed S. Darwish 2020-07-20  1060   *
89b88845e05752 Ahmed S. Darwish 2020-07-20  1061   * Context: if the seqlock_t write section, *or other read sections*, can
89b88845e05752 Ahmed S. Darwish 2020-07-20  1062   * be invoked from hardirq or softirq contexts, use the _irqsave or _bh
89b88845e05752 Ahmed S. Darwish 2020-07-20  1063   * variant of this function instead.
89b88845e05752 Ahmed S. Darwish 2020-07-20  1064   *
89b88845e05752 Ahmed S. Darwish 2020-07-20  1065   * Check Documentation/locking/seqlock.rst for template example code.
89b88845e05752 Ahmed S. Darwish 2020-07-20  1066   *
89b88845e05752 Ahmed S. Darwish 2020-07-20  1067   * Return: the encountered sequence counter value, through the @seq
89b88845e05752 Ahmed S. Darwish 2020-07-20  1068   * parameter, which is overloaded as a return parameter. This returned
89b88845e05752 Ahmed S. Darwish 2020-07-20  1069   * value must be checked with need_seqretry(). If the read section need to
89b88845e05752 Ahmed S. Darwish 2020-07-20  1070   * be retried, this returned value must also be passed as the @seq
89b88845e05752 Ahmed S. Darwish 2020-07-20  1071   * parameter of the next read_seqbegin_or_lock() iteration.
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1072   */
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1073  static inline void read_seqbegin_or_lock(seqlock_t *lock, int *seq)
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1074  {
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20 @1075  	if (!(*seq & 1))	/* Even */
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1076  		*seq = read_seqbegin(lock);
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1077  	else			/* Odd */
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1078  		read_seqlock_excl(lock);
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1079  }
f4a27cbcec90ac Ahmed S. Darwish 2020-07-20  1080  

:::::: The code at line 1075 was first introduced by commit
:::::: f4a27cbcec90ac04ee60e04b222e1449dcdba0bd seqlock: Reorder seqcount_t and seqlock_t API definitions

:::::: TO: Ahmed S. Darwish <a.darwish@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
