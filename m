Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211315A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 05:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695186428; x=1726722428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+LbKjYe36k/RjePTDK9Hxm4JbLihW6uNZl6pa3k/XY=;
  b=j0O2Knm+2E0ljqCjANiphiNRiRov7qU72JGwbCRVjt1X6pYyftg+eqdZ
   s+Rb3I9XmqDIf+PHFzttlpEWP1kcyOxgww0spSx6PygRcsA/43arJVHT+
   Tr2NGbBKGyTJDwmcCrWvsWyzf65PxZVJbvKfKaUb/rP8lZqFQrvrJ4Kyn
   yD64tYfl+Kj+iHzXeNB3qjg7P1AKpIuuozdoF6ekEHwaHcn/h0nJgkyyp
   CZzGleptx/d335J/0Kbs/5TCYyPDI9YxXzmGQDnJGFRy8dUy8wQkN+1tl
   pDHU9XxS9H9BaexCRx2wp3ANl5ohfvItkX+81zTGqEAikn+4Ce3NfvIXK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383970549"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="383970549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 22:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="723117206"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="723117206"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2023 22:07:05 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qipQV-0008KW-1b;
	Wed, 20 Sep 2023 05:07:03 +0000
Date: Wed, 20 Sep 2023 13:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1217/1363]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to
 pointer from integer of different size
Message-ID: <202309201302.diqJVnUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: cda08684a23737aa453f96a6542047c8ecdfa5d6 [1217/1363] drm: xlnx: dptx: Add HDCP1x support for DPTx subsystem
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201302.diqJVnUF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201302.diqJVnUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201302.diqJVnUF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/nios2/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:6,
                    from include/asm-generic/bitops.h:35,
                    from ./arch/nios2/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/nios2/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/current.h:5,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:12:
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c: In function 'xdptx_hdcp1x_keymgmt_set_key':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:25:19: note: in definition of macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:25:19: note: in definition of macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:26:19: note: in definition of macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:26:19: note: in definition of macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:27:19: note: in definition of macro '___constant_swab64'
      27 |         (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:27:19: note: in definition of macro '___constant_swab64'
      27 |         (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:28:19: note: in definition of macro '___constant_swab64'
      28 |         (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:28:19: note: in definition of macro '___constant_swab64'
      28 |         (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:29:19: note: in definition of macro '___constant_swab64'
      29 |         (((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:29:19: note: in definition of macro '___constant_swab64'
      29 |         (((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:30:19: note: in definition of macro '___constant_swab64'
      30 |         (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:30:19: note: in definition of macro '___constant_swab64'
      30 |         (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:31:19: note: in definition of macro '___constant_swab64'
      31 |         (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:31:19: note: in definition of macro '___constant_swab64'
      31 |         (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |   \
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:32:19: note: in definition of macro '___constant_swab64'
      32 |         (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:32:19: note: in definition of macro '___constant_swab64'
      32 |         (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
         |                   ^
   include/uapi/linux/byteorder/little_endian.h:39:26: note: in expansion of macro '__swab64'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/little_endian.h:39:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                  ^
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~


vim +41 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c

    28	
    29	#define HDCP1X_KEYMGMT_REG_CTRL_RST_MASK	BIT(31)
    30	#define HDCP1X_KEYMGMT_REG_CTRL_DISABLE_MASK	GENMASK(31, 1)
    31	#define HDCP1X_KEYMGMT_REG_CTRL_ENABLE_MASK	BIT(0)
    32	#define HDCP1X_KEYMGMT_REG_TBL_STATUS_RETRY	0x400
    33	#define HDCP1X_KEYMGMT_TBLID_0			0
    34	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_WR_MASK	BIT(0)
    35	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_RD_MASK	BIT(1)
    36	#define HDCP1X_KEYMGMT_REG_TBL_CTRL_EN_MASK	BIT(31)
    37	#define HDCP1X_KEYMGMT_REG_TBL_STATUS_DONE_MASK	BIT(0)
    38	#define HDCP1X_KEYMGMT_MAX_TBLS			8
    39	#define HDCP1X_KEYS_SIZE			336
    40	#define HDCP1X_KEYMGMT_MAX_ROWS_PER_TBL		41
  > 41	#define ntohll(x) be64_to_cpu((__be64 *)x)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
