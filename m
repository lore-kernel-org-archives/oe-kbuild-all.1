Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2524B256
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736598239; cv=none; b=A/lQq7ufAAfRBMfs21LQuR7ZBY5//Q/PETNTEfj1zCQA+VmCTPK1VHK4PF9WX7yRJODf9LkA5dFfdJD+x0Jb/C/HfV1JWr96KAhbwpTxwEW49VozrFp/MluVZzoNZQW2NuHCtEepiKB2Os9j4NDuYAWx+FILWU+io5hWrkYZKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736598239; c=relaxed/simple;
	bh=wKJLpIAWhCXSUdQ0OYeiUjAIl0krU3mZZwO/KrMbPBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OJpZEXpx0QXasqQqnQ87hrkPg6kMAPaiIDcvmROV1eJbBCNG35I+0v2Wbn4hKZlfoH7FAPwk9J18grQA/S0RizazX1LrDfW2lbTqSWE1J8JfTz/lRcLGSi4zdEbA5f12ByPFc93JB+oZn41+PE7pCXc8QlDZk5zDMjoEgPt0850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ28IM5l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZ28IM5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736598237; x=1768134237;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wKJLpIAWhCXSUdQ0OYeiUjAIl0krU3mZZwO/KrMbPBA=;
  b=MZ28IM5l2yBK5Bem3oRFkHTzm8YdEjMhec0WxL/ABjj4PrKj+J4+wvJz
   w+HBd4Iry9L/70bVUF911NqvBlVVmnLNcmbsJOG1qMkYwQW3EOluxbfOA
   yzDy3tzlZTOtvjEem2AJVr3vS86K0HZkD+Fu+g8twKy6APcFdgkaXmGr7
   3jN0L5wQ5IJ1JLf+SS4g4mymbpdUBJ3wd0kA6q0WyqCZ9jXtuOJqmNg0W
   XBH0ZAyTer/6Kv7wziQWccJOGrvcqUq/VhEOqqsCPkLCTfMghHDcB1WQx
   HeVchSz7SyXVNcCSRa0izWJQiIPqTECXmwTDJGrv3jiQDAPi8/WTihs33
   g==;
X-CSE-ConnectionGUID: xjxBe/SiQxWf/KvDMrt/Ng==
X-CSE-MsgGUID: 5CUMcMkNRdGRuOpyQsCPiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36772691"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36772691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:23:57 -0800
X-CSE-ConnectionGUID: 1MNJ/dxLS7arNXhBg7KVeA==
X-CSE-MsgGUID: 0En3GR22RleGxjyvtSK7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109094741"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jan 2025 04:23:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWaWv-000Kcj-34;
	Sat, 11 Jan 2025 12:23:53 +0000
Date: Sat, 11 Jan 2025 20:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: 1534428646@qq.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: kprobe: fix an error in single stepping support
Message-ID: <Z4JipgziMl1v_5lO@244b91683e12>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_4B60C577479F735A75E6459B9AEAB3F54A05@qq.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] arm64: kprobe: fix an error in single stepping support
Link: https://lore.kernel.org/stable/tencent_4B60C577479F735A75E6459B9AEAB3F54A05%40qq.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



