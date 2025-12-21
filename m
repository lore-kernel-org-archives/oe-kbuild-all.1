Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63D22FE0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766298541; cv=none; b=loLMYccqszZX8CDNJF9/oi3GqGamxx9UasZC8wzcw1bMvVxKrFSb7hM7G7nwsbFN81NchVLbnDLKGnc4+blMX1g17CDd6E4ug27nbkZVMPLmQJ/iKtYvgL1O4m1/Qaf4183Pa82bXJ1sqCvN02+YuPBh9V6bm68pO2zImSOuqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766298541; c=relaxed/simple;
	bh=JUfkdDgS9xdBBUCkD1YlGqTRHDmWiEYllSnTw3e/Ku8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqSD0RdGcaho9xdsU2SxpYnYeY9+0SQKae/EUFEl7tcSeLZMqbIklZnohUSqxEayO12RWAVj2wj7eC8b4bxxUedRHmyF4xgo+e6Hst3JY3LkyhSFzDfrvlLMuKRzH6xqXVchU0TQrLMe0UtbISlHcPVNkvOB3oBw0LgX+QZHMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeRlnYGI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeRlnYGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766298539; x=1797834539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUfkdDgS9xdBBUCkD1YlGqTRHDmWiEYllSnTw3e/Ku8=;
  b=EeRlnYGIIqc8l1MANbiplmlvyrqJqTlLPwC38HIjPCTG5R73+SXXCDwS
   0V2kPykvMMZi6zyjJFNLJE7e9TsQr+qNxIuUXxQ6gyNI+2+9S5qWAgwcN
   apjF8W78QcBHH+XYoL2sGJA5ok8ILoHfJ4GoD2mtsHSGsjmWOE5HLVbEH
   rKDPwSC6H0rKuiAnL9hAbF9uicxnjkPKQjcSHfRprC7ccpWPXhzinwlMh
   PmFDKJDLUqP4xraeTIbb7nfE8jFyzJXtFiGm2T+HrlINyL+wjOmpjLWvV
   t/U+R9QyF3CeHq2tCkvIAmABfaTxB62Fru4FEWXVN9YeP2OhBUaGNxtU8
   Q==;
X-CSE-ConnectionGUID: DfiP6Dn7S4utAuuYfE7e5Q==
X-CSE-MsgGUID: tn1tQKm2SayTncPzux7NTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79651114"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79651114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 22:28:58 -0800
X-CSE-ConnectionGUID: 4A7kquGJS9KrDxopWvApuQ==
X-CSE-MsgGUID: 2rOg07wMRb+MibsJ5IJnxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199153375"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 22:28:58 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCw3-000000005MD-3Jpj;
	Sun, 21 Dec 2025 06:28:55 +0000
Date: Sun, 21 Dec 2025 14:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6] include/linux/sunrpc/debug.h:12:10: fatal
 error: 'linux/trace_pritk.h' file not found
Message-ID: <202512211447.v6VAj8rE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux kerne-unload
head:   db5f16753bdda297b43e6c2e04f591ea173438e2
commit: db5f16753bdda297b43e6c2e04f591ea173438e2 [6/6] drop trace_printk.h
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251221/202512211447.v6VAj8rE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211447.v6VAj8rE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211447.v6VAj8rE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:30:
>> include/linux/sunrpc/debug.h:12:10: fatal error: 'linux/trace_pritk.h' file not found
      12 | #include <linux/trace_pritk.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 include/linux/sunrpc/debug.h

    11	
  > 12	#include <linux/trace_pritk.h>
    13	#include <uapi/linux/sunrpc/debug.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
