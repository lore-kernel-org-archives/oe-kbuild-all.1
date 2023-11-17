Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C21199BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoH44Rrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700225779; x=1731761779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YzekPzrO23b28cLFePobqNZzP2nC+1mICoHagrMNBfs=;
  b=NoH44RrqCwyyaaNGcu6wZXIaTxOE4Grrn27WxdAWzp6DnUIuC5XXrxCN
   kRBU3mF8ZC0Mat7D6hmpRZFMw7x6z2mJoeFWxHon/ry5nXRqJAUBA/o3n
   nNrDVuBzFJ0Z3MbVYog3PGXiZa9oKw1nTT8SmjkdzUXUaQq5KrR6q2vhQ
   4PSkMcmAhncfUrOYO6oCRMZzowbEG5A3+WlpW1/zNHThjEwpybBiYKZVC
   iwlBPsbgcac2IZ0RnYpr9xzb6c7GGYuiKoWcxzxwkH6SsBuf6Cb1FZlPL
   iMiIhE3QljLNLLUycto+VKfGr8TGAFvOPMqV9ioMLHZOmcSna1+1BDmPh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390153186"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390153186"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="7005044"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2023 04:56:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3yON-0002ns-1i;
	Fri, 17 Nov 2023 12:56:15 +0000
Date: Fri, 17 Nov 2023 20:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geoff Levand <geoff@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoff-ps3:ps3-queue-v6.6 5/13]
 arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or
 member 'address' not described in 'ps3_debug_setup_dabr'
Message-ID: <202311172014.DAhKdyM0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git ps3-queue-v6.6
head:   ca9039524fbe291f48f700fd79551ae45581e6f4
commit: 92cbc9d6ec4f538e19e830f86c78ef38fe756423 [5/13] ps3-debugging: Setup DABR register
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231117/202311172014.DAhKdyM0-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172014.DAhKdyM0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172014.DAhKdyM0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or member 'address' not described in 'ps3_debug_setup_dabr'


vim +194 arch/powerpc/platforms/ps3/setup.c

   185	
   186	/**
   187	 * ps3_debug_setup_dabr - Setup the DABR for kernel use.
   188	 * @dabr_flags: DABR_DATA_WRITE, DABR_DATA_READ, DABR_TRANSLATION
   189	 * @dabrx: DABRX_BTI, DABRX_KERNEL, DABRX_USER
   190	 */
   191	
   192	int ps3_debug_setup_dabr(u64 address, unsigned int dabr_flags,
   193		unsigned int dabrx)
 > 194	{
   195		int result;
   196		u64 reg;
   197	
   198		BUG_ON(dabr_flags
   199			& ~(DABR_DATA_WRITE | DABR_DATA_READ | DABR_TRANSLATION));
   200	
   201		/* PS3 seems to need DABR_TRANSLATION set to work */
   202	
   203		reg = (address & -8L) | dabr_flags | DABR_TRANSLATION;
   204	
   205		printk("%s: address %016llxh, flags %xh = %016llxh\n", __func__,
   206			address, dabr_flags, reg);
   207	
   208		result = ps3_set_dabr(reg, dabrx);
   209	
   210		if (result)
   211			printk("%s: failed: %d %s\n", __func__, result,
   212				ps3_result(result));
   213	
   214		return result;
   215	}
   216	EXPORT_SYMBOL_GPL(ps3_debug_setup_dabr);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
