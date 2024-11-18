Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E851C1F1C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731954854; cv=none; b=oyKAaO2dBUhmQSeW8Hpqz2vCKnMOpEoZOjifLb8b/Ob3I6ONKstmN/ooxKUUZz/x6QL5aeQb73k72bGUz2puHM/DXhH1H45ObZf0LYYyGN7yT9Eq9/49xy84jc7YgKaVH+tmJ0/XICumqOw/5XUxngSr72h9Gobt6iMgl6g0sQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731954854; c=relaxed/simple;
	bh=FrzYnzQIsuairdi3tQb7vmjJCuJANI9j7Ap8F3vkfWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJAuB6SBMdAL/qITjfLYnPGoJw2Ml1TkjSE+reYnhp1qeNB6ymQ0rJKM/2ORp3vlnR9S5ZgN5RyTgfQLnP+EsjsiOf7bFur0HJNussFejzG62ex8cy5YKdrJR+VNScL0t9qsL4DbfoAb/fbxwKHRnABng3XdRs02KIakYsK61zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0xR2Twk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0xR2Twk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731954852; x=1763490852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrzYnzQIsuairdi3tQb7vmjJCuJANI9j7Ap8F3vkfWM=;
  b=g0xR2TwktVM/ukUKFwLDOri8AqCou/fG8H/6OvBL3CT5HLpjGUVUfmFe
   tmRX1mpXHpgjOFeBDFCMHtIfMF5MBl5iZsDTrj95s4kJNYdmp9oG2QXgm
   PjBiNGfywVLr8Z2p/aqwKY8i+tzo2gvqRloUhYEhYMa7OpyvnjQ+US4hW
   AfJKO75De8xTYzsLfs195Ju/ctT0z4EE/FQVX2zKiKefS/ghlb8agOfSA
   peQnGod1p2IyI82lvpsXBqzmUo74ri24ZHdoMh+VrK9DyZPSCGftb9mkk
   jEY1URMThwxkeL3ZfWIdxGrgngZ7Q0y6WIguFIhL0x08RnPG0WXOdeVvB
   A==;
X-CSE-ConnectionGUID: ycqsPACeQ/2qk0r+bJIyeg==
X-CSE-MsgGUID: GzgxMcxQTbOhBOr/dS6K1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31679411"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31679411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 10:34:12 -0800
X-CSE-ConnectionGUID: oQPOlSBXQO6TfQVckQLtgA==
X-CSE-MsgGUID: VgeDJFPiSQiWFWrSfPIh1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="120251548"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 10:34:11 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD6Zc-0002az-1M;
	Mon, 18 Nov 2024 18:34:08 +0000
Date: Tue, 19 Nov 2024 02:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] ./usr/include/fwctl/cxl.h:83:47: error:
 field 'query' has incomplete type
Message-ID: <202411190231.cT2t2oa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411190231.cT2t2oa6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190231.cT2t2oa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190231.cT2t2oa6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/fwctl/cxl.h:83:47: error: field 'query' has incomplete type
      83 |                 struct cxl_mem_query_commands query;
         |                                               ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
