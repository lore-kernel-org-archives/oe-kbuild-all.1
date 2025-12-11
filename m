Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7B2D192B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765480494; cv=none; b=BMT8Kene9giMQhHxcIEc6iMYBG3hGUsJ0FdDZwF+5FgAdFLdrGax/VfjKmYT61VK5szzcEqzGVJZczoIfPspiPMqj456GbPgJZku02S6lWHHORN9YVTh6Nhdk3hmVOkMkU/qmGAGw0ygaA1K/HswI4DVxZCbaQUtAd64jiKhOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765480494; c=relaxed/simple;
	bh=j2H+6jSGGUqzEbx0dmd77WfQS9+NusvRmbWBxEZn19E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RnzCHZ1eaF0NgYzwkQ2uhmxue5CHeu5y++9GTbLwkgnQ/94TNlOBM5GNrmKUM+vnzAGU6Z6/K6xq2rR1TLqJoChALIDT1OTwTpBJP1FKkaUxEiPhJZODrm4n+GmwN2hq/shq//ghX906lCaGQRHIQYlAFrgoMcHLdt2bDBNIL14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebmXpAq8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebmXpAq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765480493; x=1797016493;
  h=date:from:cc:subject:message-id:mime-version;
  bh=j2H+6jSGGUqzEbx0dmd77WfQS9+NusvRmbWBxEZn19E=;
  b=ebmXpAq8SXYPS5RDBFbTr6VtRAgvXe1Hv3qaZ0ng5fu9Jm0XKEFZJG2i
   CQp2Qa5Ytm6jzr9s5xn22YTxvsqqZveC5+K2W/Uwlld6Gjnxmdlf4GMRY
   gttjpX+p5xBe1jVxToybLbpUafB7UBLN3/kiqMFM8C84pwDZuUBZrAWA/
   Qu+A906G8Qrtk90R/BNJh7x2DzYvn2rhB2OxJBG684H1tu7L+Wfc4sO/l
   hDtUYW+JLl8V4a0YsfX9G9SA6SuAVwTCaWbscFxcRgCjZbp3tCWyu0EwH
   d6SdTklkGWMI/8bnOCAot62MWK78XABp9NLGo2gpDEtGXNbqeTEyfHTYu
   A==;
X-CSE-ConnectionGUID: Z3rirarpR+iS13cLtCtOZA==
X-CSE-MsgGUID: 5JM6BwdcSOuR3L7OXF9URw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90124222"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="90124222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:14:53 -0800
X-CSE-ConnectionGUID: 5PfJvtWVQYO+mKRVl+kNKg==
X-CSE-MsgGUID: GJiwXie+SgGuAy9rkD7zaQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 11:14:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTm7l-000000001BM-06sE;
	Thu, 11 Dec 2025 19:14:49 +0000
Date: Thu, 11 Dec 2025 20:14:29 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kishor408 <kishorx.buchi@intel.com>,
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.12/emt 9/9] xdp.c:4:9: warning: '_GNU_SOURCE' macro
 redefined
Message-ID: <202512112044.i6z4DzOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: ce6a6d2988ee17b952e2ac9e1ae1868ad093e777 [9/9] tools/bpf: Add xdp set command for md btf
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112044.i6z4DzOC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112044.i6z4DzOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112044.i6z4DzOC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> xdp.c:4:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       4 | #define _GNU_SOURCE
         |         ^
   <command line>:5:9: note: previous definition is here
       5 | #define _GNU_SOURCE 1
         |         ^
   xdp.c:92:37: warning: comparison of integers of different signs: '__u32' (aka 'unsigned int') and 'int' [-Wsign-compare]
      92 |                 for (nh = (struct nlmsghdr *)buf; NLMSG_OK(nh, len);
         |                                                   ^~~~~~~~~~~~~~~~~
   tools/include/uapi/linux/netlink.h:99:24: note: expanded from macro 'NLMSG_OK'
      99 |                            (nlh)->nlmsg_len <= (len))
         |                            ~~~~~~~~~~~~~~~~ ^   ~~~
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
