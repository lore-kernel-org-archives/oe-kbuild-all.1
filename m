Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659E36CDFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771974; cv=none; b=scChIgjacxhMTqfb/WlrwWo2ybs8CnTin3Qco9s/hgI3tO7lZMGr9Z2Ncf7omGF7S5izRJTtWVPfFpzGovJCKMl4qRfot5oI208XpShfT4v6vOj468y+dfqva810Rlz+r78182xvvHjH1Am0m+1yL/pbnpLPZ2v89F49o+ZvIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771974; c=relaxed/simple;
	bh=H+g+SdWdxRlza2oA9SUuRILR3W2HynA8cGz+CBE6y00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psW4/C06Jmp68tGRbhu7JjZZnYP69sc3X4VkuLvcoVVm4g6v5+eaop12rgZ/xGXAzDUcm/Is3bqV0eEzyQab/5j+Sm+fH6o0xV6IRRHBmrmCRPuZL8pbbaY6y5zYgDtKinv2HmL1YRCKOYnEVjg/NAPNf/9LWl8e0SpANDY/mNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1IE/PN9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1IE/PN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782771973; x=1814307973;
  h=date:from:to:cc:subject:message-id;
  bh=H+g+SdWdxRlza2oA9SUuRILR3W2HynA8cGz+CBE6y00=;
  b=Z1IE/PN9/mQDUJOToH1fBHjR5vBqkzHdJ0hbypgEolQJaN2LtZ7bgRtC
   ppa/XocUXb0C2ucvCj//J4proM6SE72bNFVdBAMMSenQ7cDEaJTqOy0w3
   XmDKA8quqfKhjJXIqbupxrm9EUUTMAfo5VcV1Uk6eRnCRxatV615Tizor
   2GboEcqpKl8dSetNHSaqLqCcWoT+2HYnmzAxERPVYr4waMbb06eeKEtjF
   Yki8bu6kwLrv5moXHJVrjvYf7n8ZbKpSCUHPdG0h3u9Jpf6PbcCwJ8J9e
   DxlM3cMpL4UK/l8+/7CPQj6YOz4i22hudWtlEJA/mQWgN55OHJTTpC3y4
   Q==;
X-CSE-ConnectionGUID: jcRbYZfiRiGWQx7LRGftzw==
X-CSE-MsgGUID: ePQS6ND3S8C08wobtSV/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93832682"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93832682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 15:26:10 -0700
X-CSE-ConnectionGUID: SzSN9Fi3SfuEEizhoBfkOQ==
X-CSE-MsgGUID: cj1p355CRiWP9KEU9LF/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="275316938"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2026 15:26:08 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weKQY-000000000Ff-0xja;
	Mon, 29 Jun 2026 22:26:06 +0000
Date: Tue, 30 Jun 2026 00:25:32 +0200
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260626-1435 14/24]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202606300043.wPPIq6VK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260626-1435
head:   5e303b90f40cfc84c2bcdb5ee07319ac63df48b2
commit: 9bed45c17198e8f83064ad539ac6c18a47f74183 [14/24] RDMA/hfi2: Add PIO send infrastructure
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300043.wPPIq6VK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#199: FILE: drivers/infiniband/hw/hfi2/pio.c:155:
+	int centipercent; /*
+				 * 100th of 1% of memory to use, -1 if blocks

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
