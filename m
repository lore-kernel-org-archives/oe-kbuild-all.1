Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5395C156
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692800737; x=1724336737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jk3UpxG5wEf2sQiZ96WzymeJkmL2QiGrp0HXx9xNHo0=;
  b=c4QaykaHzn1HBtMNuX4Yc1j9XTvlwjhkWRQ7+HFlkLHNb4h3RhJfE4S0
   3gBK/XtaFCCXSkCj6/JJZ8Jg/Z87XWm9GgekrcGT3nRZN7B0aFDlIOv1h
   ZtrA4jdgnDars/R9VFfHC7Ih4NIMe7Z/78H89SZfeRVeZwGTh1nlNbWf1
   hIPX+Zto047sX6S4p1rDyusoijnHQbrtS3v7V+LZJ1qv3keZQhd2rpayd
   TZ7zcHJEKpsLf6cZaiZsWvBDo4yLgWlKhUEFi35zVxhbua9HpOP7Ii7cu
   K98l39AjF+74KTkA6wKih+nGSpPKDrp1evZDhhLFpYGjeQCqO65KTeWN5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377931633"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377931633"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730227761"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730227761"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 07:25:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYond-0001H3-1u;
	Wed, 23 Aug 2023 14:25:33 +0000
Date: Wed, 23 Aug 2023 22:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Junfeng Guo <junfeng.guo@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, ivecera@redhat.com, qi.z.zhang@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v2 3/3] ice: enable Protocol
 Agnostic Flow Offloading FDIR
Message-ID: <202308232207.mbURs2VO-lkp@intel.com>
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
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230823/202308232207.mbURs2VO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232207.mbURs2VO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232207.mbURs2VO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice.h:64,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
>> drivers/net/ethernet/intel/ice/ice_flow.h:8:10: fatal error: ice_parser.h: No such file or directory
       8 | #include "ice_parser.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/net/ethernet/intel/ice/ice_flow.h

     6	
     7	#include "ice_flex_type.h"
   > 8	#include "ice_parser.h"
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
