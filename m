Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D27134B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMTQ3DF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702262845; x=1733798845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXp1wn3yVLqkiHrUHZmARM471cOySknrXEhIgk+VIMU=;
  b=CMTQ3DF5mdR/3nEc7hLXMCadkNJAuiCRK3gvybYKb6Yqan5XppxFrGXU
   Ga8JgnlZtgxnMml1knWn6nueUdpN0XIegn2ZWZfvz4k8omMyktsSO4Q0A
   J1WLLpRVRP1MY3Qd41gJrGYDN482siAWi+IvMgmYS2z2oDa/b4KZGBO+z
   5uVNdLy9/n2cdkvK7/Zy/qridgtzUcmQT6lBxc6+s21NLo4whisxHafj8
   K9/+4uneC7p14I351rvhbFLgM7xjiYxyJemScADSegIhqiDG4bonxYKJq
   Bol8GOORh3AWTugOcpVLnEqFWygNeRI3lAXPpiNzX4r1w2LzSFIATyyGF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="394320335"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="394320335"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 18:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="916664801"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="916664801"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2023 18:47:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCWKH-000HYo-1r;
	Mon, 11 Dec 2023 02:47:21 +0000
Date: Mon, 11 Dec 2023 10:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 4/8] fs/splice.c:1283:9: error:
 conflicting types for 'splice_file_to_pipe'
Message-ID: <202312111051.A5SMEt7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   510ead444588b4eb211d3c6670c897b83ed90d8b
commit: 38e5b41d49a9b3c33ff60348fcd3b908852c96d7 [4/8] splice: return type ssize_t from all helpers
config: i386-buildonly-randconfig-002-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111051.A5SMEt7S-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111051.A5SMEt7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111051.A5SMEt7S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/splice.c:1283:9: error: conflicting types for 'splice_file_to_pipe'
   ssize_t splice_file_to_pipe(struct file *in,
           ^
   fs/internal.h:244:6: note: previous declaration is here
   long splice_file_to_pipe(struct file *in,
        ^
   1 error generated.


vim +/splice_file_to_pipe +1283 fs/splice.c

  1278	
  1279	static int splice_pipe_to_pipe(struct pipe_inode_info *ipipe,
  1280				       struct pipe_inode_info *opipe,
  1281				       size_t len, unsigned int flags);
  1282	
> 1283	ssize_t splice_file_to_pipe(struct file *in,
  1284				    struct pipe_inode_info *opipe,
  1285				    loff_t *offset,
  1286				    size_t len, unsigned int flags)
  1287	{
  1288		ssize_t ret;
  1289	
  1290		pipe_lock(opipe);
  1291		ret = wait_for_space(opipe, flags);
  1292		if (!ret)
  1293			ret = do_splice_read(in, offset, opipe, len, flags);
  1294		pipe_unlock(opipe);
  1295		if (ret > 0)
  1296			wakeup_pipe_readers(opipe);
  1297		return ret;
  1298	}
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
