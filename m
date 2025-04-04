Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924462E62B2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743742845; cv=none; b=eOoOEyF5J0BgsoAtE21nyVKcIcg2wBQ7aBDZsqbrwJgvHe5D8RFuBQjXdaSlZDJ0m6qneNnp3GzkBur81V6LTnDETRRNpR9mOQEoxt+5DivsMTRQll6e29Ccda65ogCjg8KeS8emNEwj5tQxnnspIi0ztQJHE0wUPDGSauClBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743742845; c=relaxed/simple;
	bh=xUAh5zFTR80NBQGAhPhXrtitVYcBPpXb56H5xGKG3Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLhx+wQ1tXO+EeUrfYsoAQF9hSt+IgCgQ6o3J0X4s2vTSoeqH4pVPl7mpPUpvlMAr1AIKnT6t4qZb31zwDLZBCZccDxLjq4xHx0hjZT3nZil6X6P73/5deTX80FNspdRY+B56fQYywEhlba+JXhhccCJ7b4lNjIHrN9yvy/boJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lf/1Zw4Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lf/1Zw4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743742843; x=1775278843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUAh5zFTR80NBQGAhPhXrtitVYcBPpXb56H5xGKG3Io=;
  b=lf/1Zw4Y8cLdmAHukavazF/S0AT5P4zzC7j1k5dL7RfYAt3/mIsLMuaM
   wH/mkzO41fnelghghY0Xgt/75rRNcYayY+9u5HcXBst5ZRukYuKz8KmNB
   0QFPsCsfHCZs2W5+0uKkdGkq3jsfbEODMO9ImQZ0cekZoR9YSYpV4O4kd
   0KSt1T718S3ldAsIycPeIXjccZnOlhkqCMO61zX236SafBJpPMARy5hG7
   KpfKyCGjg3OXejC5tieUDMx/mhHxEgy14/ANrkrMS8n55SoAiaslz5xfu
   xTUmyA9nRJ2H1kbqEesw9gMAfUE/fKuC4imMVzsAXPu6LsQvqT7mR6DTd
   Q==;
X-CSE-ConnectionGUID: A7o1Ui5uTk+4DjjvRw7Bew==
X-CSE-MsgGUID: YDU4JgauR3+nqmo4prHQQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55368368"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55368368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 22:00:43 -0700
X-CSE-ConnectionGUID: SMx5rjtSSQORx9nhfPmprA==
X-CSE-MsgGUID: a/7frf3+RtKUJkVT8xVHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127740617"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2025 22:00:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0ZAV-00010F-2g;
	Fri, 04 Apr 2025 05:00:39 +0000
Date: Fri, 4 Apr 2025 12:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2089/2089] fs/ntfs/collate.o: warning: objtool:
 ntfs_collate+0x9c: can't find jump dest instruction at .text+0x3dc
Message-ID: <202504041224.uqw8VTgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7b875ea720bc6e57bfde437f67d42230a63438f6
commit: 7984eaba9ede77910543832d6e19af3f84f49d7c [2089/2089] LoongArch: Add ORC stack unwinder support
config: loongarch-randconfig-r064-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041224.uqw8VTgL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041224.uqw8VTgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041224.uqw8VTgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs/collate.o: warning: objtool: ntfs_collate+0x9c: can't find jump dest instruction at .text+0x3dc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
