Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63CA41C94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 02:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732761218; cv=none; b=tXmrwXMj9KVbqspN0My2727xLOPfMmJmOMoLeQoZMDDLQHXajM2qufjTcaxHWm1NWAzWakg9MWwcx6kxwXG+zPSG/7VOBmtQz/RNfzqQryprZltql4wHksAe+/XVQQkV3qTlqmXzOFNbjVFvsCPQsR2+tYzfonF44l6Cf2jPuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732761218; c=relaxed/simple;
	bh=yaLcgb9iiIhFTvkKtkhpr0Kc5d6x+ysXpHIxlpvzuao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+ZyxZDrab3NyZSRE0dlK++zjwJzJ7TGARvwnz2yFFy6k9ZbzpjuuzSkso/zT3B3vk1hmNanZ8+V2/IAwzUT/3n2cvccTLIwLwsWZoKQ7+q7t32ja+Pp6JVbF+vPpy6QWOXVuHLvOfiMp5fI5J68PFJmhTvnbqO0/TRvb9XrBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvSAHTe6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvSAHTe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732761217; x=1764297217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yaLcgb9iiIhFTvkKtkhpr0Kc5d6x+ysXpHIxlpvzuao=;
  b=CvSAHTe6o19xMrj+r44dLK9ed2WcYo0dDEacZMcJwv859lEFaBpUwSUC
   j5u4ssgJxGfTP7J25HVWSVJHdKQHZg8en1p9pOdlUGNiuW7M2aKpvzYzl
   vcHTtoTk+wKWOShMwPc5XOZg2MwQfwJ3n2f3iI/pKv3Vz7tJtR9QDirkR
   krJEe3s3/94SD/bTHMh84tOYnyPaPElxHWg/+vdcSrPI+C3I14MUJ8hBH
   zk07VlAzRQutRPvd1lrg8mnkDO7j0Foq6ALY5Tan0iMh+L3U6tuDYPHTt
   JEf6Pwql4HNl97GrmDzSof/r/4b2tyoexnFQy0aq0PgUOK43c9p0oFw63
   w==;
X-CSE-ConnectionGUID: B8+jrJehRLihrX+pNV7d1A==
X-CSE-MsgGUID: tSxBepy2SOaEgqPtBPdR6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33129872"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="33129872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 18:33:36 -0800
X-CSE-ConnectionGUID: KazFFJy9QRmOfydXqr0WqQ==
X-CSE-MsgGUID: 1ShjwyfQTG2LHtEjE5ZT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="92431882"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2024 18:33:35 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGULU-0008iZ-2F;
	Thu, 28 Nov 2024 02:33:32 +0000
Date: Thu, 28 Nov 2024 10:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1308/1308] arch/x86/mm/.tmp_maccess.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411281042.al4D2CD2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f763890ac28e4d36527b22a830c5e95cae55470
commit: 22058d2bdaf6b0526395ceec2736c72c3b5f435a [1308/1308] uaccess: Add strict non-pagefault kernel-space read function
config: x86_64-buildonly-randconfig-002-20241126 (https://download.01.org/0day-ci/archive/20241128/202411281042.al4D2CD2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281042.al4D2CD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281042.al4D2CD2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/.tmp_maccess.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
