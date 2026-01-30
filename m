Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC3224AE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778317; cv=none; b=aM9vhxbN60XO5IiyncY1qrvfJObk+/oUiSE6YF86GH+otLTnPIFyGALE9VSVSEheBVCliWV8NFO2J4+Fa93uctw6ZLza6jnZBnHG7CEDzJoU5+8ayQaJBfPxi5M1C/1iA2rPhtbybsz9M+eRD6R41xL68wlGINFnIU1XxNMLwBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778317; c=relaxed/simple;
	bh=WL3z/+nAZWnAx2vQGuB82j0E810wQcGU8KwptDhFYPg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkhHIvTdGDcnwyBwe2lhpP2NClZpenjm91hVSovu/AbuwqpfVH7wXZCXPkSc8hvODzKpKzILWAkdrpxJK5U3LZRLVIrRuHJXY5BWIQ3MoTC6i6rypgDwYavkl8WPi3a2V7iuOPDFoON6QVDyPTa0+Wm+R/rOPf7eSERUkuumM/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqGNvc7H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqGNvc7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769778316; x=1801314316;
  h=date:from:to:cc:subject:message-id;
  bh=WL3z/+nAZWnAx2vQGuB82j0E810wQcGU8KwptDhFYPg=;
  b=gqGNvc7HUQq1XLyYnpP8UvuyuNr7ZbkvWo2fD/KmKDVJkqq4+IoAYzJi
   +OGiyR6q9+8Qph+BMmMyMsazveYv9XNGqU6KUjAJx9kXJSunYn57TCZJQ
   y6PK1wMlHWZ3ZLW/7gW1gjM2Bn5aqHToqp1gcQPgPSnto8DCi+N179W09
   a1YbH92VIOWzR9I8z/GbesnGiZyB/YW9B0QAp4nGTRTYpqbLadWpqZfTq
   TO9uNBAcou/6POagNdW/4AqAuOfxLWpxg8xcbCVs5AJt7sJj4enTENeWw
   ziFE3cFLRjnqFOUFraoVBF44/xwORNdewCfv5YLSITVByYL9nJGAveDA1
   g==;
X-CSE-ConnectionGUID: /piJ0uauRzqA3ofOaaYwhA==
X-CSE-MsgGUID: CQWXZSXLTPKPPK/lWDWEKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71191831"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71191831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:05:15 -0800
X-CSE-ConnectionGUID: ZLAE7tuEQJWR24KHWZdKwQ==
X-CSE-MsgGUID: L4bSF0++QvaladRJp9fkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="209267454"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2026 05:05:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vloBT-00000000czq-1hF5;
	Fri, 30 Jan 2026 13:05:11 +0000
Date: Fri, 30 Jan 2026 21:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [mtd:mtd/next 24/24] arm-linux-gnueabi-ld:
 drivers/mtd/mtdcore.c:2642:undefined reference to
 `mtd_virt_concat_destroy_items'
Message-ID: <202601302001.mGwPwhGE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   285871f1ff3c251cba288e7dd9e373c04149a509
commit: 285871f1ff3c251cba288e7dd9e373c04149a509 [24/24] mtd: Add driver for concatenating devices
config: arm-dove_defconfig (https://download.01.org/0day-ci/archive/20260130/202601302001.mGwPwhGE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302001.mGwPwhGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302001.mGwPwhGE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mtd/mtdcore.o: in function `cleanup_mtd':
   drivers/mtd/mtdcore.c:2641:(.exit.text+0xc): undefined reference to `mtd_virt_concat_destroy_joins'
>> arm-linux-gnueabi-ld: drivers/mtd/mtdcore.c:2642:(.exit.text+0x10): undefined reference to `mtd_virt_concat_destroy_items'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
