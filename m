Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C227F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 18:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686766062; x=1718302062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8AAQUsnI+UgUz91w1F1Je1x1MDLg8GdeiYSuzOUkEjw=;
  b=FrXgwUjlZj4NZ3p4AmkHfI9ai4guZJj+n2iJfBTnSFzsm8LHqBTornCS
   EKR85DgvasGVv6snHmzyFe7Csvgj/bzTTJxnjkhiuOrxd1gWgX8pLN0yg
   pG4hcmAAc7mRZk6lPRAP2Da4FtTn384avWCSsQvFO7eEO/Y7dM4nLYrGd
   iFLsHJS6SMp9j7qpj7ioyn5G8esnkGouHwHPU7QsCFAqEt35xLIyP1qhD
   WkcN7bHn37xxpfK3k0+2Jd/I1L+QiRkreKZDLT736Pw7r0p8bjF4mEVhi
   DmY/o9j+LMfZDny6dIUFYgviBV7jlLEKRxt6XG5apGu/jvdvb+kIfxWFQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424580689"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="424580689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 11:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="741910159"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="741910159"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Jun 2023 11:07:23 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Utu-0000vh-2s;
	Wed, 14 Jun 2023 18:07:22 +0000
Date: Thu, 15 Jun 2023 02:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <qi.zheng@linux.dev>, trond.myklebust@hammerspace.com,
	anna@kernel.org, fllinden@amazon.com
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH] NFSv4.2: fix wrong shrinker_id
Message-ID: <202306150121.cN9iKnvx-lkp@intel.com>
References: <20230614072443.3264264-1-qi.zheng@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614072443.3264264-1-qi.zheng@linux.dev>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on trondmy-nfs/linux-next v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/NFSv4-2-fix-wrong-shrinker_id/20230614-152853
base:   linus/master
patch link:    https://lore.kernel.org/r/20230614072443.3264264-1-qi.zheng%40linux.dev
patch subject: [PATCH] NFSv4.2: fix wrong shrinker_id
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230615/202306150121.cN9iKnvx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git checkout linus/master
        b4 shazam https://lore.kernel.org/r/20230614072443.3264264-1-qi.zheng@linux.dev
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150121.cN9iKnvx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "free_prealloced_shrinker" [fs/nfs/nfsv4.ko] undefined!
>> ERROR: modpost: "register_shrinker_prepared" [fs/nfs/nfsv4.ko] undefined!
>> ERROR: modpost: "prealloc_shrinker" [fs/nfs/nfsv4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
