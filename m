Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219B3D97A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730594166; cv=none; b=LbB7HKNbL7MF0IZxS3gMEadnJocEmkEBMO9uPyXEyYorVJwswojRuqArLC9D99C5UNw5m1HsZj8sl9OFWOea4jtgTqlmne+044IGPqvVbS7T+B1ZRJjrvRLUy7z4du7kumajLTXVOBOT+GLIjBrvWZMZz2Gh86YrKwMstZQ4kKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730594166; c=relaxed/simple;
	bh=3641kN+E054e++0y+nSnMPiQrDkOiZgDbG62ML1IaYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=byNK3AXJFI8pOVN3kGg8utaYFG66td6XyeeKN6yNV5WixVRpg3IIICNH2gkLkexgUhGN69A9FaLQ29lflQcTR/d0eF+J/CVDkSfdvoN+dPccQii/zFp5Js4zpIdxrxLdK7wtDRCoilGo9RJLagDrzYGZ9IPPZgvrJcnR23N5xVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWh3jX+H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWh3jX+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730594165; x=1762130165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3641kN+E054e++0y+nSnMPiQrDkOiZgDbG62ML1IaYE=;
  b=eWh3jX+HLSt9hmpNpY33dwlkCINwH1EMYh5qYwWV4gKSCNaGEcneTt6v
   JiYf9fE8FSBGLcWK7JtC799Q69zP9xeFWxHylfA11Wb9A5dZlZaTmghrH
   l2li/GBWqb+eKag2E/+p9U8ZGPR4QhsYY8jFflAxlwzNMmqjd2EMDAINY
   zrM8U0z18X5DmKx7OgO45/o8MhiK41ivJBv4CEmr7t5nrDcTXDRv11yjH
   oe2HFWAFHwFnHepCcVQwQDD7r3Y1DkluelZbK043dqRIUMdF/QkF8BWqe
   9OzYXWUePatD3dhUAoL33myEpfJWCeMO2t25Lom6Hl36pLCZ4WJIimFIO
   A==;
X-CSE-ConnectionGUID: x+ZEeikITQesjgCzRApW+w==
X-CSE-MsgGUID: yNwtEHdfRB+sz7EQvoTiqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30276090"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30276090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:36:04 -0700
X-CSE-ConnectionGUID: CCJ5zdCEROeLTqzAz6qRcg==
X-CSE-MsgGUID: VInxy/vLTsucFm6nFzq1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83749545"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2024 17:36:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Ob3-000jVn-14;
	Sun, 03 Nov 2024 00:36:01 +0000
Date: Sun, 3 Nov 2024 08:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257]
 sound/core/seq/.tmp_seq_info.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202411030841.5zDkiwtI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 00976ad5271999ba06d24319fd1031b178aff832 [1257/1257] ALSA: seq: Fix leftovers at probe error path
config: x86_64-buildonly-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030841.5zDkiwtI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030841.5zDkiwtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030841.5zDkiwtI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/seq/.tmp_seq_info.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
