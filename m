Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F31993AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723572882; cv=none; b=F+UHx+iZwHh9BCDM+TMY8GlyhFEg4diVIVoa01eLiF0VAdA2zBJvQpYNLm+UzrHVgprOAPcHTQjhMB+LUR8XUOTeyi74C9wbjeac/vEfWzGyeXkRgM5DAcfDDJRlPlB0FxSnAKYn+9bv78QLOkx87VBRLIEqjKydIWjFXXA/gAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723572882; c=relaxed/simple;
	bh=VZW1k+mB2LbhST7ZbUlctl1RZ4MP4rW/bdiJhx9XwF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KW4ExpmyIaLvQ7M8NsCrbB5p2v8valj11ZDsJh16q4Efty8MnOhtZG1A80dYXi2ObddLerpIM0HRcLeAsFi0/6I6gHPKMgkrNgZzuMEA1ylq0qmwimeNGBm2v7ESVDJaiBKVKETn1JirpABIWL7ME8kJx1dVj5OV7AkPxA8BAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjbseInN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjbseInN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723572881; x=1755108881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZW1k+mB2LbhST7ZbUlctl1RZ4MP4rW/bdiJhx9XwF4=;
  b=TjbseInNWbgvrCMQs243Vso0WSLnRbICv/WPNU84vIVuHIcXRaMqDAA+
   SzRNP9lWB1kVze4759iyn6gpoCkJqAViWL27vutKCHcqgRyymUAZRC16p
   aqe6sI3JNRJN4s9pIL/VAdXOyC5BekS3WDfSuOp9OwpdI/NoxoSnUUE+Q
   jY6u+cyd69ZXwISj+UqktjL2fyGA4gDAML3Rcsbg6D6Z6leZLnMC4QAa8
   /fkBVfnZ4pw8QCakY7g/+HAcGUyyjdwUQCsPa1zIP9ni9MRvWzrsoPSEh
   pQFofOTmeMJevg0HrWlYCtEXKtsEHnISxJTj8JWh2yrM/gjYpXPC2W+Jz
   A==;
X-CSE-ConnectionGUID: YaTdgSNKRUCCE7aVpyaHiA==
X-CSE-MsgGUID: qdnzB6kMQFiO1QwLgkqUAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21924061"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21924061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 11:14:37 -0700
X-CSE-ConnectionGUID: jd/H/CXMT4GUs8mJW9ksRA==
X-CSE-MsgGUID: CzZtj4OeTjKG1gYsrb9/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="63169070"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2024 11:14:35 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdw2T-0000dy-1Q;
	Tue, 13 Aug 2024 18:14:33 +0000
Date: Wed, 14 Aug 2024 02:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17019/23490] kernel/sched/fair.o:
 warning: objtool: propagate_entity_cfs_rq()+0x35b: unreachable instruction
Message-ID: <202408140248.c4tdhQh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 909ad0a4afdeff3577ce657881b7668cc8de1c72 [17019/23490] sched/fair: Fix unfairness caused by missing load decay
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240814/202408140248.c4tdhQh1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140248.c4tdhQh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140248.c4tdhQh1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6878:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    6878 |         unsigned long time;
         |                       ^
   2 warnings generated.
>> kernel/sched/fair.o: warning: objtool: propagate_entity_cfs_rq()+0x35b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
