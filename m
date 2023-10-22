Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE85692
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inrP9dOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698009972; x=1729545972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhGKzY8juMvFgm7Vio69iWfVihFJMxCb0+X0227evDY=;
  b=inrP9dOtAbUb4IjUn+u6vjxojPm8YAiDy5EzHwx4JgvKQWZ4q2kNE47I
   PO2wTpLueiQ+eNGv0P0cf58PhrdVjkE9oqucXbHwIqNoIegeBf3A//VkN
   RnFCqZIvhL3Cz/YQsXr+VsXu+99/6gkWZiQsMDm29nHI8v0iVPWMWtSPf
   q+ntP68hL25IBDwHyx858bNV9ycjSM2RcfsZNIxeBKiaaH4AeZOcNatEK
   rKOuC26TvXegEzj+TDGBaWdBtXfShPWq+45yskzSKNPbwhofQdGVDeSTg
   zlT8eSq8LswgKGu4rMQBmhCgsViO/pFOzJunyV6DHF+FxwbiGj/ZFQBcq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="385614642"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="385614642"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734470428"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="734470428"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 14:26:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qufxY-0006H0-18;
	Sun, 22 Oct 2023 21:26:08 +0000
Date: Mon, 23 Oct 2023 05:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 33/41] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310230526.KFkkX7hp-lkp@intel.com>
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
commit: 33e728c67db6b7e72fc8d09f7a38f72302b8a98d [33/41] ext4: Separate block bitmap and buddy bitmap freeing in ext4_mb_clear_bb()
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230526.KFkkX7hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230526.KFkkX7hp-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#60: FILE: fs/ext4/mballoc.c:6426:
+		ext4_error(sb, "Freeing blocks in system zone - "
+			   "Block = %llu, count = %lu", block, count);

WARNING:LINE_SPACING: Missing a blank line after declarations
#125: FILE: fs/ext4/mballoc.c:6475:
+		ext4_group_t flex_group = ext4_flex_group(sbi, block_group);
+		atomic64_add(count_clusters,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
