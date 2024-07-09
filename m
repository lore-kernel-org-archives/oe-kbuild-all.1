Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69D148FED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516226; cv=none; b=Wea6qBFB/xviLBqI9e66VEN40sxT0Q1SV13ZOWixih9I8ZgBDu/07/8we7q/5f8DA3Jfw6kyNYZDTQeAbHRNnNCUFlS0GH/KLsU1YAU82/4xIzfQc1GGiJPj2V4X5HLwouBW1DWza8XL2WbP3c1GwIiS04xvt3w3N+oaJNPMJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516226; c=relaxed/simple;
	bh=aDvMI6Zbjnxn/xiT4z1jQRuTrGiL6Bs4x9GKC9qaZxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcUNZOAk5s6+tMLN0GmL5AxmtqsQx66UHgsFtvg6eqIzD4NuI5JAg1ha6L/KhhYzb61TXP+nGyr1q4x8KG3dUs2WboUfX1zVvReDPG9NQMaLvL/76nTmTm0Lt2V+xbkOffdR1hB4DZbODgiLItVvTIjpydGaQw9enjug06a2ff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vo/8Fyqj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vo/8Fyqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720516225; x=1752052225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDvMI6Zbjnxn/xiT4z1jQRuTrGiL6Bs4x9GKC9qaZxA=;
  b=Vo/8FyqjvK3Fpu3z2PPd7URTmEUO9Eamww2zSYe2vlyXQlk4JLRpbAUZ
   k6qgq9h7PO6U1eRjm0Pu74KFYtydbPj8hLKzgpKqQ0GdGbyjEhcKhtp7a
   C+d9/HopDv/qytKXZzsKOnOa3McBhUQDzMr3SmeS9gsJtRbX6eU4CUluy
   ouQ22x+zHaW+1pmo5F/cIRTtUjwRttUDzizLMjHucShROQH/EFPp1BxVh
   yx8IAhPbA/lcHYtnYz1kNN/F97eN/mV0qi+IdBJ/ZNHCGUoyfKVAIPpi2
   UXre0IeSt0RA89a/61J8SkySG9ho1o8xD8yBVFreDTK77s84akmuxnkNp
   g==;
X-CSE-ConnectionGUID: iwqx+UdjQmWnZmPJNc/KdQ==
X-CSE-MsgGUID: qRS3TGqyTcupx19z66cyng==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17594503"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17594503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 02:10:23 -0700
X-CSE-ConnectionGUID: etx1EltMQZmTSZwtrTC92w==
X-CSE-MsgGUID: 5Xk+6NnOQdqChE659X7oOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48221202"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2024 02:10:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR6ra-000WVA-1I;
	Tue, 09 Jul 2024 09:10:18 +0000
Date: Tue, 9 Jul 2024 17:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 33/33] powerpc-linux-ld: cannot find
 MEM_KEEP: No such file or directory
Message-ID: <202407091730.tskvf9ht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   63f3f6cad1031067fd6b92f319a1366565348b94
commit: 63f3f6cad1031067fd6b92f319a1366565348b94 [33/33] init/modpost: conditionally check section mismatch to __meminit*
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240709/202407091730.tskvf9ht-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091730.tskvf9ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091730.tskvf9ht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: cannot find MEM_KEEP: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
