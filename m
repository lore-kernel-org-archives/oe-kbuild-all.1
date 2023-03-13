Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233623A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678703172; x=1710239172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWSEW872+sKKyOMS4GzJqFshF8MvhpjVjajFd7Eeb2I=;
  b=GdcgxBTUcm6Xe+LZbxwBGIyVOgzHnTF9GuPDXjubWSbiXin75frjqfvO
   9udi5MfZK4l2aXbXa6kq69k5ytUifEEHst3dWWBjaXkMVQGcXPbFzdPGj
   k9vibWqVKB56sIIcddQHvD51/u19V04l9CiboE+kZ+tMVVOBwfgl5mzq+
   bWb/GepZcLgYKpMhWBHpvzlm1NCjLh8RWfcF7vpi3UpDAWxt3zu5ZqXvS
   JgSO8dl8NvEuxHW48Ejc5iq+48l5QnH+7A+KIJ1KLRLN0eKwzuNQQqbuR
   ZSA/gAaX1aR22FF+fKM7b1DI890ka8FdVkHoqYFOIVC5QKkavZ8Ob7uDd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="401981478"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="401981478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="767644630"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="767644630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2023 03:26:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbfNa-0005Zy-00;
	Mon, 13 Mar 2023 10:26:10 +0000
Date: Mon, 13 Mar 2023 18:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 57/68]
 drivers/gpu/drm/nouveau/nvif/outp.c:335:1: warning: the frame size of 2056
 bytes is larger than 1024 bytes
Message-ID: <202303131805.Bioz9HL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   89da5e5109a92f4be025e40b80d1f1a6c1d6d8c7
commit: f88f955a8a247f03baa570bb53b67846f6af7e90 [57/68] disp
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131805.Bioz9HL7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout f88f955a8a247f03baa570bb53b67846f6af7e90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131805.Bioz9HL7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_edid_get':
>> drivers/gpu/drm/nouveau/nvif/outp.c:335:1: warning: the frame size of 2056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     335 | }
         | ^


vim +335 drivers/gpu/drm/nouveau/nvif/outp.c

   315	
   316	int
   317	nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
   318	{
   319		struct nvif_outp_edid_get_v0 args;
   320		int ret;
   321	
   322		args.version = 0;
   323	
   324		ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, &args, sizeof(args));
   325		NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args.size);
   326		if (ret)
   327			return ret;
   328	
   329		*pedid = kmalloc(args.size, GFP_KERNEL);
   330		if (WARN_ON(!*pedid))
   331			return -ENOMEM;
   332	
   333		memcpy(*pedid, args.data, args.size);
   334		return args.size;
 > 335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
