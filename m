Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293E27EC7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 00:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580832; cv=none; b=ZbdPe1Kwnc7OkcsHcQ6CPin+1Tuyx2FR3pY909Xt2glhMoZipdgvs/5uuwDx9jR7dPsHWjemHbMBRHhXJYLYuYERj25fy09qs73fEfrIv5ofvapE8gh7ytgLcP8cLcQskcO5fI3WZsetgxfVLTQ6sHJ2xmpkdgpxYTCX8n+423E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580832; c=relaxed/simple;
	bh=3QeeDCQZi/5vJOoJNoyriSiEN34jRPTQ35UTa+pI+vo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZA+8B7Uw1GKOD9wFWYUh3KdFCYoR0nIwh3GNXQyJ1vlpYn+ehZPx29hmWrdOAh1FAFNxy3y6gkW0AzuzDROgZ+sZxMA5BXpzUbfqpbySfTieu/lk8yNwQ0SMoR60MtXOFCqkOXmDsFuyMp6EEX4OsjvnSIBbvjz7elz4+dM1TMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bczsdzvh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bczsdzvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786580830; x=1818116830;
  h=date:from:to:cc:subject:message-id;
  bh=3QeeDCQZi/5vJOoJNoyriSiEN34jRPTQ35UTa+pI+vo=;
  b=BczsdzvhVUAy+siJH9sa3VpIaa0hPAp/xtV7uMe9XO/gFcYmy6RwlU+T
   Tsp9cWEvUjSYPL/maDVnUfLfyVWCsdBMMJYDAWIu1d20pMOgSxgLiawho
   e0rxHgyuluqUID+7LgiOhM+wfriykoLndlflY0THFImvYt2HS5WW8v1WS
   037dOTzF65BzN0y9P0T4+SvexSz04uJo+tB+VKsxUeeFw7g5cEUc5x5sz
   aPtNs4FhiQ0xyyIgGRUqpHv7baeEtyA9EB3q1g5DPIksjdI4Gxk5gtjyo
   QH9k2tl9Q7iGyPKAL5Ss2z1w0YBALMu7ttWUjms+QmMLBW9AgEGiRmqMN
   A==;
X-CSE-ConnectionGUID: U5cwZ7KJTBKSmZUlNpocoA==
X-CSE-MsgGUID: Shga+yMTRzGeuL+s6NdrRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91026058"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="91026058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 17:27:10 -0700
X-CSE-ConnectionGUID: ErWnlPLnQ5GOgqWZbeWz6Q==
X-CSE-MsgGUID: p4nphiDFQ9azGZh4fzaCIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287244593"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 17:27:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJHl-00000000SHJ-38at;
	Thu, 13 Aug 2026 00:27:05 +0000
Date: Thu, 13 Aug 2026 08:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202608130852.EWkFnOwo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   10f6d538c651ab6dd44bb8679c8e2d6522f13a68
commit: d05d941c20c9dbdbf19c7935bed9b00eb5b44eaa [1/1] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130852.EWkFnOwo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130852.EWkFnOwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130852.EWkFnOwo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
