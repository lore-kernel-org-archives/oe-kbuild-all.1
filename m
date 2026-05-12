Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA139AD21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590703; cv=none; b=IUDm4oDxxcL3sV5vzNnNoE5JaFkVvNy7qIzO1vjtUbwEV4iEssJKd8qAEwNMZ36AhQ5YWTIqM+RS8GGKS5PjZXFCqCf2+JUC8fJ0vDkSZwzZxzc/vQs/aha+vdqJ6fGLx+3Dl+EGO2hOXDaNpLbVlgPvQugBAugVN2hKeurmZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590703; c=relaxed/simple;
	bh=j0bzjGLDJUD+MyFgu9c070Y9u/zMHBJ72AbPnz2PaoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/SMTYr1R23MGrUm6a3C2AIGf+pDmeRZK6IHZOeO47g4G4wNQwhQIRaXqzB4pune8Ujly1uYWro7gB0ZpltEg8nSSbq3UQy0Lt5u/ctdP2pEU6Or2kY+b+7bwuVYrWvPrPPrs74QyXZpXex7P7yMXQoZnL8V52QFC5KUY04GQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qrn3pHFq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qrn3pHFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778590701; x=1810126701;
  h=date:from:to:cc:subject:message-id;
  bh=j0bzjGLDJUD+MyFgu9c070Y9u/zMHBJ72AbPnz2PaoM=;
  b=Qrn3pHFqcjUH5l5EKtVCkwiQ7rG8wiJCUPMdiAF35OugxzW7YwTVB+p3
   Q5lQHa8qS4C79062jONmAd21uHMV1RLIaZqoBr8onxfprZ/aMmPB+j01+
   /r5phA79lYNMCzqmQQya2DzA0IWEod/2SyMZYpjmxKM9n40W9KOBsqAng
   iIziwyRusMODuyaJce4xtdWOafytbU7UutuewpeL5DtDi/T6l4CjHmz2P
   S2GKBL0wxXe3ae7DnbwNZyLM0vMZ4MP/8JdG6APD6rm6YjQTs8Y2Z7r0/
   D3eVt8AW0sdnj1hA5jKBm5EnJyL8BZEJJUHJJcwTBj08rM2ja4dwhc+6Z
   A==;
X-CSE-ConnectionGUID: 1g259cJ2QFiw2+SjR3IqVg==
X-CSE-MsgGUID: j8j6RlVmSoy7bElT3k0znw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78526828"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="78526828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:58:21 -0700
X-CSE-ConnectionGUID: rfeC7Pb2SlOJY35F+rVS2Q==
X-CSE-MsgGUID: Pfvxs3SBSa6WTnIzEbrzFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235097887"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 05:58:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMmgi-000000002AT-433v;
	Tue, 12 May 2026 12:58:16 +0000
Date: Tue, 12 May 2026 20:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260507 3/21]
 drivers/scsi/aic94xx/aic94xx_sas.h:323:35: error: field 'ssp_cmd' has
 incomplete type
Message-ID: <202605122013.1sGrng4W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260507
head:   3f5086f83661760934067787b2935c0ef32441f4
commit: 83e5715c9d567ecaf26f0797dc1f874ba1792326 [3/21] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260512/202605122013.1sGrng4W-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122013.1sGrng4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122013.1sGrng4W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19,
                    from drivers/scsi/aic94xx/aic94xx_reg.h:13,
                    from drivers/scsi/aic94xx/aic94xx_init.c:21:
>> drivers/scsi/aic94xx/aic94xx_sas.h:323:35: error: field 'ssp_cmd' has incomplete type
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^~~~~~~


vim +/ssp_cmd +323 drivers/scsi/aic94xx/aic94xx_sas.h

   316	
   317	/* This is both ssp_task and long_ssp_task
   318	 */
   319	struct initiate_ssp_task {
   320		u8     proto_conn_rate;	  /* proto:6,4, conn_rate:3,0 */
   321		__le32 total_xfer_len;
   322		struct ssp_frame_hdr  ssp_frame;
 > 323		struct ssp_command_iu_hdr ssp_cmd;
   324		__le16 sister_scb;	  /* 0xFFFF */
   325		__le16 conn_handle;	  /* index to DDB for the intended target */
   326		u8     data_dir;	  /* :1,0 */
   327	#define DATA_DIR_NONE   0x00
   328	#define DATA_DIR_IN     0x01
   329	#define DATA_DIR_OUT    0x02
   330	#define DATA_DIR_BYRECIPIENT 0x03
   331	
   332		u8     _r_a;
   333		u8     retry_count;
   334		u8     _r_b[5];
   335		struct sg_el sg_element[3]; /* 2 real and 1 link */
   336	} __attribute__ ((packed));
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
