Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37C13BC36
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712320429; cv=none; b=WRTRUWA35e+uHHPcLojgsigvFmRtncJO3d77wSLSIY3xBmUpQitv/QhHZTS/Jw3jjx3RSYh5wadrcX6QX7XR/HYQKJnJvJJyvSliXbCCY14j/iTT4aLCaq40QKI34nf7X0+ZCjJqaDPaxUSWPYYIbk14BAYRDFW8N6CieR1dZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712320429; c=relaxed/simple;
	bh=kV9/w3JtpXRuT3QI2XL3JTHgq1wkoORxRQl3+858CCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNRSndZnC0Y5U02ZOshF02FC5/wcnB4aY0W5IwV4csAregcSAWYvb4Dg6FTDfq6v+NdNX4+zFU20mTeQosJ9KSYPSi9uGmaju04gHcSusBokAGHabq3EoAfkc7H0ks4dEbGe7iVFFu6BktBfdb1xGuHReKBI2wL0MyLO4zrrv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLQ3bwJn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLQ3bwJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712320428; x=1743856428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kV9/w3JtpXRuT3QI2XL3JTHgq1wkoORxRQl3+858CCE=;
  b=aLQ3bwJndKrNQuZe4BuTljQaBbfIuln0Yo5V12rnBOiK557/eY7j0JQi
   SaqmDAy3yiMV+OmzIj5xIYrL8agUwQvlqVWF4KuTxPjqsz+jFnYun2jk/
   Y417TjQavQks6HHLHlrppxvdJGsTNmRhIhoaeu1YAO38sx6SUmi1twvYM
   k7SXYQFZaa41Xg/LGoNC1t8S09oHCkubcM+PLBHWkUbefFsmnRdQ+tn1C
   oKal6tmYmWvEyF8KqlDM4smZRK0hbtPabGlsGMOJwkk2JWbTuHW7sNOqt
   yim0Pq/1zpY3BebHp8/h8ubEVVbcugk7vyyCu65xh3zeWQg3CnOagdjJx
   A==;
X-CSE-ConnectionGUID: vhtFhoyaQm2kAiH423Ge4g==
X-CSE-MsgGUID: HxmWMjGsRSKnZENfOU+/1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7832454"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7832454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 05:33:45 -0700
X-CSE-ConnectionGUID: B2qK99UuRhmGpD5lEupNGw==
X-CSE-MsgGUID: 0XVpAXEdTnmchuZ+3p1GnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23786395"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2024 05:33:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsilJ-0002G0-38;
	Fri, 05 Apr 2024 12:33:41 +0000
Date: Fri, 5 Apr 2024 20:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4238/4242] riscv32-linux-ld: section .data LMA
 [00369000,00907967] overlaps section .text LMA [0007899c,01a6a6af]
Message-ID: <202404052022.Cwf2ilBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 131818f60c2d9eed9fab95e40abde53499f25e50 [4238/4242] Merge branch 'slab/for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
config: riscv-randconfig-r031-20221203 (https://download.01.org/0day-ci/archive/20240405/202404052022.Cwf2ilBp-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404052022.Cwf2ilBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404052022.Cwf2ilBp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: section .data LMA [00369000,00907967] overlaps section .text LMA [0007899c,01a6a6af]
   riscv32-linux-ld: section .pci_fixup VMA [c22d8f38,c22dbb67] overlaps section .data VMA [c2000000,c259e967]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
