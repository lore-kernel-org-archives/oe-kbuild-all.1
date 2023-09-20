Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06E747B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 07:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695194622; x=1726730622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IIRUX7IkRG1Y+yXpJWqq4kJpGm+rpQeR1d6NEHSny5w=;
  b=E1bj+tPiLNJW+Vp+bZpt8PqW6rsWcKghrFCT6iFuDRQYzJmMnMuvtulF
   sHN7dtBgYQcBkHycVBZdeucDJ8srsDATrmim73E//7gvlxF5dd6jY/Y4G
   irVRbWmlDjQX5JSQ+l+bjz8yVrxW2/TOv0U0MZoAGyPILNs75hYSxOFu7
   TqnhAgnec2A7c1SLVcy36F8OdDsKEQ0klg0udXwk9IcQfCe9ZIzbKOoK3
   2WQFeTCytHyORrpIqbyz7bmG5+LBhPM6lbQrCGsPRRk/dcB4pSTf2lgwE
   sxCr8fe5H/9uMivNB0pOn8IIztaR89/799kfaoGIDB0himl9kXwKFyHfe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380049526"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380049526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 00:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920171846"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="920171846"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Sep 2023 00:23:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qirYa-0008Re-0C;
	Wed, 20 Sep 2023 07:23:32 +0000
Date: Wed, 20 Sep 2023 15:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1217/1363]
 include/uapi/linux/byteorder/big_endian.h:39:42: warning: cast from pointer
 to integer of different size
Message-ID: <202309201551.DER3529e-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230920/202309201551.DER3529e-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201551.DER3529e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201551.DER3529e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:545,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:12:
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c: In function 'xdptx_hdcp1x_keymgmt_set_key':
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                               ^
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~
>> include/uapi/linux/byteorder/big_endian.h:39:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                          ^
   include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__be64_to_cpu'
      93 | #define be64_to_cpu __be64_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:41:19: note: in expansion of macro 'be64_to_cpu'
      41 | #define ntohll(x) be64_to_cpu((__be64 *)x)
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_keymngt.c:286:45: note: in expansion of macro 'ntohll'
     286 |                 key_table.data_u64[index] = ntohll(key_table.data_u64[index]);
         |                                             ^~~~~~


vim +39 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13 @39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

:::::: The code at line 39 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
