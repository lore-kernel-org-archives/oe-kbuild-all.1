Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010673C30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678814812; x=1710350812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrS/rNeRDgIQ1HAXoljks3q7xV3A7OtZKme29SfEePI=;
  b=icr86QwW0s8hc6zGWBmtZt0/OdE6Rd3KXwygBtStt/+XEum8r9zK/rTV
   O3vRe2RK45bwhXuyUhT5OyDiL+48FNwpiR7/GHW31FXIGIP5v+kJ+E0a8
   fr4/82pD+u6yoOw+bIDzijBEYFHu61hz811K9B8NcNV/Sjep15XWbow5G
   BHXS+NO3PiERczZGK/Atp/laJqQ0xmLGz9R+JRyhIniq1H5Q25RogwFDV
   eipNw+3s0MM5t0/xoF0BucwkDSXDUHVlfyo68RPTLGi81q8Qu+y/u/LA9
   WUGRZcDjivHNT5lFnLTh673gBf2efK1shs4/CyxVZeVuh1VmIoK9A19OX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400078227"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="400078227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 10:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="1008500630"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="1008500630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Mar 2023 10:26:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc8Q9-000746-20;
	Tue, 14 Mar 2023 17:26:45 +0000
Date: Wed, 15 Mar 2023 01:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 107/107]
 drivers/virtio/virtio_balloon.c:189:41: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202303150104.MkkMCNpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   553c30fc619d3063b8add4d90b1050795d43ba87
commit: 06c7c42cb1e901ed805ec8c993426e8c08f9c6de [107/107] CHROMIUM: virtio_balloon: support the event queue
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230315/202303150104.MkkMCNpU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 06c7c42cb1e901ed805ec8c993426e8c08f9c6de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150104.MkkMCNpU-lkp@intel.com/

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
