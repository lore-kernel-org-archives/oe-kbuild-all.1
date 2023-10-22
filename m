Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F010FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNUHiEHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697964771; x=1729500771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zu+S+jZ0wiX0kcxBvLUYvyfPEIkoBUhTrkHqVkQIwDc=;
  b=KNUHiEHDvqlRm/iSFk2C2vp44w1/Qb4IwiZLvh1rCgIk3pW4bjpnM6Mp
   hqsIB6ZhPeYtWhzc7+nn5XCe8lsrdV8dwOZxJKu2ExdeUj4aiawFjL2au
   KmdSJ94rrP+pBfCsY4WVpSHiAciUG0YsymL1CNZodQZB2aZUitfNpED6N
   sKnWRG1l/89UTdKXpNG5G/+uLDEbyJdmeJ1TTOV8UEZZqLw9x4Hwnm1yO
   1AQ18wmT73STF0I58gKAhyYdtHe5OgzKyao8PhqdDzys/bU6RAm8ixTW8
   AOvDLmQSiVe6319lA/HcyCZO/AquTcp9RhMUPjZJ571AfIeaiuIV190yG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="5310207"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5310207"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757870228"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757870228"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Oct 2023 01:52:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quUCV-0005ms-05;
	Sun, 22 Oct 2023 08:52:47 +0000
Date: Sun, 22 Oct 2023 16:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchehab-experimental:master 172/178] checkpatch: WARNING: Symbolic
 permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal
 permissions '0644'.
Message-ID: <202310221630.s2bUJzxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/mchehab/experimental.git master
head:   94e27fbeca27d8c772fc2bc807730aaee5886055
commit: 8cd08e365153481065eeec684ed00949bc980aff [172/178] media: siano: Drop unnecessary error check for debugfs_create_dir/file()
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221630.s2bUJzxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221630.s2bUJzxy-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#65: FILE: drivers/media/common/siano/smsdvb-debugfs.c:368:
+	debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
