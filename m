Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9C15CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 04:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhVnfu5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698122861; x=1729658861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISSkEhQ+Xw16+5nw9WvRkxcOqkIyLj2swMnkBKFWjlA=;
  b=FhVnfu5CaqRdmpOgORAHvN1xXt9pgnvKTscFLICSoqNLL5RbULmaaW9Z
   RtZ4DFg7A+e4svTAYyeNfA00giY4b/0ojdvPLA5/K+bbFN+OFMwaEjywQ
   UIM5NAKgg8rN7F/z/C9JqkStkVy6nf84CgljwbgaKZltYgz4qfVlqVPfL
   53LvG8kN8mc6G74Ydq9ztRxelP+3eBto8TRGnDhDB35iYQWju1dXgQM2A
   lUlWZqnDrSDHi0ds89kTL80F/AWf8dKJzDdsZwPDunoqGCnmtSx7vHDmp
   lKdobACcz/nIvXSU2GBZ34boyThwsi0KEpcOMJDdkCLiWqVNkMGYaiffX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366330349"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366330349"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 21:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="761979050"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="761979050"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Oct 2023 21:47:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv9KK-0007Zd-3B;
	Tue, 24 Oct 2023 04:47:37 +0000
Date: Tue, 24 Oct 2023 12:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm_buf 6/10] drivers/char/tpm/tpm-buf.c:51: warning:
 Function parameter or member 'buf' not described in 'tpm_buf_length'
Message-ID: <202310241246.PUoufuVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   19f6e9fedbf68841c13485638dae42d3026b134f
commit: 4e5479df563c5931f1e39f552922901f2891dee5 [6/10] tpm: Store TPM buffer length
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241246.PUoufuVL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241246.PUoufuVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241246.PUoufuVL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm-buf.c:51: warning: Function parameter or member 'buf' not described in 'tpm_buf_length'


vim +51 drivers/char/tpm/tpm-buf.c

51afeadc9432f1 James Bottomley 2023-04-03  44  
4e5479df563c59 Jarkko Sakkinen 2023-08-11  45  /**
4e5479df563c59 Jarkko Sakkinen 2023-08-11  46   * tpm_buf_length() - Return the number of bytes consumed by the buffer
4e5479df563c59 Jarkko Sakkinen 2023-08-11  47   *
4e5479df563c59 Jarkko Sakkinen 2023-08-11  48   * Return: The number of bytes consumed by the buffer
4e5479df563c59 Jarkko Sakkinen 2023-08-11  49   */
51afeadc9432f1 James Bottomley 2023-04-03  50  u32 tpm_buf_length(struct tpm_buf *buf)
51afeadc9432f1 James Bottomley 2023-04-03 @51  {
4e5479df563c59 Jarkko Sakkinen 2023-08-11  52  	return buf->length;
51afeadc9432f1 James Bottomley 2023-04-03  53  }
51afeadc9432f1 James Bottomley 2023-04-03  54  EXPORT_SYMBOL_GPL(tpm_buf_length);
51afeadc9432f1 James Bottomley 2023-04-03  55  

:::::: The code at line 51 was first introduced by commit
:::::: 51afeadc9432f19b72cb5e2530d60f79de565a42 tpm: Move buffer handling from static inlines to real functions

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
