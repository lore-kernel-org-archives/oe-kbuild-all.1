Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7DE16C451
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720083; cv=none; b=YL1NESZlEg+Ov6rJ3h/FhwF1zDXslrlPYTrdm/5WmPTpAmQt3bnm63lMQWNKmiSa2MM1opHwDMCBYGgd3MCUpKsNIw4xxbNAAiv/dHm2ZTl13TG3hGoP9PfxYOptLtw1SWbQrNSJUP6gvOr1rIVlKC+rCANf2LgpoU3ozYyp8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720083; c=relaxed/simple;
	bh=S/EZqXPome6iw+Y+esw/NybHel2XFsV/dKJPwzUh9Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXEe8rldgPCFlincaC7ZFI6riveo6UZNGU45gShGXujFJ942WEvsmY4wtlxy7qGJ1Xvowvy5laV+WD/qJkXrelrDPMeLRs/DY1nAUT3CjI1FF0ftGU2RUDChir9hKNMBqSBrHeI7NE35PTV15smMyg3wqcmDT+3GB2GnYmMUQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA2427xs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA2427xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720082; x=1765256082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/EZqXPome6iw+Y+esw/NybHel2XFsV/dKJPwzUh9Yc=;
  b=KA2427xsbytEdoAqpU70Dd+QwactVxuZ8HP3peKYYN/FNEM+FSZSoMzo
   DTcFXsKSNKk8iWbaZDAxjkXfjxd4z8rDVyld45daxpW/khg6F0YLIQz5Z
   dvInbrnwto4b3OiwDieSBHtE5nnGabe2Bm3uOf1g6a0f7b5JWFZUXF3i8
   gCP38blEugTs8yKWLmmu9m5whh8rlHqm41JJvpk7vJVHeZxMxWMoRWx0b
   xNDsDkwq9pzklalu/8HnPCCsJgraGoICnpaPFzhRTquDjq0MmLC1JzzLD
   aSreqEvtFekrRIJdX17w//qe6GPanhw/6Q6Z1+1XXkE5dDAKSn5wr9Urx
   g==;
X-CSE-ConnectionGUID: +vbJBqz8QhGsipSQtQR0cw==
X-CSE-MsgGUID: pE3tBHf/RBygY8TcGH9ieg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416632"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:54:41 -0800
X-CSE-ConnectionGUID: I3lrxBjITDyaE4mbpDKX9Q==
X-CSE-MsgGUID: vEtqdWHqTDO0rBzNK5ApZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94802483"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:54:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVn3-0003wD-2z;
	Mon, 09 Dec 2024 04:54:37 +0000
Date: Mon, 9 Dec 2024 12:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2/13] net/netfilter/nf_tables_api.o:
 warning: objtool: nf_tables_deactivate_set()+0x5d8: unreachable instruction
Message-ID: <202412090308.dhfl46PU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   8ee3ff60103d85ad00366866387645645c52deeb
commit: 3a298023c912c600eb9df0288c7398cbb55ced83 [2/13] UPSTREAM: netfilter: nf_tables: drop map element references from preparation phase
config: x86_64-randconfig-103-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090308.dhfl46PU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090308.dhfl46PU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090308.dhfl46PU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.o: warning: objtool: nf_tables_deactivate_set()+0x5d8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
