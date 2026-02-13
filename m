Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90908331A5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973827; cv=none; b=MmNZWiQTYr+UZILe9w8YIMU1VnCFkW+Nz+8Z0gKjHw7EVTIdkvyi+mEVuJobYoAWO5F6NB11/7DbV6pkXBlvLPOxZWrQBm3820BKaUnvOXpFanYEkqPKR06ZbzFD0UctEkvUqLfWMEmsm43rX6pPTfye6vGblCchPFZ835VkapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973827; c=relaxed/simple;
	bh=wFsXMJC3uad/YFbw/ma5wWtQb8QH2U7GAVHJ+g8k/Z4=;
	h=Date:From:Cc:Subject:Message-ID; b=BfbcKiLJrN4oWgYzx1KoRItciuq0azOGzFQ9lKaPNXKuFa8u7hKsFAhGFO6qbbD05EoCllaRcxKrqC6IwQG4UMSJvQR8eamnPrOTQ7YpqBC0LqoQP03FHez+AkEaZH7o0thQ+kSGBMkpYP7w+TQTKLro8jEdaRpQP1UJidNelO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXd1eTbz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXd1eTbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770973826; x=1802509826;
  h=date:from:cc:subject:message-id;
  bh=wFsXMJC3uad/YFbw/ma5wWtQb8QH2U7GAVHJ+g8k/Z4=;
  b=GXd1eTbzQTscuyiHoFoqU4GAw1gyT/TrsLS3kkexG3gip1yTWnKD9ODz
   vPN1qdTyK/HIAokU/CHSzaACeqM6iuIXB7thCJ3eb6OP+/W3wdEgru2On
   UUB8te09mXFXgIU2ejgOInzneQNFhxYLQjQdYhy6vWD4IsEjBOQvMfbUl
   Oi3uuDhbum6VrYQQgiuWKvDwKEJgUM9DLAHrKNogsjfyNwuYlD8lh07/s
   XAvfGiBnVmMg96o0j3rgBy9tgO5GWPcYsYZ6T0B3pdERXyT4lHjPFV9lu
   gOyaSgh1GlKdHxydF+i6tbF4OCS+6ZStcLapku9qDEEmqakrukiyfuBqI
   A==;
X-CSE-ConnectionGUID: h8Fvb5pXTdaieei1wXC3Hw==
X-CSE-MsgGUID: 65DJcAIVQzyqRwOVGB5BZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97614659"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="97614659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:10:24 -0800
X-CSE-ConnectionGUID: rddphdeNQnOmoBPuJyvaXw==
X-CSE-MsgGUID: uak+haYGTM2td2UOhn3GcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212117109"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 01:10:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqpBs-00000000vFw-20gt;
	Fri, 13 Feb 2026 09:10:20 +0000
Date: Fri, 13 Feb 2026 17:10:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: ld.lld: error: undefined symbol:
 xe_configfs_get_ctx_restore_mid_bb
Message-ID: <202602131722.ZXfVklUT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cee73b1e840c154f64ace682cb477c1ae2e29cc4
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   5 months ago
config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260213/202602131722.ZXfVklUT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131722.ZXfVklUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131722.ZXfVklUT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_ctx_restore_mid_bb
   >>> referenced by xe_lrc.c:87 (drivers/gpu/drm/xe/xe_lrc.c:87)
   >>>               vmlinux.o:(xe_lrc_create)
   >>> referenced by xe_lrc.c:1151 (drivers/gpu/drm/xe/xe_lrc.c:1151)
   >>>               vmlinux.o:(setup_configfs_mid_ctx_restore_bb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
