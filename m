Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041B1B374D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882851; cv=none; b=XdXqfTaliwUXQtEE9NEAs/J5tPNydiyWreLPwNWa5/OHmrYxIhqN8G4aM2dX1erSyOtaDvw7wIGfa2/nzY1BiIuqyAbenzwS6yYymB30sw4TLfx/Jr75kqgJvJQSChTV7IRAdlGI08X+VD+h0lFduoPmfsBUB/Avu7cfM4ZHqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882851; c=relaxed/simple;
	bh=+eVWBWo55Z0KVX0TqvC96GGDU24uJyAscnXYY/2+yQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BaxlYI0VSHHFGR3NBbl+3ZWq4ZHln3Lmo2wilYJBFuCVTV9Hu49r6Hg2NTTTbtkH4zXwtDihx6w3caunzybMiyE1VEF9yRBAjtDPBj9Ih+J9aTmY7yk59NKDYNc2Mh2rA7CdkfvZg64Hv0EN3k82EtOZATtEnx0BcAgOAAtMfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh8kr3rU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh8kr3rU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725882850; x=1757418850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+eVWBWo55Z0KVX0TqvC96GGDU24uJyAscnXYY/2+yQ8=;
  b=Rh8kr3rUb898FAmA0P32wQozAqQ3slHm0VcAOBK+LHqZPIKInIuoKJIw
   jN/qV/GVLMavaFbHwaA2s2BvCLHWfcGCgOmjDT1HxCq6p20r0Ri6l6hQp
   DZLh8UiKgw8VY+APD61MFc/dmdenjJJ/3jDntNossm6eNHR17pSD17D1c
   bZ/ZTOzUXitEJjiR/9RJffTRgYnbDgb2wCJv0ssVUWjtuqnlVDTN6tobe
   Nww7gVaS4qZ8jaEOJ6k8rg1Ti2vy4bdwSu2bPrWGL1sHq334v0klPhI/T
   Qrrq6YOwjfjvgnsduT5zusep2s6cQtzOmLgudebicv61Y2Mc9QXtOlPfi
   g==;
X-CSE-ConnectionGUID: Z6r3pnwQRjqOHZCRtU3kag==
X-CSE-MsgGUID: Bkoe0suzQtqliMqX6bGrsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35716794"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35716794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 04:54:10 -0700
X-CSE-ConnectionGUID: AJ/mktfVQIuvYi+/eW0MrA==
X-CSE-MsgGUID: QPcWV8xgSnCrNQQA9tY5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="89937527"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2024 04:54:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sncy6-000Eg4-0M;
	Mon, 09 Sep 2024 11:54:06 +0000
Date: Mon, 9 Sep 2024 19:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10073/10296]
 backpointers.c:(.text.progress_init+0x3b4): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202409091915.c5Kot5ar-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: fa50c30a37b543c36c81f5cff33e09574382d151 [10073/10296] Merge branch 'for-next' of git://evilpiepirate.org/bcachefs.git
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240909/202409091915.c5Kot5ar-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091915.c5Kot5ar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091915.c5Kot5ar-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/bcachefs/backpointers.o: in function `progress_init':
>> backpointers.c:(.text.progress_init+0x3b4): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
