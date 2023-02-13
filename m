Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCB2914
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676287277; x=1707823277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4vK+1xN/5BovAWcfi0EQSBakcsWXZz/atPNZIIgfmw=;
  b=htGxW5eOc3Z9nzE5Txg6KmvYxb565SsWWRNPjY30at94awWry/uLZm5G
   ziVyaOcR3yTMXdapjS/wECxPqgmmXW207NLK/l+d4utot97n2ws/OiXZg
   K2vUEFLJKjNgs0G9/4u41C2GM89CxODPsBL4rJIk1bDezb8W46Typ7NkH
   IBDWthyzfwAsbv2Kc59Zvfh40cvuk71EzfPBpK3SmAXaAAO4E7LL60k77
   8RYwgg5hcMIVxLCVn0QsPZQTEBtlgZMQ6B3/Nro0gIyXUKjfxp+mxSbDR
   nWmY/mV1/whkcG6YLwvqmcvTvcUwhZWy4jynUqHNZZqrzkrhdDcksq9io
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395480868"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395480868"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 03:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="777806695"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="777806695"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2023 03:21:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRWtX-0007i1-0F;
	Mon, 13 Feb 2023 11:21:15 +0000
Date: Mon, 13 Feb 2023 19:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 185/193]
 drivers/gpu/drm/nouveau/nvif/outp.c:335:1: warning: the frame size of 2064
 bytes is larger than 2048 bytes
Message-ID: <202302131939.TNxCZciw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   ab3448c2873e0fbcf1fd710cccb52dc548bdf449
commit: c24815755c5c79d50fa9370ec1124fedd29743bb [185/193] disp
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302131939.TNxCZciw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout c24815755c5c79d50fa9370ec1124fedd29743bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131939.TNxCZciw-lkp@intel.com/

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
