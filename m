Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E781C38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 05:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689139243; x=1720675243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3rkAG/HFlT3OhkPHIMZwLC/NpZ1nAATnHtqK+vWxFY=;
  b=mA0I6oDniCzqm8qxHuO3t7VG1DK1wOQ14nP+dAsdkBa309RzXvdWk8uq
   crUZPCRbPI1vu5SQTIgv+ikAyKZhj9Q/UX/c0X2ahfk/k694R2jCatSRE
   CuTFkAoDf4tQhqqshXOoVutmYibV3AZBeeSkYFe1KeFOozYyUaNi1y6CQ
   goam4CFqUA2aNScva0Hv4hwTpHTXeUgw6/XDsUIPuWAMUtZ3fSfiJ/ZnU
   oXsY/bWXSDNQsJkeKA5wOd9nOCuuWt1hMgbHLDrE1eeRjwWgXkvoDl/X1
   gJNfeu4d4kgkIX3mxYhK87ztbE7hwgqSukCVurqJmg1giEmubWj6emslf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363667282"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="363667282"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 22:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845531796"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="845531796"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 22:20:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJSHI-0005PD-0M;
	Wed, 12 Jul 2023 05:20:40 +0000
Date: Wed, 12 Jul 2023 13:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [linux-stable-rc:linux-4.19.y 6362/6444]
 drivers/gpu/drm/.tmp_drm_edid.o: warning: objtool:
 drm_for_each_detailed_block.part.0()+0xe4: return with modified stack frame
Message-ID: <202307121340.tkFKYUD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   86b58f64d958edd3b0ee1c2be6e0d231178b56c9
commit: c83e55cdbb48a1646b1228e1afd5d5d9496ee368 [6362/6444] drm/edid: Fix uninitialized variable in drm_cvt_modes()
config: x86_64-buildonly-randconfig-r002-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121340.tkFKYUD0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121340.tkFKYUD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121340.tkFKYUD0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/.tmp_drm_edid.o: warning: objtool: drm_for_each_detailed_block.part.0()+0xe4: return with modified stack frame
>> drivers/gpu/drm/.tmp_drm_edid.o: warning: objtool: drm_for_each_detailed_block.part.0()+0x0: stack state mismatch: cfa1=7+216 cfa2=7+8


objdump-func vmlinux.o drm_for_each_detailed_block.part.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
