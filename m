Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415243634E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637408; cv=none; b=uoPOvUh/mS81jz9gZKqcNYymeYk/LLVix6UKAFioGh3GtFFrUIt/C0FkvejYPQztKtdKKIAxkrJY9HgjLXrW8CdP2vgEZ3clOu1gNJMbN5NXTj2X9JXpoosy6N1WobmrQhu7uTrrOTOHUCFj1FtKM64IR3LJJotowScrhI8vUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637408; c=relaxed/simple;
	bh=npQ2fy8Oad5IJPSl3XuoJcNbhirXE8vEF7WgC8Il9OE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0HhqgCNi7bjCc4F2UObjT3DKDI7BtYh6Hzw1/lbLwj3KS4icgwIWoMCfrejNRyw7ldkSQdbzeSRQi7Tdm2wrwNHu8oPVhHF2pY55BnpWOSNgFImv5F6azY7finhRbo97vgM5TxuC726O7ZDuT/FvaVAFKLyDicIe9c4GsmaowA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NijeiwY3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NijeiwY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786637400; x=1818173400;
  h=date:from:to:cc:subject:message-id;
  bh=npQ2fy8Oad5IJPSl3XuoJcNbhirXE8vEF7WgC8Il9OE=;
  b=NijeiwY3HRFvT8vrPtMGcDKCuqnvzyKNRD1H0rFGeR0ly03au6v4iDDV
   NYcv+QP6fOw7JUHOBipBp7o3TZkkXW/4vFHr5OPJK2yA3uTmCsN/PheM8
   fpvn7e0xQhUzEQXDkFTg5KilYwdGv9vCAAIChOqtlLJspbsw1T36LL3MJ
   jd/sv6gZd4UIqRdtG+XuuHMj0xwDaL38yrwOl3Cntb6bpBrbF4aa7RDTJ
   KeuWG/RnYClFw4hA3ygqLojF219V86MCOUtDrUTCDiQFXcbhsqDLxeX8g
   KooKkokXIpPW5/bmiMSOysOEBKGRq7mWGfEhgn/vl7U5RCFqSlO1W17j/
   Q==;
X-CSE-ConnectionGUID: bHvkPR38RyWCxY5JGiDy7g==
X-CSE-MsgGUID: MjzKXix9TRWuDZ4UVCM31Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86336974"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="86336974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 09:09:57 -0700
X-CSE-ConnectionGUID: 4S5amwpQQa2bvtErIjLBXg==
X-CSE-MsgGUID: nwgjWi+eT8Wnvqh0fQAkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267844701"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2026 09:09:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuY09-00000000VpE-3dvK;
	Thu, 13 Aug 2026 16:09:53 +0000
Date: Fri, 14 Aug 2026 00:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/partial_ctlvec 11/14] Warning:
 kernel/sysctl.c:655 function parameter 'conv' not described in
 'apply_conv_on_vec'
Message-ID: <202608132314.gwa5ZWQF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Joel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/partial_ctlvec
head:   9312ca3b5af5c2cb5f745052f7dd3b8d1891b973
commit: 0f090cba937710dff0c17c85749d50c6b7038451 [11/14] sysctl: Split data conversion and file position handling
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608132314.gwa5ZWQF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132314.gwa5ZWQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608132314.gwa5ZWQF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sysctl.c:655 function parameter 'conv' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'table' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'data_type' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'data_size' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'conv_dir' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf_nbyte' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf_left_final' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'conv' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'table' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'data_type' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'data_size' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'conv_dir' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf_nbyte' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf' not described in 'apply_conv_on_vec'
>> Warning: kernel/sysctl.c:655 function parameter 'buf_left_final' not described in 'apply_conv_on_vec'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
