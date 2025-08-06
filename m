Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C9214A6A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 19:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508846; cv=none; b=LBLZ34DhLVds4pCrsSDrPjjAQrHfU45bZSdr8F8Pa+yu+BVerxJNQId7iLL1xGkeZ/BWjpW2n6HppfZjIAX0X5/F6ff0WGuIbLzeZPU5yMp4WdzNF1cE+ylSBLjVX9faDpPVexjRJgWYzyURMEEH7EXGujGnUDxVxDQ54/XsqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508846; c=relaxed/simple;
	bh=I2ZjiBoABg3vL9xpgJjm9ONJ6K0S8dyHY2g5A0oOCgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDHiNwcEDI7xDVrrYL5HJMV6PoefcGywnMbUtIGAmZpkEgt44gy6G2IiPD8A3gEWJb8h7NAAaI55TWBMpRrNmru1TOz869V1WgZUrCQgHBl1wjgK2oWR/KBo7Si1evEpS+08TgHPW61PzwfE5sj/TOvIIE9CnjqShnEFK4wv5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAyIXa+F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAyIXa+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754508845; x=1786044845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2ZjiBoABg3vL9xpgJjm9ONJ6K0S8dyHY2g5A0oOCgY=;
  b=IAyIXa+FZQf1w18rrdiqX632jLvK+3Dios4LEzHM7EZkXy7ZnA35C2se
   Qm+SdhnBTxUBrI9oWTi4eG8sQnjx8m8OMv73ILO/6gtIFTtYqztYpCrx5
   NeTNeL6mt9RE1QEjS1SBlS7kZ/4J1YXVPlggM8SjCau8TDrcipzNBLP7d
   OLAJryzbWcJnGQUpOuY2b8b2eII0iynpUbsbkHO7nCmBu0NKoFaw202Gm
   ASN2gEqpQiZF83WjTAkcP3TM5qbAGoeLy7lokEG9TVKlXB8b5Qzhnpgsb
   D8aPmDqifxqeIVrVTcBNRJDlGD2Zd9fi0Feg0y8h5saeNv+BbyPMf6GUn
   A==;
X-CSE-ConnectionGUID: yYHNjffXTvy4dY1jRMKm6g==
X-CSE-MsgGUID: kyatCeRnTa+mS+d0bfAfvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60468478"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60468478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 12:34:03 -0700
X-CSE-ConnectionGUID: oFowJcMyTJi2cSFDhoL1YA==
X-CSE-MsgGUID: y1C+q5cHTnyuwXWsBYG+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169294466"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2025 12:34:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujjtf-00021k-2V;
	Wed, 06 Aug 2025 19:33:59 +0000
Date: Thu, 7 Aug 2025 03:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 6/7] Warning:
 fs/smb/server/connection.c:53 function parameter 'inet_addr' not described
 in 'ksmbd_conn_alloc'
Message-ID: <202508070312.uVOEHE5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   e93cacc370af1638851fe447da90438f954b8de5
commit: eebc2ac55b40f0829837e5c986e6d26e7bcd73dd [6/7] ksmbd: replace connection list with xarray
config: csky-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070312.uVOEHE5y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070312.uVOEHE5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070312.uVOEHE5y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/connection.c:53 function parameter 'inet_addr' not described in 'ksmbd_conn_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
