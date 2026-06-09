Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E4E390CAE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983546; cv=none; b=UfNdMEDWX8LY0YOWjhjj2S9c5JQPDIVx0zipMq/jsRXBYku2KE40mFdLgA8UPe4sUzXvvx8Ne68eaiwt9Vy57AVZefM7mfxlnV40MLT3Y0ylcS6mTbaA8Hj2ZMdH+mB5jUR/510T1yL0l1NTZf0E5BztB5Cdh+7AubxFjrK1JsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983546; c=relaxed/simple;
	bh=y3sP5FDR125vHzc+PELOwARKwmeYJd0mr5pqLGIDA3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DL/DfV6VvofGXlxlrHYpue/KNe2Kil9Ta8YktWkGZ1wVwzFDiYAOKlqVvFA/xgZvU9JkMHGK7pbVnAcqZbiwfDk2ZwZM2AEZd2rj9xvGvqeQU6a6cWhSXO4OdE/tt7UfHs0wFhW7dxI77PzaS3ln39dSPur8qCzbLaAYelGP36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go4d09eE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go4d09eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780983545; x=1812519545;
  h=date:from:to:cc:subject:message-id;
  bh=y3sP5FDR125vHzc+PELOwARKwmeYJd0mr5pqLGIDA3U=;
  b=Go4d09eEY3wxzehRsbYciPji2VTH73MkKCpSeFepHa7CddsNXd+GBEN5
   l6uPyPFMTPQkAbSzKvFyyaPSml7g5GH0l0mm03iyUNE/q1x8Dd/heArXo
   RzNujHnRU7CjDwKAnYJdzeHj9Xae/yHdrGgKtEyi3eVfDvw2j8Oprhjx7
   MXmEEpmboWWwbYY7Fk3SqCv5Mr61ItDAiYNW/zmGPfPcHTTlkRBJjFs1x
   P3E99R1ZEKUZM/8OqollF9bb04BJQXUAt5ljGYMYC20Ge+3Li3faHW/0B
   xDb3khCdxmwxdD4QzKiYUWKSDbcrylI/iYP6d/fny4X6yiDfzdQWY/IV5
   g==;
X-CSE-ConnectionGUID: Y+mTMmeMQnepijaJIPv8AQ==
X-CSE-MsgGUID: 3D9f3m1PQ7CDwdEFIjUqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="93120097"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="93120097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 22:39:05 -0700
X-CSE-ConnectionGUID: QQC+pPM2TFuV23eq9tzteQ==
X-CSE-MsgGUID: BDJaFopzQxe801BddypbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245798222"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jun 2026 22:39:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWpAy-00000000Jfs-262q;
	Tue, 09 Jun 2026 05:39:00 +0000
Date: Tue, 09 Jun 2026 13:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 2/15] .clangd: warning: ignored by one of
 the .gitignore files
Message-ID: <202606091340.Jgy2zG22-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f367aaa511a09de347cd63a1828d5f3b1946ee0a
commit: b19294f308336d6dfd7dd7142d9e75f56f0d6810 [2/15] clangd
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260609/202606091340.Jgy2zG22-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091340.Jgy2zG22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091340.Jgy2zG22-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .clangd: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
