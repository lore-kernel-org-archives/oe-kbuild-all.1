Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0672F32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677678080; x=1709214080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wcBqpnyfvB3woz8L/m4u+vnQ9uHOup4dsI/UP5mmN4=;
  b=Voa6sgwYhk4QYjFxwOvelFWJwVchch/wijBy9LDiotHdynD1WPUd1yPX
   DVkDAM0AFzQNgWnvTkRSQ69evHcFER/gprX+bfl/gurt392YHeahIlDSn
   FKOyIQpZP7bXBTWenrJzHXFWQwn3k4nZUX82Cnhs2ILjutUFHOrfPMTr+
   KeYk9vNLlb317hjrkCZ1lrfBfFkyvtTbAq65DR87CPRhu6FIt3VFakjM6
   MAoquU7NKnwQSmJg6Z3M7SXTauIXFsc1mm89FHP4aLoBvWH0rARJlixp5
   oKwaDONdLKwCeUuZcHjj8fkBsD4ejpRcS5z3MByWPKq7CkzWDKh65hX+7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333136186"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="333136186"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="817567699"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="817567699"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2023 05:41:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXMhq-0006B9-1n;
	Wed, 01 Mar 2023 13:41:18 +0000
Date: Wed, 1 Mar 2023 21:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 8/9] v4l2-core: zero field base in struct
 v4l2_framebuffer
Message-ID: <202303012125.V7pSpW14-lkp@intel.com>
References: <20230301111850.607515-9-hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301111850.607515-9-hverkuil-cisco@xs4all.nl>

Hi Hans,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Verkuil/saa7146-drop-overlay-support/20230301-192008
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230301111850.607515-9-hverkuil-cisco%40xs4all.nl
patch subject: [RFC PATCH 8/9] v4l2-core: zero field base in struct v4l2_framebuffer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303012125.V7pSpW14-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/05a8856d169b96562bb31dc939654dda0ba05bd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-Verkuil/saa7146-drop-overlay-support/20230301-192008
        git checkout 05a8856d169b96562bb31dc939654dda0ba05bd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012125.V7pSpW14-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-compat-ioctl32.c: In function 'get_v4l2_framebuffer32':
>> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:590:24: warning: unused variable 'tmp' [-Wunused-variable]
     590 |         compat_caddr_t tmp;
         |                        ^~~


vim +/tmp +590 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

cf664a6458b254 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  586  
50085270a162d6 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Arnd Bergmann         2020-10-30  587  static int get_v4l2_framebuffer32(struct v4l2_framebuffer *p64,
6dd0394f5fcd51 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Mauro Carvalho Chehab 2018-04-16  588  				  struct v4l2_framebuffer32 __user *p32)
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  589  {
a1dfb4c48cc1e6 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Daniel Mentz          2017-07-19 @590  	compat_caddr_t tmp;
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  591  
05a8856d169b96 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Hans Verkuil          2023-03-01  592  	if (get_user(p64->capability, &p32->capability) ||
50085270a162d6 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Arnd Bergmann         2020-10-30  593  	    get_user(p64->flags, &p32->flags) ||
50085270a162d6 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Arnd Bergmann         2020-10-30  594  	    copy_from_user(&p64->fmt, &p32->fmt, sizeof(p64->fmt)))
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  595  		return -EFAULT;
05a8856d169b96 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Hans Verkuil          2023-03-01  596  	p64->base = NULL;
50085270a162d6 drivers/media/v4l2-core/v4l2-compat-ioctl32.c Arnd Bergmann         2020-10-30  597  
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  598  	return 0;
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  599  }
13d133bc66ea78 drivers/media/video/compat_ioctl32.c          Philippe De Muyter    2006-01-09  600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
