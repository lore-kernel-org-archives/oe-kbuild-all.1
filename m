Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64357260C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 03:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751426107; cv=none; b=GQbfarm/jS50MyRG6TtRoU+xSfTvxbjzktwqon4vfmVCGl/Dc9F9rzW5/SiGVNs1gZMN9qRu2kB0X4nSjNOJobsGCMXyRvC6K+EqE4H64LNXiQFS6miV8fY/9hplJWu3gqTBDBCv7uKlFTz0Y3QEPdIIyEFd6azp+LrZuTuZZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751426107; c=relaxed/simple;
	bh=5QREYNZxbqcL6PNQmzplNhh5SoHHZmzqeqPzn6kRbN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFonm96P6XYAvz3OnJ7Qky14r+QxLAnRYMPSxa3vcbC4nSyS6+GYOdna8ECH6xLc2FsYuXtCWheecgwRvX+KJncqXv/dU4xys9DHfr8Fj5Cwp1Pna9Vv66EvdO5lYi/SlWvTfqEJUyVk7P8FMs4l9bpWMgFRWG3jnKtBEBmmt7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs1/KJS2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs1/KJS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751426106; x=1782962106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QREYNZxbqcL6PNQmzplNhh5SoHHZmzqeqPzn6kRbN8=;
  b=Xs1/KJS26BqD67M8YbkNt95IOv0ltn5ClwvZuQos9gAiJzJO0Fmx8G76
   Qu11s8IdBAN3frDmwd+QNIvbxXmnuyw9F872pFROAcfXvi1ODaADLVQvr
   m31BgvJ3CSv0Zzkbzr2ncLnqet7tDkjD1aovRqvUWWGbGLoye3x5VkO1N
   khvj22HBSkifKXwqySG2NHQe3C5i52OyL0rwxb4GeQC6ggqUZgktT+uL/
   S5cdQPYU6Y0FNE2mNdJWdNeVhHu5fMdRkWjgoPZrh5FtHKm6IsfRu02vF
   DgKO6j5Au/gAp/kbjWr4PQcuK6oJq1mLTQKYxAuw3dqWRKCkfFJkKEYt8
   Q==;
X-CSE-ConnectionGUID: uYIPym/DR0Wy8QfYQsq8CA==
X-CSE-MsgGUID: LWDJ1rfXQ+2gHYEXb+q+vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79149928"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="79149928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 20:15:05 -0700
X-CSE-ConnectionGUID: iKuoAsY7SXqV1kTysqfdKA==
X-CSE-MsgGUID: VM5/CQvdSbG2k1FV9tNX7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="184900618"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2025 20:15:04 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWnw5-00005s-36;
	Wed, 02 Jul 2025 03:15:01 +0000
Date: Wed, 2 Jul 2025 11:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [linux-next:master 6106/6384] drivers/cxl/cxl.h:365:22: error: field
 'hpa_range' has incomplete type
Message-ID: <202507021152.Ai4UMERb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f804361f3b9af33e00b90ec9cb5afcc96831e60
commit: aefeb286b960a0629273d1dc809ea36754f42d98 [6106/6384] libnvdimm: Don't use "proxy" headers
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507021152.Ai4UMERb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021152.Ai4UMERb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021152.Ai4UMERb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/acpi.c:4:
>> drivers/cxl/cxl.h:365:22: error: field 'hpa_range' has incomplete type
     365 |         struct range hpa_range;
         |                      ^~~~~~~~~
   drivers/cxl/cxl.h:562:22: error: field 'hpa_range' has incomplete type
     562 |         struct range hpa_range;
         |                      ^~~~~~~~~
   drivers/cxl/cxl.h:570:22: error: field 'hpa_range' has incomplete type
     570 |         struct range hpa_range;
         |                      ^~~~~~~~~
>> drivers/cxl/cxl.h:803:22: error: array type has incomplete element type 'struct range'
     803 |         struct range dvsec_range[2];
         |                      ^~~~~~~~~~~


vim +/hpa_range +365 drivers/cxl/cxl.h

e77483055c325f Dan Williams 2022-07-22  348  
40ba17afdfabb0 Dan Williams 2021-06-09  349  /**
e636479e2f1b61 Dan Williams 2022-05-18  350   * struct cxl_decoder - Common CXL HDM Decoder Attributes
40ba17afdfabb0 Dan Williams 2021-06-09  351   * @dev: this decoder's device
40ba17afdfabb0 Dan Williams 2021-06-09  352   * @id: kernel device name id
e8b7ea58abbd23 Dan Williams 2022-05-18  353   * @hpa_range: Host physical address range mapped by this decoder
40ba17afdfabb0 Dan Williams 2021-06-09  354   * @interleave_ways: number of cxl_dports in this decode
40ba17afdfabb0 Dan Williams 2021-06-09  355   * @interleave_granularity: data stride per dport
40ba17afdfabb0 Dan Williams 2021-06-09  356   * @target_type: accelerator vs expander (type2 vs type3) selector
b9686e8c8e39d4 Dan Williams 2022-06-04  357   * @region: currently assigned region for this decoder
40ba17afdfabb0 Dan Williams 2021-06-09  358   * @flags: memory type capabilities and locking
176baefb2eb5d7 Dan Williams 2022-06-08  359   * @commit: device/decoder-type specific callback to commit settings to hw
176baefb2eb5d7 Dan Williams 2022-06-08  360   * @reset: device/decoder-type specific callback to reset hw settings
40ba17afdfabb0 Dan Williams 2021-06-09  361  */
40ba17afdfabb0 Dan Williams 2021-06-09  362  struct cxl_decoder {
40ba17afdfabb0 Dan Williams 2021-06-09  363  	struct device dev;
40ba17afdfabb0 Dan Williams 2021-06-09  364  	int id;
e8b7ea58abbd23 Dan Williams 2022-05-18 @365  	struct range hpa_range;
40ba17afdfabb0 Dan Williams 2021-06-09  366  	int interleave_ways;
40ba17afdfabb0 Dan Williams 2021-06-09  367  	int interleave_granularity;
40ba17afdfabb0 Dan Williams 2021-06-09  368  	enum cxl_decoder_type target_type;
b9686e8c8e39d4 Dan Williams 2022-06-04  369  	struct cxl_region *region;
40ba17afdfabb0 Dan Williams 2021-06-09  370  	unsigned long flags;
176baefb2eb5d7 Dan Williams 2022-06-08  371  	int (*commit)(struct cxl_decoder *cxld);
101c268bd2f37e Dan Williams 2024-10-22  372  	void (*reset)(struct cxl_decoder *cxld);
e636479e2f1b61 Dan Williams 2022-05-18  373  };
e636479e2f1b61 Dan Williams 2022-05-18  374  

:::::: The code at line 365 was first introduced by commit
:::::: e8b7ea58abbd2335734e67cccbd992e4735366bd cxl/core: Rename ->decoder_range ->hpa_range

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
