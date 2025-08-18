Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA22517AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540941; cv=none; b=XiE/JkdQZpZSNntebhlrzp8VJdFpxC+VCyiVnvOccEiSnjO5jMsYcItMcGoQYQwF0pyP1jmqj5PV9lEp0jBY1egLC37UK6b4Iq4J5/l+cTjEYqM6yjvCmdE3EvgCPE8BPbiGo4hHJucx50BEalDST5KKNrTLxYxim1/06ZyHK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540941; c=relaxed/simple;
	bh=noRtJjnjg50KSl1kAwduSfipiFi8/DiCTkFHGz3n1rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZBxN/pR6aZsy6oELl03HFZp3D3+vTDyc0q8FJce/EdnQcFp4hORasVuY5IMZggW9k8wdmVx2/d97mmADEJ36SHOQ08c8wOAdYpxr8ohjz2gjsKIarAXWtYppQV3Iu61BbUNmc4n1sTZu8R6GV12WYyM0tIyqxvk0q73NBKI+4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9WRLMe2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9WRLMe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755540939; x=1787076939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=noRtJjnjg50KSl1kAwduSfipiFi8/DiCTkFHGz3n1rA=;
  b=I9WRLMe2G5C4XAN93PC9nLVxIH/E+q+otBG3PKMTZYRsNYICiz1mJWGG
   Kjnv17mVWVc6n+KKtOME5+aiM1XyWY5h/Vc5fjPPTU3cGHmTFgsb/lZWp
   NZwXFbqKpwhxecmaTnLl16GlZE9cgzlMeSJo6fUbX7duJhkaJ7VltJCKN
   uRs+fmljGG+exmTNi363Wo6gO3RLfkMGvbk3G4W0UYTrPZK2fTBYcLOP6
   MDACZJ6BJPpTInxh7AnGbxkLdzGwnW6I6N1U8jPZAzFakxypp1B/GnVqS
   svAdiX1Ixp5EBFnVgY52B1fi3njFEoFvap03fSbUlnkF4EFrDDhfIQW5W
   w==;
X-CSE-ConnectionGUID: G37YiHMxTbChbOcu4cxSAA==
X-CSE-MsgGUID: xaMNCiY9Ruah7MKZxn6rdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57630055"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57630055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 11:15:37 -0700
X-CSE-ConnectionGUID: ffP1HYbCQH+4sTVoMkqbuQ==
X-CSE-MsgGUID: i5xvGP1WSPeSOdtU3WFgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="204806279"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2025 11:15:36 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo4OL-00017j-0u;
	Mon, 18 Aug 2025 18:15:33 +0000
Date: Mon, 18 Aug 2025 20:15:13 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] drivers/dax/super.c:45: warning:
 Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'
Message-ID: <202508182052.TJO1Yi0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Long,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 63101913bbd057cea31fb598eeb4a4c91584f0f0 [2687/2687] dax: kabi: Reserve KABI slots for dax_* struct
config: x86_64-buildonly-randconfig-2001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508182052.TJO1Yi0k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508182052.TJO1Yi0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508182052.TJO1Yi0k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/super.c:45: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'


vim +45 drivers/dax/super.c

7b6be8444e0f0d Dan Williams      2017-04-11  17  
1b7646014e0d83 Christoph Hellwig 2021-08-26  18  /**
1b7646014e0d83 Christoph Hellwig 2021-08-26  19   * struct dax_device - anchor object for dax services
1b7646014e0d83 Christoph Hellwig 2021-08-26  20   * @inode: core vfs
1b7646014e0d83 Christoph Hellwig 2021-08-26  21   * @cdev: optional character interface for "device dax"
1b7646014e0d83 Christoph Hellwig 2021-08-26  22   * @private: dax driver private data
1b7646014e0d83 Christoph Hellwig 2021-08-26  23   * @flags: state and boolean properties
db8cd5efeebc49 Ira Weiny         2022-03-04  24   * @ops: operations for this device
8012b866085523 Shiyang Ruan      2022-06-03  25   * @holder_data: holder of a dax_device: could be filesystem or mapped device
8012b866085523 Shiyang Ruan      2022-06-03  26   * @holder_ops: operations for the inner holder
1b7646014e0d83 Christoph Hellwig 2021-08-26  27   */
1b7646014e0d83 Christoph Hellwig 2021-08-26  28  struct dax_device {
1b7646014e0d83 Christoph Hellwig 2021-08-26  29  	struct inode inode;
1b7646014e0d83 Christoph Hellwig 2021-08-26  30  	struct cdev cdev;
1b7646014e0d83 Christoph Hellwig 2021-08-26  31  	void *private;
1b7646014e0d83 Christoph Hellwig 2021-08-26  32  	unsigned long flags;
1b7646014e0d83 Christoph Hellwig 2021-08-26  33  	const struct dax_operations *ops;
8012b866085523 Shiyang Ruan      2022-06-03  34  	void *holder_data;
8012b866085523 Shiyang Ruan      2022-06-03  35  	const struct dax_holder_operations *holder_ops;
63101913bbd057 Long Li           2024-02-07  36  
63101913bbd057 Long Li           2024-02-07  37  	KABI_RESERVE(1)
63101913bbd057 Long Li           2024-02-07  38  	KABI_RESERVE(2)
63101913bbd057 Long Li           2024-02-07  39  	KABI_RESERVE(3)
63101913bbd057 Long Li           2024-02-07  40  	KABI_RESERVE(4)
63101913bbd057 Long Li           2024-02-07  41  	KABI_RESERVE(5)
63101913bbd057 Long Li           2024-02-07  42  	KABI_RESERVE(6)
63101913bbd057 Long Li           2024-02-07  43  	KABI_RESERVE(7)
63101913bbd057 Long Li           2024-02-07  44  	KABI_RESERVE(8)
1b7646014e0d83 Christoph Hellwig 2021-08-26 @45  };
1b7646014e0d83 Christoph Hellwig 2021-08-26  46  

:::::: The code at line 45 was first introduced by commit
:::::: 1b7646014e0d838b06be7288e2dec3262948cc56 dax: mark dax_get_by_host static

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
