Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCF1AACB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708774140; cv=none; b=EFzQFW9rX0CFixbUIvJt0VgdJgHTIP3CnFr0Y25mIeJNVBJufhBrmtZtltlDBj0OwY7CLacoAM4gZiex8cB+jNRuJzV66A8pFXI2moF/TkkgpwzfzMpcrtHYuWZAlxZuKo3ZKz99XZwXOdRZNQnm77YCLQsmqxqYyEw7g5CPbD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708774140; c=relaxed/simple;
	bh=JnHh/IDb4dnSNJJzG+OBqfLUBEci2t/XIKx3rw7GLGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a32A+bEMI3tpKnnMp9okNHefwaCWszohaPbzmNIPcnpBInGY6/uT7tU7hnY+eVFeK5TOQOa6+HNKWL0i34db1oe6Gxa5p2ygR/g9GAwPVJ5r8S144lqsaVpmzCszNf/dDPpQ/m6GgKVHC689PgKMIq8gKdO3BXiv2KJxfwt5bR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLXP67wI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLXP67wI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708774138; x=1740310138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnHh/IDb4dnSNJJzG+OBqfLUBEci2t/XIKx3rw7GLGk=;
  b=bLXP67wIHZn6jcONli+zyW7eYcEvHhs1a6qM8H8sZRidABFT37QpZLDe
   F92X1Xb53LuztsKL1eZkE6atDPDVRQgokyX0CwlqOXzes2Zw//vhXkQiJ
   ZwPSJQXxC6HPgVD25f0ofWF+ZvCCfK0FgW7aQl/Z5s1FMsOOifY0ZXACV
   ZxPQWhf/lDuPg4BMHTAmRholuG/wURiQFNH/ZWsst/SHpA4OaosRo1RFF
   3SKqXYilQZBB3fwED14Mlr0ctBQIIvuqnnDGAxkQCacdtHqzhBQ/nqhCr
   ihe1R+Ybe0xoRgHuuPRmCgqHh2tEfJgvy9qu7wPr13gN37wFkOn77GKPJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20647071"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20647071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10855829"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2024 03:28:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqD6-0008Uf-06;
	Sat, 24 Feb 2024 11:28:52 +0000
Date: Sat, 24 Feb 2024 19:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pengyuan Zhao <zhaopengyuan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19387/30000]
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c:36:4: sparse: sparse: symbol
 'macaddr_buf' was not declared. Should it be static?
Message-ID: <202402241904.fKVDwGyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fee6fdef7d687d6ce43289fd7e7f96fde039af0
commit: d4a6c405d07d2c7eb60a781368d94c476ebe24ab [19387/30000] vdpa: split vdpasim to core and net modules
config: x86_64-randconfig-122-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241904.fKVDwGyh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241904.fKVDwGyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241904.fKVDwGyh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa_sim/vdpa_sim_net.c:36:4: sparse: sparse: symbol 'macaddr_buf' was not declared. Should it be static?

vim +/macaddr_buf +36 drivers/vdpa/vdpa_sim/vdpa_sim_net.c

    35	
  > 36	u8 macaddr_buf[ETH_ALEN];
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
