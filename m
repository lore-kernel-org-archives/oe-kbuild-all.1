Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2AA24169D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766269491; cv=none; b=B5OHeYKOnBbNFSJ6SPliuyO/x7waAQchbsBRprjgHBl3zB+dV+ZmhyWCPJZm/9FxgPyoEKkn0PjPvSdFz7gIbFjoPWIpWBJKhlOw4ApnmjmcxfLS6xTRSvsMkBnAlVwFmHOZgW68K5DGWAhUi4hukReHd/byYTE+eWRDrlboPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766269491; c=relaxed/simple;
	bh=Y8scP3DyujNb4bMP2ouQcGQHIEDvHGJn2I7IBUyCNN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9wpsrGZLY/111BXFEgd7KIhBtumtryXJy0maRz/BdUyzXYHEKMwP41bNcxglyx6oGtmevVhTc8e9b6kv2h2J8EH+gaZZHXmALaR27TrmMqF1ggBV/dbOwWbiUy39pTZHmXXynOGAYKEzdMyF/mvN07CLfxbInY8ENc+9eALmho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwk11Wci; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwk11Wci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766269489; x=1797805489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y8scP3DyujNb4bMP2ouQcGQHIEDvHGJn2I7IBUyCNN0=;
  b=mwk11Wcij9gvcuxHdhWufzUf9iQl7uDcDPwWnDsalvWbvdzifCeNjYsF
   XY0zHAnat3Sh2WiBhawqOgSZ3l3yEvfQksa3j7anVcca1R2lqlSjKtFGD
   WCueGOcOK7v2+23V3S8xIph14/xxCoYqCtjpzZeyAuC6lywzhMbNDQOem
   WWbDjy1fUqlYu4UwlYNaduZ5WtUR+H5QvbZVKf+7JDF8jNdbnpxd7JWzt
   hqVzBu/QVInSYTRxYqdjFZ6Wt5uUBUiRzoskDAl85LmeE3FRXR9vC3qrt
   vuwIra+PzQfztv5NzHjaLUGOEtVIuyEMoeBCOWc2f6rouTuiGtbKkKibX
   Q==;
X-CSE-ConnectionGUID: +LbDPzNuQdGDqAoxI/tjMA==
X-CSE-MsgGUID: FXswUUiLQhOeNzNdTOlcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67182226"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67182226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 14:24:49 -0800
X-CSE-ConnectionGUID: TxcHRa3HQg2kLb3xQ5S7Lw==
X-CSE-MsgGUID: u038YBcERRSG7tMh3spKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199427794"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 14:24:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX5NW-000000004nq-0uqn;
	Sat, 20 Dec 2025 22:24:46 +0000
Date: Sat, 20 Dec 2025 23:24:31 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 124/131] Warning: kernel/sys.c:1998 expecting prototype
 for sys_setuid(). Prototype was for __sys_setuid() instead
Message-ID: <202512202315.F7JIUEaa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 5ba9ab34fccbe3ea9a4b9bedc9b54211d613ac3e [124/131] kernel/api: add API specification for sys_setuid
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251220/202512202315.F7JIUEaa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202315.F7JIUEaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202315.F7JIUEaa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
