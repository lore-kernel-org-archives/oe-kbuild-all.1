Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186620B28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw9r/2X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697214060; x=1728750060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xyrUbW3xFBf4huju7A1t4MAMgDnKOuvpCEJi4O3OiI=;
  b=Sw9r/2X06j9IF16hF0SkFu8imMUyyyteo2l7aAkgYHPisdDqYgbCNu3P
   R7OlCiskL1o8vzVJuiI/OC8NXSBQV3NbQYi21hyhJq+sSUX4p+agIcjvD
   /U47L8zmkQ6vAAkRUK2do963KZpU/UtcPvrCgL2Rkde5uqhaO1WM7QIgb
   3z14wIyqtVUA5/Baygq0AL2wBPKPuA0izqJnqZPxfY82OenkDEbRVUYfu
   QMiN3fP2nNGFPG4RRDJcz0evEbF450lrNfAHlOacEf4kf49ZbIfRGlQkz
   NO2NlAEPMrYzgpAMMf/rHk4r8ShCuw9BHxo4AJbQil3pvuRpTayvQgf6Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364579087"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="364579087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748398800"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="748398800"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2023 09:20:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrKu9-00056h-0C;
	Fri, 13 Oct 2023 16:20:49 +0000
Date: Sat, 14 Oct 2023 00:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 20/29] checkpatch: WARNING: braces {} are
 not necessary for single statement blocks
Message-ID: <202310140011.AsMnP3cF-lkp@intel.com>
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
commit: 03c0eb3308fc5b428252dd0dee02f0ef24194398 [20/29] fs: factor out backing_file_{read,write}_iter() helpers
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140011.AsMnP3cF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140011.AsMnP3cF-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#73: FILE: fs/backing-file.c:85:
+	if (iocb->ki_flags & IOCB_WRITE) {
+		kiocb_end_write(iocb);
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
