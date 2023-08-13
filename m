Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59515BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691905414; x=1723441414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDEeKing+9LHbvSCm04C7Qb89H8kCD/MD+30jr1PGqU=;
  b=RJdZ7UFmgXJjfDnyyduxBMy+2McWi8A+/vzQl90Mfe1Xef5mLAhB4lAh
   wlzUO4Sx+cnJw87l6jjyIqOqquDzu/Nsejx5kmhByuEt+V4QM1WgVEOEs
   On45l4YfIuFAsvEx2rh6hEOZqHTF+n3dTk0uN6SGseafcymLgmFycOXdW
   3ejLdzDK0pnG9QnKw5ujaq1Mjkx0z5syKejEKyT2vW+npIYJ6+s7MT3dB
   hlkBJ29BJisJSSO5Tcz02wjIwvXYBy3IDlI6gJXZedxMMMSiQQ+wczlbH
   mrbsb5wdnGy+j7kv4yIkQCU5Tde2JQSjsxy9VdTJBmGLt+MI/viohmpnV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="356829361"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="356829361"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 22:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="709951368"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="709951368"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Aug 2023 22:43:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV3sx-0008yW-20;
	Sun, 13 Aug 2023 05:43:31 +0000
Date: Sun, 13 Aug 2023 13:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: zhengding chen <chenzhengding@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 21/9999]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202308131347.BHPDjt0l-lkp@intel.com>
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
config: i386-randconfig-i062-20230813 (https://download.01.org/0day-ci/archive/20230813/202308131347.BHPDjt0l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131347.BHPDjt0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308131347.BHPDjt0l-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
