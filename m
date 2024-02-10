Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217A1535CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707571286; cv=none; b=JcJv7kjXUhA4rwCUs3MxrL6KkSkG6GNoRJOHf/THRfKTBSUBEJ6qC0whIqL80kEr1Em9fixBMEYzKfqZNiZZCnHCaXXtfgsWFxowRnr0ifOPU6KjK80q1w4UKtR566JOhYKf0gNErzjnrfcbFtahzVN+bxjaxPPw1O5FSpINZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707571286; c=relaxed/simple;
	bh=Q5y3j4YhVO7S7SRwDzmfaiHnM6IDjvjs5lQOq3g2QZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bvut1e87tF68fNMvuk+AeM8XGRoeXjzMzzB7TmuCx2yJh3hFbY0rABRbuS0v2X6vQLqmfuMq3f6sGe+nu2OAiISey2rUAOe0TaEGr7bREC1pPh/kdGLWda3fl6Bd6JrU8qbn5+XrFhlVKJg7Z6PBOioZ95ibl/qYRQkmRz2hFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnR4fiGy; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnR4fiGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707571284; x=1739107284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5y3j4YhVO7S7SRwDzmfaiHnM6IDjvjs5lQOq3g2QZ4=;
  b=QnR4fiGyQUwdYJMlda2f3mLC7Zcn9UnNHrNmvo6cMqpoD41yIwoIkCO/
   3HZalao3R1nQBa6nlNC+ARlKqk/ytvugEGrddEr5DTNDjbwN+Wf2EJOcv
   aTk0s+gKQoYb0tYWC3gsW051os7s78qOvXCuK2KO28Jr/2kNB6ag+xNTk
   6c0y8D5a0geblw2HPqsr/h1dgWI0DOiQMljy1YrbBCC77JvqTpPeQkqLf
   0M1L4/I+K6wrahP8S036shQF0J85o8OJX3dCvNmRkAuSLqZ9m9XAKhy3U
   zty8LztYCIb5+1pxLVtm1GbWpbRFL9m5tYYdwrhuqAaz6snZf5cLgvNvJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="395995615"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="395995615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 05:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2474873"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 05:21:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYnID-0005gI-2l;
	Sat, 10 Feb 2024 13:21:17 +0000
Date: Sat, 10 Feb 2024 21:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 7/8]
 ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:20: error: C++
 style comments are not allowed in ISO C90
Message-ID: <202402102144.8MHWEm8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   728775b95062efdecedad4df4013a8db5382d470
commit: fb7be10e2d1176b9cdd3bbf901d7795a27837b6f [7/8] media: raspberrypi: Add support for PiSP BE
config: i386-randconfig-005-20240210 (https://download.01.org/0day-ci/archive/20240210/202402102144.8MHWEm8B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102144.8MHWEm8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102144.8MHWEm8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:20: error: C++ style comments are not allowed in ISO C90
     476 |         __u8 edge; // enum pisp_tile_edge
         |                    ^
   ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:20: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
