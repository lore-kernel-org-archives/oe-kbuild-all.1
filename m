Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A864B04A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786840392; cv=none; b=KCt+8+XN/tYdt1Ii+6edtgtP5P4mVF05DtkPkSD6kl+QDcgINmdH84wX7afFto1wWXErOxEBmloGyI1mhlWIj2txsH5oSh5GADb68Qgpxi0skZDO1lwEy4yjTeZ55P+NWfE441DTDciM6wE4HRieWCnOvgaAB7xng+zmXvauTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786840392; c=relaxed/simple;
	bh=Z5Byhi44E3WWGiZWilb2Y+392Xtgjqt1EbKQ2st+aHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CPVFPC7U3rnNhOcv5w6651LYd9qwePi50sKuMvdsgVX0cJhdv6Mov4JWaR9RijR0QTKMTsdqwjgIJSwZM27OQKAhYFCPJ3L2KQIa5FotxLTSsOCH0TbUwBi2J7JHgIxCfr3DS90tctlXKPcbN7xiQ+IsJwRLgmmP5vJy8CsRYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YU3pJltd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YU3pJltd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786840391; x=1818376391;
  h=date:from:to:cc:subject:message-id;
  bh=Z5Byhi44E3WWGiZWilb2Y+392Xtgjqt1EbKQ2st+aHk=;
  b=YU3pJltd/tmvwaoRX9u9T7r130kNiGd314qI2jCWAt/JYsEw1VyUwYnc
   AFDeW++NYBy2PVecvwSVDi/Nl4uEjBAEvI+9UTFW2GhOkEYw35xs5xcsO
   XIXiI+GILPJcNdfa+xsoDFZsZ84dDvDckn5i0j3Xg2+nWAEGYPLOe2ITw
   NLy5Ed/kyOK37Yu3DEVmolaNClDLCqrq/ylMnUzRxcWeZT/8rPQHBV/jl
   7jAHWetNb2qF0YwttBckE88Ica0TQawX1+cm5m1DhtESn70Egjuz4TBj+
   SkpUQJVOa7EEmbPaOiXm0GHgTiKsaIIHyXc1UwWOv5oaz5x8z2KEZ7LQm
   Q==;
X-CSE-ConnectionGUID: BdHO242dTKevYEi3pAyP5w==
X-CSE-MsgGUID: //FJpy8KTS2sx2RK+C0n9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="112911249"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="112911249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:33:10 -0700
X-CSE-ConnectionGUID: Z7EfkAxcT6yRiXMDae3iQA==
X-CSE-MsgGUID: VB374oFTTSCrKFd8ai049Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="262789437"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2026 17:33:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOoE-00000000cZw-0VL5;
	Sun, 16 Aug 2026 00:33:06 +0000
Date: Sun, 16 Aug 2026 08:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:board-remove 135/217] Warning:
 drivers/regulator/lp8755.c:49 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202608160822.uRsChfKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 467cf72c21854e4de62212c55dbed871ea134d9d [135/217] regulator: lp8755: remove platform data based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608160822.uRsChfKC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160822.uRsChfKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160822.uRsChfKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/lp8755.c:49 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * multiphase configuration options
>> Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
