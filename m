Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA932D45B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025399; cv=none; b=Vaj4xgG9TF8Gopfw0OJOoX8oTYG63k3/VpDUDJg2x3ENNP6xVigQrkoveLQ/rnaN6+5mMw1S5Vck6BT6qIx2qdGqq9WFwBTL5+F6gpw/kO4KZ4T8AWs0hI36FFJ2kZDok9d+H+QPgPeM2gM1WcbsHzX6CcK0BLyKEJQTpfSaXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025399; c=relaxed/simple;
	bh=luxTQIqxE58l7sG3Fc4jUEJMYHBgHXs91L7zH3IkbmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p1UsVLPyQB6Vl3oq8eg4Od6J/W31lmNwzfJt2PObn5gHzg6Z6KPkxzsJizcQlWxIGiU2Qerui9K69cOekADYp5Q104YDSFP0smUJ6hE1/P+46OvI5GdGA9JYbGnY3XIW408ShpdmXImOC0E3DPR5j2y1yi+Ks21TTX3e7PLCR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXhOGrHg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXhOGrHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025398; x=1806561398;
  h=date:from:to:cc:subject:message-id;
  bh=luxTQIqxE58l7sG3Fc4jUEJMYHBgHXs91L7zH3IkbmE=;
  b=iXhOGrHgA/jrR88respKOzYRjnBdEujlkV3X8MD6HcNWxfv7lLsUxpb2
   xYzNP1yrF2DIjfdQZ+3iq+qCsWZ5guP810yacJQcHj/il6DQZaxJeqeh+
   oWGGmPco5jn295JO/m/ARVjLEgIXmfT5eePjqS29W8K7LMc3Pxe3LGDii
   h5ohwL+in8Tsw1fTtVDU+0slWjiOyr1jBd9Qni49sr12WfIF2FxtB6FDG
   Pw1j/Lk9XgdO5g78fK8mK/qdkpJS2RRi+1AqaELIEKjl6uUkt6SAtNCs+
   xautycwdEM6tEnaVsmGj232Zs4QWyluoorjaWFztJ/bQAZq66uzML6ndV
   g==;
X-CSE-ConnectionGUID: 53K2HNGSTFm8u8XgqC4tPw==
X-CSE-MsgGUID: bpIy2CHISJOZsrEd0gPg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87514010"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87514010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:36:37 -0700
X-CSE-ConnectionGUID: 9ktjOTazTO6qiGkXWhWsfA==
X-CSE-MsgGUID: n6RtgcRfT2KY+IkaSjy+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249805320"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2026 23:36:34 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pBo-0000000002n-1jg5;
	Wed, 01 Apr 2026 06:36:32 +0000
Date: Wed, 01 Apr 2026 14:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/fortify-strlen 4/4]
 lib/tests/fortify_kunit.c:57:13: error: variably modified 'writable' at file
 scope
Message-ID: <202604011436.6Wkidb5W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/fortify-strlen
head:   b1ceeebc2beeebc79225ffb42ed92df2d189fdf9
commit: b1ceeebc2beeebc79225ffb42ed92df2d189fdf9 [4/4] kunit/fortify: Explicit test strlen() with static initializers
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260401/202604011436.6Wkidb5W-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011436.6Wkidb5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011436.6Wkidb5W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/fortify_kunit.c:57:13: error: variably modified 'writable' at file scope
      57 | static char writable[strlen(writable_default) > 5 ? 9 : 10];
         |             ^~~~~~~~


vim +/writable +57 lib/tests/fortify_kunit.c

    55	
    56	static const char writable_default[] = "default";
  > 57	static char writable[strlen(writable_default) > 5 ? 9 : 10];
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
