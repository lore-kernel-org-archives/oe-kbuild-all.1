Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1B5168B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl4Igdol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698400405; x=1729936405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nK8g6bqi8rFoCYxlOhiGMiBsx5EKl8FQIGvPk0ArIG8=;
  b=Fl4IgdolTM9rW2r6PNY6k78kfya9bOfToBdROfQpFBm/eTIse2JPseiz
   zyO7vkRLbCGpBHRIa4DqMAHpxKjtUb459iPPiP4otaMvlgdyJQud/nCwo
   rn02Iyr0D5gRsDYxop5lVqYcu3XQzaBpzLUUFo6Qd/pHiAVse6P6nS1p9
   /+jj1jBxHSWYKV3GU2vJm0j/jWBrip9Z4VFIBmEmIQenyzt4gZeJGIb9H
   FVI5Jz2sJFPb/v7akGfcHF1If7kvkDlwBHeriu/b5oILBwOKaDFT7Wqi7
   XRE1GaA3B7yvpornpn5gcY+eRkbb/RUT+8QOCql7DQfXzFRSQm1U39+w3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367955579"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367955579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788787649"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="788787649"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 02:53:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwJWq-000Ahn-0C;
	Fri, 27 Oct 2023 09:53:20 +0000
Date: Fri, 27 Oct 2023 17:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [morse:mpam/monitors_and_locking/v7 24/24] undefined reference to
 `lockdep_is_cpus_held'
Message-ID: <202310271729.YzwzoNiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v7
head:   4997bd3c46a319aba302b9ed72140c6e63eaadb9
commit: 4997bd3c46a319aba302b9ed72140c6e63eaadb9 [24/24] x86/resctrl: Separate arch and fs resctrl locks
config: x86_64-buildonly-randconfig-002-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271729.YzwzoNiT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271729.YzwzoNiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271729.YzwzoNiT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `get_domain_from_cpu':
>> (.text+0xcc0ef): undefined reference to `lockdep_is_cpus_held'
   ld: vmlinux.o: in function `rdt_ctrl_update':
   (.text+0xcc189): undefined reference to `lockdep_is_cpus_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
