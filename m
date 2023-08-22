Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79E1D31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692717653; x=1724253653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jjC0pqnSyp98rZ45uL4GmW7eUGFVm1S8wbiOUNtUfpQ=;
  b=FfAFGeMdKBQT2wxIlS19+8kJJCfTzycFkwllZKXZfSJQypAEiAvT+4HC
   iCssJYjqnAiQBqBgbU7LjyxrITa/TN5x6e5r3gJjTXOm0XpPBpKJjEOVF
   t6jH9lVFpUqzdK58M0hRa7CGkT5sdF4GDz32y3GVoe9COy6EoAXtX+jvW
   6839dGSH8W3VFjDlDzigegJj0qvVj1/brYqpV51XcxJXXFPgDr+Hwb/mH
   6pS/b80+Uswo44G+/pTfnvZ7jrF3pWQmX7j7aLA6CJiNWfLWZvfJo2Ism
   4XAouHJchjyrdyVfHvDfufRayyzNto6gs3JhNdqeHDyoAR4QSgQIRj8eg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377670278"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="377670278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 08:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806328290"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="806328290"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 08:20:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYTBB-0000HW-1s;
	Tue, 22 Aug 2023 15:20:25 +0000
Date: Tue, 22 Aug 2023 23:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Junfeng Guo <junfeng.guo@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, ivecera@redhat.com, qi.z.zhang@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v2 3/3] ice: enable Protocol
 Agnostic Flow Offloading FDIR
Message-ID: <202308222319.2aetHclw-lkp@intel.com>
References: <20230818064703.154183-4-junfeng.guo@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818064703.154183-4-junfeng.guo@intel.com>

Hi Junfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Junfeng-Guo/virtchnl-support-raw-packet-in-protocol-header/20230818-144901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230818064703.154183-4-junfeng.guo%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v2 3/3] ice: enable Protocol Agnostic Flow Offloading FDIR
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230822/202308222319.2aetHclw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222319.2aetHclw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222319.2aetHclw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/irdma/../../../net/ethernet/intel/ice/ice.h:64,
                    from drivers/infiniband/hw/irdma/main.c:4:
>> drivers/infiniband/hw/irdma/../../../net/ethernet/intel/ice/ice_flow.h:8:10: fatal error: ice_parser.h: No such file or directory
       8 | #include "ice_parser.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/infiniband/hw/irdma/../../../net/ethernet/intel/ice/ice_flow.h

     6	
     7	#include "ice_flex_type.h"
   > 8	#include "ice_parser.h"
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
