Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F899AFC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681837678; x=1713373678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YshI9e6HRN45rWcMyhztHeDs6iQ5GYT0iB9DxegzG+M=;
  b=m8bKKxDal7kLmCRcbn9WkBl8t73fabCGMNphdjATMIlqh9ZrcXFNHJzX
   LU05znRb3gVQ/ZANcTSJ17DecVR3HvkLN5jVXRbihkQn1SEPx7kgonIXb
   eIbvvidGGzTSyr26L9w/oDvvu1/DY47t1vZdY2snS+kgXGtHYhlZeyAJ0
   8R6epx7drk1C+LUZd7HGyQaxGrvyN3JsBlvZjQfc3CnussA5UM/2cJQaN
   fa6WZKZbaIWK7thI8kfJcen2eRTsam12wOlc81L+Ep5fsuMfDqa12KUrB
   eIrec2sKjZxpQ/V5ULzDmiMtGUU+pOb5+I/efBwPeQrDtN1WE6eMv1J8a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431517758"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431517758"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865496803"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="865496803"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 10:07:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pooo8-000dmB-0S;
	Tue, 18 Apr 2023 17:07:56 +0000
Date: Wed, 19 Apr 2023 01:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: zhengding chen <chenzhengding@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 21/9999]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202304190102.xmFdK6Zj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 35014985c266face161f6d107f8d8338e02a0b2d [21/9999] ANDROID: vendor_hooks: Add hooks for binder proc transaction
config: parisc-randconfig-s032-20230416 (https://download.01.org/0day-ci/archive/20230419/202304190102.xmFdK6Zj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=35014985c266face161f6d107f8d8338e02a0b2d
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.10/ffa
        git checkout 35014985c266face161f6d107f8d8338e02a0b2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190102.xmFdK6Zj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:2508:41: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:4580:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/android/binder.c:4580:24: sparse:     expected restricted __poll_t
   drivers/android/binder.c:4580:24: sparse:     got int

vim +1373 drivers/android/binder.c

  1363	
  1364	/**
  1365	 * binder_free_ref() - free the binder_ref
  1366	 * @ref:	ref to free
  1367	 *
  1368	 * Free the binder_ref. Free the binder_node indicated by ref->node
  1369	 * (if non-NULL) and the binder_ref_death indicated by ref->death.
  1370	 */
  1371	static void binder_free_ref(struct binder_ref *ref)
  1372	{
> 1373		trace_android_vh_binder_del_ref(ref->proc ? ref->proc->tsk : 0, ref->data.desc);
  1374		if (ref->node)
  1375			binder_free_node(ref->node);
  1376		kfree(ref->death);
  1377		kfree(ref);
  1378	}
  1379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
