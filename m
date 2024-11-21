Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF191BDC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 01:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152670; cv=none; b=hYhN22xCnVLJSSIdlIG8eyHUZgHz2BJyvFp8C9EfiAbpcvUM2RXmGZsxrAvHA8nDf+9noQ8PYGziV9h1SbQLKT1qOb+k4MYHH9ICU3NhffVsRwzvK1rhdo1pR2NnU5vO/5zOipFpGFxJE1rVl6+CQe03/8wl6NpzoHCEar6NxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152670; c=relaxed/simple;
	bh=NGO82W2bU22nBOoCeFoLDrM09g0kkZlqDF3cLuvrnJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RvqgLuvFrb3fVTgCobANHC0VRo8cwR1qe9Ap7nUIFwixNLNZ/NsuQWfbJv054D2buwlYfiQZsCBWTPHr6bMOrvGisq5FNVQ7wbZHyVy3aRQgZuMWsIDyCXDCDdnx61bf9P5qxaMJomgsRjZw035HNaGnfV1UTwsiVcLduEDE/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFACu4nz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFACu4nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732152668; x=1763688668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGO82W2bU22nBOoCeFoLDrM09g0kkZlqDF3cLuvrnJg=;
  b=OFACu4nzIw/dh73Wtb4wE38KaOW2S8pkLBOqY6XqmcQ2T7jfyA80c15j
   75BpaqISoRivtIzCMPLGnb/B2A8EdEo3krw/7eF2Yjfr1fHaVrFFZ+lGZ
   f+hokU1vTVoYOWeEOGgReQ9ySu5zpeoxFx2oLVh+NcJeuXxs/JwpiplyA
   gAj6+UuQSNbn5oFswKWNlsXsMxhUjd2DcjCuS9AW4i+k1QMUeVN/42Myh
   Wq2JxWZc6JEYL8H5e7Oa+JMNLrWFfFtFh3I3fYrJfsYWX39XIkZWMoY2L
   r+Ud71G3pkHL1hZfiW1i83cuJKNfM9AfcNinh+5PqqPlgMZE256NNFA8X
   g==;
X-CSE-ConnectionGUID: kMTUswD6Tmm3gyh733dunw==
X-CSE-MsgGUID: wtltO0lOS5qV+9gsEWfZsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32168280"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32168280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:31:07 -0800
X-CSE-ConnectionGUID: lYa66uKmTNiQhQeVCc944g==
X-CSE-MsgGUID: jBACKlO/SomHCUBq5lsvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="120955916"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2024 17:31:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDw2B-0001K9-0g;
	Thu, 21 Nov 2024 01:31:03 +0000
Date: Thu, 21 Nov 2024 09:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] super.c:undefined reference
 to `__alloc_skb'
Message-ID: <202411210950.bzCekRiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f49b713adeb7d09d40da433b7700b1666a7d6e32
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [1297/1297] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241121/202411210950.bzCekRiW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210950.bzCekRiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210950.bzCekRiW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: fs/ext4/super.o: in function `ext4_netlink_send_info.part.0':
>> super.c:(.text+0x1c3cd): undefined reference to `__alloc_skb'
>> ld: super.c:(.text+0x1c456): undefined reference to `__nlmsg_put'
>> ld: super.c:(.text+0x1c422): undefined reference to `kfree_skb'
>> ld: super.c:(.text+0x1c50f): undefined reference to `netlink_broadcast'
   ld: fs/ext4/super.o: in function `ext4_init_fs':
>> super.c:(.init.text+0x46ef): undefined reference to `init_net'
>> ld: super.c:(.init.text+0x46f9): undefined reference to `__netlink_kernel_create'
   ld: fs/ext4/super.o: in function `ext4_exit_fs':
>> super.c:(.exit.text+0x65): undefined reference to `netlink_kernel_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
