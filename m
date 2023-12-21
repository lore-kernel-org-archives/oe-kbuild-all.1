Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69677F34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkdExJ1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703185879; x=1734721879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WPdbYwXRe2+2NwJf3nfdgdXUtsBFSoGL1WrpWY0M0D8=;
  b=MkdExJ1nGZyS8b0GBp/9za/QH20cXEccmTvs2C4ypSNnNIzsvplo/N+V
   yKUzT5L/+WlOF5k6gErGiPkCGIqwI8mHWVQhPuCKH9Sl5MIJ71M+hUju4
   6Jn0ec2dGa8U376p17LC2OUpi8hG2OiQN5KukTm+Dj4J0sma9vBKD6y31
   mpECbSeGxKROkqT3QBUu0EDlKh6pXqLE8dYG4t2XQoR4GizUufWBnTGRg
   OEvYRZrquuI3jiKA+9f/TE2fs/0lBpHevQ7z9am1N+r73UStlPNaFiTpT
   qsrqpgMXQra59EpKxS/aXp8XwG1+41TrdeEFNe8jA4/xuloDtaXlKGS+9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482207249"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="482207249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 11:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="25068025"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2023 11:11:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGORm-0008bs-0P;
	Thu, 21 Dec 2023 19:11:09 +0000
Date: Fri, 22 Dec 2023 03:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 193/193] fs/bcachefs/chardev.c:761:41:
 warning: iteration 10 invokes undefined behavior
Message-ID: <202312220324.uyHyk7Bg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   495265326bdb4ee82eeee98f9d69baf7bd2b6a6c
commit: 99393a06121d3f4c2dc4ae4a8c1003956916db56 [193/193] bcachefs: BCH_DATA_unstriped
config: arc-randconfig-002-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220324.uyHyk7Bg-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220324.uyHyk7Bg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220324.uyHyk7Bg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage':
>> fs/bcachefs/chardev.c:761:41: warning: iteration 10 invokes undefined behavior [-Waggressive-loop-optimizations]
     761 |                 arg.d[i].buckets        = src.d[i].buckets;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   fs/bcachefs/chardev.c:760:23: note: within this loop
     760 |         for (i = 0; i < BCH_DATA_NR; i++) {
         |                     ~~^~~~~~~~~~~~~


vim +761 fs/bcachefs/chardev.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  728  
72f2511eb8c681 Kent Overstreet 2023-11-23  729  /* obsolete, didn't allow for new data types: */
22502ac23a2eaa Kent Overstreet 2019-12-16  730  static long bch2_ioctl_dev_usage(struct bch_fs *c,
22502ac23a2eaa Kent Overstreet 2019-12-16  731  				 struct bch_ioctl_dev_usage __user *user_arg)
22502ac23a2eaa Kent Overstreet 2019-12-16  732  {
22502ac23a2eaa Kent Overstreet 2019-12-16  733  	struct bch_ioctl_dev_usage arg;
22502ac23a2eaa Kent Overstreet 2019-12-16  734  	struct bch_dev_usage src;
22502ac23a2eaa Kent Overstreet 2019-12-16  735  	struct bch_dev *ca;
22502ac23a2eaa Kent Overstreet 2019-12-16  736  	unsigned i;
22502ac23a2eaa Kent Overstreet 2019-12-16  737  
45b4d963f0b9d0 Kent Overstreet 2023-11-26  738  	if (!test_bit(BCH_FS_started, &c->flags))
22502ac23a2eaa Kent Overstreet 2019-12-16  739  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  740  
22502ac23a2eaa Kent Overstreet 2019-12-16  741  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
22502ac23a2eaa Kent Overstreet 2019-12-16  742  		return -EFAULT;
22502ac23a2eaa Kent Overstreet 2019-12-16  743  
22502ac23a2eaa Kent Overstreet 2019-12-16  744  	if ((arg.flags & ~BCH_BY_INDEX) ||
22502ac23a2eaa Kent Overstreet 2019-12-16  745  	    arg.pad[0] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  746  	    arg.pad[1] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  747  	    arg.pad[2])
22502ac23a2eaa Kent Overstreet 2019-12-16  748  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  749  
22502ac23a2eaa Kent Overstreet 2019-12-16  750  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
22502ac23a2eaa Kent Overstreet 2019-12-16  751  	if (IS_ERR(ca))
22502ac23a2eaa Kent Overstreet 2019-12-16  752  		return PTR_ERR(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  753  
3d080aa52f6c1b Kent Overstreet 2020-07-22  754  	src = bch2_dev_usage_read(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  755  
22502ac23a2eaa Kent Overstreet 2019-12-16  756  	arg.state		= ca->mi.state;
22502ac23a2eaa Kent Overstreet 2019-12-16  757  	arg.bucket_size		= ca->mi.bucket_size;
22502ac23a2eaa Kent Overstreet 2019-12-16  758  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
22502ac23a2eaa Kent Overstreet 2019-12-16  759  
22502ac23a2eaa Kent Overstreet 2019-12-16  760  	for (i = 0; i < BCH_DATA_NR; i++) {
822835ffeae411 Kent Overstreet 2022-04-01 @761  		arg.d[i].buckets	= src.d[i].buckets;
822835ffeae411 Kent Overstreet 2022-04-01  762  		arg.d[i].sectors	= src.d[i].sectors;
822835ffeae411 Kent Overstreet 2022-04-01  763  		arg.d[i].fragmented	= src.d[i].fragmented;
22502ac23a2eaa Kent Overstreet 2019-12-16  764  	}
22502ac23a2eaa Kent Overstreet 2019-12-16  765  
22502ac23a2eaa Kent Overstreet 2019-12-16  766  	percpu_ref_put(&ca->ref);
22502ac23a2eaa Kent Overstreet 2019-12-16  767  
72f2511eb8c681 Kent Overstreet 2023-11-23  768  	return copy_to_user_errcode(user_arg, &arg, sizeof(arg));
72f2511eb8c681 Kent Overstreet 2023-11-23  769  }
72f2511eb8c681 Kent Overstreet 2023-11-23  770  

:::::: The code at line 761 was first introduced by commit
:::::: 822835ffeae411bbc8af104da9331fdf63a7bc12 bcachefs: Fold bucket_state in to BCH_DATA_TYPES()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
