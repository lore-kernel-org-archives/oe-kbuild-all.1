Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49499501F3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633204; cv=none; b=D2l/BbHrvbFFZNOJ8Pl0LEd5+gItEogn+bjL7Y1GggXHYCe5Y3Z1x0Ms+M4lc8xo/LYxNjZ5AVi4j2wvQbfpAEfjXPhuSbqkVADrIXnYsn+OYtmJ/6r/l7byRA+1GQMje9aBbTbo/UlHcclfesUYH0X3GwJX49wrzPlGB9ATD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633204; c=relaxed/simple;
	bh=EMnspZ+Cko3uleMcY9aVG3KuZE6co7sQOeLQNl/jY3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Olh/FJ8hH4q+aKvAwDnMZfUU/7myip+83knbJwXeqeMczEXkDSNXCI4jafdHtmWmuIwcExkyR8tD3kAhs6VgyK8+l2qVUSF5I8DZZmxEk84NO9tM2FZFogzpPw7e/YdffafigF6SQ8GMketAvEbaUDv81HEglhfkx1OMJ6E4xhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9V1j/yr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9V1j/yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790633204; x=1822169204;
  h=date:from:to:cc:subject:message-id;
  bh=EMnspZ+Cko3uleMcY9aVG3KuZE6co7sQOeLQNl/jY3k=;
  b=M9V1j/yr+Tj3OHx0wtcnzZalSidudkqjU9pCBxTFcbGXUr+GtvKCD4cK
   FuU1CGeKzV33vN35nmQSr1foEhNkDqKbccVf9Azzkd9nWR1tG8UWPZNU6
   N1HP0p/YKPQVCXS5vfmSiG4nMOzZ+n8hMvgzQOKwT8uswrz3SylbevDDv
   7t0RViQ8I+oNieJ7bPO2VTTPdCwgrWSaJc3naYI8jE+/qVNE0vuTBv3VJ
   0Pp56tJO54Xa14qc/0HgnhIyaCRICLSXHyiB6hDVPtqIUAJrqz4Px9s87
   GowU5En2MeBJSgrqh0z5OMSNVq5AB8DsGh0YvKcIyNeexC2/Kf/FXLxay
   Q==;
X-CSE-ConnectionGUID: YexxPMeHSWSkhRPU0AFnCQ==
X-CSE-MsgGUID: Aze9RF0zQkSEAQjmtDoC9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90397814"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90397814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:06:43 -0700
X-CSE-ConnectionGUID: A61TC1vuRn2wqv877/pepQ==
X-CSE-MsgGUID: ARCcizhnQS2csePx8kmIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="279897312"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2026 15:06:41 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJUd-0000000019P-1iJL;
	Mon, 28 Sep 2026 22:06:39 +0000
Date: Tue, 29 Sep 2026 00:05:57 +0200
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Ranjani Sridharan <ranjani.sridharan@intel.com>
Subject: [thesofproject:topic/sof-dev 7658/8676] nios2-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202609282356.wF5saX0p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   31d325add7cc39aaf227bb8f5e5dc292b735db25
commit: f7978ee0239f435e07135fb50cd3ab6842f1f628 [7658/8676] ASoC: SOF: mediatek: Add mt8365 support
config: nios2-randconfig-r2104-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282356.wF5saX0p-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282356.wF5saX0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282356.wF5saX0p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> nios2-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data+0x7c): undefined reference to `sof_of_pm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
