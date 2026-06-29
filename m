Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1864358360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771973; cv=none; b=MfjHumPPto+6TNtK6wVN3mK54M/smRUQouYADzYesAoFJ5gOoqaR2GJBR1uRMbLBy5iY6cZ4TpgSO00N8YFzXr15LPRQNRGvMVllzeitqruXvHL/DWDcRSHQLi4k/9kwVir9RXrDQQoskVZttNUKssFNxVHvMFw9Hm0LHosxFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771973; c=relaxed/simple;
	bh=H8p9jN07XnkajLcQrFEi90qol/CzY9HJ/lRaAbXHXGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iAh0Jw1giOKEmse+7YBrAKH9tD8c+6OX5Lh28YeBpHFRc6DVBBo29E45Smt6WuZl1x1IxX4h0ylYdWpscVJBq14Zg0X2Qv5+W/JIjDbxdPBlqW5GTuhpw6vLxPjEBPJvu4C2IiwdA8duqaroC1ssXXdCG8Cdu69ioB37dPSu8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR12ChkY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR12ChkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782771970; x=1814307970;
  h=date:from:to:cc:subject:message-id;
  bh=H8p9jN07XnkajLcQrFEi90qol/CzY9HJ/lRaAbXHXGU=;
  b=lR12ChkY0SVLdoPCRpUTNWxZIki3XWWVBY11RC/8fvr15PbHr7JG8OqY
   NFXxEnqeHLtUnw46/5dCYmJahAs2PczhECxyy06VAdeHtKYIv8dkQ7QeO
   CrxHxHx3gqe/6of9Ow6jOSxwdJpcRuIs6XozcVItxC9mIm4gti1Z0Av4Y
   xuuaMhbc3lCQHWEPaZQAjPTekqeRDTQGVx6nQ9VJbTxCnq/RtqDzSvqXK
   dF4hQ2dIpM1AWjFjWbuC7g0/sIoTz738oTAgZfNpxbBTtXeXbTn+4H/Qm
   X/M2hava9DyvF2jq/k7r9pCp5JllImxHV4KhgIVXa9F+F/woLDbVsXWQ9
   Q==;
X-CSE-ConnectionGUID: oXTRFsMNR32c6KaqYWzmdQ==
X-CSE-MsgGUID: ADeTfzLcRuandpyF/I079A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93832680"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93832680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 15:26:10 -0700
X-CSE-ConnectionGUID: XfMTNF/RQ8qZWnfIeOJqFw==
X-CSE-MsgGUID: 5WMO0T9ERnuXQmFUOiiylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="275316936"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2026 15:26:08 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weKQY-000000000Fh-1AWk;
	Mon, 29 Jun 2026 22:26:06 +0000
Date: Tue, 30 Jun 2026 00:25:29 +0200
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260626-1435 4/24]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202606300052.n4INgwzV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260626-1435
head:   5e303b90f40cfc84c2bcdb5ee07319ac63df48b2
commit: 24d03da18f38bb535acf223b525ffd264b66ea3a [4/24] RDMA/hfi2: Add in HW register access support
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300052.n4INgwzV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4393: FILE: drivers/infiniband/hw/hfi2/chip.c:4323:
+	/*
+ * start		 end

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#14777: FILE: drivers/infiniband/hw/hfi2/chip_jkr.c:598:
+	/*
+ * start			end

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
