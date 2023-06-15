Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020464B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686810772; x=1718346772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7Rg4Z8tN68L4Ggv7n3oCaLNZ0NWwcD2fhinr5NJ6OQ=;
  b=PssWc96nllXnkdxq5YCIIv5Tk/wJrrcB7/iMFlbB291G3sxJwzQMhMJ7
   uG2sZ8M/Cp+0rhofWswY3T1fJRaitAYVf8ZCl/7X/ncZIr/CFmVpVBkqR
   XLCBa4CLD+Ybw9/COYzsAo2EDj3i+JsLFuU/Prvdih+cOXvOb25Ts664b
   gImIDZHur6LDo6W3MSUkQ/itXInII+X1qi0lX50sJHfOdDY6J/6FExkS7
   ZuK2T/wsTA1L2CnnFCBSFVTw9Mw+2lpscuJIAEJdH+x66qJv/TsIZ1iHK
   j2TYB6xkeV0ioMdQKu4OnPZVGycRO4Ht+JtKa1WyDRgQu6L4MxePO1mkt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343527715"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="343527715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 23:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712345887"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="712345887"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 23:32:47 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9gXG-0001Yd-2W;
	Thu, 15 Jun 2023 06:32:46 +0000
Date: Thu, 15 Jun 2023 14:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Felix.Kuehling@amd.com
Cc: oe-kbuild-all@lists.linux.dev,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
	Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	alexander.deucher@amd.com, christian.koenig@amd.com
Subject: Re: [PATCH] drm/amdkfd: Switch over to memdup_user()
Message-ID: <202306151407.U4D2AMDM-lkp@intel.com>
References: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>

Hi Jiapeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230613]
[cannot apply to drm-misc/drm-misc-next v6.4-rc6 v6.4-rc5 v6.4-rc4 linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-amdkfd-Switch-over-to-memdup_user/20230614-100553
base:   next-20230613
patch link:    https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm/amdkfd: Switch over to memdup_user()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151407.U4D2AMDM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git checkout next-20230613
        b4 shazam https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong@linux.alibaba.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151407.U4D2AMDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c: In function 'get_queue_ids':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:2815:24: warning: returning 'long int' from a function with return type 'uint32_t *' {aka 'unsigned int *'} makes pointer from integer without a cast [-Wint-conversion]
    2815 |                 return PTR_ERR(queue_ids);
         |                        ^~~~~~~~~~~~~~~~~~


vim +2815 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c

  2804	
  2805	static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
  2806	{
  2807		size_t array_size = num_queues * sizeof(uint32_t);
  2808		uint32_t *queue_ids = NULL;
  2809	
  2810		if (!usr_queue_id_array)
  2811			return NULL;
  2812	
  2813		queue_ids = memdup_user(usr_queue_id_array, array_size);
  2814		if (IS_ERR(queue_ids))
> 2815			return PTR_ERR(queue_ids);
  2816	
  2817		return queue_ids;
  2818	}
  2819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
