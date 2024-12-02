Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45181DDA2E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162996; cv=none; b=b+KnHkEs3YVncZiIwwgBrwcSF3hVqDqTJuU8M1O+Fjx6P54WH6P3HwAzc83NizLGH1g3r/kmCn/TkZmekLA8fE6m7UxrLYr6DEvyyET1D5zpdqNmKhdCI4z6yx88c8fXwdEBETVZMcrVCli2U8ioLBEaVNy+sCEbdtcOMRd9/dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162996; c=relaxed/simple;
	bh=aiUnHZn/QBs/4zsuEUyIfZbXp7jQrZcSG3qBPaJh8ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UaX06c7eDXy5weHNFWPJ+bmOHYI6pH/rytjtBuc9BYwiCiMKu5d7Sad8++WsYqBX8gFtig7f8WTq8KL6L2yjjutBwuzsDw9al3ySi6hFQ6j0lnUzg+6iIhZFAudadVAKZkqaELUh5byc2v9zn+AshXl3v737BQ6Nfq7rVodmHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXu8qJ9p; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXu8qJ9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733162994; x=1764698994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aiUnHZn/QBs/4zsuEUyIfZbXp7jQrZcSG3qBPaJh8ZU=;
  b=iXu8qJ9pqJbgkgSNTBF7D/E388c5K4l9KWTfPeIKnHCvAatUNT0UN7F3
   r6cpxaNsifoT7TXkdvI2I9TuVeWxFAB9pt/2vZmBTbFbtUAH57fDELU02
   aygoSsMDATY97SaKWmZdSUVX55QVG4m0Emn192si/q8/2m8MBKXnOSz7S
   0iBxuM6TLrvJVNeM8YKge/zHx6UaWzSdtSLqiXBRHFom8wztTeEtYwnvA
   GzuA1+hyrnyknMZG4qnZs83dgz3W7VsqB882COwGuuuuLv4lzy4spC04U
   fx0QoPdvUG2tDJaKMTsNln6TGnG0WAqIFU8CgZfTAhbjYi2YkGmZCaDQA
   Q==;
X-CSE-ConnectionGUID: RN0yd8VQQ5+oF2I/mgE6RQ==
X-CSE-MsgGUID: xx/6QdDXTUy6gyeEGUWJ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44731076"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="44731076"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:09:54 -0800
X-CSE-ConnectionGUID: bGzc+p0hR8qkT3c+m3eUkA==
X-CSE-MsgGUID: pSq4FdIoRauqz3lFP0sUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93358374"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2024 10:09:54 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIArn-0002hr-0L;
	Mon, 02 Dec 2024 18:09:51 +0000
Date: Tue, 3 Dec 2024 02:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] drivers/ptp/ptp_hisi.c:731:36:
 warning: unused variable 'hisi_ptp_acpi_match'
Message-ID: <202412030237.97I45s3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yonglong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: c64545e1e5fa4e09603149e918f306562a22a60a [2417/2417] net: hns3: add support for Hisilicon ptp sync device
config: x86_64-buildonly-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030237.97I45s3K-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030237.97I45s3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030237.97I45s3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_hisi.c:3:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ptp/ptp_hisi.c:731:36: warning: unused variable 'hisi_ptp_acpi_match' [-Wunused-const-variable]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
