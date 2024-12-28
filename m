Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23F70813
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735369707; cv=none; b=k33AbZOdVx0XijPlMtGqEShP6n0HyaJQId2RekdJL26jOByUxLNMRXmnb863pfJ7dXLwmoUAzwXlm+wHw6pKHvzvs8aGPl30PmpFdlYj744rsZZCiE/EKWDSqOAP6suHEL5Ss1JPXb+5/02Dy//GKSdobEfD8kEo6W9Mzp7pRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735369707; c=relaxed/simple;
	bh=OVVN9oO8jmlpMqlSll+79CCefWneifpWWkklz+huGqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D36B/+HpzMjtkEvEGnA1GvTwXpJvTTbD489Ux1aOlFEDGW6mNqZjnarPdGs/Kr/vuAmgJPGfTaTtogkyPhAC/O0x0hfssHgoWCIeX22lPE9Mu4o4brzkth+s1gfSjIANLRRNUXUJPxu5cZi/ipp7ax80SDnUm80x7+39VwZXcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp0RG9HZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp0RG9HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735369706; x=1766905706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVVN9oO8jmlpMqlSll+79CCefWneifpWWkklz+huGqc=;
  b=Kp0RG9HZfLffj1bkt8yKaCKzPYdjPbMIviGzhnvZWooCpS97C4sffNEP
   ZxcOenjGjMIPyw/ZzsJH8CU1apGLEaSdS/maWRh37HSXGbRyW6p9nd+Fi
   gzk1Pd2gCOdhA3pvSf4H9qP2lSXErW9Mi47fX+/KHthKEd4JD8gwYytyi
   1Lu14rOrYdzqx6rRZbR5owYWyMLk4dCBSn272kunmR8n0icbw2oiEbaRb
   wSqWDB82UEodlqWyY3dsTwpYyX6OQphwsH8DYFdY/bOEdBT8qs5UA3hrh
   1vvwREjbmZP96FfwhGE9ZE7omBr/+fl+u5D/tH5GIEl13ffaVps8QxJhR
   Q==;
X-CSE-ConnectionGUID: eZJnpCVkS5mUfG2/RYQfRA==
X-CSE-MsgGUID: dqLOlG1uSka0dCLn8gvdLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61124820"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="61124820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 23:08:25 -0800
X-CSE-ConnectionGUID: 4M6U1HoTSdGBn+AsiXH5wA==
X-CSE-MsgGUID: OItCsm1CRsa3Y3QmKE5JQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101168436"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2024 23:08:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRQvt-0003vQ-16;
	Sat, 28 Dec 2024 07:08:21 +0000
Date: Sat, 28 Dec 2024 15:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Daniel Wagner <dwagner@suse.de>
Subject: drivers/nvme/target/nvmet.o: warning: objtool:
 .text.nvmet_ctrl_state_show: unexpected end of section
Message-ID: <202412281523.JssuvINm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 649fd41420a816b11b07423ebf4dbd4ac1ac2905 nvmet: add debugfs support
date:   6 months ago
config: x86_64-randconfig-r063-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281523.JssuvINm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281523.JssuvINm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281523.JssuvINm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/nvmet.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
