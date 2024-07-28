Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1199F5820E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722175869; cv=none; b=pZKfOjJUVe1nJQocJlyeOi0TRah5S3l7BIQ6jJg5OZNZ+wi6atLlGhBLW+KRzASYC5EYHzl1HFUb6aG8V7saXEFJ4h30mwvXof1C6XA9CPdQESsSW2l/aTK9H6RMCEhCDCwzRQd0tWXIutp/B2aS22Fcy18sJvtXzKOzUuagt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722175869; c=relaxed/simple;
	bh=rwyoKFszLi+FU3xwWWpg2RbFgVGiB6hx/UBCmyeGo2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZC5IL9NCqVTd/jj43AatawcVPk4TsYV5Y8PyIPj6Ct/+Ogt84E+6lA9LhYV+lmxA4vFVC3GnraipJ8JL/4tSLdCKEulHeXaSgRTI6z+BZViKEsY8xhyrDlMU47rcaDCfvr1hda/J/Sm+Vb3PkvelyYs3qDc84LX4A4oDQR0qIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/6Qs91W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/6Qs91W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722175867; x=1753711867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rwyoKFszLi+FU3xwWWpg2RbFgVGiB6hx/UBCmyeGo2E=;
  b=W/6Qs91WKcz3aA+UJKhZBPGQXSjbA93a8j8SG7ec4XlHeK037Qr0EIPd
   lO3ulY/fiNZtN4QmKyZTgCTAQANBPrn7epSN8tZQUuL0UDeDs29xcJCSv
   6dfzzJig3DicRm+irqNYHkAMZBKkuv4kSCoyZ/PS4+tVveU6t4dpKlThA
   p1MwX2MsmBwwV8LAonLfBGLWA5fM8XrxfDxeD02PmTeSbQeczHZRcH6ZN
   N2GtLD1izbfiV93Sa25S3sLQxp0p+8PGGezrkK2HdAgAQ/y/e0DRvQ8ph
   RIRBGJlG06wVxgCVjL9wWdJH2c7iVxFPvnWwDVSv/diizVuFQNLFxWsEN
   g==;
X-CSE-ConnectionGUID: Bq3/Bp5TQfexN7+LR+B2jA==
X-CSE-MsgGUID: Fdjm67/pRiCDQT0zByWW1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="12753146"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="12753146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 07:11:06 -0700
X-CSE-ConnectionGUID: 9rOvNHiERiW0MmOuI6rPrw==
X-CSE-MsgGUID: OdRugEcfQae/3w07PlA2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="76955671"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2024 07:11:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY4c3-000qqg-16;
	Sun, 28 Jul 2024 14:11:03 +0000
Date: Sun, 28 Jul 2024 22:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240726-cbc 14/14]
 usr/include/linux/ethtool.h:1645:15: error: expected declaration specifiers
 or '...' before '__builtin_offsetof'
Message-ID: <202407282208.YeiZqcQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240726-cbc
head:   bd10b39e2b713a2f9fe8715278e9d4bee9253e24
commit: bd10b39e2b713a2f9fe8715278e9d4bee9253e24 [14/14] ethtool: Avoid -Wflex-array-member-not-at-end warning
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240728/202407282208.YeiZqcQL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407282208.YeiZqcQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407282208.YeiZqcQL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from usr/include/linux/ethtool.h:22,
                    from ./usr/include/linux/mii.h:13,
                    from <command-line>:
>> usr/include/linux/ethtool.h:1645:15: error: expected declaration specifiers or '...' before '__builtin_offsetof'
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |               ^~~~~~~~
   usr/include/linux/ethtool.h:1646:15: error: expected declaration specifiers or '...' before string constant
    1646 |               "struct member outside of __struct_group()");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from ./usr/include/linux/ethtool.h:22,
                    from <command-line>:
>> ./usr/include/linux/ethtool.h:1645:15: error: expected declaration specifiers or '...' before '__builtin_offsetof'
    1645 | static_assert(offsetof(struct ethtool_dump, data) == sizeof(struct ethtool_dump_hdr),
         |               ^~~~~~~~
   ./usr/include/linux/ethtool.h:1646:15: error: expected declaration specifiers or '...' before string constant
    1646 |               "struct member outside of __struct_group()");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
