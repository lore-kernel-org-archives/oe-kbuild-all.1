Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA87B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676574637; x=1708110637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RwY8a02AIkV97Z4qRtDsJTEpocNba67FsnuHfH7AgbQ=;
  b=hxhpX9O4hQceaqYghsaYBLqJnufsqpkofR4pQbBV3pHWaVenxiYEjuZ8
   6/1hwiCE9sFmmse9Vd5uFae71guUQNaaU+/zX6RCOuChxrmDBxS41BHUX
   k05W7oI3K6b1WjXhvM3odupWU9eZIfSR6shsPN2xzcqVlh5y0vqO6uCeQ
   CmY/YA6t9C5NBNoBTFJN60caauXI7wg6ffCo6Rt8NPKjlyU/5Rp5szo/I
   ObkpxBKHrotOwlYWs9XH7Xp8P7SXMXFnnA3OwijUMrk/1rypCISACcote
   P90FyppP4TomAmZazaa+vljMo2QGlHrCO23hDwk+DaykeLg2BKsuRgfmE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331812012"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331812012"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 11:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734022105"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="734022105"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 11:10:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSjeM-000ASH-2v;
	Thu, 16 Feb 2023 19:10:34 +0000
Date: Fri, 17 Feb 2023 03:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] mm: add zero_user_folio_segments()
Message-ID: <202302170219.WWlo7XAx-lkp@intel.com>
References: <20230216160528.2146188-3-fengwei.yin@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216160528.2146188-3-fengwei.yin@intel.com>

Hi Yin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc8 next-20230216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Fengwei/mm-remove-duplicated-flush_dcache_folio/20230217-004045
patch link:    https://lore.kernel.org/r/20230216160528.2146188-3-fengwei.yin%40intel.com
patch subject: [RFC PATCH 2/2] mm: add zero_user_folio_segments()
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230217/202302170219.WWlo7XAx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/24ce10c4a39cf847063c9d8ea4157882f13d7143
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yin-Fengwei/mm-remove-duplicated-flush_dcache_folio/20230217-004045
        git checkout 24ce10c4a39cf847063c9d8ea4157882f13d7143
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170219.WWlo7XAx-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: mm/truncate.o: in function `truncate_inode_partial_folio':
   truncate.c:(.text+0x754): undefined reference to `zero_user_folio_segments'
>> csky-linux-ld: truncate.c:(.text+0x7e4): undefined reference to `zero_user_folio_segments'
   csky-linux-ld: mm/shmem.o: in function `shmem_get_folio_gfp.constprop.0':
   shmem.c:(.text+0x1cb8): undefined reference to `zero_user_folio_segments'
>> csky-linux-ld: shmem.c:(.text+0x1d40): undefined reference to `zero_user_folio_segments'
>> csky-linux-ld: mm/highmem.o:(___ksymtab+zero_user_folio_segments+0x0): undefined reference to `zero_user_folio_segments'
   csky-linux-ld: fs/libfs.o:libfs.c:(.text+0x614): more undefined references to `zero_user_folio_segments' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
