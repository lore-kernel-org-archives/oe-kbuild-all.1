Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CABD286
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILP8Iv9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697091066; x=1728627066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWblGo07xS4H9tP+yORkt2JSHAZBxr+DYfxTAjTWCcE=;
  b=ILP8Iv9QrnuZJbOCIX+1k+U2+R//qOetbmhSCL5kvtmyXTTLw8idV/aO
   aMa9se+/d8EdQCDh/q5YkPiGmcqVE20+ZII+0tJL4K0Rm7BkvWoOWU/7E
   ygATwNobrVLL+DiNcyc9XVZVumqkJvjaNWFxPaYidRLbO8KviPLIvh+jJ
   zI2XeKnJFecHvmSSO/ycDkxpokJc60WY0ZKZC6fJnXuy7WpY/3pPiYALS
   APpGfnJLytUPP0c+EdTSgdTP+i3AfntL+4uNFEVHuLckB4W4UkRS7MGJ9
   tuJ0ejAJQLWgxD2ZsQc0ydo40wcYpqcqc44KBHA1dW0MgtqHlC/PTrdVu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451334311"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="451334311"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870439370"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870439370"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 23:10:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqouM-0003Fr-0q;
	Thu, 12 Oct 2023 06:10:54 +0000
Date: Thu, 12 Oct 2023 14:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 53/235] checkpatch: WARNING: Symbolic
 permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal
 permissions '0600'.
Message-ID: <202310121421.THSykYkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   7a3180b27232bff6b95d65874e05272fa0c99b01
commit: 5f1fa54eb9679de954dfbe9aba4887d16d0780d5 [53/235] x86/mce/inject: Add notrigger entry to suppress MCE injection
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121421.THSykYkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121421.THSykYkK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#93: FILE: arch/x86/kernel/cpu/mce/inject.c:739:
+						      .perm = S_IRUSR | S_IWUSR },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
