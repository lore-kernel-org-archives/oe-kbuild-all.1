Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40F433E63
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099104; cv=none; b=Lu3n1GjxLLd3oqCqyJQLMrwsGGoVYKNRnOsQh2qIct3TsmuN7SM2yvj34s3HrAXEVwU174KnICvvHeF13AkelDdPNxZwlT3wVjmOU2MDzk+cFGisCkvlsQFqOJpy8++8E4nftAwSSBbMe0sgjBiPPOmp8azo9TS3qVigV9wIfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099104; c=relaxed/simple;
	bh=HxR0K93x3QC4eA8hh5466fvwHEE9XwokwtgpO6f1lLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YpDv84NFhKb6xK7k1WTGkfZNB4QUzcrwT54n+7uTsw2JRAnPD3bKr5aAMy8GMzZL+h1Rw/LflDgEsD1zxFU/IT/olPd5n2W91rYYJ5OapW67bVUL8H933skmNL8Mvi7qCHPH9ajofl2fdaehySL4eoP+Dyg8gODUIZ9xZ0tAuw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFtaflsj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFtaflsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783099102; x=1814635102;
  h=date:from:to:cc:subject:message-id;
  bh=HxR0K93x3QC4eA8hh5466fvwHEE9XwokwtgpO6f1lLk=;
  b=SFtaflsjarnOh0yHSmhMOiqvj5JbbzxXUDoVPge5p7QKFpZ44s5f4uy4
   uRq7t+cf/z5IQ8z8ZIui9knL+0ZTLLqLzXTSg5ewbRd7NLFFBQ9YhoSxn
   TsXXqz2RHHPsVgJVRGD5PcDUyiYh08YLsfuy924jsqI6GbUUsMpzphwB/
   86o12YBZfa+XgZTQp1mUh3LsAS4Fc9bERDtEhyXyId0HX6wsB07y99rfL
   v7z0Klcgu6KBR9FlvFDd1wlxeU3qmZ6t5/hWEl/4OdGb8xnICiuyIDo8M
   2eWmrgrpx0pfgeLsCo1Wv+U6mGdPj3omUFLOdy68WLgFuvf+DIHGDeiQX
   Q==;
X-CSE-ConnectionGUID: x2UElE6aSbq0EQD2sQUCAw==
X-CSE-MsgGUID: BhkTHtlpTSuGFuBPl6MzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82839723"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82839723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 10:18:21 -0700
X-CSE-ConnectionGUID: Ren5+5ezTtqazsF09naEPw==
X-CSE-MsgGUID: ebOTI1hVTsyNJMdr029Gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252689413"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jul 2026 10:18:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfhWq-000000001YP-0zsi;
	Fri, 03 Jul 2026 17:18:16 +0000
Date: Fri, 03 Jul 2026 19:17:58 +0200
From: kernel test robot <lkp@intel.com>
To: Javen Xu <javen_xu@realsil.com.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/phy/realtek/realtek_main.c:20:10: fatal error:
 net/phy/realtek_phy.h: No such file or directory
Message-ID: <202607031903.wyD5xh3g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-speed-in-private-struct/20260703-173649
head:   4088a221c3a777072eddaf9d63a3b69c2eaf9982
commit: 4088a221c3a777072eddaf9d63a3b69c2eaf9982 r8169: add phylink support for RTL8127atf
date:   8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260703/202607031903.wyD5xh3g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031903.wyD5xh3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031903.wyD5xh3g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/realtek/realtek_main.c:20:10: fatal error: net/phy/realtek_phy.h: No such file or directory
      20 | #include <net/phy/realtek_phy.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/net/ethernet/realtek/r8169_main.c:35:10: fatal error: net/phy/realtek_phy.h: No such file or directory
      35 | #include <net/phy/realtek_phy.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/net/phy/realtek/realtek_main.c

c4277d21ab694c drivers/net/phy/realtek/realtek_main.c Heiner Kallweit 2026-01-10 @20  #include <net/phy/realtek_phy.h>
097c2aa89f22f5 drivers/net/phy/realtek.c              Johnson Leung   2008-02-03  21  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
