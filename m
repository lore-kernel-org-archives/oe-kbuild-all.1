Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556231C38
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696236702; x=1727772702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xu7cBf0cYIIhsOg3D0CpE5z1WMkUQIr4Uec/JIdZ3K0=;
  b=Rf0v1VUqFPYK8b/0AA4JuQGPlk0H1t7qwaX6mln+zsOhmQEPXpgshmmP
   1eZZRxk+aT2ra33seNu8ukip2aUIKeFu96Nd3mS+VQGaus04+P04GDs1h
   nq6SK5vdK/vbDu848OpdyZxZsAd+6kY+XjWZQHkMn5BDQcQB5fMla/i1p
   alxe8gT6TxVJipV0zvs5D+Re73EWZDOsAhsA7i+UhHGJ+BdQ+4HYmM+4q
   RGIwAPs3j6zZ3tivXxj34QP0JhUFhN3fBTwamDXTjTm0cPyzKHC+NtHQ0
   IsYX0UWSisIAJLmkq5RmqjRAziM7JNFQIe781LUeZQvWNTKC+jjWfxzKd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413518566"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="413518566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 01:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779878388"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="779878388"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Oct 2023 01:51:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnEeO-0005tp-2I;
	Mon, 02 Oct 2023 08:51:37 +0000
Date: Mon, 2 Oct 2023 16:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2]
 drivers/virtio/virtio_pvclock.c:294:11: warning: mixing declarations and
 code is a C99 extension
Message-ID: <202310021652.moYiWYjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   d30b4152883442cfd51b371ff775190ce5c9fe77
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231002/202310021652.moYiWYjj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021652.moYiWYjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021652.moYiWYjj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_pvclock.c:48:6: warning: no previous prototype for function 'update_suspend_time' [-Wmissing-prototypes]
   void update_suspend_time(struct work_struct *work)
        ^
   drivers/virtio/virtio_pvclock.c:48:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void update_suspend_time(struct work_struct *work)
   ^
   static 
>> drivers/virtio/virtio_pvclock.c:294:11: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           uint32_t rating =
                    ^
   2 warnings generated.


vim +294 drivers/virtio/virtio_pvclock.c

   288	
   289	static int virtpvclock_validate(struct virtio_device *vdev)
   290	{
   291		if (!virtio_has_feature(vdev, VIRTIO_PVCLOCK_F_CLOCKSOURCE_RATING))
   292			return 0;
   293	
 > 294		uint32_t rating =
   295			virtio_cread32(vdev, offsetof(struct virtio_pvclock_config,
   296						      clocksource_rating));
   297		if (rating > MAX_CLOCKSOURCE_RATING) {
   298			dev_warn(
   299				&vdev->dev,
   300				"device clocksource rating too high: %u, using max rating: %u\n",
   301				rating, MAX_CLOCKSOURCE_RATING);
   302			__virtio_clear_bit(vdev, VIRTIO_PVCLOCK_F_CLOCKSOURCE_RATING);
   303			virtio_pvclock_clocksource.rating = (int)MAX_CLOCKSOURCE_RATING;
   304		} else {
   305			dev_info(&vdev->dev, "clocksource rating set to %u\n", rating);
   306			virtio_pvclock_clocksource.rating = (int)rating;
   307		}
   308	
   309		return 0;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
