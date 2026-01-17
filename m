Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0E33122C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768634931; cv=none; b=SP0BNOaHEbZIVEY5FjTsfCSVp5bb85aVHZBboSfJ6y0AJh4FxYtgQjL1sY+IjHJfqK3g6oTGKZliaJurm7BFqA6oSgUgRabBirHMfCOeQ1m/vBu/AgvrJ/Ob6aZz7CUlShXceSMVbT1BNNUVFh+HXQcx5p/RAn6IRaQsGPBDg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768634931; c=relaxed/simple;
	bh=TSt0bW8Y+yWF2lgoQjsaMPenoQ4aU2J3RUD5df7xPT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NU+dsJaxfg3trEgbpauea249wK+jkov640JQ6p6MmuZyr7+niwPGOGN2hHi3ZLBZDOtltQ/6fI/0AjaaeG9v9bwSZq53FgIfUfYhje12n6Y236kHbQpLj7bxsmgRg4PaOtyh5edzMZIdG3GDvAYdsbxlQtX/NStw8w/YXbFLOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmYld+1L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmYld+1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768634928; x=1800170928;
  h=date:from:to:cc:subject:message-id;
  bh=TSt0bW8Y+yWF2lgoQjsaMPenoQ4aU2J3RUD5df7xPT4=;
  b=TmYld+1LMEI89QSOJRXrlqk/+uIGlIEh7xt6zDOedtv2i+DHbtcmnkC8
   Be1qIWoVrc6SPZYmuspe2SCBTiniAfsTdOUyxkOtB8ICKgAMZ40XGI/YX
   HpFFi3wJwLL4DA8qKTY5EdoNwXq/XrgpoL1f0dRrsizNRMohv5GRsh3kc
   TaWDGRbxhZNwATI2wmMdUaOUYYqYwmUChzGfRHgC9Xt9OLNJ7r0DFLKVY
   9RLfCqlcV7GQOQO6VCwrud0uFQZiPUzZ/9iaMPlPwajUu8yGsBELtjuWx
   kPjE29hAmamuVRq9wr41iJSxIFTZKZOW0vNyqZP8l1ESU2bPQABHw4loW
   w==;
X-CSE-ConnectionGUID: 0XYseQaxQC25guHBPlLpzg==
X-CSE-MsgGUID: fpCR3FCXQSG5TjZTUTDleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73793040"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73793040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 23:28:46 -0800
X-CSE-ConnectionGUID: wQ6aVLdsSBOINu4L43N2sw==
X-CSE-MsgGUID: BUxDiVloSESVyK0Gpv/J+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="209925564"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jan 2026 23:28:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh0jh-00000000Lee-31bZ;
	Sat, 17 Jan 2026 07:28:41 +0000
Date: Sat, 17 Jan 2026 15:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 148/213] ERROR: modpost:
 "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202601171515.zccfCMmu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   796b20996fc24b2b7524f76613ca6c26b513a313
commit: ee275944ddf8276ecd88d14df78394828d89535e [148/213] bcachefs: backpointer_scan_iter
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260117/202601171515.zccfCMmu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171515.zccfCMmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171515.zccfCMmu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
