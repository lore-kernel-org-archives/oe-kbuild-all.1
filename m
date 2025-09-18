Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457213C38
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 02:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162894; cv=none; b=OYI/krOZd8NYyXGGKhcg0cWhJJblh57gfA+8UGJ8QnnnCagAWcpnFjfaIoT1flc/feNhVz3iYKb28BTy9HmtrhiC2V0JSn9PU2GCBZ7G8vLQwRaVuWPw95I/MuKSnOwJmncORTQflvu0gRhR4MbNO28g7uTwrli7RNLcI3LDtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162894; c=relaxed/simple;
	bh=XvCw6ya1aYj6NQAIa0YScoLy4BC8CW5bOXX8pKM495c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REx45dU/5050q+svoxCosOdJ8aGufXLvQH/LjJ04LcI+9PtjXLWMy78XxmPiyLE6jJrPdRfdmt3AmkhZgAE4qKqpICuuVlCIJ8F2wq+JBf+TVUFFrYPXYg2P/gHHj2r50NQ9SBdIEpR6858oIxI8BxzOj9qTfYNx5UvjxRs7kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY5D5jN0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY5D5jN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758162891; x=1789698891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvCw6ya1aYj6NQAIa0YScoLy4BC8CW5bOXX8pKM495c=;
  b=PY5D5jN0jRBMu+XcUGz2J3IDa61aGilCPdXXb+eetCIRgFWy59r1pPgq
   I9EKKYXxuxXmaX/hcHMH6/g6sOkZ9QhJBvvU6oIQObjJwCEmxoj2ucA7W
   IblAp7usTXM98zx0fg+lKoYwC9PAkLlWN8EGDE5hbtm49Ylosu4bvrHHi
   GNbvAyDSznmLWM86olB6NgtLIil3KVZICLSi3KS3Y0UQFzcXtUVCPEK93
   UC9lmODuWnQ6mYjzdC8/fjCNPTfRhZaNk4zkTedosDDo60Gck12WePLt8
   8Gy+gVfWen2VHDZB1Ck5O+cUZYYmZ31fBvPySmquw1NJHL704fwa3iVOb
   g==;
X-CSE-ConnectionGUID: CxQI+OE7Qm6wDhQfaWBwNg==
X-CSE-MsgGUID: iId6gut/RAyH8su/9lyo5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71907291"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="71907291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 19:34:51 -0700
X-CSE-ConnectionGUID: osmW6AvWQYydZRAqi/ys4w==
X-CSE-MsgGUID: T1xYaJPrT22bhDKlhrlaxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175010864"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2025 19:34:50 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz4Tv-0002el-13;
	Thu, 18 Sep 2025 02:34:47 +0000
Date: Thu, 18 Sep 2025 10:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2904/2904]
 drivers/scsi/leapioraid/leapioraid_func.c:323:5: sparse: sparse: symbol
 'cooo' was not declared. Should it be static?
Message-ID: <202509181012.vVyKqQhs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8ba53a0f68c5722dd787f872e161bbd850b225c4
commit: cb4f105d75398d2a0bd81c54df74aab82050e0f7 [2904/2904] LeapIOraid: add device and support fw log
config: loongarch-randconfig-r111-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181012.vVyKqQhs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181012.vVyKqQhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181012.vVyKqQhs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/leapioraid/leapioraid_func.c:303:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   drivers/scsi/leapioraid/leapioraid_func.c:303:35: sparse:     expected restricted __be32 static [addressable] [assigned] [toplevel] [usertype] s_addr
   drivers/scsi/leapioraid/leapioraid_func.c:303:35: sparse:     got unsigned int [addressable] [usertype] ip
>> drivers/scsi/leapioraid/leapioraid_func.c:323:5: sparse: sparse: symbol 'cooo' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:1366:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1366:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1366:67: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1398:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:1398:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:1398:51: sparse:     got unsigned long long [usertype] *
   drivers/scsi/leapioraid/leapioraid_func.c:1896:21: sparse: sparse: symbol 'leapioraid_pcie_link_speed' was not declared. Should it be static?
   drivers/scsi/leapioraid/leapioraid_func.c:2918:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/scsi/leapioraid/leapioraid_func.c:3263:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3263:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3263:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3276:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3276:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3276:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3289:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3289:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3289:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3302:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/leapioraid/leapioraid_func.c:3302:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/leapioraid/leapioraid_func.c:3302:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/leapioraid/leapioraid_func.c:3345:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ImageSize @@     got unsigned long [assigned] [usertype] data_length @@
   drivers/scsi/leapioraid/leapioraid_func.c:3345:32: sparse:     expected restricted __le32 [usertype] ImageSize
   drivers/scsi/leapioraid/leapioraid_func.c:3345:32: sparse:     got unsigned long [assigned] [usertype] data_length
   drivers/scsi/leapioraid/leapioraid_func.c:4717:40: sparse: sparse: invalid assignment: |=
   drivers/scsi/leapioraid/leapioraid_func.c:4717:40: sparse:    left side has type restricted __le16
   drivers/scsi/leapioraid/leapioraid_func.c:4717:40: sparse:    right side has type int
   drivers/scsi/leapioraid/leapioraid_func.c:4775:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr @@     got unsigned long long [usertype] log_buffer_dma @@
   drivers/scsi/leapioraid/leapioraid_func.c:4775:29: sparse:     expected restricted __le64 [addressable] [assigned] [usertype] BufAddr
   drivers/scsi/leapioraid/leapioraid_func.c:4775:29: sparse:     got unsigned long long [usertype] log_buffer_dma
   drivers/scsi/leapioraid/leapioraid_func.c:4776:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] BufSize @@     got int @@
   drivers/scsi/leapioraid/leapioraid_func.c:4776:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] BufSize
   drivers/scsi/leapioraid/leapioraid_func.c:4776:29: sparse:     got int
   drivers/scsi/leapioraid/leapioraid_func.c:5218:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/scsi/leapioraid/leapioraid_func.c:5218:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/leapioraid/leapioraid_func.c:5218:67: sparse:     got unsigned long long [usertype] *

vim +/cooo +323 drivers/scsi/leapioraid/leapioraid_func.c

   317	
   318	struct info
   319	{
   320		u32 user_position;
   321		u32 ioc_position;
   322	};
 > 323	int cooo;
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
