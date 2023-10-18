Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1CC2FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeDV6FW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697612905; x=1729148905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ds32oF4WDhxK3gUBfvzW9QYJKvK5JgYVaGzXEj/eUyw=;
  b=IeDV6FW1K5LsvtKSsVKkIX9NKd+L1JlH183rADdyTgFNStsv8ZRxJfuM
   95u+OK8xQmxlfCwaMsRbQBtE1odmHUnnCOMFgywGSQaaxxFPna9oWAeNy
   E92iHuQVOQFcI6QahCR9UGfayfb8krfSGR8Z/i/yKKo0ccySh32hpulMI
   LDksM/BDlYe9YoxmmmDuOnWeFu1WGZ19yLGecXcxSl8jl+YttuRcpBwjz
   qwvCLhha5BX31sgWb37232/kbw2I11XHVNbV3b6nG3RHFwVwliyVcriP6
   gc0ya7cbyTmRZX1gcZL2R2dRFeTj+G7E1UOpaxPgRyF8LMJuMpt3GvYBR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452426783"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452426783"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826757516"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826757516"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 00:08:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt0fD-000034-1q;
	Wed, 18 Oct 2023 07:08:19 +0000
Date: Wed, 18 Oct 2023 15:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rtbitmap-accessors-6.7 25/28] checkpatch:
 WARNING: Possible repeated word: 'the'
Message-ID: <202310181232.zsNZWioY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rtbitmap-accessors-6.7
head:   bbfd98d868d78ca1a2e579e8a141932302fb8503
commit: bab392259f1eea706e77027a6e36df15e924b415 [25/28] xfs: create a helper to handle logging parts of rt bitmap blocks
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181232.zsNZWioY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181232.zsNZWioY-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
While we're at it, fix an off-by-one error in two of the the rtbitmap

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
