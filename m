Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771496D39
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 23:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681686985; x=1713222985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J3XJ8PkVFeBwjZRCEqRC55dwsAdwRFTxoupwo33Loeo=;
  b=ceam+wSWjuy78I4hzMF8dr0iHQT2xZdQ6F6U23mhN1I3kvKW9aA92Qo3
   kUDMN9lcXk23ihs217OJpVUNDA0/2TQfzNs9u2jQmeklOgIZ9j9M9Tznc
   3D7jtKPyrza+vWFvsvpfVt+6jN6IHgfAi5JLTBqBfwheb+kN21IE8FH5T
   5ozI2SUtSsdqecADOhG4nU8zc4pisodGO4s15DccL0FkBc5yDnVdOSw1H
   tSa43TPnJHFpweKQCcZsSmso/7Ydab/3Upva/SQKA3eAECaI8lbZCC6Pr
   j4zokJ5rbnHe04d2z5sUlqNlPhtSo5haZKKIDwVqgvFyZXOF5MsYcN2B4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="346614696"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="346614696"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 16:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="801880198"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="801880198"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2023 16:16:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poBbY-000btd-15;
	Sun, 16 Apr 2023 23:16:20 +0000
Date: Mon, 17 Apr 2023 07:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>
Subject: [linux-next:master 7439/12016]
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:146:2-3: Unneeded semicolon
Message-ID: <202304170759.WX8ncvYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3f2cd24819158bb70701c3549e586f9df9cee67
commit: 39def24f8c0f86a2d2edc52c694a1cbb41aee69e [7439/12016] drm/amdgpu: add nbio v7_9 support
config: csky-randconfig-c024-20230416 (https://download.01.org/0day-ci/archive/20230417/202304170759.WX8ncvYE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170759.WX8ncvYE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:146:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
