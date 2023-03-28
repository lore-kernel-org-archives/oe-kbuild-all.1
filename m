Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80577AD30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680026789; x=1711562789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50/w02QSISI+EfRnY5mPe00nw2Ef+a6Ab+EH9dOeYkY=;
  b=Nq4LiP7ulGzXYFmckBosES3ooyTn4DUR8pRTYCz0YrHteo9OurIjepZR
   RVCTlhTqTW55QvAHG383E/jlVYr1+k2ikZ2EKwRowkvzm9q9j474eNDrx
   Xaaf/cQQwqGraKCH3sQ6oGQ0TZkECncS18Fa619DL0L511hDx0wB3+shQ
   pAgg5bRDwXUO1lMtIlVAaoWcSPN/KlgJe4SbQgyDncO6Ars1oOdPIodpg
   1FuvnrfpFLbn6wcgVPUPXwc8Ss17VMlUCc1YDaK7t1wVnyE0Rn/HzZfwC
   0ns9XZGfNSX+0ulOOpp7sKtEOLCZy6ch+2Makm/HZp34aqbmhhMWxqdz7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405589819"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="405589819"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 11:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753256820"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="753256820"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 11:06:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phDi3-000InS-2J;
	Tue, 28 Mar 2023 18:06:15 +0000
Date: Wed, 29 Mar 2023 02:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 107/107]
 drivers/virtio/virtio_balloon.c:189:41: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202303290245.4CR5iuzs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   268c8aee161e4135a7202da9cf31722ddbdb750e
commit: 06c7c42cb1e901ed805ec8c993426e8c08f9c6de [107/107] CHROMIUM: virtio_balloon: support the event queue
config: h8300-randconfig-s051-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290245.4CR5iuzs-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 06c7c42cb1e901ed805ec8c993426e8c08f9c6de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290245.4CR5iuzs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_balloon.c:189:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio32 [usertype] type @@     got int @@
   drivers/virtio/virtio_balloon.c:189:41: sparse:     expected restricted __virtio32 [usertype] type
   drivers/virtio/virtio_balloon.c:189:41: sparse:     got int
   drivers/virtio/virtio_balloon.c:468:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio32 [usertype] type @@     got int @@
   drivers/virtio/virtio_balloon.c:468:37: sparse:     expected restricted __virtio32 [usertype] type
   drivers/virtio/virtio_balloon.c:468:37: sparse:     got int

vim +189 drivers/virtio/virtio_balloon.c

   184	
   185	static void tell_host_puff_event(struct virtio_balloon *vb)
   186	{
   187		struct scatterlist sg;
   188	
 > 189		vb->event.puff_failure.hdr.type = VIRTIO_BALLOON_EVENT_PUFF_FAILURE;
   190	
   191		sg_init_one(&sg, &vb->event, sizeof(vb->event.puff_failure));
   192		tell_host(vb, vb->events_vq, &sg);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
