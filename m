Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651F2D0C94
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764805182; cv=none; b=m3HrCUsYebihJHpGo2PYz9GTsQ5myRrrQp7uv335fKKGhMJr+Iw8OFrG6Iw3vtfMPrPi+AaD5vhHb9u7wCgHsDnS+XJX4j5d2WEB7xnCGFMaC5dfdXCTEiOAm5G7w8ZMyMJJDLRTf/KmBejxmVIIpgm6vaSq80FF2ba/sanJHds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764805182; c=relaxed/simple;
	bh=ZJRLGautgN8VJppts1vWF8wjo1KYnMgzmRmUlmXrdcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOOiyAZqvogtG6xmBUQEfEtSXVDeKRihGxubNyliY/1n3JJ6HTod/HIZFnz6HxTHaTfNJcf6BQ7TqZSYelFOVNl5PiS+me/larUCZ1YFo5SqLYBQjWSCB/rIaIdIwakb7OrWPwVQ40B2n7J2MYjnaTfGg3eFu501Sct9bGCRW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0pFiSyi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0pFiSyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764805181; x=1796341181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJRLGautgN8VJppts1vWF8wjo1KYnMgzmRmUlmXrdcI=;
  b=J0pFiSyibsDt/+mPEXWj3Mlqz4aPMLT0atD6VffElIerk3eIyLYu2DwL
   GxWSR4AK5GQA7xxX0MLIQeWt3XkukbX5Li/0jQ5NfspX+0nJk1JxQkwyz
   kJ8GJCK2LbPQ0p6IYB3lUa91uA4aMpk5eszsDStH3H00yt0QN5iuZyOYc
   ZP0aOZDy0ldvs5e9Hcl5d/DeHpMXSmIkyl4cmO0UptR8fXm4TpVUhNIIN
   i/ey2nS7cQYQx8lUNz3rvmxAWuvCcs+JaOU9KnvwzpgYSl62htHSHuvKV
   KA7AGqe3/r4sHJvKOLqRkwX0/ht7pDnaIERby71BHtZsDEQcn03VD1MME
   g==;
X-CSE-ConnectionGUID: U4rkab+6QhCBNyNauEcPFg==
X-CSE-MsgGUID: bfbEV56TQFWJbdUSv4Do9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70666200"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="70666200"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:39:40 -0800
X-CSE-ConnectionGUID: RE0UMc0QRd2OoGpXfaxEpA==
X-CSE-MsgGUID: qfQuzEGBQGyLO9oZZpEVgA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 15:39:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQwRd-00000000DHn-20aO;
	Wed, 03 Dec 2025 23:39:37 +0000
Date: Thu, 4 Dec 2025 07:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 22/25] ld.lld: error: duplicate symbol:
 pinctrl_generic_pins_function_dt_node_to_map
Message-ID: <202512040738.npHRPjzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   792b41ff7de94d1e05bc7070de949d0b8634b0a8
commit: 6765ded8f8600e6d76699cfb11cf85c23c60b07a [22/25] pinctrl: add generic functions + pins mapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251204/202512040738.npHRPjzK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040738.npHRPjzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040738.npHRPjzK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: pinctrl_generic_pins_function_dt_node_to_map
   >>> defined at pinconf.h:174 (drivers/pinctrl/pinconf.h:174)
   >>>            drivers/pinctrl/core.o:(pinctrl_generic_pins_function_dt_node_to_map) in archive vmlinux.a
   >>> defined at pinconf.h:174 (drivers/pinctrl/pinconf.h:174)
   >>>            drivers/pinctrl/pinconf.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: pinctrl_generic_pins_function_dt_node_to_map
   >>> defined at pinconf.h:174 (drivers/pinctrl/pinconf.h:174)
   >>>            drivers/pinctrl/core.o:(pinctrl_generic_pins_function_dt_node_to_map) in archive vmlinux.a
   >>> defined at pinconf.h:174 (drivers/pinctrl/pinconf.h:174)
   >>>            drivers/pinctrl/pinconf-generic.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
