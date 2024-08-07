Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652931C7B87
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015664; cv=none; b=GmcpUJ5hx8D2/axMdVgc+oL1KmtIvmkDGyyRGyRJllMvQ5AyTlzS2xekZA7KKLywZYC77W/GdgMDn7PfFE8YfMjqYWd+Go28/8Lq0r8ZWYElC0gF2xMjiJMzUJE7WOdY4lnBYQz87e6T8eSCm4zGwngiqPXuocDp7Ws5XqRQs0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015664; c=relaxed/simple;
	bh=jDfyNRBTm+snDVC9jYfhq7rG6SjEKTwfO2EvffYc0w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vdu2yfu25Zk/ecomCmxCb4see/785knH2s6SVqG3Hycs4NHDjmOr6gtMbGFYQMv5lZLFX4s9nhreJbg/hlBczKcn5PBTGXYy4L/rTivb2SXU0ic8cMyqu2mCkVszvcW+umCtzxjUETZcB24kT/GQ9p7XTro2GfHnpmytbaHThag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOUPyZ62; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOUPyZ62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723015662; x=1754551662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDfyNRBTm+snDVC9jYfhq7rG6SjEKTwfO2EvffYc0w8=;
  b=jOUPyZ62O91v2qmLMwl0zA78m52mXA0G9yihB1GhjbygySJOT/BdPgmr
   t154t4aOBEFzEDRhgVTipTpHOXffW/rL+Yy5nbGk5pUQOgMyXxJHZaSQH
   I2Z1a9bSMHtMfedZjUtH8TA6wfDEwPsZ/5GF1eyU7ZLhlCr7fe2l5nnOk
   pIbQwv/C7TIB0b2IUMWRtNt1yyckFtkZ+U3qxWTy6JdIMf5q/JLg34dxq
   T/npww5V9T4PcE9EjjuH+SqWMqUCeBFF/wa3/L2xXpyS68/2VNwLlcGlM
   fx1sVSffh6fjbx/3FDgDvjY3AUKXCE02ITAAkoWTMvBDpDx/HikxLner7
   w==;
X-CSE-ConnectionGUID: xYUFdvpOTz6qNVASD2+L3g==
X-CSE-MsgGUID: 5FeqFxhsTZmxi6eBOsGF6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24948274"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="24948274"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 00:27:42 -0700
X-CSE-ConnectionGUID: QgablWJxRiS6JmzXdTdkEw==
X-CSE-MsgGUID: 3fTRgzG8TV6rtL8QSoKP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61403990"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 00:27:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbb53-0005Ci-23;
	Wed, 07 Aug 2024 07:27:35 +0000
Date: Wed, 7 Aug 2024 15:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhanglei <zhanglei48@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21466/23457]
 drivers/scsi/hisi_raid/.tmp_hiraid_main.o: warning: objtool: missing symbol
 for section .exit.text
Message-ID: <202408071520.YhKILcYe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1b0fff4561341f470eaa556c2b1eb2131ce7ddc1
commit: f153a1e5e708c7cf9607ad375bf7145060ababd4 [21466/23457] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
config: x86_64-buildonly-randconfig-006-20240806 (https://download.01.org/0day-ci/archive/20240807/202408071520.YhKILcYe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071520.YhKILcYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071520.YhKILcYe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hdev' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'qid' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'cq_vector' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hdev' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'qid' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_send_queue'
>> drivers/scsi/hisi_raid/.tmp_hiraid_main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
