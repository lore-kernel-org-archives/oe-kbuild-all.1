Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CF1FDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689746976; x=1721282976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8CG4j9EnSSvWWd1ckFEJxYcVFKFeAWemSxHduvjAPw=;
  b=B0UCh2GJlD8SefsBIwNJiF304nHcXIWsckLAOKkoeMrgGWLFdHfrAPxR
   J9/yU9eWq7wYAzxNxH1asjwJUGRS8DeACLzQKLGkCAfobgXWZ9q7KWMNZ
   EjFN7dvdj8fz0YAmUUHUM9xcNjimubNtSLqHtCDzS6oPCouKokG1V1tHI
   xVj7lOxQBZ9u3bIFlSSGWZAwwa7GC1erp7t/YKURtQ5/mGfnKtH3Fz5Oe
   jZdZWUqpGJOQG90iAAXHlc+yKKOBizrFwI9N7d/wHtMmx2ODQWjeUn3cJ
   K8tPCOtuTG51qottJWbvP1NKQ+UJpMQRkcFbPSC3OC0V+YWWuy75FWRsI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452756879"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="452756879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 23:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727193083"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727193083"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2023 23:09:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM0NR-0004Ch-38;
	Wed, 19 Jul 2023 06:09:33 +0000
Date: Wed, 19 Jul 2023 14:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 123/12466]
 ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name
 'snd_pcm_format_t'
Message-ID: <202307191455.KMJKrI1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 2103da1663c78848201107a827b058150d25df26 [123/12466] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: i386-randconfig-i005-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191455.KMJKrI1Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191455.KMJKrI1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191455.KMJKrI1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name 'snd_pcm_format_t'
     126 |         snd_pcm_format_t input_format;
         |         ^~~~~~~~~~~~~~~~
   ./usr/include/linux/mxc_asrc.h:127:9: error: unknown type name 'snd_pcm_format_t'
     127 |         snd_pcm_format_t output_format;
         |         ^~~~~~~~~~~~~~~~
>> ./usr/include/linux/mxc_asrc.h:135:9: error: unknown type name 'uint64_t'
     135 |         uint64_t supported_in_format;
         |         ^~~~~~~~
   ./usr/include/linux/mxc_asrc.h:136:9: error: unknown type name 'uint64_t'
     136 |         uint64_t supported_out_format;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
