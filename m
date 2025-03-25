Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906E25776
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888343; cv=none; b=TqHa9tqikmEEey4o5tp/KizvreFVoHNcGVnIc25m/8s56N1ZMFNRXOQZ5Y3D3XgITGQA6oYHuIJnLCixM1B8qSPwrV1MICi5+CQkRI8zhAgvYuGt8ygs5OEgEEtDZN/Drrj8aodpY1byQRSdPcDK2VbUCJrtEskaMf8tfPZeR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888343; c=relaxed/simple;
	bh=3z7X92vNXlZLxMtvQI3SaZawPMnVRQFQDE6W2COm2SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYZBgnT/NFHcTvcQbBxBlzbxzZNXASQSaCLUCELi7aW5TPGHKo6Cdm68xRFkll+lJNhlx7euvYFIMZfItXLmeN8fiwexutFUv8QA2v3BMXdHI1LxvurR5vU2iLi1gm8IJjDGTUyKoMAulQ+If6u86nXr5zjcCnwzWREmJD+KDbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyTsqp8b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyTsqp8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742888341; x=1774424341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3z7X92vNXlZLxMtvQI3SaZawPMnVRQFQDE6W2COm2SM=;
  b=WyTsqp8bu8EmLcq+vLy/yO//dOsIBg8zKqpw0gHsdmBZRn2UU9WdvW+l
   JJpjaYJCLXsPyn74dMR47wXR9YBsocialhGkvxPjUGDt6EA3KIQ5qrjH0
   +7pBTQVRcA+QMkicjUoM1L8BZHAOIV6QJ2IK0jDq6PRECXRAcpvm1pASy
   SZeYX7+RurkqTKX9J4bOLi/Z62f+KAJhSbToNBVbEpenQktk3XseltVIV
   gUdvMCPOeTvyVp7/Ok1H92Q/r6cNapN2LW7lpXG8srLrTSOdg0yOY4Xrz
   YPVXyZG4QoE8r/64WrtrqbAYUH6rachKcMJDSJPPx+QTlylUdQJ0Yg9w4
   Q==;
X-CSE-ConnectionGUID: bHpWDcnJR06mCaJJ27N2Dg==
X-CSE-MsgGUID: jQxCWvngSzKxzF1o5SHZVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43356137"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43356137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 00:39:01 -0700
X-CSE-ConnectionGUID: Doi3cIMqSoeNl8DTS5WVFQ==
X-CSE-MsgGUID: p5609WTRT5Cg/9qH3dScwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124322825"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2025 00:39:00 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twysD-0004Cx-1M;
	Tue, 25 Mar 2025 07:38:57 +0000
Date: Tue, 25 Mar 2025 15:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/bbr3 1/1] ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko]
 undefined!
Message-ID: <202503251518.MpRpCxgH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.14/bbr3
head:   34167ee061e35e8bb9368e1ea575b2f1fbd4867c
commit: 34167ee061e35e8bb9368e1ea575b2f1fbd4867c [1/1] tcp/bbr3: initial import
config: parisc-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251518.MpRpCxgH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251518.MpRpCxgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251518.MpRpCxgH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!
>> ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
