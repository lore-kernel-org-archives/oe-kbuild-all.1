Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A841CAA96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211680; cv=none; b=R8hZ9rYaB9VQwOlAfg6ZDL1Jp6PVIXkOSFeP03HzQyGRoWcXRn5BL9hW4iJQt7nb4mYgSb0W4guSok5pEy5+ED9iZ+C96IB4sotFTPUKXat+EW4WO9TBqx1/HrNUToKqMvgIY68YrUQJtNXbHYIQEnr5il9STNdAKfP56GhGO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211680; c=relaxed/simple;
	bh=dLGNGRAYZlUXEOgIhL8+FihAtaq2Xew8xjPHFpemyQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I5uwDU3COoZsTFPdt3PCWeIQsQFXhn84M+w3KaUER3OKkfKJ004TneNIxwFVZ6C1X7IXw7Isq6SPGO8RnDUqJ+9bDy54/d8y0he0z/IMlWAUPwLOC+6ReuEv24x+nJXCgnOwyf17Uxd5ILIW3jT4UYC6jLke0fbJXlt8ezQgelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXQ3u0SP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXQ3u0SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747211676; x=1778747676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dLGNGRAYZlUXEOgIhL8+FihAtaq2Xew8xjPHFpemyQ4=;
  b=bXQ3u0SPdM2m83f9BOEP0ohKxjkjW62FNU2W+OkbkN4AGeL6UFcOi2Gh
   JiDBycUx9D/By2e3+Qv7ghZFOcjlAxjKXeNImSAqKaptw4+Zo6UZg8Hwg
   0zQI/Z1FN2SbKQqddjf0gTsGLoUDqUlz5N2b2hCW2CbOpzAGktlWRwASB
   H6bu/ljOfQB1mtAfOd7zW/mWYiV6l/wxE4Qf/YyhOzKugn25/Tlg0vJUZ
   3RFfQU+ADTPqwvkO8grME34czefbtdU015ripNQJ9npGhfWo7V/i4i1u3
   ZCENuuxxAhj5CzRun5w02/KnbcU2UJWD34IgXBxUqiHJaSQTwFqMXznkn
   Q==;
X-CSE-ConnectionGUID: LyucwpxZRe+sTfap5bF2Gw==
X-CSE-MsgGUID: hDOdB81oT1y9Y49Qc66o7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48963891"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48963891"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:34:36 -0700
X-CSE-ConnectionGUID: W39n7MFQRC24YoKEMcR8Lw==
X-CSE-MsgGUID: cqERLQV5SVWd0e6R3eIDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161259281"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2025 01:34:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF7ZQ-000Gqy-0A;
	Wed, 14 May 2025 08:34:32 +0000
Date: Wed, 14 May 2025 16:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2228/2228] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for 'psp_register_cmd_notifier'
Message-ID: <202505141619.2NcI2pvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a8743142c88fdbade6ffcd3cf426037633e9e1fc
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [2228/2228] arch/x86/kvm: Support tkm virtualization
config: x86_64-buildonly-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141619.2NcI2pvO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141619.2NcI2pvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141619.2NcI2pvO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^~~~~~~~~~~~
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^~~~~~~~~~~~


vim +/psp_register_cmd_notifier +219 include/linux/psp-hygon.h

d0b3a770d8e20d chench00 2024-08-01  218  
d0b3a770d8e20d chench00 2024-08-01 @219  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01 @220  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01  221  

:::::: The code at line 219 was first introduced by commit
:::::: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: chench00 <chench@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
