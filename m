Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A81E32BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028866; cv=none; b=X7qGm26bUkS5ZPAgHbyj/vvG4IuWAXW7CX4nNZV+WWcdWt0RWUAcBlkdFiYKHEOFj+GzNxrm/nfv0RJxmIN4HB/SvJeZ35YBUGVw+j6gAXzxxqJ/VHeNBZHws71DcfZt0b7vn9WSDVBtNn1ldaYGs8XhjcTvxf2TeuDrhsbGcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028866; c=relaxed/simple;
	bh=SqYKUpSoeU9YtD0PnQZEQBE/l99OeF1pAOCdUiuHtIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dShldEhjEa0c/Dlm+9S1xBzq5j8aK+cqGgAu3Px5PmcsvbtzM/KACRkA+GkzvQBwI0f+V8g/Is9kpSllKJtTJB43jkn3e+o5QvIfh8EY9iMN+m7KCaj85H1G5ZIS5wN/J6bX3joIXR/omQjbYpQos9QAS7hDDQPhxeHI5aUUf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6snzaBl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6snzaBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741028863; x=1772564863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqYKUpSoeU9YtD0PnQZEQBE/l99OeF1pAOCdUiuHtIg=;
  b=D6snzaBlAK9WMXADgC0sI3A7QO0B2/vra0gOqx9Ig/CINr2tNXA818W8
   wNtkazeQ4qU4Omv8H6cqIQEoGGH3uknqQ6qnTDaPIvD0n5Zkw9YKM8sMl
   vbKNV6UtMmldwYKvfE/6u47TAujZ4teN/o+P7+f/hgD9ODG54ygN9pneH
   OBpK389DsjnSKnchLsyW8qlp8UC3gNujSCpLD7ITg1vJPDO4O5m+onMeU
   e4FfGvfDbsIgk3v3HosEhVeZAdz6VDud1TGFSQJyH8X8tTK+m3LXwxSsO
   sgawR9rvJC3Z4sEPevCrXwDhavMYkXkVbqwVL2IMdTQbyoYcUnd5IP8Jw
   A==;
X-CSE-ConnectionGUID: yGkiN0D+Te2iYpbxuqsBEw==
X-CSE-MsgGUID: V4TubjP8RUmRxYuVPEcn0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41629472"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41629472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 11:07:43 -0800
X-CSE-ConnectionGUID: yMnlDarSTEmMvsNQs9/6OQ==
X-CSE-MsgGUID: 85NEQhdOQ6GO2T6BYqzNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122262990"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 11:07:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpB8c-000Ipo-2s;
	Mon, 03 Mar 2025 19:07:38 +0000
Date: Tue, 4 Mar 2025 03:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1980/1980]
 drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202503040511.Dk9g0ZiZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   252f84b8f8205e5b1f29719d9139ed187c2873f4
commit: 7fea595ef48e9ab13bd31df067b19152153e1925 [1980/1980] SCSI: LEAPIORAID: Supports LEAPIO RAID controller
config: loongarch-randconfig-r123-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040511.Dk9g0ZiZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250304/202503040511.Dk9g0ZiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040511.Dk9g0ZiZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse:     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr
   drivers/scsi/leapioraid/leapioraid_func.c:304:35: sparse:     got unsigned int [addressable] [usertype] ip
   drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long [usertype] iov_len @@     got restricted __le32 [usertype] datasize @@
   drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse:     expected unsigned long [usertype] iov_len
   drivers/scsi/leapioraid/leapioraid_func.c:325:21: sparse:     got restricted __le32 [usertype] datasize
   drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 [usertype] datasize @@     got unsigned int [assigned] [usertype] send_sz @@
   drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse:     expected restricted __le32 [usertype] datasize
   drivers/scsi/leapioraid/leapioraid_func.c:369:71: sparse:     got unsigned int [assigned] [usertype] send_sz
   drivers/scsi/leapioraid/leapioraid_func.c:671:1: sparse: sparse: symbol 'leapioraid_base_stop_smart_polling' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1395:67: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1427:51: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1300:1: sparse: sparse: symbol 'leapioraid_base_process_reply_queue' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1468:5: sparse: sparse: symbol 'leapioraid_base_irqpoll' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1490:1: sparse: sparse: symbol 'leapioraid_base_init_irqpolls' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1924:21: sparse: sparse: symbol 'leapioraid_pcie_link_speed' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:2946:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3291:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3304:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3317:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3330:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ImageSize @@     got unsigned long [assigned] [usertype] data_length @@
   drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse:     expected restricted __le32 [usertype] ImageSize
   drivers/scsi/leapioraid/leapioraid_func.c:3373:32: sparse:     got unsigned long [assigned] [usertype] data_length
   drivers/scsi/leapioraid/leapioraid_func.c:4414:1: sparse: sparse: symbol 'leapioraid_base_flush_ios_and_panic' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse: sparse: invalid assignment: |=
   drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse:    left side has type restricted __le16
   drivers/scsi/leapioraid/leapioraid_func.c:4747:40: sparse:    right side has type int
   drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr @@     got unsigned long long [usertype] log_buffer_dma @@
   drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse:     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr
   drivers/scsi/leapioraid/leapioraid_func.c:4799:29: sparse:     got unsigned long long [usertype] log_buffer_dma
   drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] BufSize @@     got int @@
   drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] BufSize
   drivers/scsi/leapioraid/leapioraid_func.c:4800:29: sparse:     got int
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:5242:67: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +3291 drivers/scsi/leapioraid/leapioraid_func.c

  3280	
  3281	static void
  3282	leapioraid_base_put_smid_scsi_io_atomic(struct LEAPIORAID_ADAPTER *ioc,
  3283						u16 smid, u16 handle)
  3284	{
  3285		struct LeapioraidAtomicReqDesc_t descriptor;
  3286		u32 *request = (u32 *) &descriptor;
  3287	
  3288		descriptor.RequestFlags = LEAPIORAID_REQ_DESCRIPT_FLAGS_SCSI_IO;
  3289		descriptor.MSIxIndex = leapioraid_base_set_and_get_msix_index(ioc, smid);
  3290		descriptor.SMID = cpu_to_le16(smid);
> 3291		writel(cpu_to_le32(*request), &ioc->chip->AtomicRequestDescriptorPost);
  3292	}
  3293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
