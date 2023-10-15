Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE71C03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 03:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvS1dZc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338941; x=1728874941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSNGdrj9t1gdSIBw5jtL73LTvmYcjhjwi8lGgiqceSQ=;
  b=bvS1dZc04RqlCImZSuE1hNAW9GEC8VkS1HsgM0k74CuYeVhakK3o7Thg
   umlnSxzEuA567DVvt4CF+B5WkuNRwu1FjfDsYIX0rqsxSqxVJYS69AzaY
   zDku5W2u6wQ6jfL/8K6mFP/jC0SUr/9HZVGorS3GzLkRjuAp+7SK2NgaT
   zP6D70Kg7VVPPWPnDv5isWmXDY4opUTi4mMy8Dr7SCBt5ciHz0z3pSuzB
   XJwRXYmLCsowmwgAx+vwGJb26duKsrRmyQpwAIUzXFgrv8+O0GvE7VnqK
   77re1pYMfPcg1UZogluaZt1GZltKaSlOznLksNTrBuOoyuVONZwFhzysE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370432517"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="370432517"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 20:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="878998966"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="878998966"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Oct 2023 20:02:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrOT-0006yB-2X;
	Sun, 15 Oct 2023 03:02:17 +0000
Date: Sun, 15 Oct 2023 11:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:backing_file 20/22] checkpatch: WARNING: braces {} are not
 necessary for single statement blocks
Message-ID: <202310151016.OB4o5T0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux backing_file
head:   3f6f4728c87b06cbb4d7917bf25bcf95b3ee4973
commit: 03c0eb3308fc5b428252dd0dee02f0ef24194398 [20/22] fs: factor out backing_file_{read,write}_iter() helpers
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151016.OB4o5T0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151016.OB4o5T0w-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#73: FILE: fs/backing-file.c:85:
+	if (iocb->ki_flags & IOCB_WRITE) {
+		kiocb_end_write(iocb);
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
