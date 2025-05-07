Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289F189B8C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617158; cv=none; b=hnPPMUl7HGyAxsgu0y3iEMbTNZZkaWb1XNQevoBQHQu8wFrmO3OdAC5xwjdPTg02ul0rfQmIi6iMHDOz9mYMjTrmQEv2o5HwwW/X8LZlC7k0BJgL0yDjhuaHUq8WZb45/CebmbTF0RwgAwoTj6BlHCoNHSDVvoX+XuqPxroaCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617158; c=relaxed/simple;
	bh=6bhJVcSF9kcFypmW+aJf6lf8sojkiKtNt1VwIA0Dmc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qihaoqs8VbRN3tua6Zi/y7eXUKiO+Co+0uDBMRnyezr4qdlg4OC68wlubAGOFUrQMN8ovjmm2u9LOdF3q8SJjubBlFpPYrWw3WjFnT6VwUv2RRTzSlJplFliqkVa4YF3ZzXWY3RA2Hk4EyPiVomsQVbeseK1IVKP99DtG0b4+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Chi4+pzh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Chi4+pzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617157; x=1778153157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bhJVcSF9kcFypmW+aJf6lf8sojkiKtNt1VwIA0Dmc4=;
  b=Chi4+pzhv1NQ1jKGXnjUetsGScMeqO8N9jvZkPtPa6aZS+hSu99aH5Eu
   ke5qFX/ITxENe7lDXHtC89I6aCQo2iITXxXLJtZzDn22bGJVqzhQ44BNv
   0T68PHFBPX/adtW427gQrFWEb0RQfWB1BSfcVOyRl9VzBDHGlxa+sXMM8
   mwzRrd/yqyUMh+T/4rteitYiR8VEADZy5sYdndlIH83NmmoooT7ow/5nD
   skQnvS4QQwmmPD7yTrmGj6KTFsN9vMdPtxyK7eCicCqVMlysMV/Z9nE8I
   WN0wOE8/tAhh6BawWathKpvo7JN4kqGCGEq9X/9eCYeF6EXxneySJhv6k
   Q==;
X-CSE-ConnectionGUID: YqjhmZI9SxqhiuJjXEWLkw==
X-CSE-MsgGUID: NWZK2kppQQiIAD7As9XFmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47440617"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47440617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:25:56 -0700
X-CSE-ConnectionGUID: eHQtRS7ATPy7eaNAJLoA+g==
X-CSE-MsgGUID: +fUq7ZfCQaOePLZGcr6bXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136943642"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2025 04:25:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcuP-0007fh-1m;
	Wed, 07 May 2025 11:25:53 +0000
Date: Wed, 7 May 2025 19:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 17/20]
 ./usr/include/scsi/fc/fc_els.h:1196:39: error: 'u8' undeclared
Message-ID: <202505071928.csc98bSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: 172ed06baf9415900b3460917f4163ee63cf712c [17/20] fc_els: use 'union fc_tlv_desc'
config: x86_64-buildonly-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071928.csc98bSK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071928.csc98bSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071928.csc98bSK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/scsi/fc/fc_els.h: In function 'fc_tlv_next_desc':
>> ./usr/include/scsi/fc/fc_els.h:1196:39: error: 'u8' undeclared (first use in this function)
    1196 |         return (union fc_tlv_desc *)((u8 *)desc + FC_TLV_DESC_SZ_FROM_LENGTH(desc));
         |                                       ^~
   ./usr/include/scsi/fc/fc_els.h:1196:39: note: each undeclared identifier is reported only once for each function it appears in
>> ./usr/include/scsi/fc/fc_els.h:1196:43: error: expected expression before ')' token
    1196 |         return (union fc_tlv_desc *)((u8 *)desc + FC_TLV_DESC_SZ_FROM_LENGTH(desc));
         |                                           ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
