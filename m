Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066A1B29B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBN5ftI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699531040; x=1731067040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhB4r5SqssgLkRWOBJqa6Ct/haTkt3Yc5Pytm6EIV78=;
  b=WBN5ftI1AdURTnkH+4ueFEa5PvrmcrxE2JNoBxk9sEapxryce9nrlTsy
   JrnyqmoWR6UBVUJ6v7pPdg7AAf8afxd/lfPkyybg3jezL3AIEcrDMO/OK
   EDYrNRH5Wff34w1PVtX9skNCfx1LR7C50+oS6hOLtZ39trrVjeWTjIfII
   Ez/tLI4vFUPgwdHbwG8ckDBEXg9+iDzz0DdYIExhI6ofZLOmbN/qiy6xa
   AagNEO5x1NyH+FejZjz0Qh6X0p25jJ4GkuNYuvEVC/eYDD06A2piUU0x5
   E20cfd/vOgE6DJSCxAu/XnOubMni+NMnV0H1hf6Td+jGF0fRqbU0qfPey
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454273916"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="454273916"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 03:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="829298958"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="829298958"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 03:57:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13et-0008hL-1h;
	Thu, 09 Nov 2023 11:57:15 +0000
Date: Thu, 9 Nov 2023 19:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org,
	cloud-init created default user <ec2-user@ip-172-31-5-41.eu-west-1.compute.internal>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>
Subject: [agraf-2.6:snp-host-v10 64/108] arch/x86/virt/svm/sev.c:280:5:
 warning: no previous prototype for 'snp_lookup_rmpentry'
Message-ID: <202311091932.mDFnXLAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git snp-host-v10
head:   689d7ab69df8f6bff29bd1dbefe7c07bba52a9ac
commit: 0551830477200b8f4dbfe6cd1294f19b488c47f4 [64/108] x86/sev: Add RMP entry lookup helpers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231109/202311091932.mDFnXLAm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091932.mDFnXLAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091932.mDFnXLAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/virt/svm/sev.c:280:5: warning: no previous prototype for 'snp_lookup_rmpentry' [-Wmissing-prototypes]
     280 | int snp_lookup_rmpentry(u64 pfn, bool *assigned, int *level)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/snp_lookup_rmpentry +280 arch/x86/virt/svm/sev.c

   279	
 > 280	int snp_lookup_rmpentry(u64 pfn, bool *assigned, int *level)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
