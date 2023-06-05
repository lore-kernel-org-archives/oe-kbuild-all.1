Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4681A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685942326; x=1717478326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+RmxiXWnHZZ62TcQ9MA25NIpYkGiF/onQuLEoGnnuo=;
  b=V5Y067NerCLS/0eb1pIB1ZQtHkuIYaS8IL0kFoDiftHWj5mDafG0duBR
   62/+RTyUEfD1jLUMPZ4FE56YEoqXdUCnZktravkrxvWJtiT+iC5Yyz6zh
   pgnugQQqZSYVh61lT9nDIuX93fliR+tD7IJ28P5p69dy49IwE+2MqHv2i
   0sSPTmZTqx77ONdU6W3LMDAQHIAnYQaF0eqn0QXlSs8M9ANsBZ3ycssd2
   eLiRx2bOxcVUY+Y6+mmdhQnh5bdZjCED14htLgn0SZUR0JawA7wqkhKdQ
   v7GLBlfLp+MIOmVRx6w2d5pTcwhsa0IFDRYXvM7/hT45wdHTMwrHgqMuY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358732969"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358732969"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 22:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="738245474"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="738245474"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jun 2023 22:18:44 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q62c7-0003sh-1J;
	Mon, 05 Jun 2023 05:18:43 +0000
Date: Mon, 5 Jun 2023 13:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Junfeng Guo <junfeng.guo@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, qi.z.zhang@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next 3/3] ice: enable Protocol
 Agnostic Flow Offloading FDIR
Message-ID: <202306051356.sDDfru9n-lkp@intel.com>
References: <20230605024453.2378898-4-junfeng.guo@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605024453.2378898-4-junfeng.guo@intel.com>

Hi Junfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Junfeng-Guo/virtchnl-support-raw-packet-in-protocol-header/20230605-104620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230605024453.2378898-4-junfeng.guo%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next 3/3] ice: enable Protocol Agnostic Flow Offloading FDIR
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230605/202306051356.sDDfru9n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3b97772bd19a621706eaa1fab244f88515017fe3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Junfeng-Guo/virtchnl-support-raw-packet-in-protocol-header/20230605-104620
        git checkout 3b97772bd19a621706eaa1fab244f88515017fe3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051356.sDDfru9n-lkp@intel.com/

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
