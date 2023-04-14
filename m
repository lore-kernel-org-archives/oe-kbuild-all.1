Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEED6ADC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681511396; x=1713047396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r709tICCq9r57l2Oqp58KTfe3UUZVx8qgK2WVzf5Io=;
  b=BAQAIDNuVqhvBmLOWYkok2stc3poveMllKwsegIKeMH8oXbkwPWBZTpG
   ECnVJ46JAVbmcO/3GLbqkBG3WSDd7EzLE+RKi+2k+hyYFEmtdsLQz0YA2
   VpOBfE1Ad/DoxbIr/c1yCNBB4JUKp1hqmxJ9B0LDFM0X6GolURKfj3Prf
   K7nE+2jbtz/I1M5lJ3h5zgKJnSn4QaZJZjmUiIk+vHyIQHnA2+0rP9oyv
   7Q0zdz8+srakLCZJ3HpAVyirwP/DQ/Dme32Hr05EenPjraGEHD1x3hzeQ
   0PCHGElQ7jukwyKYMjN+ID7hbX18z/yFJbrJQF83Ooi7WtPlHZ9fgg2jh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344579983"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="344579983"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 15:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="667343291"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="667343291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2023 15:29:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnRvV-000a35-20;
	Fri, 14 Apr 2023 22:29:53 +0000
Date: Sat, 15 Apr 2023 06:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/4]
 drivers/android/binder.c:1417:70: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202304150607.IuUhkfxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e269893a9b54320ae93e2e5577fd5399cddbf41f
commit: e107ea9e4dd1808d71922fb489297b4235ac6031 [2/4] ANDROID: vendor_hooks: Add hooks for binder proc transaction
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230415/202304150607.IuUhkfxB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout e107ea9e4dd1808d71922fb489297b4235ac6031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150607.IuUhkfxB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder.c:1417:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:2641:41: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:4814:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/android/binder.c:4814:24: sparse:     expected restricted __poll_t
   drivers/android/binder.c:4814:24: sparse:     got int

vim +1417 drivers/android/binder.c

  1407	
  1408	/**
  1409	 * binder_free_ref() - free the binder_ref
  1410	 * @ref:	ref to free
  1411	 *
  1412	 * Free the binder_ref. Free the binder_node indicated by ref->node
  1413	 * (if non-NULL) and the binder_ref_death indicated by ref->death.
  1414	 */
  1415	static void binder_free_ref(struct binder_ref *ref)
  1416	{
> 1417		trace_android_vh_binder_del_ref(ref->proc ? ref->proc->tsk : 0, ref->data.desc);
  1418		if (ref->node)
  1419			binder_free_node(ref->node);
  1420		kfree(ref->death);
  1421		kfree(ref);
  1422	}
  1423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
