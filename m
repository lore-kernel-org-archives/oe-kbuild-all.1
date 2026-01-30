Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81FF24EF8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793867; cv=none; b=oQYE4Lcd/7eWSZzy76RdNF/w6CJcpMx6env3tCEbfBOFLt3e5Qp/zjL+ULIeUWqdMjXekbKDbg93pIOO+CkIkSBv3+8YYJFHYJyLw3UfG9Ad33P0O8uZzbOwna42QzYJJwyRm9AhktWiAipllPJxoUFLL8FsLOiB6+n3xU7y1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793867; c=relaxed/simple;
	bh=e6hmICO2VlcP+zkBJoaMKam9Q9hrVAfIz9xCLVD1C1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFtVBkAYwH+PO7cln1JyqCFFzVnr91DPvibC/ur1Y54/h0zdySmpdXFE3zJoENvZaS9wLZd0a6eMbwDBx0GEkBtGuhATKIubMvDwQIaKOtPWO9+6C9ugtFbdm4SFjf0sQ9TrkjwpwKeZ8yfRUvlWcVpJ2NFhHpeyoMNRcO7y/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lktKWKNM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lktKWKNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769793866; x=1801329866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6hmICO2VlcP+zkBJoaMKam9Q9hrVAfIz9xCLVD1C1M=;
  b=lktKWKNMrc1iyiRVkrv+HtNwtZ9RMxJbqrseldEm7/OzZdCq/JZDnY7c
   YVaXrCIvnjpQOsTAP66TQ5vcPlts0jmpjJJxNSkBFDdFawDX+b5Sei6Bi
   UYPtO9b3xsPm4LKceaa0MJE9L7uwwuobbf+O7ambtTWAPmgGCrI2KN31s
   K0hRozkBmHo63fm0iyrQWxGDe041MNyx/NI1Mb2kxZjW8OKQLpeKFXdPd
   LjsA/eS507GjT3FUYKoeyOlL8oLViWYkBYBcnkKrpx2ko2HgYensrnXdY
   FnsVWePnEKO5kO6CZ/JNVu8ScCCJJQOWV+8zftYtABNvq0QsCy1tZ8PQ0
   g==;
X-CSE-ConnectionGUID: ebwrgHf4QwSZEF3c8ABezA==
X-CSE-MsgGUID: qhfwUDw2SjCsnq8t72tJWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71104140"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71104140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 09:24:25 -0800
X-CSE-ConnectionGUID: OKw7QJFyS6SqqgVK4Ipw5g==
X-CSE-MsgGUID: LWZcdTZ9ST2Kx7Dxw9RveA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 09:24:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlsEF-00000000dBI-3cmj;
	Fri, 30 Jan 2026 17:24:19 +0000
Date: Sat, 31 Jan 2026 01:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
Message-ID: <202601310149.HWa5PpbD-lkp@intel.com>
References: <20260130092349.621034-2-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130092349.621034-2-linchengming884@gmail.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc7]
[also build test WARNING on linus/master next-20260129]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nand-Add-support-for-randomizer/20260130-173004
base:   v6.19-rc7
patch link:    https://lore.kernel.org/r/20260130092349.621034-2-linchengming884%40gmail.com
patch subject: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
config: sh-randconfig-001-20260130 (https://download.01.org/0day-ci/archive/20260131/202601310149.HWa5PpbD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310149.HWa5PpbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310149.HWa5PpbD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_randomizer_init':
>> drivers/mtd/nand/spi/core.c:1234:11: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1234 |    return ret;
         |           ^~~
   drivers/mtd/nand/spi/core.c:1227:13: note: declared here
    1227 | static void spinand_randomizer_init(struct spinand_device *spinand)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1237:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1237 |  return 0;
         |         ^
   drivers/mtd/nand/spi/core.c:1227:13: note: declared here
    1227 | static void spinand_randomizer_init(struct spinand_device *spinand)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/return +1234 drivers/mtd/nand/spi/core.c

  1226	
  1227	static void spinand_randomizer_init(struct spinand_device *spinand)
  1228	{
  1229		int ret;
  1230	
  1231		if (spinand->set_randomizer) {
  1232			ret = spinand_randomizer_enable(spinand, true);
  1233			if (ret)
> 1234				return ret;
  1235		}
  1236	
  1237		return 0;
  1238	}
  1239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
