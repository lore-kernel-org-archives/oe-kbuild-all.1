Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357439EF22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297178; cv=none; b=OU9EXKkQzLU3+A7jByQ//mgsch2FntRNkq5/ivr1CDgpt9p/9XYUELmiM74Oi4wCq0FnSuHiXRm+Je/EBXCKGUFzxLHXdarebJNk6L8WkKVPyxNOYYDfbq4wxLrV/AWgT2fQ0PWlzc/qMhQce/QCouvrB53X4ACYB9zlYZ6+XkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297178; c=relaxed/simple;
	bh=7tPQg18FME4dL/OKCv0SrVlw2ZGiFX5moMCMpSaygiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IjMt5TtsN3zCYFL6+F/LwqtZ1NhoPhWAnbyjERvXbdC7+/IG3INkkQR/PqSN/Ivg4lbuSpbFhXQOfZdh88wQtxdFk/WPNIbVu8BkgFMSxiNP/3XEsCJrtEVqicBFsnJx9e7u9vGPvN/+0VfEvytB88ELNw8ryXpsvxQaNMhiFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNtAZV5T; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNtAZV5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773297178; x=1804833178;
  h=date:from:to:cc:subject:message-id;
  bh=7tPQg18FME4dL/OKCv0SrVlw2ZGiFX5moMCMpSaygiU=;
  b=PNtAZV5ToUydtI3XC5vs10Y/Ml5nFyt2I4JaxN0DlofuxitHO7ohR38h
   GKkwq27hR4kCWtbmhiXpDe4NdRObChROU/396Y4UQo3Bcs92hZr69bdg2
   KAOL+gkp7BfxmW53f0tp0ksImHNU0Lbw7pqSXjtmsY0vSjXmZFL7htZDf
   j1s1lU1I4xgV3DhyXyQPysF73Whhode7DZY7XJfpnH/wihQE6IsxU0rwI
   yM/hPeaygp4KgRyLaG6/pdJvfV+rUDG/rOeNxjAk5/xg8/19St7Md5UOj
   UnpLioShlrpHnnPrnaOEpF5PU9XMB2Jf2869HaLXvOuCFNsCXkjtkNoUa
   Q==;
X-CSE-ConnectionGUID: IUST7LMNScCWhmaJma5lpg==
X-CSE-MsgGUID: p4p8qsRNS6+KPL1n87TbeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78230253"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78230253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:32:48 -0700
X-CSE-ConnectionGUID: yrB5Qbg0TOqB8sgfqT1yQg==
X-CSE-MsgGUID: fRtbRTChS/WNq0dJ1O89Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220774454"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2026 23:32:46 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Zb8-000000002A3-4Bnq;
	Thu, 12 Mar 2026 06:32:42 +0000
Date: Thu, 12 Mar 2026 14:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260309 4/19]
 drivers/scsi/aic94xx/aic94xx_sas.h:323:35: error: field 'ssp_cmd' has
 incomplete type
Message-ID: <202603121442.Tpx644fq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260309
head:   2fccc7ac847ceb27d79945fb44daa91edaf65bf2
commit: ace05b14a5eb00ab69a4968656f46e6b8b4a60fa [4/19] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260312/202603121442.Tpx644fq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121442.Tpx644fq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121442.Tpx644fq-lkp@intel.com/

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
