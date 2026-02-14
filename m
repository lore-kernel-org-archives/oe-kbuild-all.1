Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00623F40D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771036023; cv=none; b=FIrfDdrhGdJ/bK9lAwE2Y0ndWGSCxBtq1blrDlTopBEnQSBZ1SXUb+i3uMpYtQDlpltZv4GB9n3aSjfPR6Rd2b+IX8spno6PihK5LrZrnBenV8U/E+VPZQ+a0HEh3NgMbnso/dWnx7X00aSSabfx8eO5biJwRVbTeqV7PLCmavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771036023; c=relaxed/simple;
	bh=6rdlOHZy2YC+olohoiQL+n+WQtM0h6apCL3y6owWulg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqd70xNDpTULSaCl76n5joY3dJ7qDViYKcLhEt+VSWuwCuIiSvrrPSCIY/Dm5npIka7AtfzdGaBeywgAgTBW3oGWsR794/cmx3LvoeMaPBu1J9WdplOFLi+Q4D7VIoJS8OW22MrZ4tYmb9zuQG1Gvy0TWfF41oGEmqGAtZDNjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5igBrfM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5igBrfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771036022; x=1802572022;
  h=date:from:to:cc:subject:message-id;
  bh=6rdlOHZy2YC+olohoiQL+n+WQtM0h6apCL3y6owWulg=;
  b=c5igBrfM+ac+g1NhDZ8Lkx9nwBd8mm3LsG4lZU8cqqX0orQ9X2kudONJ
   5cwOy4irqXW8pU5L6JulvA6K7qSl+KKdpW4gmCjhWSOAnXmNKcDLmBEGb
   0b5YkpbHQhPAuAwsXdzRal05panvT6100UUr2Qta2g+Na22Qkd8LDJHL4
   /woMSGl7zaCLS9o9m7/kZByORQ8uHWxXd+VYryWIclPIUgBWskpyNfkaQ
   kL33cYdHdsZhyrj0ZqI+Gmkuj8Gn5v36Z+M/YNe2ARw/x6W6ZPdz2cWoi
   axb2zC2ZKQlipDlLGjWlFs1RFABowmpRYOFkCyq2Dg5uuNYltYz+H8LTj
   w==;
X-CSE-ConnectionGUID: EOey1AbyQcWy4oDllX2SQA==
X-CSE-MsgGUID: Zt6tLRS2QGO9D80eMxQEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="75842162"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="75842162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 18:27:02 -0800
X-CSE-ConnectionGUID: rKWQ2zcpSf2cvok4Mncfeg==
X-CSE-MsgGUID: od2jKhy3RkCygy96xaj3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211737193"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 18:27:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr5N4-00000000w3A-1VOe;
	Sat, 14 Feb 2026 02:26:58 +0000
Date: Sat, 14 Feb 2026 10:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 33/33] Warning:
 drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in
 'ufshcd_prepare_utp_scsi_cmd_upiu'
Message-ID: <202602141024.wKBulsuq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   51e22b8a739901870e0f0f4f06212388c8f8bab0
commit: 28c108aa56a37d8dbc634378b7bc828bb3465f88 [33/33] ANDROID: scsi: ufs: Add UFSHCD_ANDROID_QUIRK_SET_IID_TO_ONE
config: arm-randconfig-002-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141024.wKBulsuq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141024.wKBulsuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141024.wKBulsuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in 'ufshcd_prepare_utp_scsi_cmd_upiu'
>> Warning: drivers/ufs/core/ufshcd.c:2843 function parameter 'iid' not described in 'ufshcd_prepare_utp_query_req_upiu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
