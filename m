Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0328FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739928792; cv=none; b=er6pDYq+Jb6c/qobO+5IAkSefv9m2jpAFqJ1OsalvnjMzZMuX7YfCjkgV+5siTCGSyY/5jsZYcrHM++SRg5IMToQJkMChpE6rSdcJqoEYkMfA9ygMNHbewtSsYQlyqxpnxMUGgaRj6hqZhr9lPQup6jQjDu6Ocq/cJwBL/c1zjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739928792; c=relaxed/simple;
	bh=X4zbK/QK0Ez2LqpwdacqAcpl3Sn52ZI0e1PxAa+MwDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwUdTYNOyev6yKtE0AWlz1wMzv3XEvnVqopg4HvLD3DSpTs8YWzZ3byI6wwG0YZTPAtVnx2t4q+908O1az4QFzeVdQPe2yZhtqV6JeldqoB2vjuTmsFaT/eslv8cPFKpJ5wpp0KfarCbh+n0oNFhrjYocX2UoMJq5OGa7JjiHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLFZmKKt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLFZmKKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739928791; x=1771464791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4zbK/QK0Ez2LqpwdacqAcpl3Sn52ZI0e1PxAa+MwDA=;
  b=kLFZmKKtIjb7uIRI0PSFU5ZqYAS0hdz19QayueSXgNd7ueHeITSrHuUH
   QuBcjTumz0tCU38rLWyI1Hj/1iA/hovfYFIZy8gbB5zZ3wWD3kgPuqeoI
   ZNe01YZpTAxwcemtLu8uxB2SNgjdIcTYyUFz3kDbd6R+OuLAeR7f0o7u+
   ANh7FrczQjroM215xoyP5T5Clzen7XKo6Ok79Et2SQ9MU+stY44FxVtrd
   8XttRv/IT6s8NctVxJWPC8ZFCDZTywGr+jdMvZbW/hY8Rk8iO9HYtbvOt
   I34OcqFf+1GSBhib0TKvJD/j3SUGn2z3NcLwTtxZhPQ+HkMI8QXMpLUt+
   A==;
X-CSE-ConnectionGUID: A37+KZ9BRnefG7PUWMX/gg==
X-CSE-MsgGUID: mCScoA/WQRazqklKaKjk8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40906351"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40906351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 17:33:10 -0800
X-CSE-ConnectionGUID: AhiDzwbYQUar6MuVUcp/Ng==
X-CSE-MsgGUID: K8D2MtemSM+pFwnBcUyC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="145418109"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2025 17:33:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkYxW-00015T-2F;
	Wed, 19 Feb 2025 01:33:06 +0000
Date: Wed, 19 Feb 2025 09:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 25/30] error: no such file or directory:
 'scripts/capability-analysis-suppression.txt'
Message-ID: <202502190914.U5cc0zvM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   3a2f82ad80de301e6111df724680b606dd93ad6c
commit: 9e59b5334c65ccfc953af8312c2b3d362a967567 [25/30] kfence: Enable capability analysis
config: arm64-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250219/202502190914.U5cc0zvM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190914.U5cc0zvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190914.U5cc0zvM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: no such file or directory: 'scripts/capability-analysis-suppression.txt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
