Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64329B777
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784878; cv=none; b=MtYhOf8BbC2leK1IUci1fyBn6/LJ9OdVW9y6hkEP1hJPTzfuKwkyV3HJnxKpAgB26LBtdttTCzXTXdXhhzWJbs0P5RCCR/osQ4fL8Pl63m77Uer6YRXYD06ry+EfSWSqMwKvK7++YGRQVovMUrEmClsO83X5d5iBcfD0mDDLK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784878; c=relaxed/simple;
	bh=FBSiRifc6kebJgTBKx6ksX4wTjLhi1pX+wL+QzcrTPI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNHPDz70LIQfqwkWt1NaIxBxFxM1hOxcZwfnenxm+aSloeD3QbyAAg8XqCwhWQvecIAy6OGlEBvbhhxUtEz/dAV+wIvPYFOkUpS6ds5BbUjk9Dvm271uxex9T92iVcwrnpUCSogJEumh+XPBfHga1Mipi/3kPtZhYRG9SiczjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOotYL7P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOotYL7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765784877; x=1797320877;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FBSiRifc6kebJgTBKx6ksX4wTjLhi1pX+wL+QzcrTPI=;
  b=gOotYL7Pg1o/Ii3eHLEFrV37Jl7W6/2xWdT20QRXMnO4aan7Dhjb1pUy
   XMunFLrdfn4FZRsCcZdn49tN/+Zf2GSwv8bGnAkvjxRvZZkTQAW58912Z
   733wf69atmbabGzcqaI8HzPbniWQJ+VnQpVAI8oSorJXHU9XnQ6xZoh2m
   KUPk3Yx7+OvYwOjwrAOIVNhTH8Lq18GCfiZrbwNOyXAW5ER/00QZgBRTa
   PKL7yzCxJCgZbXpRvd8sFUHZMudwzYyUJ78jciTXIo1nvLWsCFP/OEt53
   l3pXyg+KbzU5ZCdTtdxXwJSPFj0W5Mfr9qiUx+BlV3l6gGN6GNzjXkqpB
   Q==;
X-CSE-ConnectionGUID: kexRsoP9QNmBM4mR2RFW2w==
X-CSE-MsgGUID: rjVU026nSfyTV1bVC3xJ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="70259403"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="70259403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 23:47:56 -0800
X-CSE-ConnectionGUID: MvHfYqpERKSQWCR+nDkRfQ==
X-CSE-MsgGUID: 6tUcNAbDQli73MOAxVwvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197705894"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2025 23:47:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV3JB-000000002bc-03xm;
	Mon, 15 Dec 2025 07:47:53 +0000
Date: Mon, 15 Dec 2025 08:46:58 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/emt 0/9] htmldocs: ./include/media/v4l2-async.h:63:
 warning: Function parameter or struct member 'src_pad' not described in
 'v4l2_async_match_desc'
Message-ID: <202512150827.Oi9SQr1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 864201e3a7a9428b2c6733268d5d8688d0c3f55f [0/9] lt6911 2 pads linked to ipu 2 ports for split mode
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150827.Oi9SQr1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150827.Oi9SQr1o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/libps2.h
   Error: Cannot open file ./include/linux/libps2.h
   Error: Cannot open file ./include/linux/interconnect-provider.h
>> ./include/media/v4l2-async.h:63: warning: Function parameter or struct member 'src_pad' not described in 'v4l2_async_match_desc'
>> ./include/media/v4l2-async.h:87: warning: Function parameter or struct member 'src_pad' not described in 'v4l2_async_connection'
   Error: Cannot open file ./include/linux/parport.h
   Error: Cannot open file ./include/linux/parport.h
   Error: Cannot open file ./include/linux/pwm.h
   Error: Cannot open file ./include/linux/pwm.h
   Error: Cannot open file ./include/linux/mtd/rawnand.h


vim +63 ./include/media/v4l2-async.h

e9e310491bdbc8c Guennadi Liakhovetski 2013-01-08  35  
e9e310491bdbc8c Guennadi Liakhovetski 2013-01-08  36  /**
adb2dcd5f2d49d3 Sakari Ailus          2023-02-16  37   * struct v4l2_async_match_desc - async connection match information
f8b27377076e440 Mauro Carvalho Chehab 2015-08-22  38   *
f0e10d0a971c43f Sakari Ailus          2023-02-19  39   * @type:	type of match that will be used
f0e10d0a971c43f Sakari Ailus          2023-02-19  40   * @fwnode:	pointer to &struct fwnode_handle to be matched.
7a2259fc5182bc7 Sakari Ailus          2023-05-05  41   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_FWNODE.
f0e10d0a971c43f Sakari Ailus          2023-02-19  42   * @i2c:	embedded struct with I2C parameters to be matched.
eb0f73ba1230584 Mauro Carvalho Chehab 2017-09-27  43   *		Both @match.i2c.adapter_id and @match.i2c.address
eb0f73ba1230584 Mauro Carvalho Chehab 2017-09-27  44   *		should be matched.
7a2259fc5182bc7 Sakari Ailus          2023-05-05  45   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43f Sakari Ailus          2023-02-19  46   * @i2c.adapter_id:
eb0f73ba1230584 Mauro Carvalho Chehab 2017-09-27  47   *		I2C adapter ID to be matched.
7a2259fc5182bc7 Sakari Ailus          2023-05-05  48   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43f Sakari Ailus          2023-02-19  49   * @i2c.address:
eb0f73ba1230584 Mauro Carvalho Chehab 2017-09-27  50   *		I2C address to be matched.
7a2259fc5182bc7 Sakari Ailus          2023-05-05  51   *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
f0e10d0a971c43f Sakari Ailus          2023-02-19  52   */
f0e10d0a971c43f Sakari Ailus          2023-02-19  53  struct v4l2_async_match_desc {
f0e10d0a971c43f Sakari Ailus          2023-02-19  54  	enum v4l2_async_match_type type;
f0e10d0a971c43f Sakari Ailus          2023-02-19  55  	union {
f0e10d0a971c43f Sakari Ailus          2023-02-19  56  		struct fwnode_handle *fwnode;
f0e10d0a971c43f Sakari Ailus          2023-02-19  57  		struct {
f0e10d0a971c43f Sakari Ailus          2023-02-19  58  			int adapter_id;
f0e10d0a971c43f Sakari Ailus          2023-02-19  59  			unsigned short address;
f0e10d0a971c43f Sakari Ailus          2023-02-19  60  		} i2c;
f0e10d0a971c43f Sakari Ailus          2023-02-19  61  	};
864201e3a7a9428 Chen Meng J           2024-12-26  62  	s16 src_pad;
f0e10d0a971c43f Sakari Ailus          2023-02-19 @63  };
f0e10d0a971c43f Sakari Ailus          2023-02-19  64  
f0e10d0a971c43f Sakari Ailus          2023-02-19  65  /**
28a1295795d85a2 Sakari Ailus          2023-05-19  66   * struct v4l2_async_connection - sub-device connection descriptor, as known to
28a1295795d85a2 Sakari Ailus          2023-05-19  67   *				  a bridge
f0e10d0a971c43f Sakari Ailus          2023-02-19  68   *
f0e10d0a971c43f Sakari Ailus          2023-02-19  69   * @match:	struct of match type and per-bus type matching data sets
28a1295795d85a2 Sakari Ailus          2023-05-19  70   * @notifier:	the async notifier the connection is related to
adb2dcd5f2d49d3 Sakari Ailus          2023-02-16  71   * @asc_entry:	used to add struct v4l2_async_connection objects to the
9bf19fbf0c8bc43 Sakari Ailus          2023-04-18  72   *		notifier @waiting_list or @done_list
28a1295795d85a2 Sakari Ailus          2023-05-19  73   * @asc_subdev_entry:	entry in struct v4l2_async_subdev.asc_list list
9bf19fbf0c8bc43 Sakari Ailus          2023-04-18  74   * @sd:		the related sub-device
9ca465312132959 Sakari Ailus          2017-08-17  75   *
28a1295795d85a2 Sakari Ailus          2023-05-19  76   * When this struct is used as a member in a driver specific struct, the driver
28a1295795d85a2 Sakari Ailus          2023-05-19  77   * specific struct shall contain the &struct v4l2_async_connection as its first
28a1295795d85a2 Sakari Ailus          2023-05-19  78   * member.
e9e310491bdbc8c Guennadi Liakhovetski 2013-01-08  79   */
adb2dcd5f2d49d3 Sakari Ailus          2023-02-16  80  struct v4l2_async_connection {
f0e10d0a971c43f Sakari Ailus          2023-02-19  81  	struct v4l2_async_match_desc match;
28a1295795d85a2 Sakari Ailus          2023-05-19  82  	struct v4l2_async_notifier *notifier;
adb2dcd5f2d49d3 Sakari Ailus          2023-02-16  83  	struct list_head asc_entry;
28a1295795d85a2 Sakari Ailus          2023-05-19  84  	struct list_head asc_subdev_entry;
9bf19fbf0c8bc43 Sakari Ailus          2023-04-18  85  	struct v4l2_subdev *sd;
864201e3a7a9428 Chen Meng J           2024-12-26  86  	s16 src_pad;
e9e310491bdbc8c Guennadi Liakhovetski 2013-01-08 @87  };
e9e310491bdbc8c Guennadi Liakhovetski 2013-01-08  88  

:::::: The code at line 63 was first introduced by commit
:::::: f0e10d0a971c43fb2035fccc06de8bdd22674ec9 media: v4l: async: Make V4L2 async match information a struct

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
