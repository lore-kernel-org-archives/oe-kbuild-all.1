Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6C2DE70D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834508; cv=none; b=qwFEsmf+QPiJssQSRkgxC6E5Dga7Rdw6KQM68D7hI9XsiF0c7F0x+llpfokVI6e7i/vNwMs/B4s3s9rdzmgFLJWFolYmHgc4N/D/bZHtOEmik8vVClGbsimu/JJdpIOTBC2TD6oWJCx5ZwWxR8qNmd+P9rw+U2PcbnGF1btdLbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834508; c=relaxed/simple;
	bh=NuUcLXC1miviOWwxdxW/zevwsBNyJMfHBpvZ7GTNVyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hsVbLlNFn+iIduSERWlnI+3viwNepx/bbBtM4ROBpJ6uDt/OdUJU0de1ez4GIynZSBwxVkzku4grqSF5VjE0lAzRNpQFln3Id9aGSphonPdA7YTVMGPswouWi0mo0OSJtMmeJZt/Ux/l+lU0rgUTUXTNwuXsHjR5MF9Ddz85tOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGEa4Pyu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGEa4Pyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834506; x=1819370506;
  h=date:from:to:cc:subject:message-id;
  bh=NuUcLXC1miviOWwxdxW/zevwsBNyJMfHBpvZ7GTNVyA=;
  b=QGEa4PyufpAr7wEmWhLxgJLOAHlKZReBOs7JRcfWehyA1POX1xpisuaE
   tkRyqVnRIJhIo5l7O/isQjzEbSCjvwTwBbhrhoAt0AQkvd7gEHfBwQDG7
   0/Wvqo0/EfImCx5x94P32m5Za0dNCUFU718iqIoPN2D9u/nq4QeTHG5K4
   C5c4lJMwazRbjHgrqMGK/mKPox6gh1fcQ9Q1Vox1zd8RnRhRKqzueca6h
   mrnvexp8MicqIdsBpXaYMLTnwTUzfwh0DF405Q4A38fzNsfgIleSW68/1
   PqWzEAS6CIgDhOT9I4PLLm9IBTBIRy27qURo7nwBg49Yr3rxDkc+rNPQf
   A==;
X-CSE-ConnectionGUID: 1gFw8jBLRbCiMfFSTOYUNg==
X-CSE-MsgGUID: XxyyTkY2SjO5ZTxE6g7dcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92148445"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="92148445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:41:45 -0700
X-CSE-ConnectionGUID: iJiSpMJlTpOXchiqrUc5qw==
X-CSE-MsgGUID: FLIFghzFTXq4MWuCu0ov/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="292699566"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2026 05:41:44 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzZQM-000000000mv-1sWy;
	Thu, 27 Aug 2026 12:41:42 +0000
Date: Thu, 27 Aug 2026 14:41:07 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 254/254]
 drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error:
 'sxe2_pm_resume' declared 'static' but never defined
Message-ID: <202608271406.FwkZSiRH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1cb14b8ebd706a55e3cb0251941355687e595e1d
commit: e0244015478adde7baee3a127e43091668d91289 [254/254] anolis: net: update linkdata ethernet driver features.
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608271406.FwkZSiRH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271406.FwkZSiRH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271406.FwkZSiRH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error: 'sxe2_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1533 | static int __maybe_unused sxe2_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1534:27: error: 'sxe2_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1534 | static int __maybe_unused sxe2_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1864:27: error: 'sxe2vf_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1864 | static int __maybe_unused sxe2vf_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1865:27: error: 'sxe2vf_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1865 | static int __maybe_unused sxe2vf_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1533 drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c

  1532	
> 1533	static int __maybe_unused sxe2_pm_resume(struct device *dev);
> 1534	static int __maybe_unused sxe2_pm_suspend(struct device *dev);
  1535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
