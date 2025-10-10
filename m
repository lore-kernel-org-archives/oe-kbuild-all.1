Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4B3FB31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760068556; cv=none; b=qo4V/dx6i9rnc/k3NGbf/psIkL7t/gCTtE5HtowNyFx8UT41SQmBmmMmfUqxjfEx9gHP8X+b4V/5TeMiKj1E+6meD09vo/lbW3C6i/RSsRvJrnWlfoqIgfhPpLs+b84wc/aWPIIKuIMsjC+lsx7QKy6egQ1AFXmbOZgx1a2ZHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760068556; c=relaxed/simple;
	bh=4QX0REg8wScugCmpmdKPYZiB8BCKgqZ+ZIPv+rdIcLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mn6x4jYxszGymLzLLJaE/us7moKhJxAODaa50IRX/AHfzJPl6VRVFC/BlZyYgSqc6a7jFVYK3AQQiDcnEvwEc7gYwwrroigAYdzh7ZWdXvMGOEJhVqsFGtaOWiyj8DXRGhd/d4L+njjmf61npRfOyufp9V5SH4AFJ6TQSoSSNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMCuiAoY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMCuiAoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760068554; x=1791604554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4QX0REg8wScugCmpmdKPYZiB8BCKgqZ+ZIPv+rdIcLQ=;
  b=AMCuiAoYsK+H5fG9l165cLB+qMcRNObbJCqsLqo6yowK94nfiuZrC6yM
   2J0D2MI8H2VPVG7OMZOKajeJEvuvtHK9G+bAejeoQ3cEaHIBXpKf37sAj
   +bkCMdVMfUZYAsxPCdaO50X20hRqARqPovkr37RMHAsmnCamDFF7ODzGt
   /P1N2I6T7vMyMQ0NWan5kQ1EiaHY6Kb8EbmZiJouh6z43IpY+VGJtsjNu
   8RfopeGx40C5C2z+SzELVKGkxhqtdQjKDRBe7Z98FqlACdTLiJzSYwzms
   Eiu4Gtj0C3z7gzKf/dvHbYW52HUZHe6cCAHu9RYZamx+mLf8xahPXnFmt
   Q==;
X-CSE-ConnectionGUID: FdNZIy37TpGgMckdTERwiQ==
X-CSE-MsgGUID: wD86LQc8Ss65EHWdh1rpuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62383799"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62383799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 20:55:53 -0700
X-CSE-ConnectionGUID: Y+BMStA5TIuieAJhHP+89g==
X-CSE-MsgGUID: dSlzwQPFSF2P2yyahDMpOg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Oct 2025 20:55:52 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v74EQ-000259-2L;
	Fri, 10 Oct 2025 03:55:50 +0000
Date: Fri, 10 Oct 2025 11:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/shrinker.c:698: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202510101122.yEImm9qY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   eb81fd92a9db00ec051630a8937aa93319a08d2a
commit: 1e63c23f99e1610c8c483368df6922ec9076d95a [1/1] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251010/202510101122.yEImm9qY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101122.yEImm9qY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101122.yEImm9qY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
