Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE951012
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 05:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709269682; cv=none; b=HgGUl05qX40F/bzvGgSjqS6nrjweAlDa+/JfDJZW8Uy6NQ0nYYqE6pRmdqk9hu3SNYhREJH5VCsaLUCOPeMz3oB5wQ0FdJaYj7KF/kwW/yzENdITtnMRVSvOQaywEt7javcdAM1V9SbpwuxfqirBZJS1DlH7fgXqooUUIQm+t2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709269682; c=relaxed/simple;
	bh=rUKXMYonaaqBmxW+JIBHf5gGRmD31r6zEaMxhnjSosU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlgJI+nHNN0MhODCVMwWS5/hCBtCc69KeI4WqmwAim2ldNNE2kWv/Kar7c1mSTVQ0Cyo1c9l6ETJ9mZwxEZf/LhrSobWCW/giVHnLhrnuWXyvRGCsQ19iTwXesVKvGSGguh4H1kwOYJmZtsCSCvm0P02Ag1bGphlLCErvjw0MXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO5KUDGl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO5KUDGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709269681; x=1740805681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rUKXMYonaaqBmxW+JIBHf5gGRmD31r6zEaMxhnjSosU=;
  b=fO5KUDGlmZGBwOf0JaUgAEqBOnI5rlHcqhit0KrVbuL4vD/vHK6Pu2IC
   RStmDOScV5IJcEeVGJeWJQ9VjUhgc2UlGih6PMKDpLcs6vybtpQlEkRLs
   tQKoQ9au+B/9WAmbjBNBF8De4Xwe1Az7qbQ3tB9ewUjKBA3yPkNtXhJQe
   mqO78l2hrGdUMssLcfaU4zGoysc9QIWToEN+To1TdChoP+zLi83neTV90
   eKAozUiD2wpWcXQFHZnCTPZ79oA9stJ4+xJmsNr1af+tpTgN89ZhuKEN6
   sEUyumvZyL+zY/twLXUQXXXjkNr6zDp/jn76lM4ZhPnr/zgdkpfpGBbsQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3949110"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3949110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:07:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8211845"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Feb 2024 21:07:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfv7k-000DY1-0I;
	Fri, 01 Mar 2024 05:07:56 +0000
Date: Fri, 1 Mar 2024 13:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 7311/30000] kernel/workqueue.o: warning:
 objtool: pwq_dec_nr_in_flight()+0x441: unreachable instruction
Message-ID: <202403011347.BSVD2waD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ebba55154f6b47b476dbcd26c12f31ead8bcd4c6
commit: 003a421b04ba85abaf24a92736dc47f76fda0803 [7311/30000] disable OPTIMIZE_INLINING by default
config: x86_64-buildonly-randconfig-001-20240226 (https://download.01.org/0day-ci/archive/20240301/202403011347.BSVD2waD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011347.BSVD2waD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011347.BSVD2waD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/workqueue.o: warning: objtool: pwq_dec_nr_in_flight()+0x441: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
