Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467977;
	b=YzGYWfuJ11dOff/2Ky/SWbN29wtro7gWKP0xoujiFsh//UYxmxXBE7pTjDH8hM6ZeLwb
	 CUGkO77VMIfeBSU5mfH/Wwo4gj8PhFfegPB9qUYlvXrteA9pZdHC5wjvHp/0fmcm2qWk2
	 /bfXZCxqA8+1T+Pm0efyJ3OXSmf2PLOafylfNv4GFkbyBvfBcgER3GBOWkYRNqzGMBgX4
	 EtU/G4RPxhe9DZpzMtpYLBfjRsS4CmS+4V/Nach3r3X8zDksxyYP7BzmScVta7JrG0Hcr
	 7TaCx2MYLBDKnaQHhEshrJ8DKdJa9oAw6kLQkf7wTlgJpYznSRnpbQSLTP+jc9sUcbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467977;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=utccmveJUZlutpJzias17ZyngswVt6NfE9B8Pn+3Jno=;
	b=Zuuauf0vTAblp68lPRGrmpFD+rkMJvZQIKjBSJAdaMaQu+XJRg7lr0RfjE/QuqAI0XXl
	 DgTBNZF6iB/tnMrvR7uNyBb873VLmpaIcz3pGfUtlTsHTr3cgenLxBlIbki8kYrqfRfn+
	 M9h0TbXVxfE6IfIgwlq+BzA6j7eSiJpt3FCApagnLuvxeijQTwJvwkVLSdaPs5tGdzFaL
	 1iczlNbLIVlXzx7f5CAtcdTPMRtTfRRJBBvc5g0bqGcicDfMnqr0ufeFF8GUELnLfNdNi
	 HZ/H9rbqXHaKcxhvkW/ucBYZJ+puhhy79iyZMkvVYZjEf0tdwPDXjWyk56UmkDO4BrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Me9/D5Ki";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BA606A8BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 07:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122BA606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Me9/D5Ki
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794467977; x=1826003977;
  h=date:from:to:cc:subject:message-id;
  bh=413pykpZ8NYV4MQuipWqMU7OGbgG2bok1dBlTX1HZ/A=;
  b=Me9/D5KiqlrPAbnts1fgslXzFGQxr/Ewx8bUnBspFTiJhNgRmNGekMh9
   gg9BlH4bAOju9qazm10jo1LXqCKPqttkNZVtvbYsHVeXMpWhs8Vt+Xnfx
   rlIS3d7xek2Yn8MPKEbp7h1Y5sFi9EmQTyiZFCejrVnFrB8cA0rxqEgxa
   jW5/Xg6MgLUw12KB5zmHy6TesYeEAWnSdMMVb2+snD56du9XdBKWHSb42
   6kzfxGX+mYNjc7jQ4dy9fOTPqeir5Q34fHPH4VWECfsitTtl9ENX+CjG8
   z6tZhznA7q1OsjGPeSqOoa9QqkPxxXd8keudDNRGjKocJKH2aJ27qnkAn
   g==;
X-CSE-ConnectionGUID: bzzPN4RfTYaB9m0+8x4ZJg==
X-CSE-MsgGUID: 0A2tXJWCT/+N6TXwclyqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3263991"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3263991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:19:36 -0800
X-CSE-ConnectionGUID: InL3gvDPTlerpsiVbfy3bQ==
X-CSE-MsgGUID: NRBwPHA+QOyMIpcwEWHiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8753155"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2026 23:19:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRP5o-000000000pp-2ErD;
	Thu, 12 Nov 2026 07:19:32 +0000
Date: Thu, 12 Nov 2026 08:18:48 +0100
From: kernel test robot <lkp@intel.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org
Subject: [tytso-ext4:pu 17/50] fs/ext4/super-test.c:219:6: warning:
 unused variable 'i'
Message-ID: <202611120832.HRTiXytu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 1cec1055be7fc2b602f1cde94d772ec822ad6d74 [17/50] ext4: add KUnit tests for fs/ext4/super.c
config: parisc-randconfig-2001-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120832.HRTiXytu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120832.HRTiXytu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120832.HRTiXytu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/super-test.c: In function 'super_test_cleanup':
>> fs/ext4/super-test.c:219:6: warning: unused variable 'i' [-Wunused-variable]
     219 |  int i;
         |      ^


vim +/i +219 fs/ext4/super-test.c

   216	
   217	static void super_test_cleanup(struct super_test_ctx *ctx)
   218	{
 > 219		int i;
   220	
   221		active_super_test = NULL;
   222		ctx->sbi.s_journal = NULL;
   223	
   224		if (ctx->journal_inode) {
   225			iput(ctx->journal_inode);
   226			ctx->journal_inode = NULL;
   227		}
   228	
   229		ext4_flex_groups_free_test(&ctx->sbi);
   230	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
