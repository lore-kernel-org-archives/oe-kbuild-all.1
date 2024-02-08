Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C4679F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 04:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707367291; cv=none; b=qJAFd9xkzC3jW+R2pcUSDjsNwYqXja//uAZzvwfT7bXPBxyHGIWMF+Uwj3JgUuYHekwB1tSGAKuhhhu1muR9c0qVSPMsDk4YAkDw0ON5Hfg/qEb8Fk8DC/j/woVvQ+xvQgSzi3erw7IClapaDy4olRAQpdLSW2JKaeX0LgeX4Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707367291; c=relaxed/simple;
	bh=eN1wroABetsmoZfuQrt3MROBu185diFJdgXRKODfuNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGc8OgLMhL2IruFgX3fUCKdkuK50Qo9+Clmly5cR91wWRRWZZLc14RFNtLNaMtPTIBmJcDzMQ0iFbGtfIVoxwgdac0b1MZJ229yJJGKKg1BfeWent1CUkpms8N0NtbZ5nXVC1jb4SYaAvd/zhKrNj1F4yO9Lx+GHFnBJdakU1cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmcUG0KU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmcUG0KU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707367289; x=1738903289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eN1wroABetsmoZfuQrt3MROBu185diFJdgXRKODfuNw=;
  b=YmcUG0KU+IhX/Z2Mgr9BOVV2zJag4zBSox0iJHlhf0YWsuhydQ98JRdE
   jpOr1MZfTmwy14Z2FQSUU+1OGCKnoYCD0PwaoJIWsAWYJLKTfJg++VPso
   jpbguGXvJohW0XcyiXzluBxHAeCp/kGgMI0l0/xn8A6dyx1oelY7ZcJNR
   dtxaaPWdpBhfnCNRdMU+p17bzLUAQyQJUEA8g3iCIPhZudmivwJuMFgIx
   O0ikWtJRjJtrnTe0AmPyPXpjdjnO1qp3DC9thTKoQCb7zMwJjRDFlIm/h
   dr2bwt/CqupcKURTdyDs6bttPx5iN8DfKNdNXRtMcOhJoTkadYbmFJ9bx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12222147"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="12222147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 20:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6197348"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Feb 2024 20:41:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXwE0-0003Ma-2O;
	Thu, 08 Feb 2024 04:41:24 +0000
Date: Thu, 8 Feb 2024 12:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3670/21625]
 drivers/staging/erofs/.tmp_unzip_vle_lz4.o: warning: objtool: missing symbol
 for section .text
Message-ID: <202402081256.pk3mFDA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 2e59f7a6876bfa6adca4ec9180ab3945e6ede7e1 [3670/21625] staging: erofs: compressed_pages should not be accessed again after freed
config: x86_64-buildonly-randconfig-003-20240207 (https://download.01.org/0day-ci/archive/20240208/202402081256.pk3mFDA1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081256.pk3mFDA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081256.pk3mFDA1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/erofs/.tmp_unzip_vle_lz4.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
