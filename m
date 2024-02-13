Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBB24B28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821689; cv=none; b=tO4Z1sV5BfnON5+91+JiqPC8YpQ9DUZagNRnAU917u7smhC4wFeOq1Ootjm+lJgVzjYb8W2EFQyPHt0na6nvPtZuyAQqkK8bvXH0dXmoZYgxld97WiXr/p7Gp3HhHR9HNqwLzKJh908tVvV5o9p5P+7gnFCOWZ60z7GydkK7LJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821689; c=relaxed/simple;
	bh=aNeVjyQfcLerg/fKBx+9hhboWv+XRlHFmzOd+yPgM48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTxhvwCe8AYj/7l8GMfxFkLdDDt4m4JOMy6M/duxIU3ItePyBaUcKIC538JBmmwNdFP/184DIF6zUSUAlHNjh8dzcn7gOiMv7m/I8NApy7yiUdQb84A2WtWwGhgyaPFmZax9nm+rKio3Uf7fmFHMiaHnWKrxRYyx0cShl230CNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6y1SdTh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6y1SdTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707821688; x=1739357688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNeVjyQfcLerg/fKBx+9hhboWv+XRlHFmzOd+yPgM48=;
  b=X6y1SdTh5nKrFSktw9Ql8lVVGwmZKETVsjSIUQDbbcqd39aNjDD174v5
   hfXQJSX9vJUiSrQFFmYP/BGmQjdFE+t33lFXz5vbPk8hugO4Yjitah1/r
   eX6BbVl88z47X2LMJABt/cwvi8JQrUCLkcoGy+lID1uVnTEBtg6s3ISMi
   sqTCzjR37R+J61/o7KKs62E8HxuShzl2aY6++grpOHniqCl1yMfzEopWg
   ElyvBcczz49Ocq6NSSNCnM28ejdjRszTYa0Mzaq8mEo1Qd0Q3gLDaa4Ng
   N2OWGoeybLpXNhVHbsIUz7Uf5ogJPbkR+TiFKvlE3rhP874xztgIZmzyu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13215879"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="13215879"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2781893"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2024 02:54:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZqR1-0007fk-2V;
	Tue, 13 Feb 2024 10:54:43 +0000
Date: Tue, 13 Feb 2024 18:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chunkuang-hu:mediatek-cmdq8 4/6]
 drivers/soc/mediatek/mtk-cmdq-helper.c:372:5: warning: no previous prototype
 for 'cmq_pkt_nop'
Message-ID: <202402131841.rqInQao8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-cmdq8
head:   572ee20058cf30ec608e6009421d89e45a6b6f5e
commit: 7656e1f3f594b39a255f94230c6bbf1dd1d0099c [4/6] soc: mediatek: cmdq: Add cmdq_pkt_nop() helper function
config: arm-randconfig-002-20240213 (https://download.01.org/0day-ci/archive/20240213/202402131841.rqInQao8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131841.rqInQao8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131841.rqInQao8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-cmdq-helper.c:372:5: warning: no previous prototype for 'cmq_pkt_nop' [-Wmissing-prototypes]
     372 | int cmq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
         |     ^~~~~~~~~~~


vim +/cmq_pkt_nop +372 drivers/soc/mediatek/mtk-cmdq-helper.c

   371	
 > 372	int cmq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
   373	{
   374		struct cmdq_instruction inst = { {0} };
   375	
   376		/* Jumping to next instruction is equal to no operation */
   377		inst.op = CMDQ_CODE_JUMP;
   378		inst.value = CMDQ_INST_SIZE >> shift_pa;
   379		return cmdq_pkt_append_command(pkt, inst);
   380	}
   381	EXPORT_SYMBOL(cmq_pkt_nop);
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
