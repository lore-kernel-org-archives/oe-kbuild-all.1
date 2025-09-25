Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52ED22154F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806080; cv=none; b=JreyD9jDN75i0Sed4CMLW9O6yRvdIcJvODcSA76/0psuFLldl5OM01+PGSuKBZwFPakjik7gTD7gegYDknUqUhvsYMw5F3UlvzLhaLg7MTSeDQw+H6VwLMD6B0SqTtl/NNdhg0IoopSCMzo4rELT7RmO6ErV5jFjB/6jqVEJ/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806080; c=relaxed/simple;
	bh=HUgISgUoxEiedft5zi10N0Mp7zxApCgHJLj5CdzZJAk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=um2NysdyPx5sGdeXJC7P0CfbsN/DVNpQT93DH+zn9eZFc0bfPys5fcO8o5AsFzAneW4wgO+nIayJLzUgA434BdKAzuZO+5f5OSG2RD4cwqQtxB+wUHjfVrINmyXnhkKjJWcUBpEOCw1AG1aBTXa54s06UncGPyLCtPRntxqa0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMEnapoR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMEnapoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758806079; x=1790342079;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HUgISgUoxEiedft5zi10N0Mp7zxApCgHJLj5CdzZJAk=;
  b=JMEnapoR7guP3gVAfPs3VPNkmqmp3ox2X47c8G5iNLVb5+NbZsOtmI5V
   OoUaV/c/omJGMzxJmRg2c7XENRngX4QLJkCg1X1iriRw8JECbVQ/Io0X3
   R5x/DgEHW+0jEQNeyKZ3YylXTEKQlZgo6KFpl+h1atqJmaDrMyfV+jdvm
   WWnxNZ5QnosWhXWKgZSGadmRihoNlGqe3/BO2plpU9jfSfPhqWDpGKQRx
   nygqTYysZ5VPQwgTGgoT3Q6b3v1bhyhufwTeUQypCMHgRBzrdP61UFBSh
   7JRvWeoTzglr58kKZ93F9DLWPcoYLRC+W1DaYHd6bLbt90uPEFX8Pr2N+
   A==;
X-CSE-ConnectionGUID: PaWOf1DASFSND8zKPfWcQw==
X-CSE-MsgGUID: bWQ3zFGQScG/MbesPtEAWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61044448"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="61044448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:14:38 -0700
X-CSE-ConnectionGUID: i9PqOlT+RaO9l/h1woVktg==
X-CSE-MsgGUID: KeX0KXg6QYuxwLHxRtVVPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="182486373"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 25 Sep 2025 06:14:36 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1lnu-000000004uT-0bny;
	Thu, 25 Sep 2025 13:14:34 +0000
Date: Thu, 25 Sep 2025 15:14:27 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:6.12/android_v 1/1] htmldocs:
 ./include/media/v4l2-async.h:63: warning: Function parameter or struct
 member 'src_pad' not described in 'v4l2_async_match_desc'
Message-ID: <202509251510.pf9ASI7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/android_v
head:   292f267ed0e0a5f981620f93a774df739aeba05a
commit: 5b38463f698f51c9d5865bf6f8b799e8dd1b9bbc [1/1] lt6911 2 pads linked to ipu 2 ports for split mode
reproduce: (https://download.01.org/0day-ci/archive/20250925/202509251510.pf9ASI7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251510.pf9ASI7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/libps2.h
   Error: Cannot open file ./include/linux/libps2.h
   Error: Cannot open file ./include/linux/interconnect-provider.h
>> ./include/media/v4l2-async.h:63: warning: Function parameter or struct member 'src_pad' not described in 'v4l2_async_match_desc'
>> ./include/media/v4l2-async.h:87: warning: Function parameter or struct member 'src_pad' not described in 'v4l2_async_connection'
   ./include/media/v4l2-ctrls.h:100: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_ptr'
   ./include/media/v4l2-ctrls.h:100: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'v4l2_ctrl_ptr'
   ./include/media/v4l2-ctrls.h:134: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_ops'
   ./include/media/v4l2-ctrls.h:161: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_type_ops'
   ./include/media/v4l2-ctrls.h:335: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl'


vim +63 ./include/media/v4l2-async.h

e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08  35  
e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08  36  /**
adb2dcd5f2d49d Sakari Ailus          2023-02-16  37   * struct v4l2_async_match_desc - async connection match information
f8b27377076e44 Mauro Carvalho Chehab 2015-08-22  38   *
f0e10d0a971c43 Sakari Ailus          2023-02-19  39   * @type:	type of match that will be used
f0e10d0a971c43 Sakari Ailus          2023-02-19  40   * @fwnode:	pointer to &struct fwnode_handle to be matched.
7a2259fc5182bc Sakari Ailus          2023-05-05  41   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_FWNODE.
f0e10d0a971c43 Sakari Ailus          2023-02-19  42   * @i2c:	embedded struct with I2C parameters to be matched.
eb0f73ba123058 Mauro Carvalho Chehab 2017-09-27  43   *		Both @match.i2c.adapter_id and @match.i2c.address
eb0f73ba123058 Mauro Carvalho Chehab 2017-09-27  44   *		should be matched.
7a2259fc5182bc Sakari Ailus          2023-05-05  45   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43 Sakari Ailus          2023-02-19  46   * @i2c.adapter_id:
eb0f73ba123058 Mauro Carvalho Chehab 2017-09-27  47   *		I2C adapter ID to be matched.
7a2259fc5182bc Sakari Ailus          2023-05-05  48   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43 Sakari Ailus          2023-02-19  49   * @i2c.address:
eb0f73ba123058 Mauro Carvalho Chehab 2017-09-27  50   *		I2C address to be matched.
7a2259fc5182bc Sakari Ailus          2023-05-05  51   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43 Sakari Ailus          2023-02-19  52   */
f0e10d0a971c43 Sakari Ailus          2023-02-19  53  struct v4l2_async_match_desc {
f0e10d0a971c43 Sakari Ailus          2023-02-19  54  	enum v4l2_async_match_type type;
f0e10d0a971c43 Sakari Ailus          2023-02-19  55  	union {
f0e10d0a971c43 Sakari Ailus          2023-02-19  56  		struct fwnode_handle *fwnode;
f0e10d0a971c43 Sakari Ailus          2023-02-19  57  		struct {
f0e10d0a971c43 Sakari Ailus          2023-02-19  58  			int adapter_id;
f0e10d0a971c43 Sakari Ailus          2023-02-19  59  			unsigned short address;
f0e10d0a971c43 Sakari Ailus          2023-02-19  60  		} i2c;
f0e10d0a971c43 Sakari Ailus          2023-02-19  61  	};
5b38463f698f51 Chen Meng J           2024-12-26  62  	s16 src_pad;
f0e10d0a971c43 Sakari Ailus          2023-02-19 @63  };
f0e10d0a971c43 Sakari Ailus          2023-02-19  64  
f0e10d0a971c43 Sakari Ailus          2023-02-19  65  /**
28a1295795d85a Sakari Ailus          2023-05-19  66   * struct v4l2_async_connection - sub-device connection descriptor, as known to
28a1295795d85a Sakari Ailus          2023-05-19  67   *				  a bridge
f0e10d0a971c43 Sakari Ailus          2023-02-19  68   *
f0e10d0a971c43 Sakari Ailus          2023-02-19  69   * @match:	struct of match type and per-bus type matching data sets
28a1295795d85a Sakari Ailus          2023-05-19  70   * @notifier:	the async notifier the connection is related to
adb2dcd5f2d49d Sakari Ailus          2023-02-16  71   * @asc_entry:	used to add struct v4l2_async_connection objects to the
9bf19fbf0c8bc4 Sakari Ailus          2023-04-18  72   *		notifier @waiting_list or @done_list
28a1295795d85a Sakari Ailus          2023-05-19  73   * @asc_subdev_entry:	entry in struct v4l2_async_subdev.asc_list list
9bf19fbf0c8bc4 Sakari Ailus          2023-04-18  74   * @sd:		the related sub-device
9ca46531213295 Sakari Ailus          2017-08-17  75   *
28a1295795d85a Sakari Ailus          2023-05-19  76   * When this struct is used as a member in a driver specific struct, the driver
28a1295795d85a Sakari Ailus          2023-05-19  77   * specific struct shall contain the &struct v4l2_async_connection as its first
28a1295795d85a Sakari Ailus          2023-05-19  78   * member.
e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08  79   */
adb2dcd5f2d49d Sakari Ailus          2023-02-16  80  struct v4l2_async_connection {
f0e10d0a971c43 Sakari Ailus          2023-02-19  81  	struct v4l2_async_match_desc match;
28a1295795d85a Sakari Ailus          2023-05-19  82  	struct v4l2_async_notifier *notifier;
adb2dcd5f2d49d Sakari Ailus          2023-02-16  83  	struct list_head asc_entry;
28a1295795d85a Sakari Ailus          2023-05-19  84  	struct list_head asc_subdev_entry;
9bf19fbf0c8bc4 Sakari Ailus          2023-04-18  85  	struct v4l2_subdev *sd;
5b38463f698f51 Chen Meng J           2024-12-26  86  	s16 src_pad;
e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08 @87  };
e9e310491bdbc8 Guennadi Liakhovetski 2013-01-08  88  

:::::: The code at line 63 was first introduced by commit
:::::: f0e10d0a971c43fb2035fccc06de8bdd22674ec9 media: v4l: async: Make V4L2 async match information a struct

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
