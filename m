Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE0A12B93
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 00:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749084119; cv=none; b=izV/b2agrEV1wDGBee0sOGC6QuREhczQNskPUr6rLbiWtsEMQpsmdHIKrVWzlS1oy/IPAWSPqUlPxc+y0ET6qAjPmXMa/DbqY5q3UiVPdqqi/K2Z6qMYyR4lLLtpzGqdxLjjuNdl96Y9HbcMKr0UZI9D5qPaRspZrdWJm9Il1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749084119; c=relaxed/simple;
	bh=DkHSPVm6Vp8/aGX7xK91rGC0PIcJpKpsqDlam56BaUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugJ6cj4wEQCw2JJIMje47It16OSuPI+W1WOc3KjRDdUuamLxIkkRu01jcXi1pr581GEPmD4wozeJQ8zt1sHU6HJ9krzZiuXRVM3+l0qD+P2Z6scUE9ZHj1zXy8tGZ1ME5jgMeCDKlK9sGmGG9nXIDCM7O7ABgHnD8chakjqDbYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgNJi2Kw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgNJi2Kw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749084118; x=1780620118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkHSPVm6Vp8/aGX7xK91rGC0PIcJpKpsqDlam56BaUs=;
  b=ZgNJi2KwsEmm8jCaMJ2/vpMJw1DXNFJ1FXcHCWgC9QBK1qNGvwnqHJcF
   9nZ6cPlgt2PLkjgovuW1rNoeFR5hLsAbnZ7DqWNO0N4ZEc8HazvHsuqTQ
   W2CyZPjOfqtYY5iVPs8pj6sSBdypR6YWPI406n0ypqO07fy4aGQT7DTV7
   7BM2xHwRU0leXMiWbqLvFZ2aTBizCNdBXPRcryfp0Dr2/Cj1xOY6ch6bM
   JlS9cuRDkTYVaXbK2NpK3Q4Ft8kxcEJzo7OJaR/9sTSnR+Vy18c8N53sl
   PMArlSYTekpkJjrQclzupjBaAVBxycVkHm++t5BGrDtennHZFXAEm5PNg
   A==;
X-CSE-ConnectionGUID: 6oKC6dQ2QuSCu2kTcjYrgQ==
X-CSE-MsgGUID: uBmL9XeISIOjDjKYUnhYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51187583"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51187583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:41:54 -0700
X-CSE-ConnectionGUID: eMkFCOsvS+Cx936x185eEw==
X-CSE-MsgGUID: FBFlzXEBSG2JGVnSHExt8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="176222862"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 17:41:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMyg1-0003Zz-2i;
	Thu, 05 Jun 2025 00:41:49 +0000
Date: Thu, 5 Jun 2025 08:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357]
 drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:43:35: sparse:
 sparse: cast to restricted __le16
Message-ID: <202506050822.mELNZxno-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9e6ec001662a376522f36604dfec47c30530549
commit: b8a759002c48f227d03084fb6b6213a3beaa44e3 [2357/2357] mm_monitor/mm_spe: Introduce standalone SPE profiling framework
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050822.mELNZxno-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506050822.mELNZxno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050822.mELNZxno-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:43:35: sparse: sparse: cast to restricted __le16
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:46:35: sparse: sparse: cast to restricted __le32
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:49:35: sparse: sparse: cast to restricted __le64
--
>> drivers/arm/mm_monitor/mm_spe.c:35:1: sparse: sparse: symbol '__pcpu_scope_per_cpu_spe_buf' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:259:5: sparse: sparse: symbol 'mm_spe_start' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:294:6: sparse: sparse: symbol 'mm_spe_continue' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:306:6: sparse: sparse: symbol 'mm_spe_stop' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:311:6: sparse: sparse: symbol 'mm_spe_decoding' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:319:19: sparse: sparse: symbol 'mm_spe_getbuf_addr' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:326:5: sparse: sparse: symbol 'mm_spe_getnum_record' was not declared. Should it be static?
   drivers/arm/mm_monitor/mm_spe.c:339:5: sparse: sparse: symbol 'mm_spe_enabled' was not declared. Should it be static?

vim +43 drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c

    26	
    27	static int arm_spe_get_payload(const unsigned char *buf, size_t len,
    28				       unsigned char ext_hdr,
    29				       struct arm_spe_pkt *packet)
    30	{
    31		size_t payload_len = arm_spe_payload_len(buf[ext_hdr]);
    32	
    33		if (len < 1 + ext_hdr + payload_len)
    34			return ARM_SPE_NEED_MORE_BYTES;
    35	
    36		buf += 1 + ext_hdr;
    37	
    38		switch (payload_len) {
    39		case 1:
    40			packet->payload = *(uint8_t *)buf;
    41			break;
    42		case 2:
  > 43			packet->payload = le16_to_cpu(*(uint16_t *)buf);
    44			break;
    45		case 4:
  > 46			packet->payload = le32_to_cpu(*(uint32_t *)buf);
    47			break;
    48		case 8:
  > 49			packet->payload = le64_to_cpu(*(uint64_t *)buf);
    50			break;
    51		default:
    52			return ARM_SPE_BAD_PACKET;
    53		}
    54	
    55		return 1 + ext_hdr + payload_len;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
