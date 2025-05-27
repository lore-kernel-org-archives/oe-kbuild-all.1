Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA841F4736
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327801; cv=none; b=iU8cHxYDvuypAibSnfVi5g+n2NR/mMj4mJeC5SpsWgEwwkXqL5KWXx45YJKMb98W+v2Bw1A8MzRsTN3Ka7Abg8fiWncYmKTP7pFmbVx1bnxq0UgJ1r81Poxvs01ruouIa++60GMgTIb29Y71u1Ap33iZ0WR0YEeMYp4JbY7hDoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327801; c=relaxed/simple;
	bh=e4SOuvgnMgVliVPRXZAdDnZV9v6eBX6FBF+FCdGGqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5BNx1gy4Hix8HY3hGBYfSNM7TGGy8IlYFSY4xvO4TKrCc5R41Yh4ulfUjXxu9uGXQIG7bM4cXx2N2jsipDwTh8FHjelRDWh0kz7FvOetD8UZ51mN2ROBQ4m2nLUti0M7hh+DmSaUIo6hyncnfXieKxnGziZHqBtXbjyrsA6NQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqNDiw+S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqNDiw+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327800; x=1779863800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4SOuvgnMgVliVPRXZAdDnZV9v6eBX6FBF+FCdGGqAI=;
  b=ZqNDiw+SQnyZNVNSqIWuiq13ozIRT4zmksyoe+40Zpq0SRYaKmSRyZMC
   S1iMB8Uyx2Oc0cCRM7AERZE8NLpEmlmOZ3HYY/gWIYO9vYxP6rpPmB3ib
   mQZ+lK+SiL6nTgw9bin7vff8mAb51aZIu3hf2fbIoOOHsT02DGRmf+RI5
   WgL2Qe5oCltvBG8iP6ywSF/txSkxZMz2AwrrCr72M/VanU9UWHN+Jn7un
   LO3btuVel93+b0JwK4ilB6Xww9zqBUF5dKaoccWTe3/XeD9l/TeOD/6m4
   d1ElWdx/Don89nAJjGSm/eOhuWP20RtrZO4n18t/2MHTEexlNVScJckL4
   w==;
X-CSE-ConnectionGUID: PJ86mp0+T+q2ulnQOEy1pA==
X-CSE-MsgGUID: BK59j/bvTDCQa9NvE7pIaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53957502"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="53957502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:37 -0700
X-CSE-ConnectionGUID: HvsPUwb3TWe9pP3A79CbRg==
X-CSE-MsgGUID: dsagU8oVTW2br4SMyzN/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="179859122"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2025 23:36:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJnvO-000Sy4-0e;
	Tue, 27 May 2025 06:36:34 +0000
Date: Tue, 27 May 2025 14:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/media/i2c/ov2680.c:572:9: error: implicit declaration of function
 'v4l2_subdev_get_try_format'
Message-ID: <202505271408.rcFdwGjV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f7dbe96d1c3986af0f08e71cdecbc6c6d73ee18f
commit: dbb717b4ee68489000c5b0470a20ac71dd4075c8 [0/2] media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
config: x86_64-randconfig-121-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271408.rcFdwGjV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271408.rcFdwGjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271408.rcFdwGjV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2680.c:572:9: error: implicit declaration of function 'v4l2_subdev_get_try_format' [-Werror,-Wimplicit-function-declaration]
     572 |                 fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
         |                       ^
   drivers/media/i2c/ov2680.c:572:7: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
     572 |                 fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     573 |                                                  format->pad);
         |                                                  ~~~~~~~~~~~~
   drivers/media/i2c/ov2680.c:614:13: error: implicit declaration of function 'v4l2_subdev_get_try_format' [-Werror,-Wimplicit-function-declaration]
     614 |                 try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
         |                           ^
   drivers/media/i2c/ov2680.c:614:11: error: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
     614 |                 try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/v4l2_subdev_get_try_format +572 drivers/media/i2c/ov2680.c

3ee47cad3e6955 Rui Miguel Silva 2018-07-03  558  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  559  static int ov2680_get_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  560  			  struct v4l2_subdev_state *sd_state,
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  561  			  struct v4l2_subdev_format *format)
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  562  {
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  563  	struct ov2680_dev *sensor = to_ov2680_dev(sd);
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  564  	struct v4l2_mbus_framefmt *fmt = NULL;
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  565  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  566  	if (format->pad != 0)
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  567  		return -EINVAL;
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  568  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  569  	mutex_lock(&sensor->lock);
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  570  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  571  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10 @572  		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  573  						 format->pad);
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  574  	} else {
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  575  		fmt = &sensor->fmt;
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  576  	}
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  577  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  578  	format->format = *fmt;
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  579  
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  580  	mutex_unlock(&sensor->lock);
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  581  
dbb717b4ee6848 Hans de Goede    2023-08-03  582  	return 0;
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  583  }
3ee47cad3e6955 Rui Miguel Silva 2018-07-03  584  

:::::: The code at line 572 was first introduced by commit
:::::: 0d346d2a6f54f06f36b224fd27cd6eafe8c83be9 media: v4l2-subdev: add subdev-wide state struct

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
