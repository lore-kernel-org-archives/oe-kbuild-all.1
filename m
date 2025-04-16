Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188631FCFF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811946; cv=none; b=N+EE0aIrPeCI++BHDWKBcZwdxEVNDmnqHS5r87VDKcNIqpQcyuQ9EdB8pjD8u76txGbwq/8Ov/gCMhUoWOLwd8hGpQJvWGpYZl32M6KwGpNCCH98nbjfAshkP3uVXjtJuXU8uHp3mg/5cipJLINJO1LvTbOoZ6lpltFMYknpB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811946; c=relaxed/simple;
	bh=eubbIJl4kEx01rYUi0+ELi1SJJssOWZ90AGEP3iNyew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JR2+wcn5d98ClgSvr1lSjdfu5saLRD1/Z3+xS5p2+BdtZNh3Yr9Ts4j48sFKQtDtn51kwvFXW/BYuNW3khsLOMfs35TQwjjpoKg1Om5jFmrBnkbh5SUGJ9FX8rFFJptmlrZvbPe9Edb6TQEVvZDWZYSc+QYGFhVKABnsL8O+UN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nmdj3JZr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nmdj3JZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811944; x=1776347944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eubbIJl4kEx01rYUi0+ELi1SJJssOWZ90AGEP3iNyew=;
  b=Nmdj3JZrYcPxtaEfgc0EZzPdFvIBeomedGX2au39nFY0XFeyfOvrQF3v
   SkK7PncrlGrh801/NI57hiaZG3UzQn5eK5LDaicyzJKjgK+pRRtP/A/jY
   8xxLKEnUtBA455aMtwExh0ga7TG4+zx+viaHCIi//HA+MGgpyqnSN1xmR
   NX6b5CkBLr9JvpSiAFjvKFW2rio+MMhy2X4x2gnTnt8+ME34C/R2CwwO7
   iJlJVmY7D4nCoawXfTTq/Zef6hAOuSDvZvd2EcyaTVtuNGLix+vhZjWx+
   5jq+XnL67Jp3Q2igg6RrgZ9/cvR1ISEmlM21zSuM6ihs2j1AqYHq7gU0I
   Q==;
X-CSE-ConnectionGUID: sDfbqi6MTACSlkmkfocWdA==
X-CSE-MsgGUID: LTbZKWBYS3WltO4QDFmfkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57748622"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57748622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:59:03 -0700
X-CSE-ConnectionGUID: G0MkWVP2THO0kbGWnTCxQQ==
X-CSE-MsgGUID: 88+PCgFXQfi96fl5JVBiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="134593904"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2025 06:59:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u53I4-000Jq0-0q;
	Wed, 16 Apr 2025 13:59:00 +0000
Date: Wed, 16 Apr 2025 21:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571] block/blk-mq-debugfs.o:
 warning: objtool: debugfs_rq_show()+0xdf: unreachable instruction
Message-ID: <202504162155.YWQMdqiA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d47443532b562cff105f8cfbc32343f83a2ecd01
commit: ad4d7c466e2520aed18679d442b1a16f33b372b8 [1571/1571] blk-mq-debugfs: factor out a new helper to show allocated request
config: x86_64-buildonly-randconfig-006-20250408 (https://download.01.org/0day-ci/archive/20250416/202504162155.YWQMdqiA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504162155.YWQMdqiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162155.YWQMdqiA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-debugfs.o: warning: objtool: debugfs_rq_show()+0xdf: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
