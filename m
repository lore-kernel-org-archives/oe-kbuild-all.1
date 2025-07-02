Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8124C7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 04:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751431940; cv=none; b=sW7Cv1ZWx4nGZDRibEA1ybAFwj27gs3OIZIFVAwZD617DSGFweHYwgel9wiiT+WAvejI7C66stTsOWr4HVv0Fe4rLn0wNJDsJah5QoTt3J/mJYfFSS4MhVj4gDDY/d5BWqtxWcAuobn9hckx2eeA4TA9ogQ03rdu59b08yTUbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751431940; c=relaxed/simple;
	bh=2tepgE7xW2pfJDqLic3wJ2H5Kpf54A4jAJI/psTp6v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PU1iJ1uB5W5e4z4DmgHcB5ecTdr5tKYkdloc2RddtDfv5Ld9BoGkn2dG1KU46seEWhNxozOZFQgZTIow1AZ8SZ9zlieuecmoesCAOZ31zspQAwSu+ExifCd8IvTXfjt0kh9uusAnYyXlSo6qVVyBc0IuUEx9Kd6rXCqvkeEvAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwmGY1Ys; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwmGY1Ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751431939; x=1782967939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tepgE7xW2pfJDqLic3wJ2H5Kpf54A4jAJI/psTp6v4=;
  b=IwmGY1Ys5Xc00kYwhfkOnS+e4Dn3Dsfwg4EearucHBVIETp3UyKzpON+
   aOfJRDgheJxpclvtmNc/RD3FMeGUiZHhTQuQ+ROPuqzabyCBUuvkS1+Pn
   9HK65V8IDl81OmuLe4sx63EBfG+3dZDI+beugrxcQnFRX5SoQP5yrlmMc
   BRCxs03s4EmStspUxMFcoPdnncTZIvFYjQI1q3p52DyCD3XHK8GuCKabt
   Tq3kmhxeuFZ3pIFeTc62b/zov4lIVP0zEJETS0AI/ViLm9zF0rfstQng3
   Ak5NXWeUH0ltKDwEcGZH9pHrmC6sa7l6KwP3SmMZzHHNT/kWB6dh4Y6Zr
   g==;
X-CSE-ConnectionGUID: hBwzPT+ZTdSqTL6ELgsH/Q==
X-CSE-MsgGUID: hJusD+n0TsChqylgWWtKwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65169073"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="65169073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 21:52:17 -0700
X-CSE-ConnectionGUID: E+Oos+3SRbub3lzjVXf9ZQ==
X-CSE-MsgGUID: 5I+Fz26TQ8aHA/GOHD9LYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153592399"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 21:52:16 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWpS9-0000E1-24;
	Wed, 02 Jul 2025 04:52:13 +0000
Date: Wed, 2 Jul 2025 06:51:21 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] net/tipc/topsrv.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202507020608.4lfjVJFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junwei,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: e373fab80587f72c98463df1f4511d06011f915c [1605/1605] tipc: fix modprobe tipc failed after switch order of device registration
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507020608.4lfjVJFL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020608.4lfjVJFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020608.4lfjVJFL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tipc/topsrv.c:82: warning: Function parameter or member 'awork' not described in 'tipc_topsrv'
   net/tipc/topsrv.c:82: warning: Function parameter or member 'listener' not described in 'tipc_topsrv'
>> net/tipc/topsrv.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
