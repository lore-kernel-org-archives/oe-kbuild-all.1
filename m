Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62394219E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+fIjWOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215194; x=1728751194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w06UhdzPK5WsWbdUs8tZO8hFqRDPZhfeofL/mbYS25g=;
  b=M+fIjWObDSOEPD+2bjgnwdkHRexN84Xj4tY6U1k34GLv+lbFx7l1mypK
   NCihkeuyBVQnj9+EHJKLdC5mUp5Dnd5/TAxmUMBfJEi5E5CZqrpXg3bIr
   mqGFX+9S4oDK5TOiu0mmeis+bsnhkCRBfiM5N93IWOVXGeHtBftMOPegB
   eyOMMTmfnVvMUKVFm7m5MfLkrcdS89iBrgz1YlHdRi81cLIyvRx8+DXuG
   uCGXpJqq7r63veu3vXWH17PAc1XSkhh8oBe47EPSJujmIs/2Ais7jHPii
   Cry/MIC55JBCBX67wRHXVO0rEBc2Ro0UCP8ynAu08RbFTSJxn+goVL1P5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385058257"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385058257"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871146759"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="871146759"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 09:39:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLCY-00058C-25;
	Fri, 13 Oct 2023 16:39:50 +0000
Date: Sat, 14 Oct 2023 00:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 25/29] checkpatch: WARNING: Possible
 repeated word: 'the'
Message-ID: <202310140022.XODCk2t0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   af314f8dfffbe0852967cf253beb94878c5d4846
commit: 4019ce76834a6111ffae8d11f085b2d8db6a6de9 [25/29] fuse: implement ioctls to map backing files to inodes
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140022.XODCk2t0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140022.XODCk2t0-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#17: 
the the backing file from the inode.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
