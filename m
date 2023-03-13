Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0987C23A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678702573; x=1710238573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5q0HnoWmX02FUf007FERh7OI3xo9zA0o9cZ20NHbBk=;
  b=BtIzcUQWpObCTiuRlZMXmfOo778H16rBYhhxnf1CTCDjKpsQgZJ6tQPJ
   Zrvh8kp4gfzURlaAhgBrq+n5kOJ4HGNCUEh9KTMyj/z+dvX3lFeNpS7PB
   dtdpUdLyDlUVQFvNKoPfRxI7WaQwwKw33ZGrR1eACtx6mweS785wYC9TL
   /G12RfGf1ODS2jwyHhqueYZcuyAEQgzlPtbDndGQFHG+xAQqRQ2kjOS+n
   Qsw3PkeyOsesTyFlR8ETbIzPj8bK4f5i7h3pbslmKpZkk4jxTwEpEj32S
   4AXisBkf7hcWLh6nzCtQ6czJGVEncPvN/WeqD5J1EBqJuXGbDQ5qZo1kV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="364771215"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="364771215"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711073975"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="711073975"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Mar 2023 03:16:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbfDt-0005ZY-2D;
	Mon, 13 Mar 2023 10:16:09 +0000
Date: Mon, 13 Mar 2023 18:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 57/68]
 drivers/gpu/drm/nouveau/nvif/outp.c:335:1: warning: the frame size of 2064
 bytes is larger than 2048 bytes
Message-ID: <202303131830.TEjwVvU0-lkp@intel.com>
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230313/202303131830.TEjwVvU0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout f88f955a8a247f03baa570bb53b67846f6af7e90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131830.TEjwVvU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_edid_get':
>> drivers/gpu/drm/nouveau/nvif/outp.c:335:1: warning: the frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=]
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
