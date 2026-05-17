Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB53D286D4D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 03:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778987295; cv=none; b=L8WCCvNlTR7bZ9/lLmyDqbq/GTlWReRcMh8+IqrkpvPxLXL+1Fqabft9wSYN0uaMlOShvZFwiXnDmYLBG+w8v+5bcnfwK31cD/dfWIWYJ5OLTSsHKWz2f23pE4mHSfSzbrSWA3srgcAuyx3yktCvjxkZWJPouwho2uUd682Gxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778987295; c=relaxed/simple;
	bh=UkWkzQZePwRqgqcuqjnC2qcMRAmNI1wPUdz8Jraaw3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TAZLxYB620/4uqOtDr+yKHkOzIc/V4YwU2s3OZ2qq7xO8ijoQjc25jbGdPKwroFCdw1LiQN1Cel28tGby5IdNfgsOTAyQaH/FmOovOGbi5LlZIrQ2iikFc5uirf4Mh8HW9jZRWDyvcLFOOXygAvmZLandKt0WVY9PN06e/LZ0X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=covU42nx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="covU42nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778987294; x=1810523294;
  h=date:from:to:cc:subject:message-id;
  bh=UkWkzQZePwRqgqcuqjnC2qcMRAmNI1wPUdz8Jraaw3w=;
  b=covU42nxfaAof74CxJw08dcuXfZmHCZkBtOAoKnVWf3NGuVRrFXX/B86
   IKdD8wvO+0ghubtZi/PZWbMN00ZevX6MbYoiwTBaGEssAINhuuIeKWE3h
   gUCGpqBejc3Z92QcMDXfDtvoLjXPYrdiwc5Ai1W3oNcMHBaRtWUq/dBQd
   TQJkVIyata7HOLQHIPPEXt2sXoTca7/qNC9I5NY58nEDsRhqKEcQfhWBB
   sk5wJFy+bsIBIo2AZfPvoPzgKIyfcrfvtNKRJNuQtk2N3aotuNFbbhC4s
   J+d/wrjWjgAR3FobqpVQEnopjI0L39BAbb0rjsuA9B1wV+botBd+Yq5Ke
   Q==;
X-CSE-ConnectionGUID: CQoLtyCDSKOWFlCGUPs/BA==
X-CSE-MsgGUID: uFxfiHNGSU6XhnAK7IDMOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79739953"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79739953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 20:08:13 -0700
X-CSE-ConnectionGUID: px8P5yZJQsa4W4izeA9gnw==
X-CSE-MsgGUID: laifhOKhRfiRpRlPZsw4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="236445808"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2026 20:08:11 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wORrN-000000001Js-1d9X;
	Sun, 17 May 2026 03:08:09 +0000
Date: Sun, 17 May 2026 11:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.2 31/37] alpha-linux-ld:
 sound/soc/codecs/es9356.o:undefined reference to `sdca_asoc_q78_get_volsw'
Message-ID: <202605171114.05NAWNty-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.2
head:   e0014849e9af1e08aaaf2b7bc26b1918d8275f24
commit: 5d9cb740cd38fa17247b4a62af135901fa5c4d9c [31/37] ASoC: es9356-sdca: Add ES9356 SDCA driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260517/202605171114.05NAWNty-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171114.05NAWNty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171114.05NAWNty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0xd0): undefined reference to `sdca_asoc_q78_get_volsw'
>> alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0xd8): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x120): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x128): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x170): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x178): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x1c0): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x1c8): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x210): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x218): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x260): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x268): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x2b0): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x2b8): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x300): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x308): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x350): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x358): undefined reference to `sdca_asoc_q78_put_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x3a0): undefined reference to `sdca_asoc_q78_get_volsw'
   alpha-linux-ld: sound/soc/codecs/es9356.o:(.data.rel.ro+0x3a8): undefined reference to `sdca_asoc_q78_put_volsw'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
