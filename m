Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8F36073E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110198; cv=none; b=EFCu5PwQ8aMEBO8gzWCElyO8SXovF+s8wEFf2nUpq5QTYTF9pwOjQXfIaNJ6O0gpHmj6l/umvXFnFu8v+O7pESVKym9uK6PdYSvE3wE+3nCehrWcJ8DconWvdoaaY/yoRNqO7AY1NVJU4+TbSuRw2PTypigXu9BDCVvo+GRsLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110198; c=relaxed/simple;
	bh=KDqRujZS7QuSVittN9Rccp90viQDOmofpgD/gIsYA1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijG2LD83lVukHV0OQLT9xnaZePSzEt4D6lf4DQdB9gFgIO6QepyPTW/m+sRhCIcDbu/RNp4Gui/85kHXfI2wMHQjzQ8GrbA1G2QfNHWqVFCQ6pPjRTMqM1SM54nUp62zo4BJoUig6Cp2iGY5d/rSjrgSH/U+s2V9TdafNNLzZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHkfFM1L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHkfFM1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776110196; x=1807646196;
  h=date:from:to:cc:subject:message-id;
  bh=KDqRujZS7QuSVittN9Rccp90viQDOmofpgD/gIsYA1c=;
  b=nHkfFM1LUUeoUtQg4V3CA/58BFO7EUg0cSdL0O8lHSjvT9hTrvnEatMh
   v6Tvwwthc6SyjRDVWGvRhSkQ+6cjLXa9OC9VADcX4CZHgD6AhhnJidvI5
   wRXBKA79aIvvK+QexHeFTQh4+nK8Cpyp2Rd3VMukUZ8YGcIhT9tgtWhqs
   cux8hg2gB1MJTpDG8bVPJbhrn53uCiiHt3fUZIDUONqkYgntZE0NZjwiU
   lqmgz5uFu6HbzWZjwuzdx1aliUgBXQEIBrk7Xj4JWNfU5XQs4VfGR2oNS
   yjK4z5qYCcngKFFUAEHa14t557kMJAAnVaOUNQoezLKMm9QG0jtsWWVV8
   Q==;
X-CSE-ConnectionGUID: UwOiHMIoQeKDRaeq9SS3gA==
X-CSE-MsgGUID: plbTzti4TNGkMRrgZ1vv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="79640660"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="79640660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:56:36 -0700
X-CSE-ConnectionGUID: 6XE4WcRcQzyoJXgv92nCnA==
X-CSE-MsgGUID: B2nTW6EUQEunvQvWNzupsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="229757205"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2026 12:56:34 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCNOY-000000000nl-2b9z;
	Mon, 13 Apr 2026 19:56:30 +0000
Date: Tue, 14 Apr 2026 03:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 18/72] hppa-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202604140356.vXCDlCzs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   24a7b686ee5e4e272a79f48c7d4ed895e42789e7
commit: d778a2374d5df62dceba76ca188f2afbf4401e5e [18/72] ASoC: SOF: mediatek: Add mt8365 support
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260414/202604140356.vXCDlCzs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140356.vXCDlCzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140356.vXCDlCzs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data+0x110): undefined reference to `sof_of_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
