Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD721CD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685629237; x=1717165237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFf05DYAbO3Sr25eBSffUv79hFmiIy/JjBvqNWIxpY4=;
  b=Cv6oePihIlqdI1oaYSK3gTtuz3YcXX71H0GDEmNJAeZcu766htu+Fq6B
   sKl0Xj64bpuNqtcdXT/HsHka721OSnVCMzDo2khdsaL4BhlMQoFqzO5kz
   jqIq6o4Mec0Uwnk7avpXQjRHQQ+/8+WdBB/uZRk3RUAbV7KWrVnseBPtN
   yOxqBzrHcL98M2LD/ha+Bgb0RMD/ryBKmV+bVOCPwdivKmIxCq8SCyWP4
   HGmCXsxYCmAM+dkM7dpwAcpxEscaN6nqAn1ROMg6lsxvgYakyNuQA1zu1
   6J8fg33BIbQ5lwlTsid6yTjHvMeekAK1Y54QPTf0krA8jR+6NCcZnLAzP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="357989663"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="357989663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881625226"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="881625226"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 07:18:14 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4j82-0002La-1l;
	Thu, 01 Jun 2023 14:18:14 +0000
Date: Thu, 1 Jun 2023 22:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 19/35] arch/s390/kernel/uv.c:215:40:
 error: 'mm_context_t' has no member named 'protected_count'
Message-ID: <202306011710.fETYFaqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   4630f87dcf599ea7ef77b34e308079c34b622157
commit: 29228f2fc0e62a14b165f655350f56c2715f276a [19/35] KVM: s390: pv: add export before import
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230601/202306011710.fETYFaqU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=29228f2fc0e62a14b165f655350f56c2715f276a
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 29228f2fc0e62a14b165f655350f56c2715f276a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011710.fETYFaqU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/uv.c: In function 'should_export_before_import':
>> arch/s390/kernel/uv.c:215:40: error: 'mm_context_t' has no member named 'protected_count'
     215 |         return atomic_read(&mm->context.protected_count) > 1;
         |                                        ^
   arch/s390/kernel/uv.c:216:1: error: control reaches end of non-void function [-Werror=return-type]
     216 | }
         | ^
   cc1: some warnings being treated as errors


vim +215 arch/s390/kernel/uv.c

   191	
   192	/**
   193	 * should_export_before_import - Determine whether an export is needed
   194	 * before an import-like operation
   195	 * @uvcb: the Ultravisor control block of the UVC to be performed
   196	 * @mm: the mm of the process
   197	 *
   198	 * Returns whether an export is needed before every import-like operation.
   199	 * This is needed for shared pages, which don't trigger a secure storage
   200	 * exception when accessed from a different guest.
   201	 *
   202	 * Although considered as one, the Unpin Page UVC is not an actual import,
   203	 * so it is not affected.
   204	 *
   205	 * No export is needed also when there is only one protected VM, because the
   206	 * page cannot belong to the wrong VM in that case (there is no "other VM"
   207	 * it can belong to).
   208	 *
   209	 * Return: true if an export is needed before every import, otherwise false.
   210	 */
   211	static bool should_export_before_import(struct uv_cb_header *uvcb, struct mm_struct *mm)
   212	{
   213		if (uvcb->cmd == UVC_CMD_UNPIN_PAGE_SHARED)
   214			return false;
 > 215		return atomic_read(&mm->context.protected_count) > 1;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
