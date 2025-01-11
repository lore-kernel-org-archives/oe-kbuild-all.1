Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AD18FDDF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736593783; cv=none; b=Qo/brAdHnx1VnyrofjTiNN81REdqOD9plsraibHpmw6Xc+r4qlJFbLlrGX1l3XfVAJg/iTR7WOQZ+jNNDaURAGuOVCtQ3StY1eyM33h+j0bJcmeB8zy1RJ+PKrBxU66ybGPZXYeoyz8eZbbqHxlSXJZUywAL/kTCgYDRQAtluAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736593783; c=relaxed/simple;
	bh=XNaR+2zQCc1BobBLU06Ha+27VUEzioqfLLmKIUvWItU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AN7rVLzCmp77fHQMgtzFS4sAmdNrJ5p+EXHWOd5uY+CXpxw/41ysrc7J1LuAowxPdCPAmqTXUvsLmFLRwgNEojlM0hBKy/TovVtbNv/N+2zNywrjzHInqzWC4zqet3heCkIneMe+Y2/QAvXO+yRfr0qo/64bBNbqUVhINSb8NiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnsffTJr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnsffTJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736593782; x=1768129782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNaR+2zQCc1BobBLU06Ha+27VUEzioqfLLmKIUvWItU=;
  b=MnsffTJrQ13OOKKxB5vmjATS4QPCTX2GKa5l4r1RSCfrmrCc0Eahq6EF
   mtyJi89ve1PgxAk1pUqRlj+jOblwS2e8ismNVot/IHgMP6iDkqFSyaM0R
   oN4HKjaMnzK+WKVLZxTwj+SxyXe9nzjnEyZ2P1PjsBmeNKYUB8pF9V41n
   EzVrwvx8qj12i6KJ+T5CTUf3A5kqVujd2dYdkbLHKYBlF22zbsrOVteWw
   nDshzJkRkWZt+ArTPXXkSBTqvntmFc0fou1BnP7BFztNGdI6BB77BTmoj
   /hTkcUGnxXts/TcU887wFWBbwLlwe4ypzJ66/BgvGg/3NNOOZMUeo/SD2
   g==;
X-CSE-ConnectionGUID: Q9tuCU8sQM2EEcAkEkWchg==
X-CSE-MsgGUID: 0xNLu81PT4SVdrS+7HPmBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62258073"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="62258073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:09:39 -0800
X-CSE-ConnectionGUID: AFIn8Hh3Rya//PHChrjVPA==
X-CSE-MsgGUID: uL563qVOTTaNnHVm5wZrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103776812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 03:09:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZN2-000KZI-1Y;
	Sat, 11 Jan 2025 11:09:36 +0000
Date: Sat, 11 Jan 2025 19:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Song Liu <song@kernel.org>
Subject: [mdraid:md-6.14 1/3] make[5]: *** No rule to make target
 'drivers/md/md-linear.o', needed by 'drivers/md/linear.o'.
Message-ID: <202501112124.w6m8vxyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-6.14
head:   f319855a3b385a69aecb0a398cfc4855b9d8d999
commit: 7ad00dd67641fd509fff206f70eecb1364593eff [1/3] md: reintroduce md-linear
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501112124.w6m8vxyF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112124.w6m8vxyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112124.w6m8vxyF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by 'drivers/md/linear.o'.
   make[5]: Target 'drivers/md/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
