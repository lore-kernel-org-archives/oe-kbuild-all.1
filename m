Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047D1E572F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 00:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766450024; cv=none; b=hhDPQfY7IU9tOWBkPzZVU9f59/r3Szv802qg0tVuYg/3yow6BXCDP6Hg7DGJXucf5b4t+R9WP0FkMTwo37JX7xvWwDsoi4OximmpviUIOThwJStu0W177Ou/yC1yY9qd5+MpMEVvOU7C+MbS2o/qQEjlZaiRagSMhC/4cv3raUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766450024; c=relaxed/simple;
	bh=FKklEHyeI/njf60Igo29V9POwCT98B5Ns21zj+AF4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pusq/dpSBXC6IYPEf8QCsu3KVUcmFJsrqhXslj35dCi0TQhxqYimUtV4kzD+05TNeaTBCHoV6dzD5WMXYlfm8yDbslGVEH5IM3vFu3ZGIJHqo/oplkUzfRkCatoBf9XAnjzBZbkPEAown+JvV3rkfgPJs54F6jsz45IS2CUYvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkCv73fd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkCv73fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766450023; x=1797986023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKklEHyeI/njf60Igo29V9POwCT98B5Ns21zj+AF4wQ=;
  b=CkCv73fdQk36HvbbEBjGuAuUTXWMoRDIhl/Ug9jVMPkciA9XOub49Kd6
   zNmKAY4WoL7TVknazn8q3058r97wZtKxtPlTpqA2xWDjUFhyB8KsmWAXm
   oDp7qS2oEgiWwnJ9+Wjk4oax/oqNccBKyXfbAprw0My4AEUr0FOtJ16hU
   2sKedHAOpneK0UxGHDWN8x5oL1I4V84ygR3LZiHDFfvQRCUbJT9XEm2Ju
   3sVagaGClobWqK/5aTp67tInkh0/Qxy0SINsTWlIaTqNi0PfGzCAHj+zP
   +74vBWTyWIIbx1JqGudueHd2b6bYBAsWHtTdqLXEzocNOQOdOMACmvkFC
   A==;
X-CSE-ConnectionGUID: ZdivsMjlT7+wj+O4RqG/3w==
X-CSE-MsgGUID: LIZr40gvTq2I7WDpq0HYWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78619475"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="78619475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:33:30 -0800
X-CSE-ConnectionGUID: lj/fqBRPT1GKAvbGkui9cA==
X-CSE-MsgGUID: 5Gout/c5SsSiJIZDd37BUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199303883"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 16:33:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqL8-000000005g8-05b3;
	Tue, 23 Dec 2025 00:33:26 +0000
Date: Tue, 23 Dec 2025 01:32:26 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 76/131] htmldocs:
 Documentation/core-api/kernel-api:304: ./kernel/acct.c:306: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512230159.BhWPpHr4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: e272cfa94fbbaa41a1ef6f26105a0d4d3e4d8cbb [76/131] kernel/api: add API specification for sys_acct
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230159.BhWPpHr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230159.BhWPpHr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/math64.h
   ERROR: Cannot find file ./include/linux/kfifo.h
   ERROR: Cannot find file ./include/linux/kfifo.h
   WARNING: No kernel-doc for file ./include/linux/kfifo.h
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:301: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/kernel-api:304: ./kernel/acct.c:306: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:355: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:440: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:452: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:463: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:474: ERROR: Unexpected indentation. [docutils]
--
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:530: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:540: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:549: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:553: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:555: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/core-api/kernel-api:304: ./kernel/acct.c:557: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/bio.h
   WARNING: No kernel-doc for file ./include/linux/bio.h
   ERROR: Cannot find file ./include/linux/clk.h
   ERROR: Cannot find file ./include/linux/clk.h
   WARNING: No kernel-doc for file ./include/linux/clk.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
