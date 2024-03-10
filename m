Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4755376E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710087136; cv=none; b=pYIq22GivIDcKi0/uUxSjRaqkyWyvIK6ocJ6KSQ8VQOprSLPocUi+hGVVcwc/uypO/d2AulZTW9FtwZ9TPQqSCVVFYa9AoKc1rLYqHilT8Ythl5jGh2nkjaCP6IY5u5wHp+vM0xMIcGeMjLhFIoAiBhN8IKFw5yt2AFl1Ejyjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710087136; c=relaxed/simple;
	bh=I97B6ufJ7V+D8H4AQ4fh5sgig3l2UnkYEW6x2ElmpzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uehr6Ro5ujTH3Xqt4plHw3c+84/+KA1pRthQn3rkoiCS1SAcRAgVr05GUy1VB9YRT5SbOE/afBmCiPRum9KvLU3u80SpCZmW2unByxnBltZmH1f9E1kfl2PesGzWL+hg6xwFZumVqc8uol6fDf6SqJBHLtmos4gLSvw92J/Ia8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7sSlga3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7sSlga3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710087134; x=1741623134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I97B6ufJ7V+D8H4AQ4fh5sgig3l2UnkYEW6x2ElmpzE=;
  b=X7sSlga3IX/C2X6rN2194oeQDRC3jzxrUXqXatCenF9boDVfGPB5hzCc
   DPxqy+uvfqTEnqL5dQmDbAAtBu2JO695+1uhVZ6VJE6tCPss33Zxw606q
   KGgszjB70/RsDf5hgE7H3I6Lw/xTF/kaHn0/Drk63fX4R6Bc8U+jk0c5C
   C9TlCxkGiMP/BiQzJfz2cl8/LbpeCC8twDRGmAhMQlVQa7j7RCJjMuPmC
   zx8RL8VvdQGs3Wdfx84iAHuV7Pqr/XUazisfLtdKppvp8E27jpLHr8n9e
   uALISeDu1dF9radVcT6shStiaVVVT9bR3KQaVznB7DZyTD19px9XuC2pU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16183779"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="16183779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 09:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10847430"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2024 09:12:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjLmT-0008N9-2V;
	Sun, 10 Mar 2024 16:12:09 +0000
Date: Mon, 11 Mar 2024 00:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.8-dango_2 12218/12225] Error:
 arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts:343.1-7 Label
 or path slot0 not found
Message-ID: <202403110045.cPbdchqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.8-dango_2
head:   f60356397a938945300aed3f86c82a9db16bd3b9
commit: 311a284ade1bc4603dcc416228980ec2da9dcd19 [12218/12225] arm64: dts: mt7622: add device tree for Adtran SmartRG 841 T6
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240311/202403110045.cPbdchqm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110045.cPbdchqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110045.cPbdchqm-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.8-dango_2 HEAD f60356397a938945300aed3f86c82a9db16bd3b9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts:343.1-7 Label or path slot0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7622-adtran-smartrg-841-t6.dts:374.1-7 Label or path slot1 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
