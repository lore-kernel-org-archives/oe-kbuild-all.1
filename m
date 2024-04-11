Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036CD46B9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712840436; cv=none; b=W1US2fReyfl0mYc5aStmtSURGLUSwWryKTSEzjxGhCAXpDmfiOXDa9Ou4RemetgHUkoi/ADdHG1Kkk/OGswj08AzTxUvQ18w81q63i3heSMqugDljt04ReGVcLK6uNCLjY2OgEGzxaif1asIQm98T5BgWG4TG5X28j7tOWnl1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712840436; c=relaxed/simple;
	bh=Paqn39xY1jonPw837c2p+rNEDd8+7Q0WP1ZioXU729o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V17wD2Z31xtw62YGkzkLeLbd41+lfn776Lev7XjOAXYCmKEvm+vHM9lqQLJxIwE+SP7cTl69JAO70xS1G+6zy8DOZbPY0iBNeBvEEl6iV2rF2KKRbHGUXWobIixa+7v65kYByVQfXsvB2XXibqR1Jegldh+fjobBJJgBd+g8JLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZNaXz3q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZNaXz3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712840435; x=1744376435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Paqn39xY1jonPw837c2p+rNEDd8+7Q0WP1ZioXU729o=;
  b=FZNaXz3q6ZM1MMMROgStsJ4OsH5sf8YkXcWG9hHvfXNuU18kuUPEDwU1
   WGE5BlzbDJTSknzv5FKHEopTCqW6F8nOLt3WY0ZLNUneMcD2eaixuW7V+
   bE4FSMAQX1rnq69XSfoQHRC1eItmtHcv9tDPH3oesZu/fOSqVYNGrVpcP
   qwrHQ3P+H4diVCxtaqTgmHzbJ/+d/d/LugkA57LSKCIvfGT+EnaZocMnJ
   NKWlnrjNbYDBIrpXC5QYauCgJeEewtOR1DzpwUEfwdG3IgCyLEC4LSVTV
   TNNda7GxPKfIYkP6Fmq17qPh4Yjd9AYpdRt0o4jovGDWudebSK+2aMHGW
   w==;
X-CSE-ConnectionGUID: odKwcC0CQ5ixyRZeVSHVEw==
X-CSE-MsgGUID: zMhAT7rUSYum/jETmhc9hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8375215"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8375215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:00:34 -0700
X-CSE-ConnectionGUID: MHDa/ztFQ2moP4kvktyeKg==
X-CSE-MsgGUID: l1T6nfClQjK+qvuPCLDUiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25405157"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2024 06:00:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruu2W-0008dH-2e;
	Thu, 11 Apr 2024 13:00:28 +0000
Date: Thu, 11 Apr 2024 20:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4791/4792]
 drivers/crypto/ccp/hygon/csv-dev.c:20:5: warning: no previous prototype for
 function 'csv_cmd_buffer_len'
Message-ID: <202404112006.3CZ6sQmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: 09eee6b2d3f275c81b00d30a60b940a033afd6c0 [4791/4792] crypto: ccp: Implement CSV_HGSC_CERT_IMPORT ioctl command
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240411/202404112006.3CZ6sQmO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112006.3CZ6sQmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112006.3CZ6sQmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:20:5: warning: no previous prototype for function 'csv_cmd_buffer_len' [-Wmissing-prototypes]
      20 | int csv_cmd_buffer_len(int cmd)
         |     ^
   drivers/crypto/ccp/hygon/csv-dev.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | int csv_cmd_buffer_len(int cmd)
         | ^
         | static 
   1 warning generated.


vim +/csv_cmd_buffer_len +20 drivers/crypto/ccp/hygon/csv-dev.c

    19	
  > 20	int csv_cmd_buffer_len(int cmd)
    21	{
    22		switch (cmd) {
    23		case CSV_CMD_HGSC_CERT_IMPORT:		return sizeof(struct csv_data_hgsc_cert_import);
    24		default:				return 0;
    25		}
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
