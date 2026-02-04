Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265C36CE04
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770185230; cv=none; b=TfQcSECdHbGfzHkZA94jgeLWmVyn7DgIIEjjBtscaBJ5jjNCIZhCSSFrASEzgJuM16mQ6aS2J3j4IRJQuAmpocwTWUz31eChlJZcOWsKUPOrDnR6q3V+FZAVQAK+wkEKu6fLkbE44yHGgbO7NNujA7vem2ep9r8wEgPw1yKhPV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770185230; c=relaxed/simple;
	bh=3xuCoxByeQ3SuTCoJojgMndCffUKnpLj9GdoHrEJCtg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X0T194pBclqSfpUQfqTqbmWyJKM6aFb8dsxO83JpwA/RKD6dSbQMG9CA5cgaRIQ5SMyfQelZ/u7ZCeHp1QyPoc1kx/ebFM0EjyIiWX8gR48lX/UdVeyP0DMdSoTQMBiDrsE9WhgxJIA8qHpFwWQGrJ8B6fajgYyOvh9TsD0xRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+HWkxsK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+HWkxsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770185230; x=1801721230;
  h=date:from:to:cc:subject:message-id;
  bh=3xuCoxByeQ3SuTCoJojgMndCffUKnpLj9GdoHrEJCtg=;
  b=i+HWkxsKBmcDK3+kkaF5LaAlAhuOlF9VXtEJBtaYZWTXzYbGF0FQhG63
   mI+SvLY8jnVzySUDdnsR3OeNg4Wc73gCjJdf/ptYeAAzOay22mDZEZuqu
   Na9Fqh4QSZ1kTdAJh+oESMVQvGPTrV2IKkQoZL/YK56RqErJscSJjiThQ
   vTOYRjalG2OIE4W7sDaWkfcLE23205ljzHRz1YJDOUXB51rR+QqtDHRUJ
   sySvI6VKU17O6ar7wG0Rd+AQC0dXOuM7JEiPO21TVhI0upxs+oQ/F+5Gc
   pGiMFPgz0zL8esjyFfJQiZ19Wa7K81w6ZPvdDWN3ETzfGdcEodBWV606W
   w==;
X-CSE-ConnectionGUID: ODNhFdjXTk6qHnBknPcXMQ==
X-CSE-MsgGUID: BGR/uvSlT8KSm4/akku/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71265034"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71265034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:07:09 -0800
X-CSE-ConnectionGUID: lHwMJt/mQ06W4ib/Y02omg==
X-CSE-MsgGUID: i2wC/uUQSTSFMclfCRxCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214612643"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2026 22:07:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnW2a-00000000hUm-4B8j;
	Wed, 04 Feb 2026 06:07:05 +0000
Date: Wed, 04 Feb 2026 14:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:prtpbf 9/12]
 drivers/fpga/intel-m10-bmc-sec-update.c:186:31: error: implicit declaration
 of function 'rest_of_page'
Message-ID: <202602041400.qxnlM12c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux prtpbf
head:   7ce80be35d0b91a2cf3294261a9482f668394edc
commit: e5419ab54092eb719d6a817698572b46fef4c05a [9/12] fpga: m10bmc-sec: switch show_canceled_csk() to using scnprintf()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260204/202602041400.qxnlM12c-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041400.qxnlM12c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041400.qxnlM12c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fpga/intel-m10-bmc-sec-update.c: In function 'show_canceled_csk':
>> drivers/fpga/intel-m10-bmc-sec-update.c:186:31: error: implicit declaration of function 'rest_of_page' [-Wimplicit-function-declaration]
     186 |         return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
         |                               ^~~~~~~~~~~~


vim +/rest_of_page +186 drivers/fpga/intel-m10-bmc-sec-update.c

   164	
   165	static ssize_t
   166	show_canceled_csk(struct device *dev, u32 addr, char *buf)
   167	{
   168		unsigned int i, size = CSK_32ARRAY_SIZE * sizeof(u32);
   169		struct m10bmc_sec *sec = dev_get_drvdata(dev);
   170		DECLARE_BITMAP(csk_map, CSK_BIT_LEN);
   171		__le32 csk_le32[CSK_32ARRAY_SIZE];
   172		u32 csk32[CSK_32ARRAY_SIZE];
   173		int ret;
   174	
   175		ret = m10bmc_sec_read(sec, (u8 *)&csk_le32, addr, size);
   176		if (ret) {
   177			dev_err(sec->dev, "failed to read CSK vector\n");
   178			return ret;
   179		}
   180	
   181		for (i = 0; i < CSK_32ARRAY_SIZE; i++)
   182			csk32[i] = le32_to_cpu(((csk_le32[i])));
   183	
   184		bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
   185		bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
 > 186		return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
