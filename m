Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C3DDDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3eU9W8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698007991; x=1729543991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jeAJ2bZwu/Q4lhUyo/Kfu8NgYgUXkfWgR93QzxhAy8o=;
  b=B3eU9W8iT3kCnLzIucP9yeRjbXvsY+lZcmI/oEcfuALORgJetZp1PCwG
   W1POiSpaIIhy665zMl4HCYeWHghCFuXdrpKXOqW46/KFKPakZbadpYF/d
   WeelHQ6ECRgwoBdRnI9okvsb0DqekyC4shMY1B1thpFaJMWV1W+3rUkDs
   WcJWVLx9h9Vkj69NOaNuI8dPXaMXZwUdJyuiiqd4feAbytH4RlBt9mUeA
   J4+IqUpWMaZ4+MEKzEt2gSRsR/kmQwwqFqK261w3KiK6QPfddjrVJzzbX
   b7e8oVDiBGmtZfRsCJAxlWDLUi4w1e7edGZ7yQ1w5DXtogSsqIOfD9ip8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453204885"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453204885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 13:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5875608"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2023 13:53:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qufRb-0006Fq-0v;
	Sun, 22 Oct 2023 20:53:07 +0000
Date: Mon, 23 Oct 2023 04:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 22/41] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310230415.cm0AcNub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   c388da1dad59dc24801b61bc63539cab6cd83e23
commit: 71cd5a5aa0607073adba3852739b7f8c22bc7b50 [22/41] jbd2: print io_block if check data block checksum failed when do recovery
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230415.cm0AcNub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230415.cm0AcNub-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#30: FILE: fs/jbd2/recovery.c:664:
 						       "data block %llu in "
+						       "journal block %lu\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
