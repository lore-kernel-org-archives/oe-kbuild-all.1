Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392EB1118B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687166723; x=1718702723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+A47zB5hiSMcVj0FB5tiHwF2TG/iWG3KTEoQFT+1r4Y=;
  b=c7kIzm/3MRdkEiQJAaGzNT29UExECHRuGDbEowoHeEhXtDm/IER90bs2
   EQH0lHZZ/WKz4eRPhKlW9w+IsYBjRGTyFp0092sxcyJUbx9byE9ERANqM
   XT0hgdSKygTJac6I6XOSzdNLQf5tCSO6fMJ6i9vLwlrhYC362YYcMXRQh
   LWsSb9lvF/qHTYZGkCxbGxu1rblrzAp+4gJw5ZeNjiv7tGfGAvGNcJID9
   iyfhTNTYB7xfWt0Z4frdUR1xKSRLi5Q4GOgKEDGU6Yiox0F0HTyLtpV9G
   Iwe2YXygu8s8/20pl2tpZcFwTWSZ0KhgFzal9li1kdxVrmfMTjCHbRi8N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349308302"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="349308302"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 02:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="743381974"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="743381974"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jun 2023 02:25:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBB8R-0004a0-1q;
	Mon, 19 Jun 2023 09:25:19 +0000
Date: Mon, 19 Jun 2023 17:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1155/6555]
 drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202306191707.yLxrPJGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: dfdec43d0411076dc70591a0496a0824a8620695 [1155/6555] UPSTREAM: drm: extract drm_atomic_uapi.c
config: xtensa-randconfig-s032-20230615 (https://download.01.org/0day-ci/archive/20230619/202306191707.yLxrPJGl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191707.yLxrPJGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191707.yLxrPJGl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int *__pu_addr @@     got signed int [noderef] [usertype] <asn:1> *fence_ptr @@
   drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse:     expected signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse:     got signed int [noderef] [usertype] <asn:1> *fence_ptr
>> drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got signed int *__pu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse:     expected void [noderef] <asn:1> *to
   drivers/gpu/drm/drm_atomic_uapi.c:366:13: sparse:     got signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int *__pu_addr @@     got signed int [noderef] [usertype] <asn:1> *fence_ptr @@
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse:     expected signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse:     got signed int [noderef] [usertype] <asn:1> *fence_ptr
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got signed int *__pu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse:     expected void [noderef] <asn:1> *to
   drivers/gpu/drm/drm_atomic_uapi.c:466:21: sparse:     got signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int *__pu_addr @@     got signed int [noderef] [usertype] <asn:1> *out_fence_ptr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse:     expected signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse:     got signed int [noderef] [usertype] <asn:1> *out_fence_ptr
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got signed int *__pu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse:     expected void [noderef] <asn:1> *to
   drivers/gpu/drm/drm_atomic_uapi.c:1052:13: sparse:     got signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int *__pu_addr @@     got signed int [noderef] [usertype] <asn:1> *out_fence_ptr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse:     expected signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse:     got signed int [noderef] [usertype] <asn:1> *out_fence_ptr
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got signed int *__pu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse:     expected void [noderef] <asn:1> *to
   drivers/gpu/drm/drm_atomic_uapi.c:1230:21: sparse:     got signed int *__pu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
>> drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     expected void const [noderef] <asn:1> *from
   drivers/gpu/drm/drm_atomic_uapi.c:1297:21: sparse:     got unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     expected void const [noderef] <asn:1> *from
   drivers/gpu/drm/drm_atomic_uapi.c:1314:21: sparse:     got unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     expected unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     expected void const [noderef] <asn:1> *from
   drivers/gpu/drm/drm_atomic_uapi.c:1327:29: sparse:     got unsigned int const *__gu_addr
   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1193:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1193 |         struct drm_crtc *crtc;
         |                          ^~~~

vim +366 drivers/gpu/drm/drm_atomic_uapi.c

   356	
   357	static int set_out_fence_for_connector(struct drm_atomic_state *state,
   358						struct drm_connector *connector,
   359						s32 __user *fence_ptr)
   360	{
   361		unsigned int index = drm_connector_index(connector);
   362	
   363		if (!fence_ptr)
   364			return 0;
   365	
 > 366		if (put_user(-1, fence_ptr))
   367			return -EFAULT;
   368	
   369		state->connectors[index].out_fence_ptr = fence_ptr;
   370	
   371		return 0;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
