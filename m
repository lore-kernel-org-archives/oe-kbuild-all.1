Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789B7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675583538; x=1707119538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZKl84sNGJsyXpT2DXbziHWr6Y5k+g+Y2NoA4d2yfCs=;
  b=j+DyWGsXQ/wnz33z4rmyTG1YbiwL4WNIPYqq6ax+4u5wgFWbunQfTNC3
   rm/B530ecG3kDaUn9nw6PITNsvivNTdZ3T0G81z7cP89aFuNTAUmTtA67
   5kqe2+ViZ+HFPOyQU3iuo8PD9Xf3GhIHxB+YQD+xvBMD5ATVZH1B0ZHD+
   tInNYHcr2Pnhf5rUjJRj+OKgWEKDRbdwd4BZKCO/7nftcPJgfjQ7N1t1t
   6OXJz13Ra4bx9uFsjGFNrvBnwE9l1pwsFWEWKpivjsAzWvu+zYOn9EkLm
   zh3E2WJW8lBvjxaf5Fqpq/wx+Zny949Llk9x1oBlWsf7OTHMKoc2Rj0Uc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393623228"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393623228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 23:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666178479"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="666178479"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 23:52:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOZoq-0001qA-20;
	Sun, 05 Feb 2023 07:52:12 +0000
Date: Sun, 5 Feb 2023 15:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 465/20208]
 ./usr/include/linux/mxc_v4l2.h:52:9: error: unknown type name 'uint32_t'
Message-ID: <202302051508.8AiDXyCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 75d4ee65e45f476a5feb299d02dda89fe597158f [465/20208] MLK-21876-17 mxc_v4l2: add uapi headfile for yocto build pass
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230205/202302051508.8AiDXyCq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/75d4ee65e45f476a5feb299d02dda89fe597158f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 75d4ee65e45f476a5feb299d02dda89fe597158f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
