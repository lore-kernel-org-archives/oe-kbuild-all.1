Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75052111A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689757819; x=1721293819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xorASthOLC2f6GorhgxtUsnFZrNtWgMPRTK8kX5lBuU=;
  b=fFeeRWtz1gw+AiB6yJpFdOlAPFZxlVAFUB23TRuU6TT1mshGGMPvpiJ7
   dOJVUfSrDMCoNA3WOcXwHB2HK/jBzimVi99ySrn8b/oxB+Gd+EtUYxom+
   osp9rhhckT4+12acPSUI6fVRItC3vmp9U79CmArVYoxpGGGs4Ak6wSJjG
   Q8WPIx5ntFNSVYrUZ54eAjNZC+jKMAMzmtorIYnnD+MOK0oLlbkfXuBvr
   PCq0sIZISJENVsdAqvs5pgPafjdajCCvaf5sK7/M9l4G/NxouFD6dh6Uz
   n3Z6AKBmBJzrFSoAgpZSSUrzjnvWJSNJayw39EFQvOU5j71aCB5ZLmqY2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369060608"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369060608"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 02:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793934875"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="793934875"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 02:10:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM3CL-0004c9-0K;
	Wed, 19 Jul 2023 09:10:17 +0000
Date: Wed, 19 Jul 2023 17:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 420/12466]
 ./usr/include/linux/mxc_v4l2.h:52:9: error: unknown type name 'uint32_t'
Message-ID: <202307191723.9zflj426-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 317b1cf90ab94b50bef4c49148f8726aa1e42ea1 [420/12466] media: capture: add mxc v4l2 capture driver
config: i386-randconfig-i005-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191723.9zflj426-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191723.9zflj426-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191723.9zflj426-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mxc_v4l2.h:52:9: error: unknown type name 'uint32_t'
      52 |         uint32_t u_offset;
         |         ^~~~~~~~
   ./usr/include/linux/mxc_v4l2.h:53:9: error: unknown type name 'uint32_t'
      53 |         uint32_t v_offset;
         |         ^~~~~~~~
>> ./usr/include/linux/mxc_v4l2.h:57:9: error: unknown type name '__u32'
      57 |         __u32                   type;   /* enum v4l2_buf_type */
         |         ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
