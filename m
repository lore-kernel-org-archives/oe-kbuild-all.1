Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E4A2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVj+0N+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697442956; x=1728978956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VH4KFvfmsRgwPMJU3yVajsr+9B5135eI0GbJwX3XDfk=;
  b=NVj+0N+8rdUHDlp7N0a9XqA8THmZHhszIH+NhSxD4O0wwdYOt45tf7BU
   uyOa3w1A4y79pZhJHk6XAp8q/KZEoV8UZU6ApDtk7p/4K/mspaIvHmxZT
   QIGBmeT01SY0EhABNFFOgo9kAmTKOBBuGZmuS6dkbSkrg7KOI1p8rFyZh
   cpgdvL0CPn1jYqn68VJx2hFAjwDOfn8nuWdQAQIoMAWWliTH9D2HC0Ywc
   qWK0eQUvlBSwKG4BrMeSHo9HFYK1vX69eqYN6MAXvWm0QpXnSsU/fFmI9
   Xp8WbuuzJn/djl0Ijgs+pYg5jPlROJ/Oli80LTjcdcjNHwpVkRGMz4JY2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382696459"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="382696459"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825912544"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825912544"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 00:55:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsIS2-0008DR-2Q;
	Mon, 16 Oct 2023 07:55:48 +0000
Date: Mon, 16 Oct 2023 15:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:for-v6.7p 25/180] checkpatch: WARNING: Missing
 a blank line after declarations
Message-ID: <202310161501.h3nY7zJc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.7p
head:   3df5704d52d7a8077c1813ca553d83965ccd7c47
commit: 0ab13674a9bd10514486cf1670d71dbd8afec421 [25/180] media: pci: mgb4: Added Digiteq Automotive MGB4 driver
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161501.h3nY7zJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161501.h3nY7zJc-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		u32 data;
+		s64 ts __aligned(8);

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		s64 ts __aligned(8);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
