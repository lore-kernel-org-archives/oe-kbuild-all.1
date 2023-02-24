Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDC2902
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677230626; x=1708766626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAmDKqIHjdKry3RrntkNDX7x3r1aEv3zYfCIlj+fzh0=;
  b=d9b/f3+bIqun23WgJsaTrz8VuTAA9WBcdEs+cp5zrdQPZzjt8Gq7gZld
   4xRfMVLOnQ4/FONVRF//9n/pI3PJ/4AWFBYseET0FwmClJbI7OQ0s6kYF
   QMBzFGC4ZHUzBePIeKSjzAqjRs+Ouc0oFIstIgi22hFmZAs5phu4PvRUJ
   2n/hcGRTnkg+C5uwSGyuvtDHzM0nhMmLWb5enU3ZPxc/wQhYNW7IsD9U3
   4xpHV3B9gFD8wx+My93/46WmGWFdbMhWKoXH7wHXlwqSk8YEIn4ByA+VK
   UxFmMMm/2/5ZyhOzqqYMhZ6AuoZMiazlSeuacSVKZr4LYxqWcjRml+PHH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335669071"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="335669071"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 01:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001759615"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="1001759615"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2023 01:23:45 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVUIq-0002Ib-1i;
	Fri, 24 Feb 2023 09:23:44 +0000
Date: Fri, 24 Feb 2023 17:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:dcp-better-timeline 19/29] drivers/gpu/drm/apple/av.c:139:5:
 warning: no previous prototype for 'dcp_audiosrv_osobject_call'
Message-ID: <202302241735.uRksdhrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux dcp-better-timeline
head:   0de243b5677f9107b36034576e442a7e66bb692b
commit: 3152694d6c8945e90bcc1695a86351f3a20032d4 [19/29] gpu: drm: apple: Set up client of AV endpoint
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302241735.uRksdhrY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/3152694d6c8945e90bcc1695a86351f3a20032d4
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik dcp-better-timeline
        git checkout 3152694d6c8945e90bcc1695a86351f3a20032d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241735.uRksdhrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/apple/av.c: In function 'dcp_audiosrv_prepare':
   drivers/gpu/drm/apple/av.c:88:63: error: invalid application of 'sizeof' to incomplete type 'struct dcp_sound_cookie'
      88 |         ret = afk_service_call(asrv->srv, 0, 8, cookie, sizeof(*cookie),
         |                                                               ^
   drivers/gpu/drm/apple/av.c:89:43: error: invalid application of 'sizeof' to incomplete type 'struct dcp_sound_cookie'
      89 |                                64 - sizeof(*cookie), NULL, 0, 64);
         |                                           ^
   drivers/gpu/drm/apple/av.c: In function 'dcp_audiosrv_startlink':
   drivers/gpu/drm/apple/av.c:103:63: error: invalid application of 'sizeof' to incomplete type 'struct dcp_sound_cookie'
     103 |         ret = afk_service_call(asrv->srv, 0, 9, cookie, sizeof(*cookie),
         |                                                               ^
   drivers/gpu/drm/apple/av.c:104:43: error: invalid application of 'sizeof' to incomplete type 'struct dcp_sound_cookie'
     104 |                                64 - sizeof(*cookie), NULL, 0, 64);
         |                                           ^
   drivers/gpu/drm/apple/av.c: At top level:
>> drivers/gpu/drm/apple/av.c:139:5: warning: no previous prototype for 'dcp_audiosrv_osobject_call' [-Wmissing-prototypes]
     139 | int dcp_audiosrv_osobject_call(struct apple_epic_service *service, u16 group, u32 command,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/apple/av.c:226:18: error: 'const struct apple_epic_service_ops' has no member named 'report'
     226 |                 .report = av_audiosrv_report,
         |                  ^~~~~~
   drivers/gpu/drm/apple/av.c:226:27: error: initialization of 'int (*)(struct apple_epic_service *, u32,  const void *, size_t,  void *, size_t)' {aka 'int (*)(struct apple_epic_service *, unsigned int,  const void *, long unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(struct apple_epic_service *, u32,  const void *, size_t)' {aka 'int (*)(struct apple_epic_service *, unsigned int,  const void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
     226 |                 .report = av_audiosrv_report,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/apple/av.c:226:27: note: (near initialization for 'avep_ops[0].call')
   drivers/gpu/drm/apple/av.c:227:18: error: 'const struct apple_epic_service_ops' has no member named 'teardown'
     227 |                 .teardown = av_audiosrv_teardown,
         |                  ^~~~~~~~
   drivers/gpu/drm/apple/av.c:227:29: warning: excess elements in struct initializer
     227 |                 .teardown = av_audiosrv_teardown,
         |                             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/apple/av.c:227:29: note: (near initialization for 'avep_ops[0]')
   cc1: some warnings being treated as errors


vim +/dcp_audiosrv_osobject_call +139 drivers/gpu/drm/apple/av.c

   138	
 > 139	int dcp_audiosrv_osobject_call(struct apple_epic_service *service, u16 group, u32 command,
   140				       void *output, size_t output_maxsize, size_t *output_size)
   141	{
   142		struct {
   143			__le64 max_size;
   144			u8 _pad1[24];
   145			__le64 used_size;
   146			u8 _pad2[8];
   147		} __attribute__((packed)) *hdr;
   148		static_assert(sizeof(*hdr) == 48);
   149		size_t bfr_len = output_maxsize + sizeof(*hdr);
   150		void *bfr;
   151		int ret;
   152	
   153		bfr = kzalloc(bfr_len, GFP_KERNEL);
   154		if (!bfr)
   155			return -ENOMEM;
   156	
   157		hdr = bfr;
   158		hdr->max_size = cpu_to_le64(output_maxsize);
   159		ret = afk_service_call(service, group, command, hdr, sizeof(*hdr), output_maxsize,
   160				       bfr, sizeof(*hdr) + output_maxsize, 0);
   161		if (ret)
   162			return ret;
   163	
   164		if (output)
   165			memcpy(output, bfr + sizeof(*hdr), output_maxsize);
   166	
   167		if (output_size)
   168			*output_size = le64_to_cpu(hdr->used_size);
   169	
   170		return 0;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
