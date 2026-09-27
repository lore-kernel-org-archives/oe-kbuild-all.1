Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4C3B8BA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536600; cv=none; b=mfH8FMWWDrsJTlZZ4Q9zrkreLNArivLdEyTdxCOp9PJlI+ULO+dj4cxGJfpSQjnHDjhGOMZShb945Iowdy/Ry60U5zfnnNFr6DUIAbDIwwr/3+1iLYBVLcNgRGbCUNwSDntvVPrEZEb4gHg0QbFnHMPzOWCV2w6ZhMbAPOPIil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536600; c=relaxed/simple;
	bh=D9q+NDLc8tbkYbXwiJLzowwz3qZMC91ol4tQWpnzoYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JPNkhHvAVmdwB0AmV2JNl0LAOo43z5EUz4bvDoCnooJxIN0A7orwRGvpmgZOWsp7WZwSFpalgWPSmQ0356pThTyLQtj7ExRYRa3pvDdJc9W/hnD5T/oK663T2g9iOGRandYPhgOx9rVUEEVGTYhGdtF0UPwE51la+W45wB2WRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TO0b73nf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO0b73nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790536599; x=1822072599;
  h=date:from:to:cc:subject:message-id;
  bh=D9q+NDLc8tbkYbXwiJLzowwz3qZMC91ol4tQWpnzoYI=;
  b=TO0b73nfZUYM82Dl4gYyq1WCj6gV8HWOCI20XoU7afRnzo2hU7uKsdQP
   hbxeOcvf+DKE2jP8lYqqIjoK+hnSN7B5nXlhkoxiJAUIX2GphEWFlhDIB
   YFd+GbpytfOAlTGu6J+I9yZ7gdyo7klsW/ym/ShISJl3cBuWG3yyoofde
   iSP5xXkzV1U0byOH40VZTUNPyt+ATjludTpWkWqXiZqsER3b9AerA+vD3
   QMx1Wy7lgzevmsnmirAIzqve0T+3jZb03VISylRGi0UZYDwQ0FG4+fDvR
   42Qb6y7/swfjm1L6IzZNxuSBBpjTSC+zAPd8S03JHG1MnfbBwkJOF1saG
   w==;
X-CSE-ConnectionGUID: agDtjH94SuSSNMvp4xEKPw==
X-CSE-MsgGUID: 8QgKk3ZIQaq+upSAMCtsfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91343552"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="91343552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 12:16:38 -0700
X-CSE-ConnectionGUID: DtoobJlMTCmiByhB/e+1jA==
X-CSE-MsgGUID: XCbXXgXrQfiGb4Puo9zMjQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2026 12:16:36 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAuMT-000000000fN-2uSW;
	Sun, 27 Sep 2026 19:16:33 +0000
Date: Sun, 27 Sep 2026 21:16:25 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for PCI when selected by FORCE_PCI
Message-ID: <202609272107.sLZJEOtt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_PCI-CONFIG_FORCE_PCI-0-0 (https://download.01.org/0day-ci/archive/20260927/202609272107.sLZJEOtt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609272107.sLZJEOtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609272107.sLZJEOtt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI when selected by FORCE_PCI
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
