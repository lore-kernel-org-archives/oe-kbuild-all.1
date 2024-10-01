Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB51B3B28
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727756336; cv=none; b=JEmEATda++mUBeS2AhY1pgysQD2AmnUqAh9QtVS+0Q+8RtyaD9nznq/3jsnpVjN02f+/zMWLYVPZz556xAsapE2aHk+BC4ZeLP6vVlQzcZEa4PIG7qQVznhpeeBHcy4thiQIl1fW35K5jyRt9szYr8JbtM2S+hW95mTYhQwVDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727756336; c=relaxed/simple;
	bh=eO1Jrpnu5Uj04KlI7YOJiexBPXgGJwvFZhetT6oqRv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwavDg5HWwmlHrEQ1mRmI1gF4bQLhGv82ej1w8El1dNOPawYsVl5Hh6ElzUObmHkBuv46ra2IJ+ocYtsWt2Ar6K9rkK9lc/7L09Yq/DyqOyzC0F2dX5VCaX9zyDaWGE7xna+RvvEF7k0dEAsKF4bL9wBGB4FoUWkd1NNGzmnGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4uq81QV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4uq81QV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727756335; x=1759292335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eO1Jrpnu5Uj04KlI7YOJiexBPXgGJwvFZhetT6oqRv4=;
  b=b4uq81QVTlmAmtaUG88jopsb9xZG8VbWAiUoksXqq0ailSv/KjQ3Njm5
   XxxE1L9hQ1Ysp1/VNVatkb7FR1TbUNzKMXnJgurZaJsYz4KqgKjfwnImy
   iarXjaawQoC89xtP4I7D38qIcLMgEpDVU4rva8DWGeDFZ3FbYz3IGJBs/
   4954Z5Sc1K2rT/Kky47tnOwzRNJR9VUw/zjxrU8pz2IwCpH15Z8fSEP3Q
   jOn/7PFI5KECt1hcEBli5WpCzpg9LYt1YPJp9b973qWCnIYslIlA746J7
   GuAMAGub8qyR9CTSwhtHfMyU+OQTJZcrSsdayhu/tBq7BnjAxjscf6yc0
   Q==;
X-CSE-ConnectionGUID: 2+MQMTRpT4Gu6+0OZAa9JA==
X-CSE-MsgGUID: hS2Jw7rEREWmO69mK6KlkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26676722"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26676722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 21:18:54 -0700
X-CSE-ConnectionGUID: MCrmi4C2T0WQoAaT/Ur4KQ==
X-CSE-MsgGUID: 6Rb2pEyoSiqYgkMg/nfygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78483448"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2024 21:18:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svULa-000QEH-1U;
	Tue, 01 Oct 2024 04:18:50 +0000
Date: Tue, 1 Oct 2024 12:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/23811]
 drivers/scsi/huawei/hifc/.tmp_hifc_lld.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202410011241.NNAuBhq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/23811] scsi/hifc: add hifc driver FC service module
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241001/202410011241.NNAuBhq7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011241.NNAuBhq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011241.NNAuBhq7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/huawei/hifc/hifc_lld.c:333:7: warning: no previous prototype for 'hifc_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
     333 | void *hifc_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_lld.c:362:6: warning: no previous prototype for 'hifc_event_process' [-Wmissing-prototypes]
     362 | void hifc_event_process(void *adapter, struct hifc_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/scsi/huawei/hifc/.tmp_hifc_lld.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
