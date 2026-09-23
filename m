Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D834EB877
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180765; cv=none; b=LdciAcVpdg65PVkCKDArtjbv7BZo6WLjVrrIoozca/kKUzdkwgzYWus0D9bL//asDK2UYQXonO6Shxcv56TULIkLrRqccAq/3WQVVIGkDFCDM0bogIytutKk3lzC1TH5l7SKxDfEV36E3HrzqYm9mz5PXtYX79+HzVozneefn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180765; c=relaxed/simple;
	bh=IERVJGWJw6rjuNqJPjAiHeD3JZ40QlI7AQ6brGOD1uM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rZArIf1n8mVwmlwWdsutZFOTeq+E+ouomfKUd9M/rKnMJ82VJekdwtpSMlKBJXgVMUvjUuJEBQyoB80pnK8UzFM/YlAzj4Xo6+CibS1w8BSJVRXchsF+Gdbd2HLp8HBicEW2ejXNWWNHU4Sit3Gr5rrJ0vaqeBhxAVlU0dEvU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWlBMQAI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWlBMQAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790180763; x=1821716763;
  h=date:from:to:cc:subject:message-id;
  bh=IERVJGWJw6rjuNqJPjAiHeD3JZ40QlI7AQ6brGOD1uM=;
  b=hWlBMQAI5LdpFe23yzF6th3hcdfdU11Gqw99U6qd1JyOe18eQ8bWphCi
   ip3WKkCq9m4T6Ag/Pv6okUXQca/63V+ju6T+ElJZM+iA4mZbhgrsKeqIy
   inL/wNvXWsX7Emcwm+t1MYm0jMSV9Ye2LoZC3wQKsn6PCucd0cBfNh4Y2
   xA06pJ+gNKakVF3MVDmdtNKwTUokxQ1A31T4ywyDA7Uo0yMU11JzCaoqh
   Jcuc8GdjXcQEjj8fLe63SPNwcVE8Q/RHIaEd70YzuIeGVPvHtTUrIVJ8Z
   tUn+jkxl0lJdVkoJ7HFefkATFZK1Yh0p4VflffoKn96c5SUOkziExH57J
   A==;
X-CSE-ConnectionGUID: c3+kGNuJTPWci4NTcQWfFw==
X-CSE-MsgGUID: yd5WBAIrSVSX9uHplNiBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101482549"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101482549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:26:02 -0700
X-CSE-ConnectionGUID: RcYOQzwwQ6Gz6kFCMALDGg==
X-CSE-MsgGUID: OBzMDx92RD+u5GFrA0FEAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="281743556"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 09:26:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PnC-000000000k5-44gC;
	Wed, 23 Sep 2026 16:25:58 +0000
Date: Wed, 23 Sep 2026 18:25:46 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Jan Kara <jack@suse.cz>, Seth Forshee <sforshee@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [brauner-vfs:vfs-7.4.idmap 26/28] htmldocs:
 Documentation/filesystems/porting.rst:1417: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202609231806.ILZP6Fy0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.4.idmap
head:   0f30047dc83fe18fe0b0766134e9c1a67a09a431
commit: 025756ee7b476241270dd8ccbe17cc4c473800fa [26/28] fs: port mnt_idmap() and file_mnt_idmap() to const mnt_idmap
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260923/202609231806.ILZP6Fy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231806.ILZP6Fy0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Ring Design
   ----------- [docutils]
   WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
   WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
>> Documentation/filesystems/porting.rst:1417: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'power_module' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 Excess struct member 'dm_boot_time_crc_info' description in 'amdgpu_display_manager' (did you mean one of: 'boot_time_crc_info')


vim +1417 Documentation/filesystems/porting.rst

  1416	
> 1417	All struct mnt_idmap pointers handed to filesystems are const now.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
