Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7068F52
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677866653; x=1709402653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Li2y9J/dSsDIZdLQnTsIdngKQScpQwryrq6heNwiv1o=;
  b=BxbUSI7r+OqMIPVaA2wjw2Nk7wr13DhgQ98xBYP5nOyu2gElkfKCRmqu
   66udDsRLYdWTr00W6jGdrW+eMvulkVWo8f6EIMVzTaWiQqQMCF3p+ufjZ
   x2mHx4wsN40IxhjVKcomap4vkqPbKbn23OpsfXAMiDZO6QTiwPuZEsROc
   v6y4HXSxmTdfg6rjBsnShaaiKSkhzBnHq/iPb5TA8Jq6EjrK+XvyFmLC8
   7dueP7VZj5rhSdhWUZW6vUtTWza0KZCjLPJKIWxWlYXUt8pYYOQUmPSa2
   WpTYtsvuVS6Amo32TyoAYi6RIxf3aB9AOdUdghzaF81JUKF9TwoEg1cKd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421381369"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="421381369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 10:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="707926471"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="707926471"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2023 10:03:22 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY9kX-0001ai-1Q;
	Fri, 03 Mar 2023 18:03:21 +0000
Date: Sat, 4 Mar 2023 02:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/eevdf 5/10] ld: kernel/sched/fair.c:711:
 undefined reference to `__udivdi3'
Message-ID: <202303040202.29DoY47h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   bc35f40661d8d25ce8cde6e26d5956237a3e61ae
commit: b7caa414137b615a3de6fc9d46d88051ce8581e0 [5/10] sched/fair: Add sched group latency support
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230304/202303040202.29DoY47h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b7caa414137b615a3de6fc9d46d88051ce8581e0
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout b7caa414137b615a3de6fc9d46d88051ce8581e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040202.29DoY47h-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/fair.o: in function `calc_latency_offset':
   kernel/sched/fair.c:711: undefined reference to `__udivdi3'
>> ld: kernel/sched/fair.c:711: undefined reference to `__udivdi3'
>> ld: kernel/sched/fair.c:711: undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
