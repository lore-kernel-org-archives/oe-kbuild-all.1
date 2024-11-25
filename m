Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2A2500AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732510562; cv=none; b=LPNOF4zHHllVaeMVOex2qPSUir8WjNfG30RcrossVQYKq1dtM5WxvQsjs7ZpVqqpft7JYcbRP5PRIe8A3PFT3spdH7EgfNnvMsyUE5BEUvbRxBNgCnpWs4aoBT+MXpt8Z95BL5BVsyhEsFfbEW+TDTZsRjDa7KvdzaAx3nJvmSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732510562; c=relaxed/simple;
	bh=Cy/lqcI3Q3bIyEX63rwPaqT6UV7dfl8SBpNKOwZS6Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLnzhoE0QW3KxIOif0ZUOQWxf6GuLGO3uf822NSPfqUvo/uLJgM7q62AZCq4Jip+R+OLGBOGVH7G0cjJoI4sIxc/ieeB4IqoI7nrtIUQiqbuBCRQ07ILHQuuGD0BV5Jlx5pC7vsHm4s2GayVIqi1plW93dPvSpyqUW022/wBrMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuJBcnsL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuJBcnsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732510560; x=1764046560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cy/lqcI3Q3bIyEX63rwPaqT6UV7dfl8SBpNKOwZS6Yc=;
  b=EuJBcnsL5FApTWddMgviwtZjzTdY8fkEt2aMtF1H//9dVbObWjQMkQTh
   bOmyDZWpYTnbkNex9E+HS3BJN3rC8cC36u9td0PMCr5+SA4sX+JSassut
   as6zS+bnNCWNegMs9M0qZBx1h1VWwMaE3Rq/fivajIRZljjUuJr6/cXI3
   I/NNOnj9/oXVYGZcaQLlxWlt67M1d1/l8iMdYZLCAmfITByYu8ejpYcek
   lcd6DTZMus1UsMpTaFyA2GLb0GuPs8xzoy15W/UXpbxgv5ZnYzNsR84tQ
   Bq1D++t3IEOo9Ui67ZbvdW+54NBhCZamCBPokObzobABaZZlHhoVoXfDK
   g==;
X-CSE-ConnectionGUID: o6p9O3L7Q4qvgz5SDelSOg==
X-CSE-MsgGUID: a284AYhDSjyBSNjCyjGdVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="58004473"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="58004473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 20:55:59 -0800
X-CSE-ConnectionGUID: aI0VgnLZT5WwGGRLj3nIfw==
X-CSE-MsgGUID: SzpUGDT+QOeDPvLIig2WHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95560826"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2024 20:55:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFR8e-0005u1-1G;
	Mon, 25 Nov 2024 04:55:56 +0000
Date: Mon, 25 Nov 2024 12:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 10408/30000] kernel/kthread.o:
 warning: objtool: kthread_destroy_worker()+0x12f: unreachable instruction
Message-ID: <202411251255.qCWTXglP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   fbf9853a3c7e6b840268e383293c967b267c31c7
commit: c797384edc967d42ee00e3cafaf2f20a826cbe45 [10408/30000] ANDROID: kthread: break dependency between worker->lock and task_struct->pi_lock
config: x86_64-randconfig-004-20241112 (https://download.01.org/0day-ci/archive/20241125/202411251255.qCWTXglP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251255.qCWTXglP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251255.qCWTXglP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.o: warning: objtool: kthread_destroy_worker()+0x12f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
