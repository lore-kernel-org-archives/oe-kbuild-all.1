Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567EB1DED69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 23:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045843; cv=none; b=pnR56n6vXCm4qO+DtzBmOVfyCh4+P18oiVXJL0XLU+4mfHNtrMNmk3YTgRsaXBC3SDGpuFxp2y5v/DxxP4CMXP41213jVxJlcO760iRTHoU/3HrqJVWGy9SW3fzhvozg1LYrIpSP8HUslD5HbvEVMhqvNfUz4q0REro2lhuuwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045843; c=relaxed/simple;
	bh=RMabKRZfucLVlE4pxr3fyE0DwqyJ0oRPxXE+Nyut4Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7AqPpThaM8W5LFfMnbnWhvS4e5lDEH7GtTljsyUnRjLjZKeCzBE1IqVbxZRR25MgtgmUo17DI9NNIAGrGpBgAq+LmcJLW55SsyYxC5vRi/kuV4iIo+ohQQA98adAcDLyzJQkCV2UQSwdE00nYIyKg93Wmr9ZYkjIbCmwJUIABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiGaht5F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiGaht5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734045842; x=1765581842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RMabKRZfucLVlE4pxr3fyE0DwqyJ0oRPxXE+Nyut4Xc=;
  b=fiGaht5F0p+2eixAKejkzTF5Pdl+ah/1QdmDGy/IaeAo7FsY0urhn5Rq
   FBu+w/KUEqij4t+hubbAzh6FmTY7PMTBQiidtsSD7/oO9gdG0Oii64eoP
   Jc5sWA8HMt5P4RBzRf0pkEOP49XhzTLop0K6wYbc2VlPvSQ+zJm73UBaC
   PRh68QYUoU4TDmukMjIPNKZMo9DYswiOEbP7RoxjQomVjHmQh2756R4cO
   S5tX8k5zqt8Sa0yvFnb5yznv6nyNK0jb8EPy4+CMTJTxmPf5pmOcn4FVa
   t5GurI8gYYdZ+wpZsv5AiLuH9ZncfNFOh5v704/a6SWUStj3tWWmywUFC
   g==;
X-CSE-ConnectionGUID: +RGT1jK9QV2TWFhZlSyT5g==
X-CSE-MsgGUID: BKG/M+LxR9CdbFzusFZ2HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45871629"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45871629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:24:01 -0800
X-CSE-ConnectionGUID: Be8Rm//2TuKkvKdTdClIeQ==
X-CSE-MsgGUID: 76x4EmuYQ66OqJgsNNECEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96912686"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2024 15:23:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLsXF-000BTh-22;
	Thu, 12 Dec 2024 23:23:57 +0000
Date: Fri, 13 Dec 2024 07:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-s390 6/7]
 drivers/s390/cio/chp.c:221:22: error: initialization of 'struct
 bin_attribute **' from incompatible pointer type 'const struct bin_attribute
 * const*'
Message-ID: <202412130735.ErgIPfC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-s390
head:   8ae8d30bac9709d7b1824ebe3a28cc6f3017cd79
commit: 269b60415552dd90b391ef9ca088b2ee00497c03 [6/7] s390/cio/chp: Constify 'struct bin_attribute'
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241213/202412130735.ErgIPfC0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130735.ErgIPfC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130735.ErgIPfC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/s390/cio/cio.h:6,
                    from drivers/s390/cio/chp.c:24:
>> drivers/s390/cio/chp.c:221:22: error: initialization of 'struct bin_attribute **' from incompatible pointer type 'const struct bin_attribute * const*' [-Wincompatible-pointer-types]
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


vim +221 drivers/s390/cio/chp.c

e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   23  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  @24  #include "cio.h"
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   25  #include "css.h"
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   26  #include "ioasm.h"
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   27  #include "cio_debug.h"
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   28  #include "chp.h"
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   29  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   30  #define to_channelpath(device) container_of(device, struct channel_path, dev)
e5854a5839fa426 Peter Oberparleiter 2007-04-27   31  #define CHP_INFO_UPDATE_INTERVAL	1*HZ
e5854a5839fa426 Peter Oberparleiter 2007-04-27   32  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   33  enum cfg_task_t {
e5854a5839fa426 Peter Oberparleiter 2007-04-27   34  	cfg_none,
e5854a5839fa426 Peter Oberparleiter 2007-04-27   35  	cfg_configure,
e5854a5839fa426 Peter Oberparleiter 2007-04-27   36  	cfg_deconfigure
e5854a5839fa426 Peter Oberparleiter 2007-04-27   37  };
e5854a5839fa426 Peter Oberparleiter 2007-04-27   38  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   39  /* Map for pending configure tasks. */
e5854a5839fa426 Peter Oberparleiter 2007-04-27   40  static enum cfg_task_t chp_cfg_task[__MAX_CSSID + 1][__MAX_CHPID + 1];
837c5220557270e Sebastian Ott       2016-07-19   41  static DEFINE_SPINLOCK(cfg_lock);
e5854a5839fa426 Peter Oberparleiter 2007-04-27   42  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   43  /* Map for channel-path status. */
e5854a5839fa426 Peter Oberparleiter 2007-04-27   44  static struct sclp_chp_info chp_info;
e5854a5839fa426 Peter Oberparleiter 2007-04-27   45  static DEFINE_MUTEX(info_lock);
e5854a5839fa426 Peter Oberparleiter 2007-04-27   46  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   47  /* Time after which channel-path status may be outdated. */
e5854a5839fa426 Peter Oberparleiter 2007-04-27   48  static unsigned long chp_info_expires;
e5854a5839fa426 Peter Oberparleiter 2007-04-27   49  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   50  static struct work_struct cfg_work;
e5854a5839fa426 Peter Oberparleiter 2007-04-27   51  
e5854a5839fa426 Peter Oberparleiter 2007-04-27   52  /* Wait queue for configure completion events. */
3081e6160565078 Vineeth Vijayan     2021-03-29   53  static DECLARE_WAIT_QUEUE_HEAD(cfg_wait_queue);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   54  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   55  /* Set vary state for given chpid. */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   56  static void set_chp_logically_online(struct chp_id chpid, int onoff)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   57  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   58  	chpid_to_chp(chpid)->state = onoff;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   59  }
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   60  
af901ca181d92aa André Goddard Rosa  2009-11-14   61  /* On success return 0 if channel-path is varied offline, 1 if it is varied
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   62   * online. Return -ENODEV if channel-path is not registered. */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   63  int chp_get_status(struct chp_id chpid)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   64  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   65  	return (chpid_to_chp(chpid) ? chpid_to_chp(chpid)->state : -ENODEV);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   66  }
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   67  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   68  /**
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   69   * chp_get_sch_opm - return opm for subchannel
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   70   * @sch: subchannel
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   71   *
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   72   * Calculate and return the operational path mask (opm) based on the chpids
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   73   * used by the subchannel and the status of the associated channel-paths.
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   74   */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   75  u8 chp_get_sch_opm(struct subchannel *sch)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   76  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   77  	struct chp_id chpid;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   78  	int opm;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   79  	int i;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   80  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   81  	opm = 0;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   82  	chp_id_init(&chpid);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   83  	for (i = 0; i < 8; i++) {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   84  		opm <<= 1;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   85  		chpid.id = sch->schib.pmcw.chpid[i];
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   86  		if (chp_get_status(chpid) != 0)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   87  			opm |= 1;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   88  	}
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   89  	return opm;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   90  }
44a1c19e3b47a7a Cornelia Huck       2008-07-14   91  EXPORT_SYMBOL_GPL(chp_get_sch_opm);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   92  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   93  /**
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   94   * chp_is_registered - check if a channel-path is registered
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   95   * @chpid: channel-path ID
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   96   *
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   97   * Return non-zero if a channel-path with the given chpid is registered,
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   98   * zero otherwise.
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27   99   */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  100  int chp_is_registered(struct chp_id chpid)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  101  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  102  	return chpid_to_chp(chpid) != NULL;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  103  }
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  104  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  105  /*
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  106   * Function: s390_vary_chpid
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  107   * Varies the specified chpid online or offline
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  108   */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  109  static int s390_vary_chpid(struct chp_id chpid, int on)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  110  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  111  	char dbf_text[15];
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  112  	int status;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  113  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  114  	sprintf(dbf_text, on?"varyon%x.%02x":"varyoff%x.%02x", chpid.cssid,
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  115  		chpid.id);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  116  	CIO_TRACE_EVENT(2, dbf_text);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  117  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  118  	status = chp_get_status(chpid);
c78aa6cbace4600 Michael Ernst       2008-07-14  119  	if (!on && !status)
c78aa6cbace4600 Michael Ernst       2008-07-14  120  		return 0;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  121  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  122  	set_chp_logically_online(chpid, on);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  123  	chsc_chp_vary(chpid, on);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  124  	return 0;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  125  }
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  126  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  127  /*
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  128   * Channel measurement related functions
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  129   */
b4691baaeef07bd Peter Oberparleiter 2024-03-26  130  static ssize_t measurement_chars_read(struct file *filp, struct kobject *kobj,
269b60415552dd9 Thomas Weißschuh    2024-12-11  131  				      const struct bin_attribute *bin_attr,
91a6902958f0523 Zhang Rui           2007-06-09  132  				      char *buf, loff_t off, size_t count)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  133  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  134  	struct channel_path *chp;
364c85584e030f7 Heiko Carstens      2007-10-12  135  	struct device *device;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  136  
0d730b57b95f7e7 chenqiwu            2020-02-14  137  	device = kobj_to_dev(kobj);
364c85584e030f7 Heiko Carstens      2007-10-12  138  	chp = to_channelpath(device);
0d9bfe9123cfde5 Sebastian Ott       2016-01-25  139  	if (chp->cmg == -1)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  140  		return 0;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  141  
0d9bfe9123cfde5 Sebastian Ott       2016-01-25  142  	return memory_read_from_buffer(buf, count, &off, &chp->cmg_chars,
0d9bfe9123cfde5 Sebastian Ott       2016-01-25  143  				       sizeof(chp->cmg_chars));
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  144  }
269b60415552dd9 Thomas Weißschuh    2024-12-11  145  static const BIN_ATTR_ADMIN_RO(measurement_chars, sizeof(struct cmg_chars));
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  146  
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  147  static ssize_t measurement_chars_full_read(struct file *filp,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  148  					   struct kobject *kobj,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  149  					   struct bin_attribute *bin_attr,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  150  					   char *buf, loff_t off, size_t count)
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  151  {
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  152  	struct channel_path *chp = to_channelpath(kobj_to_dev(kobj));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  153  
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  154  	return memory_read_from_buffer(buf, count, &off, &chp->cmcb,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  155  				       sizeof(chp->cmcb));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  156  }
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  157  static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  158  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  159  static ssize_t chp_measurement_copy_block(void *buf, loff_t off, size_t count,
2dc8903af775ecd Peter Oberparleiter 2024-03-26  160  					  struct kobject *kobj, bool extended)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  161  {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  162  	struct channel_path *chp;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  163  	struct channel_subsystem *css;
364c85584e030f7 Heiko Carstens      2007-10-12  164  	struct device *device;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  165  	unsigned int size;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  166  	void *area, *entry;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  167  	int id, idx;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  168  
0d730b57b95f7e7 chenqiwu            2020-02-14  169  	device = kobj_to_dev(kobj);
364c85584e030f7 Heiko Carstens      2007-10-12  170  	chp = to_channelpath(device);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  171  	css = to_css(chp->dev.parent);
2dc8903af775ecd Peter Oberparleiter 2024-03-26  172  	id = chp->chpid.id;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  173  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  174  	if (extended) {
2dc8903af775ecd Peter Oberparleiter 2024-03-26  175  		/* Check if extended measurement data is available. */
2dc8903af775ecd Peter Oberparleiter 2024-03-26  176  		if (!chp->extended)
2dc8903af775ecd Peter Oberparleiter 2024-03-26  177  			return 0;
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  178  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  179  		size = sizeof(struct cmg_ext_entry);
2dc8903af775ecd Peter Oberparleiter 2024-03-26  180  		area = css->ecub[id / CSS_ECUES_PER_PAGE];
2dc8903af775ecd Peter Oberparleiter 2024-03-26  181  		idx = id % CSS_ECUES_PER_PAGE;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  182  	} else {
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  183  		size = sizeof(struct cmg_entry);
2dc8903af775ecd Peter Oberparleiter 2024-03-26  184  		area = css->cub[id / CSS_CUES_PER_PAGE];
2dc8903af775ecd Peter Oberparleiter 2024-03-26  185  		idx = id % CSS_CUES_PER_PAGE;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  186  	}
2dc8903af775ecd Peter Oberparleiter 2024-03-26  187  	entry = area + (idx * size);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  188  
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  189  	/* Only allow single reads. */
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  190  	if (off || count < size)
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  191  		return 0;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  192  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  193  	memcpy(buf, entry, size);
2dc8903af775ecd Peter Oberparleiter 2024-03-26  194  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  195  	return size;
2dc8903af775ecd Peter Oberparleiter 2024-03-26  196  }
2dc8903af775ecd Peter Oberparleiter 2024-03-26  197  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  198  static ssize_t measurement_read(struct file *filp, struct kobject *kobj,
269b60415552dd9 Thomas Weißschuh    2024-12-11  199  				const struct bin_attribute *bin_attr,
2dc8903af775ecd Peter Oberparleiter 2024-03-26  200  				char *buf, loff_t off, size_t count)
2dc8903af775ecd Peter Oberparleiter 2024-03-26  201  {
2dc8903af775ecd Peter Oberparleiter 2024-03-26  202  	return chp_measurement_copy_block(buf, off, count, kobj, false);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  203  }
269b60415552dd9 Thomas Weißschuh    2024-12-11  204  static const BIN_ATTR_ADMIN_RO(measurement, sizeof(struct cmg_entry));
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  205  
2dc8903af775ecd Peter Oberparleiter 2024-03-26  206  static ssize_t ext_measurement_read(struct file *filp, struct kobject *kobj,
269b60415552dd9 Thomas Weißschuh    2024-12-11  207  				    const struct bin_attribute *bin_attr,
2dc8903af775ecd Peter Oberparleiter 2024-03-26  208  				    char *buf, loff_t off, size_t count)
2dc8903af775ecd Peter Oberparleiter 2024-03-26  209  {
2dc8903af775ecd Peter Oberparleiter 2024-03-26  210  	return chp_measurement_copy_block(buf, off, count, kobj, true);
2dc8903af775ecd Peter Oberparleiter 2024-03-26  211  }
269b60415552dd9 Thomas Weißschuh    2024-12-11  212  static const BIN_ATTR_ADMIN_RO(ext_measurement, sizeof(struct cmg_ext_entry));
2dc8903af775ecd Peter Oberparleiter 2024-03-26  213  
269b60415552dd9 Thomas Weißschuh    2024-12-11  214  static const struct bin_attribute *const measurement_attrs[] = {
b4691baaeef07bd Peter Oberparleiter 2024-03-26  215  	&bin_attr_measurement_chars,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  216  	&bin_attr_measurement_chars_full,
b4691baaeef07bd Peter Oberparleiter 2024-03-26  217  	&bin_attr_measurement,
2dc8903af775ecd Peter Oberparleiter 2024-03-26  218  	&bin_attr_ext_measurement,
b4691baaeef07bd Peter Oberparleiter 2024-03-26  219  	NULL,
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  220  };
b4691baaeef07bd Peter Oberparleiter 2024-03-26 @221  BIN_ATTRIBUTE_GROUPS(measurement);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  222  

:::::: The code at line 221 was first introduced by commit
:::::: b4691baaeef07bdc4c3524a0702d7dd6899610b4 s390/cio: simplify measurement attribute registration

:::::: TO: Peter Oberparleiter <oberpar@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
