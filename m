Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE438245024
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206305; cv=none; b=jKof4gjllD2cCtAuu2xoPCkXfrWAPOX6z7YaWOy+iP7cYhzzG6dXJBRa4kvHvBfjgFmk/qElo8zJFHbeVRtUx7UNRj1lnE3zwwyyLoB5DIPJHSnR8CDgF8SYo1B7V3YuwhuQHBc63/okxBjJL9n/5q808rQTVtmLA0sVpD1dIzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206305; c=relaxed/simple;
	bh=YkLaid/f5ZBbE3FK7kI/BFGS29koLj0xfzX4vIvDX7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fy3Ln0krzrRoshnbV1z3zNIHYML6KGbxke8pkmpep8zOI3WXnIpj27Z6sBMH7V4KmaYa2YbTkJDoNPSbMWgInqoPbOOzIYFY1nJL/I651VuC8mbAgVJocmwX57iySDsxlQOGNHKjtRh5U26d7aSOVFianq78t57hxX61K22RKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6cPMQ27; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6cPMQ27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744206304; x=1775742304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkLaid/f5ZBbE3FK7kI/BFGS29koLj0xfzX4vIvDX7c=;
  b=O6cPMQ27NaJOhVHNavvBm+NuWm9jBrHIoNJ0qteqeBfDM9NlALkIhoNe
   Dgr5JJZv0VrDGU7FMN4IqDAnl2+UUeiD4fyXQD2vOD+AcwDzv+iNFauyZ
   H59kJyGNeJkYsARBEN0F4Cb2cFF3cOgUbFwgoiKKFXT9J4Sv4aNTsk9ok
   uf9KgyoAK4mIwSLqzvL3Iz38gB9/dVCwLvaBk1n80ghWqPeamBhOIliVH
   y4tqN6umzxlt/Q+nNj5sfWrNZoc9YxNO0LXQbkQMbCJAfjzm2la2nxUoc
   QLACSL7H7N8tcO5DdoW4XRdMGkreocNL2sTNT3yHliFVSheO7f/Yi1tXF
   g==;
X-CSE-ConnectionGUID: z+eeS+iER0qP5Nf1WJGCLA==
X-CSE-MsgGUID: 0PjHwzHRQRaylihLHDJNZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63222863"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="63222863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:45:03 -0700
X-CSE-ConnectionGUID: 7CDf4ticSR6kIIJhVbGOuQ==
X-CSE-MsgGUID: s70EqJbZSmywQk9TRdCC+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128567297"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2025 06:45:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Vjf-0008uP-1E;
	Wed, 09 Apr 2025 13:44:59 +0000
Date: Wed, 9 Apr 2025 21:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571] mm/mincore.o: warning:
 objtool: mincore_pte_range()+0x154: unreachable instruction
Message-ID: <202504092107.ks7cBbF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   332043630ae1e3b726dde819c6cb60a99afb2ad6
commit: 274fe639155078e031602764bfad9217e57d8160 [1571/1571] Revert "Change mincore() to count "mapped" pages rather than "cached" pages"
config: x86_64-buildonly-randconfig-006-20250408 (https://download.01.org/0day-ci/archive/20250409/202504092107.ks7cBbF1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092107.ks7cBbF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092107.ks7cBbF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mincore.o: warning: objtool: mincore_pte_range()+0x154: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
