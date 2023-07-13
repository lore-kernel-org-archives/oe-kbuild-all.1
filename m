Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40641566E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 05:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689227559; x=1720763559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9SGpkTDENPcD97bE74KZw4p1qW6QtlzqrPR9DJ8Ono=;
  b=Ewdr6rZj1s9p2KTGQAnVeY4NwypnOT3ONTkxpq++dMreYZ5reIrZXGbK
   IGNcjLivunjekUQdMgadw6BanXi6P6nycwbVGHOv+E2Vo1uXdEtrkb7Xv
   iULmnxtSjgDLk+50U86D8oVC+unP5vItagYpnkE2oZbZqBG+aayjOrNYD
   BOLtX3NB1W4PtxTlXoWRLpBSCs4EGWMEZ8Z9mczsNLZ3/4D81FGwM6IXR
   263ayAlAOga453DmVRUo2majw71m4QuwUPJJbdw5WbEShF51LQbEddCEK
   ClEXkMhXTu79SiHDuO35VaTRUS6SL9iWhQ3B3gYMCxc9H+VlqnuMAEWKE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349948056"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="349948056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 22:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="1052471662"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="1052471662"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2023 22:52:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJpFk-0006Hd-2a;
	Thu, 13 Jul 2023 05:52:36 +0000
Date: Thu, 13 Jul 2023 13:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <github@ivan.computer>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/kernfs-fsid 1/1] fs/kernfs/mount.c:50:5: sparse:
 sparse: symbol 'kernfs_statfs' was not declared. Should it be static?
Message-ID: <202307131321.vHc5CTHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/kernfs-fsid
head:   556d2ad5c816ebd4bc5144ef2cf82e2a5622b040
commit: 556d2ad5c816ebd4bc5144ef2cf82e2a5622b040 [1/1] kernfs: attach uuid for every kernfs and report it in fsid
config: i386-randconfig-r082-20230710 (https://download.01.org/0day-ci/archive/20230713/202307131321.vHc5CTHj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131321.vHc5CTHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131321.vHc5CTHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernfs/mount.c:50:5: sparse: sparse: symbol 'kernfs_statfs' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
