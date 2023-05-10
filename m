Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79C3D60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683739967; x=1715275967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rh9pc/HYDFP716GSxyFLnPED9yD/tWV1lG+Ywg67TZ8=;
  b=Ed4pkhtjCUdHLlRiekOr84qTkGc+TuoEdO2tkuC+HYmfI0utdjsvE1ei
   vb9xSORyyOR8GvJA9IRK0EqaqO8N7nidJD95CVxmmdr88pWeyN/4iyJTm
   1S3HpLpsl3E6oZiJeCnsOTcJXZfWDJtj6p8in4kvMA+gbbovJp12YLJY1
   fd2tahVCLXAzMXnXmUZdfZqM8PkJT9h9x1LAtTIMyOlXWYts/YU5Fwb8d
   S+NAXpIvmv00EVvtrHW8IbnyB0I1HZO9Kn1X0el9dxQjQ7r5PaD0FeY8k
   ShFcyVdDKV0aH5+6IP7gX88/jvW6kHVZQ8c4BWlacnDXGeVhoeAO5c+zV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353349424"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="353349424"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649805093"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="649805093"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 10:32:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwng8-0003TF-0u;
	Wed, 10 May 2023 17:32:40 +0000
Date: Thu, 11 May 2023 01:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] workqueue: support holding a mutex for each work
Message-ID: <202305110158.a5FXMR4H-lkp@intel.com>
References: <20230510175846.cc21c84b0e6b.I9d3df459c43a78530d9c2046724bb45626402d5f@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510175846.cc21c84b0e6b.I9d3df459c43a78530d9c2046724bb45626402d5f@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main tj-wq/for-next linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/workqueue-support-pausing-ordered-workqueues/20230511-000621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230510175846.cc21c84b0e6b.I9d3df459c43a78530d9c2046724bb45626402d5f%40changeid
patch subject: [RFC PATCH 2/4] workqueue: support holding a mutex for each work
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230511/202305110158.a5FXMR4H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/b4039a3ff5134e4344a9e12908180a69888c4c9a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Berg/workqueue-support-pausing-ordered-workqueues/20230511-000621
        git checkout b4039a3ff5134e4344a9e12908180a69888c4c9a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110158.a5FXMR4H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pm.h:13,
                    from drivers/base/power/generic_ops.c:7:
>> include/linux/workqueue.h:392:26: warning: 'struct mutex' declared inside parameter list will not be visible outside of this definition or declaration
     392 |                   struct mutex *work_mutex, ...);
         |                          ^~~~~


vim +392 include/linux/workqueue.h

   389	
   390	__printf(1, 5) struct workqueue_struct *
   391	__alloc_workqueue(const char *fmt, unsigned int flags, int max_active,
 > 392			  struct mutex *work_mutex, ...);
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
