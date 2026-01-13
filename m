Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA3239E79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305963; cv=none; b=fWLimZR6QycD4PdbHHfJ7mqeJV8VlXgzj9BEpsBe82dLM2F8SnBjOAtQ6xZ901S8jz8G88OkzfqqoRYdH1K0fhla3sabdjdjcfyJND3e+qQaJbCwjjV5tP6ceYmP0O/zMtQACwjxrBkNScwcvizUCqtGAX02q76X8QsEmko2iTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305963; c=relaxed/simple;
	bh=6IXzXB7Dxl+bTEP1MfGQdXUmw8lHFLyxasZn1lEbv2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c+EDANCB0Nk6iw6z2+MIFT5naie2iOffS6epT3kVFyFsNgZj+XTdMpI9Y1oI7wSASfDJc4+GAxA3PuqZSQFohGA3J8GqFU0YoH0TzG7pNq/eXNGbgh1f2MuOvIi88lGh5rBawwBerlDAJLRZTt1qIexj0w1EdUL4qz6/QP/lL8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfaj/L0c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfaj/L0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305961; x=1799841961;
  h=date:from:to:cc:subject:message-id;
  bh=6IXzXB7Dxl+bTEP1MfGQdXUmw8lHFLyxasZn1lEbv2U=;
  b=nfaj/L0cQa6YER6EgEcYooQmdNDfLx5s/fxFTexmpIAjI5c6800RvyFF
   aC+toU6k5yrKlwFDL04JQ18IOoZPfBXDL9EMCBqyYezkXejkqcdRoqOev
   sJZ9vtsDdk0Z7+I8INHFvlgE5UXKxUb+Ld0vkrVENu+Q8M4eDBejG6hPN
   m5jIrYTPSddCD+4JRxT812tnUfVA1c6EOO7CdoBOytPe9YtH07XEyG3MM
   knaGmL8nnApXoSmNxJLhKSsKnghRXbdvPK5Wd4uJ2IHQsLqYQyDEQmABG
   HyhRNqOGUttmy9nI5WSX3PJoXKDWo81dlD+XcPwzOubyJRz02fkKlttwZ
   w==;
X-CSE-ConnectionGUID: aA9el6m2SNq9cOA1pfsAow==
X-CSE-MsgGUID: ODbFNRbhSZmbVc7+bvPwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87170076"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="87170076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:06:01 -0800
X-CSE-ConnectionGUID: IhS9paVVTBu+e3cglvdKOA==
X-CSE-MsgGUID: nKo3LZSAToqseJlHvPpsrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204177879"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 04:05:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfd9o-00000000Ei0-2ois;
	Tue, 13 Jan 2026 12:05:56 +0000
Date: Tue, 13 Jan 2026 20:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260113 7/16]
 drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field 'ssp_cmd' has
 incomplete type
Message-ID: <202601131922.8dbH4Nal-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260113
head:   52754522a0ac00706210372e66bc73f60fa759d2
commit: 2f3d1d884e953f07b26e97dced8ba1b7adba61ad [7/16] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: sparc64-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131922.8dbH4Nal-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131922.8dbH4Nal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131922.8dbH4Nal-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19,
                    from drivers/scsi/aic94xx/aic94xx_reg.h:13,
                    from drivers/scsi/aic94xx/aic94xx_init.c:21:
>> drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field 'ssp_cmd' has incomplete type
     struct ssp_command_iu_hdr ssp_cmd;
                               ^~~~~~~


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
