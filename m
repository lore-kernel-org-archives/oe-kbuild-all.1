Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107E02FD7C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130120; cv=none; b=CXzjyeZ9tYsfTeHgtrqSHpqoztEQGCrtxrj4iMj8GhQ8Le/uV03OLUx+z6rFkB4H38RzG2JDC1IgqltYMGPKrlESC2YdjESdD8e2gq9DdhU1SQigR9xGoDRmIg7vflwaCF+WwENYQsoV+/JeQhP1LEutAMR4ACXFjQMtslzcrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130120; c=relaxed/simple;
	bh=Kzfj8ob37A8WFRiJH1KeWN40F0LZkxqAQ/jPmv4py1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjQyVJpfKeKBC/ssF8v7FRCKt82jBeTYupcjK2Tzh0wpc12PUkB7ZnuOQvoRIS+Z0UIB8Xk/5NO5M5mKH0pLSCrwgWLFGP+YpgtYKsURGy4hTYIcWj7FXHYq+hql5Ix+e9sBrzl4cSWZ/PqCr5kkIw8n756+ptQEr2PHMJZ7JLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgQBtAQa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgQBtAQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760130118; x=1791666118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kzfj8ob37A8WFRiJH1KeWN40F0LZkxqAQ/jPmv4py1g=;
  b=NgQBtAQavVPXS+0beyx8nB66S3uvg/8WkVl8bRUF2h0APyJcTqX8CfZ/
   gI6v/uYvoLQVc78ippGeo+ALypyACBP+mWPoc2iriyp2YvdQCp7F4ay1Q
   tVpqPDPMgwfk19qLj2xgSw3z/OkC5jOG/3KR693DHlpsMhKs84yoOKSdi
   PJUwcYEq+elUYVhnspB4b5p3hcU32cqHWXQmlo0vzoanJwS3j5GQTrkOd
   v4SjqnZidYNVW/HvZu9li6gDmeLTWYq/eLWyMkkrr0rkUjYAyyjbY3f6h
   zG9LaGo1tl5Ve1DQA+eBqSA7hnYs7a08fA2BdXscveAC0zcL1ulNWdR8l
   A==;
X-CSE-ConnectionGUID: SBeNDEDoRIqTiUYuOa2VUw==
X-CSE-MsgGUID: fReyC0+aTKOEN8F01/SadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="79995466"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="79995466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 14:01:57 -0700
X-CSE-ConnectionGUID: ayFROgIVSW2kQV196l2T9w==
X-CSE-MsgGUID: 2E2/XTFISziuDCdRjmkswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181829042"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2025 14:01:57 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v7KFO-000000008Nd-0h8Q;
	Fri, 10 Oct 2025 21:01:54 +0000
Date: Fri, 10 Oct 2025 23:00:56 +0200
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bjackman:asi/next 10/50] htmldocs: Documentation/arch/x86/asi.rst:
 WARNING: document isn't included in any toctree [toc.not_included]
Message-ID: <202510102342.LNRYeee4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: afe273d54cc0dda267aeaf0a48c6f9f4a5dfa842 [10/50] Documentation/x86: introduce Address Space Isolation
reproduce: (https://download.01.org/0day-ci/archive/20251010/202510102342.LNRYeee4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102342.LNRYeee4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/arch/x86/asi.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
