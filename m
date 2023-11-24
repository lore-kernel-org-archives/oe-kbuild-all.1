Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EAB31720
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoQZRLoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840550; x=1732376550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rU1Trd0Izj9kLxeHZE25McJL0p6mXo67e48UiKXJ85k=;
  b=QoQZRLozJqMSaRf8ee01vw0g1Gv5MWY9J5zeP3KUr30eGLKnwLblK5oW
   E814lsxq2q3RekboyifcXnmd6bOWB+9f6VXaYQF6Gl88SUC3HLaQdhXEX
   7rMGVFn6pANyvKOKCUY1KiavLkgNU8COI0IS/YYZVYBU4UBOV4cQLqPZH
   5Y2EOhOx/V37o1+Q3l5GhFZwxu8axjrialXrPHO1E7HNB/GbgLLPwW6ke
   ek4DUCEQwRs/p3PfcSd/w46H0KsboSjRisv6ABzS611X/3nEHbxiuX/Ku
   8cQrJr5FO0B4fo1YFTg8AdWaHfkbG1CTQL7iStdKS+X2o01V8Vh2x0LGg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577211"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911474555"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911474555"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yS-0T;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org
Subject: [viro-vfs:work.dcache2 13/21] htmldocs:
 Documentation/filesystems/porting.rst:1079: WARNING: Block quote ends
 without a blank line; unexpected unindent.
Message-ID: <202311242018.tyRmUjX0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.dcache2
head:   4931c524ee8bbdf890972b14d6fcd9e2c72602d9
commit: 616834cff49c1929d0a5dd916bacf1879bb89b35 [13/21] Call retain_dentry() with refcount 0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311242018.tyRmUjX0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242018.tyRmUjX0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/porting.rst:1079: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +1079 Documentation/filesystems/porting.rst

  1077	
  1078		->d_delete() instances are now called for dentries with ->d_lock held
> 1079	and refcount equal to 0.  They are not permitted to drop/regain ->d_lock.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
