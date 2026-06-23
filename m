Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF439B97F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258305; cv=none; b=rMjZSolzNhZLl/eVHKDBuyXQwDAHsZMS+91ttatPhpc7lcwFtW805lixhUeqQt1cVTFFmZGCZ8sxtT/Dg3gANEd7AZP8m6gkAHz6NDfUnlRwq/PwCGP7oQZPgP9ZzARyIjcHU0ULQvxcfcdEXupGsdgpdlqkbiBp+vUYcQ34fBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258305; c=relaxed/simple;
	bh=D27+qSF6lIxbgMs6hyJSjssdq7Sc70Sv6Cs3NQCM0MU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OP8D21wNZYsPJsKkJ6hz9IzZf67nZSph0pfir0xz29fxJgECUH6+qG5q7Zh7FjAZSRiJ2PTSyHn5cWpIHVX4e0HYv7HS90Gh3gKy60XYGTQu5u/DvmFWfhr271fCIZAHlZdcvj6NeuxVOcjXIt8Nkkkcm+6NJTE/rWM3742njDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SU+9OqQf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SU+9OqQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782258303; x=1813794303;
  h=date:from:to:cc:subject:message-id;
  bh=D27+qSF6lIxbgMs6hyJSjssdq7Sc70Sv6Cs3NQCM0MU=;
  b=SU+9OqQfStR0Ov/CQV/InYDHWL8Y/W8kH2lL/J9AupsHSTeDMri8ETtD
   wW9PdTx4rZ0Fs3Z18cH8BvLzn+LWyc7X3+qYs7oMLtlgTvH+Qkj3Ij5PW
   mZivMxIwinL/HWb0YIKe63xucb4hYrTc12+NjRODu20qGwQ3RSYz304Ar
   fFIpxhYFlydBMgmpUDWXH1T9dWtf9W/SGQWkR9ol4UKEAu6CfMMKs6/XD
   aetX4lANzYNxDwdl58irNsjYvnqGYNeeXxDCjOo0XUcifuU2wlKS/LsuF
   8rDMrktVwtwpGev9KG+2J1RWennanQpwWaSXW4UC3bnApK6/tegJjB+Gt
   w==;
X-CSE-ConnectionGUID: u69OrokgTI2fbJg/BslUUg==
X-CSE-MsgGUID: Wo4ciAjrRpyMpSphnwS2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70525944"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="70525944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:45:03 -0700
X-CSE-ConnectionGUID: qWwgyGMlRPGRIdy0QgNQLg==
X-CSE-MsgGUID: 8hoWvUCfSJyc7EQlqC4SpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="253522951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 16:45:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAna-000000002xp-2gIT;
	Tue, 23 Jun 2026 23:44:58 +0000
Date: Wed, 24 Jun 2026 07:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v3 9/12] configfs.c:undefined
 reference to `init_net'
Message-ID: <202606240722.Jsy0As2f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v3
head:   59472df96a84fb076a2b47a90a0bb353c80f239c
commit: 89bc5b1f20c3cea7aa079e9e5c30e8aa86b5621b [9/12] nvmet: make discovery subsystem dynamic
config: i386-buildonly-randconfig-004-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240722.Jsy0As2f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240722.Jsy0As2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240722.Jsy0As2f-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvme/target/core.o: in function `nvmet_find_get_subsys':
   core.c:(.text+0x311c): undefined reference to `init_net'
   ld: drivers/nvme/target/configfs.o: in function `nvmet_root_discovery_nqn_show':
>> configfs.c:(.text+0x1007): undefined reference to `init_net'
   ld: drivers/nvme/target/configfs.o: in function `nvmet_root_discovery_nqn_store':
   configfs.c:(.text+0x1356): undefined reference to `init_net'
   ld: drivers/nvme/target/configfs.o: in function `nvmet_subsys_make':
   configfs.c:(.text+0x3565): undefined reference to `init_net'
   ld: drivers/nvme/target/configfs.o: in function `nvmet_get_ns_id':
   configfs.c:(.text+0x4214): undefined reference to `init_net'
   ld: fs/configfs/dir.o:dir.c:(.text+0x268e): more undefined references to `init_net' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
