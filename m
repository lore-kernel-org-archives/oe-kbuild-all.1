Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706D28F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251620; cv=none; b=COpr/Nl0LPQj3G0amoMWLDCO8pIamNFAROfdBksyEREVHSTx4A7/+yL1TY4fJOjjumuhYp6nL1btWVHcaaXXbzy2Ac1cUsC1x9Ucp3epCO5K2D1sqp0weWWqQvP99tXiOBC68BuTm8pCq6xrdWU4UxUuXoaQUaoQlzws6xRHJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251620; c=relaxed/simple;
	bh=EY5iNVGjTHsG57ImnPwHhBFt2mKRCG3fOu5Olzbo8nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swXIIiMeiU4YJvl5vgOYA74PCNx4/wn0ZOpZD2Aat6QLCUYmDeAs6ACNI83jF+1ckYCJm35YJIMZMqjCgKGi9MoByAybWdF+1DORsD34CsOvg+2gBnj1WJOFV++z1cLkF4CS9YQrOBJUBSbgbyNYlAkbwnFlR8W8481timGgWBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4iG21o7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4iG21o7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751251618; x=1782787618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EY5iNVGjTHsG57ImnPwHhBFt2mKRCG3fOu5Olzbo8nQ=;
  b=M4iG21o7l9k105GojkwPOeQ5phbRU09XaN1z4CIEzW5Tg06+cdvjJM43
   KvfvEM7W0sCCuWGXIhN+lkUVCEYFqcdbe6yRCauQxq4N9NNukzpGS+MRg
   eSDUltRlTGy7VaCA6thGThgt1WVjoywOPVI+bjSuG8k6uxgDSSvY3yLNt
   q+2GOuDL7U+rmvJCFRsbjDxGRGQlm38djl2Ukde52kVhSI6SiMi6dN6jY
   EZnNZ8s52AX1uvrX+3sqXiPnyJ3RtQYDkxpbVo/ABWhoWexzV6YBIv3KF
   JhPM5JYM63mqNFentXk1vxsbw708LsXfrq4nrd3pClrbVyU9C4uxDCYMC
   w==;
X-CSE-ConnectionGUID: 3YQNrq53SfmTY/cLPuwg0A==
X-CSE-MsgGUID: yH0dzLe9SEikTbWUA0ae3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64066732"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="64066732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 19:46:58 -0700
X-CSE-ConnectionGUID: bq5nk3b2TYyye9DNOsMTMA==
X-CSE-MsgGUID: 1FvlSTUsSXyikm7vzRBsHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153807996"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2025 19:46:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW4Xm-000YPW-0x;
	Mon, 30 Jun 2025 02:46:54 +0000
Date: Mon, 30 Jun 2025 10:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1673/1673] block/blk-mq-sched.o:
 warning: objtool: blk_mq_sched_insert_request()+0x13f: unreachable
 instruction
Message-ID: <202506301025.8TcXBis8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ming,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a9d08fabefcfd9cb8ebe45f8b79a321c0f349d40
commit: 756a9563633e27b424df25eba9c7975967892ccd [1673/1673] blk-mq: insert passthrough request into hctx->dispatch directly
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250630/202506301025.8TcXBis8-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301025.8TcXBis8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301025.8TcXBis8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-sched.o: warning: objtool: blk_mq_sched_insert_request()+0x13f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
