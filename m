Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752983E016
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4pvIAm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697661865; x=1729197865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMlWZwSeVtwG/TX6KWjzLRprp2oTRjLNzUAJHt+cz7o=;
  b=h4pvIAm0r4+hZbJLcq65uPNG7Y3LD6FTOfwA6s8pLO9GGm+k76emLqGL
   4QvtW2uzY5E3K0nsCjtkzvHeS8Y6T+10SG0XH5uZI2dXpam0XNSrqzZDK
   VEBjetJ7VhN7mcyFTPtQ/Qqo/zBTSQWGAdsCXdobFfpVlo4vEIxo4gpGM
   YYIX2wJqnZ1OuA3WLJF1OuI2RCF/VT8DhVV8hIIT/mKO1rCSubBOXurVZ
   BIQShovAL5ek49REwSke4ySxCYYb8J3kOxcn98Vnragv1TCf1M6I+w/B0
   97ih3SNxVpAWesmq8Qrt20fMX460UbNr1PN0fml5lQOqgBm9Cr4BpxS5W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417217156"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="417217156"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 13:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760368467"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="760368467"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2023 13:44:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtDOv-00011O-28;
	Wed, 18 Oct 2023 20:44:21 +0000
Date: Thu, 19 Oct 2023 04:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:inode_fsid 3/8] checkpatch: WARNING: Block comments use *
 on subsequent lines
Message-ID: <202310190451.Mf2VRApA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux inode_fsid
head:   125e2fa4561ca29a94753d1292e8dda0d89e2b6d
commit: 0b60953cbe5df7160758e98b5efa063567550475 [3/8] exportfs: make ->encode_fh() a mandatory method for NFS export
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190451.Mf2VRApA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190451.Mf2VRApA-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#287: FILE: fs/smb/client/export.c:47:
+/*	Following export operations are mandatory for NFS export support:
+	.fh_to_dentry = */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#287: FILE: fs/smb/client/export.c:47:
+	.fh_to_dentry = */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
