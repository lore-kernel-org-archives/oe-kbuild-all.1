Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72B20F88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689183908; x=1720719908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zLYIyJTleF/gqH00efBbTjqBx8WogWNIFzBxFduGyI=;
  b=V6WOcK+lWOSyKNFnKAA4iMx4Oawez40PCxWNlNI5FosIAaR31j8ulrcC
   tqwzG4wCgrNrCpaxIvXfZSlPDeMeNbzKlRRnF/kqseZ5qXhev3BLTUY8z
   LCMi48pDfkap5yCtSSjMF9Bsb43Ekdl0jakkvjHqKyX/z5u7xbwl1QUmH
   uQiOJ95PwKoKlc40BK8zowYKUr/u9CzpGNIabxio5FdKWftwQBzTjbnWg
   LEUUeq52h2l9SjLJuUEYoSkIUf7q4Y2BrGAKDOA+r3acqzuqcLluGUeZO
   4yGApP5tTMwgT2ZG9PovO8034ztYLViZwPP1rzkKBueLOFLVvIiqoLy2+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395758396"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="395758396"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 10:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="715654011"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="715654011"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jul 2023 10:45:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJdtf-0005tP-1J;
	Wed, 12 Jul 2023 17:45:03 +0000
Date: Thu, 13 Jul 2023 01:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/83]
 drivers/gpu/drm/nouveau/nvif/outp.c:403:1: warning: the frame size of 2072
 bytes is larger than 2048 bytes
Message-ID: <202307130121.SNqHqGO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: 929ea3fae6784b42ba729c68acd6dee78b774624 [75/83] WIPdrm/nouveau/disp/r535: initial support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307130121.SNqHqGO8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130121.SNqHqGO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130121.SNqHqGO8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_edid_get':
>> drivers/gpu/drm/nouveau/nvif/outp.c:403:1: warning: the frame size of 2072 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     403 | }
         | ^


vim +403 drivers/gpu/drm/nouveau/nvif/outp.c

   383	
   384	int
   385	nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
   386	{
   387		struct nvif_outp_edid_get_v0 args;
   388		int ret;
   389	
   390		args.version = 0;
   391	
   392		ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, &args, sizeof(args));
   393		NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args.size);
   394		if (ret)
   395			return ret;
   396	
   397		*pedid = kmalloc(args.size, GFP_KERNEL);
   398		if (WARN_ON(!*pedid))
   399			return -ENOMEM;
   400	
   401		memcpy(*pedid, args.data, args.size);
   402		return args.size;
 > 403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
