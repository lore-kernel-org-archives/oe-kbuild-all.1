Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20ED3FE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689049365; x=1720585365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKKWmtWm4OlWu/6O+h1ywDK8MuNsWZh/wp8xutohiv8=;
  b=LSOQD4FTYT1ABc/+nfIT0Res04gdl3DaXQxRaboRL5BCwIfawXRkhFIA
   KngOrRouY36stNRNtoy99LaWaBzP/y4/MqC5nXejeeK5NwDGP96Ag90VA
   mzVugejrEDsld2G4taq5mkEkDDGUoe6Y8a6cywUSZuz9hdUU6NnBAborC
   oiKX+4x+DD5tWOiv+cRoozyZO3sTaxerj//r/yevD5Z7Irno6jM3sDLMz
   eZYqytscOpQfmOXQvgjgXjB6ePd9sZC8Fu27l0xOWW/7tSrB5hXfBzClI
   YDeYtq5HiyuFABrUwpijodWXBZnyO5gSZapMHXKt9zjp1h3/TIagh2w2D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367099494"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="367099494"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 21:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786460140"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="786460140"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2023 21:22:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ4tc-0004JF-2I;
	Tue, 11 Jul 2023 04:22:40 +0000
Date: Tue, 11 Jul 2023 12:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [linux-next:master 698/1391]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:868:1: error: the frame size of
 1168 bytes is larger than 1024 bytes
Message-ID: <202307111250.GzpYxUtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe57d0d86f03a8b2afe2869a95477d0ed1824c96
commit: 9041b53a59d77039c69fa61be8575fa232cd3bcd [698/1391] drm/amdkfd: Use KIQ to unmap HIQ
config: microblaze-randconfig-r003-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111250.GzpYxUtH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111250.GzpYxUtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111250.GzpYxUtH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c: In function 'amdgpu_amdkfd_unmap_hiq':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:868:1: error: the frame size of 1168 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
     868 | }
         | ^
   cc1: all warnings being treated as errors


vim +868 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

   833	
   834	int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,
   835				    u32 inst)
   836	{
   837		struct amdgpu_kiq *kiq = &adev->gfx.kiq[inst];
   838		struct amdgpu_ring *kiq_ring = &kiq->ring;
   839		struct amdgpu_ring_funcs ring_funcs;
   840		struct amdgpu_ring ring;
   841		int r = 0;
   842	
   843		if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
   844			return -EINVAL;
   845	
   846		memset(&ring, 0x0, sizeof(struct amdgpu_ring));
   847		memset(&ring_funcs, 0x0, sizeof(struct amdgpu_ring_funcs));
   848	
   849		ring_funcs.type = AMDGPU_RING_TYPE_COMPUTE;
   850		ring.doorbell_index = doorbell_off;
   851		ring.funcs = &ring_funcs;
   852	
   853		spin_lock(&kiq->ring_lock);
   854	
   855		if (amdgpu_ring_alloc(kiq_ring, kiq->pmf->unmap_queues_size)) {
   856			spin_unlock(&kiq->ring_lock);
   857			return -ENOMEM;
   858		}
   859	
   860		kiq->pmf->kiq_unmap_queues(kiq_ring, &ring, RESET_QUEUES, 0, 0);
   861	
   862		if (kiq_ring->sched.ready && !adev->job_hang)
   863			r = amdgpu_ring_test_helper(kiq_ring);
   864	
   865		spin_unlock(&kiq->ring_lock);
   866	
   867		return r;
 > 868	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
