Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3C27EFE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064306; cv=none; b=sw8Tu/T5UboK1vSq7yhYxs1ZGOY4AvsRoCi5/gti3gK1ib3GaglvzS7IwI2ypK0mKV4824yz2yR5F+29Xer4bddYfjTX+6Ir4oB8+E1anXx8JyPqqhcVrPcIK/QLFvw/vA5p1g9IjredyGT1U1BtJ94OXwkaV76xatXHU6jG8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064306; c=relaxed/simple;
	bh=J7GZufLvtFrZN8sFS4xOJPwrqs1q3HPH5gG+qZjXFHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHZknS2epbSEyrYvi0X1+IJP73UK6aszbCdK4SzAgSnbAWqC7K3LT7H4sP4azPgMFp/FBKFnrGsnZYORKComkB5cvEoDs2v3kG5NQeIAHO3ho5NtUsQUjFAJp58gK+jgcR6BH2d9DGbIKf4bdbcky8q80y7frG/ywZGfGDCKK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eR2PJUQF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR2PJUQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771064304; x=1802600304;
  h=date:from:to:cc:subject:message-id;
  bh=J7GZufLvtFrZN8sFS4xOJPwrqs1q3HPH5gG+qZjXFHo=;
  b=eR2PJUQFYYspAl1K3KnnBlVHQBodP8b9Uk0Ms7z+OlNYELPek1xbmphY
   8rh8njWnoR1RYendu0JpINdwFCViwihQH7K+ct2XwYUjpnAvBZkcOM32D
   Rh0l9QGOinu/ffAHmyZy2fyn+Qdb3Jl8QkTYmxEUYq4m3D64ljpxgboKc
   4hW/n0v873QRJb/R685T6toa8b4irCXP2PN9nJytxUgmb6/OPoyNB7BR+
   0uKzfPD71HaVsn4HHVMygmZG5RHIeqkPEEOx4o9pG9LIL0g6hqXrpg7Ot
   oH3MSui7bCPp0XcKdwicnNEswiweNC3sVKSD58Edeh1M58y9mFeJqp9dX
   w==;
X-CSE-ConnectionGUID: k0ybIbFVTGCAlvs2+zH4Ug==
X-CSE-MsgGUID: QOjp0Y7sS6K1xfWRczbq4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82561388"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82561388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 02:18:23 -0800
X-CSE-ConnectionGUID: EJVY/56nRbSLKiQlTy2WKQ==
X-CSE-MsgGUID: ZUYiBUrvTtuKrxPeTA+VDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="242447809"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2026 02:18:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrCjD-00000000wRa-0npe;
	Sat, 14 Feb 2026 10:18:19 +0000
Date: Sat, 14 Feb 2026 18:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: samples/ftrace/ftrace-direct.o: warning: objtool:
 my_tramp+0x24: sibling call from callable instruction with modified stack
 frame
Message-ID: <202602141800.mGEfj7iw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chenghao,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   770aaedb461a055f79b971d538678942b6607894
commit: bb85d206be208bbf834883e948125a35ac59993a samples/ftrace: Adjust LoongArch register restore order in direct calls
date:   6 weeks ago
config: loongarch-randconfig-r053-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141800.mGEfj7iw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141800.mGEfj7iw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141800.mGEfj7iw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct.o: warning: objtool: my_tramp+0x24: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
