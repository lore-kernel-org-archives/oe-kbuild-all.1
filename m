Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5347DA8C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 23:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734909968; cv=none; b=uqC4KlM8OXlQLOxMqrT2Ty4SwXbBxucJzW4/ioBZTuOHWAnfVPyjvatnQJbCBM11nbrZfio2Xgsfv1u++G3mQaQkLgkX2X6mdE8u3g5Nz8QQGlxCKpM/vDw1GzjuJJjDqGNP9+lbjr2lLxv4v2sqBz39Qe2ip5hmk+6midLKgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734909968; c=relaxed/simple;
	bh=UnMvXhUuNmVLuig0gEHxrlvtyW6S9zSk3APD8q29Sn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tT2dnW25zAC85DkFSXC539E+bsUCAkp7uLqKDgwFKut2+4pEc6M4dK0F9V2adavArtd0L4iVgeCJMptxgZBI7uI7VnQHhw+iwxiB2tb6CUoRiMJ1ao08yWSZ23LWZA0Wut2wTypRQD1hXaIoDKxUZsCEJMM/0Sn1wr97spDoVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTiNozCg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTiNozCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734909967; x=1766445967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UnMvXhUuNmVLuig0gEHxrlvtyW6S9zSk3APD8q29Sn0=;
  b=GTiNozCgIqAPcALQWY2r+h2q/Q83huMREFh60XdYrb/2ydnoq4drpmuG
   blB/dFQgpr6HNaosDmo0dg4Aid3y4fmGmqbhhTS4Z8dqy6tQcR+dd/kl8
   FxV7PqlU04dcakJ1BRqjQwPmERR7n0rZ5Qnf0u5hw3ReoczSBTtfzs5/a
   a4ASDOSm/7rp01pZTBA8jiXXHxnJjAY+JneTo7/J3aabs7O5nTPJ/Z9ST
   j7iXHZm2G55FiZ5uuj0J0n+066MLiVm8SsSov+NVpY/GoLVRV4Qs1UzBX
   1t7R3/eVnut2DB2gNcLbD8IFcuQP/JWMJ1P5tWOPpqQcOo+MYnuKPxy2L
   g==;
X-CSE-ConnectionGUID: hhcqIppkTqCJUIVTLJAnvQ==
X-CSE-MsgGUID: 3dGfwvGlSlOFnVUJTVh+bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46384744"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46384744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:26:06 -0800
X-CSE-ConnectionGUID: JBoCSYRLQmqhV6iZDwHYBw==
X-CSE-MsgGUID: 9VHE7DzoQSWDqAS9kLvgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99264093"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2024 15:26:05 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVKk-0003Gb-2i;
	Sun, 22 Dec 2024 23:26:02 +0000
Date: Mon, 23 Dec 2024 07:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 106/107]
 drivers/s390/cio/chp.c:157:26: error: initialization of 'ssize_t (*)(struct
 file *, struct kobject *, const struct bin_attribute *, char *, loff_t,
  size_t)' {aka 'long int (*)(struct file *, struct kobject *, const struct
 bin_attribute *, char *, long lo...
Message-ID: <202412230708.txWWTehv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   8db3706541f19807373f27aa92d17a30c7092993
commit: dd1c32ee4842fb19b7fc433388b5e6071e135440 [106/107] read/write
config: s390-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241223/202412230708.txWWTehv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230708.txWWTehv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230708.txWWTehv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/s390/cio/cio.h:6,
                    from drivers/s390/cio/chp.c:24:
>> drivers/s390/cio/chp.c:157:26: error: initialization of 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)'} [-Wincompatible-pointer-types]
     157 | static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   include/linux/sysfs.h:378:41: note: in expansion of macro '__BIN_ATTR_ADMIN_RO'
     378 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/s390/cio/chp.c:157:8: note: in expansion of macro 'BIN_ATTR_ADMIN_RO'
     157 | static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
         |        ^~~~~~~~~~~~~~~~~
   drivers/s390/cio/chp.c:157:26: note: (near initialization for 'bin_attr_measurement_chars_full.read')
     157 | static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:17: note: in definition of macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   include/linux/sysfs.h:378:41: note: in expansion of macro '__BIN_ATTR_ADMIN_RO'
     378 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/s390/cio/chp.c:157:8: note: in expansion of macro 'BIN_ATTR_ADMIN_RO'
     157 | static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
         |        ^~~~~~~~~~~~~~~~~
   drivers/s390/cio/chp.c:221:22: error: initialization of 'struct bin_attribute **' from incompatible pointer type 'const struct bin_attribute * const*' [-Wincompatible-pointer-types]
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         |                      ^~~~~~~~~~~
   include/linux/sysfs.h:296:22: note: in definition of macro 'BIN_ATTRIBUTE_GROUPS'
     296 |         .bin_attrs = _name##_attrs,                             \
         |                      ^~~~~
   drivers/s390/cio/chp.c:221:22: note: (near initialization for 'measurement_group.<anonymous>.bin_attrs')
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         |                      ^~~~~~~~~~~
   include/linux/sysfs.h:296:22: note: in definition of macro 'BIN_ATTRIBUTE_GROUPS'
     296 |         .bin_attrs = _name##_attrs,                             \
         |                      ^~~~~


vim +157 drivers/s390/cio/chp.c

e6b6e10ac1de11 Peter Oberparleiter 2007-04-27  146  
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  147  static ssize_t measurement_chars_full_read(struct file *filp,
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  148  					   struct kobject *kobj,
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  149  					   struct bin_attribute *bin_attr,
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  150  					   char *buf, loff_t off, size_t count)
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  151  {
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  152  	struct channel_path *chp = to_channelpath(kobj_to_dev(kobj));
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  153  
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  154  	return memory_read_from_buffer(buf, count, &off, &chp->cmcb,
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  155  				       sizeof(chp->cmcb));
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  156  }
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07 @157  static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
2f4b3b83b8c6e7 Peter Oberparleiter 2024-11-07  158  

:::::: The code at line 157 was first introduced by commit
:::::: 2f4b3b83b8c6e798a2e581521f00933d0f9ec777 s390/cio: Externalize full CMG characteristics

:::::: TO: Peter Oberparleiter <oberpar@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
