Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C5B79C2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 04:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717301799; cv=none; b=CBy5Vbt70CcP0cGh5aAl1btHEKN9EosVlNC+0kXQcdU11atDPIXy95FnJWgXr7o8L4uV3xJ1Z3U2cu3v0u9zB/TrzLbVmOxpri7FXM/9YuyR9mRMgvAH4s8TQZMoKHoqQ0FWCEYu3hzdt+mIhUeTVQAkOEY0p0VHQvYidAaJ4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717301799; c=relaxed/simple;
	bh=Y9vHRoeciof+s0YuwlcXma4oQNl0AvkME863bnPSs18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jgk0iY9RQB5x6Q2yaRSrmFUE1hhx7KcvPoBOuh69YTl5Fl1p4aBwSCNoLZAb5UCWevqVgLP2nXjxxZRP+iKSIStFDrZQTlpb6cQ4cfUejMV31vG4bZKdeai4IbFO9RlnMBdATqcMpjxHYNiuQ1TbC5BvIpLaTsoiolpo5d9HhN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgmGa4Nj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgmGa4Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717301797; x=1748837797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y9vHRoeciof+s0YuwlcXma4oQNl0AvkME863bnPSs18=;
  b=NgmGa4NjiAamFF1KJgoCkvFo/PL3o1taHk5VdLleW/oGYM9/Osgb1sJm
   /7iBpDuM18DshZn3/H+MIIGFn5B9BweZjO5PU1zFFjc9lxnWdeMXIYnzg
   8I9n0IGO/4O5xUn6ouuuv2/sniLr5hptspwaA3+sDS63SPBVis/2jiwJE
   BaacNMXjcl1jYbWDvDRtEL6QdV9eQb1T3seDQ3vtfm7tosmZSBWFxESdc
   BGinEW0oK1yICfg+fF4ia4tzFCoKRT9F+Hn/obwxdKMDsU1qOVymziK/n
   z/QnGcY8WQEkc2CCz1sCFhSK/DivMoWVIPE4PLR+7mpWshadb4AgEiHVt
   g==;
X-CSE-ConnectionGUID: TKocZ1z9T/yU/4Xzz15f5Q==
X-CSE-MsgGUID: MnTROXqOSJqtYNbdFKUqVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="17640175"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="17640175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 21:16:36 -0700
X-CSE-ConnectionGUID: hTqktDLTSfeEqD16+KWHWQ==
X-CSE-MsgGUID: XzmATcvQSNCSW5z6Yxm/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="41085820"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2024 21:16:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDce1-000Jfr-1N;
	Sun, 02 Jun 2024 04:16:33 +0000
Date: Sun, 2 Jun 2024 12:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 20/42]
 arch/powerpc/platforms/powernv/pci-sriov.c:6:10: fatal error:
 'linux/find-atomic.h' file not found
Message-ID: <202406021238.Ue9LCIIU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   5e71daee3822b67746a0d93189a36722c28470d4
commit: 07872bf286fb7ec07c300d5e9912237ad980c231 [20/42] powerpc: optimize arch code by using atomic find_bit() API
config: powerpc64-randconfig-003-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021238.Ue9LCIIU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021238.Ue9LCIIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406021238.Ue9LCIIU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/powernv/pci-sriov.c:6:10: fatal error: 'linux/find-atomic.h' file not found
       6 | #include <linux/find-atomic.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +6 arch/powerpc/platforms/powernv/pci-sriov.c

     2	
     3	#include <linux/kernel.h>
     4	#include <linux/ioport.h>
     5	#include <linux/bitmap.h>
   > 6	#include <linux/find-atomic.h>
     7	#include <linux/pci.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
