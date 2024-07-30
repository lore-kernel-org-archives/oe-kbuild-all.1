Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2AC15746E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722320561; cv=none; b=F4SOVdBbtTB7WEWcs9C8StGSTvVAgHJaqy4CC57KjIR6cthWjNYpOBKZ7YCy3Q6grF3IMf1DSzrD8WsfwvJBsrq0/7aFUR+TffheIvPdUM3mSfT9GP6ECuqtv/7P0riq13Adh+yPPvzAM9AFt1YJQKqvbKxp7eY1nTCQoycsGG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722320561; c=relaxed/simple;
	bh=SwgOb7rbVtfgweVVhY2BMtCr5O5JUTzS4i7ha9VyKkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHnnrU+RQ9vVmzewy5p4EVUihjfT3JCgyrhq4ktfRWuRK1/DRfeiRQ+wcBXuySoNgyGJFtvP8lUDsjB6wfMfWX65I6lliHrQEyCwxV6Uiw3tnwui31tR1WfMqzPcy69VxrkfhuWiU5rm66Y0jL67fwe/T4ySythdW2souEZSPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhpi1Txg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhpi1Txg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722320559; x=1753856559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwgOb7rbVtfgweVVhY2BMtCr5O5JUTzS4i7ha9VyKkw=;
  b=lhpi1TxgGL1HRS7I923UNiUtZJjOwNjZFJVB/6sukIJIeV4QKheu+EA2
   i1tAF/DpJmKR4tQnO9tgg5dBXApwCCK1W75kgeE/6OsLs3YxQFXgGJ+wS
   V1M0FLvAqZNGetyUzYMTNGiNhqvRXYPAUs8sdOohYL+3QDEaMMngXKWaP
   vLHJ7nXOrWmkZRJijBluppJKNXnnoMyl099AXRTkYAA2cN1Xv7QiTGWUr
   Hn/K1Duy93hmEXX2H/gIMe75hf4wp+6zIfSSRNnmGm26CXiD20d22LfIk
   d/LHLAjm2vaDFN53KbSLfRJza1BCtQxU/Fp60oEDTlPZc4m6i+ZgWpV1Z
   w==;
X-CSE-ConnectionGUID: yI3KK2DrTXWsk/6Td//cAg==
X-CSE-MsgGUID: fx7RakKgRlyxJ8lGPNZxfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31524766"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="31524766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 23:22:26 -0700
X-CSE-ConnectionGUID: Go/3ui0RRz+J0Ktj41/qaA==
X-CSE-MsgGUID: jEDK5CxbSfSXcpwupHeb1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="84869448"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2024 23:22:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYgFa-000sYe-1k;
	Tue, 30 Jul 2024 06:22:22 +0000
Date: Tue, 30 Jul 2024 14:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15750/23378] fs/.tmp_select.o: warning:
 objtool: poll_select_finish()+0xc6: can't find switch jump table
Message-ID: <202407301459.O1t38ucj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   87e97edb9d08052dcb1df91827fb9dd9edecf612
commit: 44ae3d3e5f1f99c0fd5f040e4da88b0c5b3ec76b [15750/23378] select: shift restore_saved_sigmask_unless() into poll_select_copy_remaining()
config: x86_64-buildonly-randconfig-001-20240729 (https://download.01.org/0day-ci/archive/20240730/202407301459.O1t38ucj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301459.O1t38ucj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301459.O1t38ucj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/.tmp_select.o: warning: objtool: poll_select_finish()+0xc6: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
