Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAD2F99AE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766334575; cv=none; b=W1g/tdtufnsMyrY9k/3TInS7mB1G+gpkWbrY4NtRKIbJQz8jAd/a1/GkTa7TMGV8w1KBOPEuL9PpRNtmZcrf1VJ5uymJ6DDjDbggefVG92KDgO1D2z9V0lgQhcM1LEDIK/r9OAtxcTKLl+ZPOVlIcRzBwpEXOIolxN1cXozenqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766334575; c=relaxed/simple;
	bh=a+n8BQBWMFMLPGleO0v1G5sffMt+Mjq1SW2rWUlXpFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4K44HGqAx9XFu3y5+XmeEVxTIMo837fS4hEl/CsSc/LZkTMDhlTuXGkTl11EO6RyDdPX/wQDfEqGSeSM3ZWdUSiheiNXi6J0JomuV1eRta0HBsSaUznasXNU/WsgPu3iqQ0XzzBYi18hPK/5rhUVExwRXhnD616As0P9eComMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjxdIdvu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjxdIdvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766334573; x=1797870573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+n8BQBWMFMLPGleO0v1G5sffMt+Mjq1SW2rWUlXpFQ=;
  b=ZjxdIdvugLAH8jOPsyt2L18lB/oyEANDF6kf+EhIzwzLXn6sGZUmmfTs
   tLvVjlaHwzYFToCipSXkGB4mK/D2NEepeWIQSW0630Egu3aIWTi6vTS7r
   i3p9CdKzdIFSZgup3yp/OhTMtZ9zSAQDRhyRX2ATL9h3WD2No0ZbIsSX2
   UCWEncoUQduwqLs7QdyEZZZ7iq8UCBwisDLiJSzJr1fvOsm/Z701c3x/v
   ExVwVoMuwUA9zR860FVDoj4ta6FB2+y/SQR4hx1Q+dbxYLKDfaDx7q3FD
   NPO369JW6Qokj3ED2Y9aG6inPByN8YnGoZfc0ot2OoQvxHSt2HrFvlKFv
   g==;
X-CSE-ConnectionGUID: ysJE2pTHTeC5T1EOg3IejQ==
X-CSE-MsgGUID: IyOC8dycQa2hlqqkX6F1YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55788415"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="55788415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:29:32 -0800
X-CSE-ConnectionGUID: 8mS/pXENTDO6cJU+98xBTQ==
X-CSE-MsgGUID: iA9aI/1RTz+VyLA0eVVhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199354882"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 08:29:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXMJE-000000005qf-2GKO;
	Sun, 21 Dec 2025 16:29:28 +0000
Date: Mon, 22 Dec 2025 00:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:43:35: sparse:
 sparse: cast to restricted __le16
Message-ID: <202512220002.7l3mjSAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: b8a759002c48f227d03084fb6b6213a3beaa44e3 [3557/3557] mm_monitor/mm_spe: Introduce standalone SPE profiling framework
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251222/202512220002.7l3mjSAD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220002.7l3mjSAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220002.7l3mjSAD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:43:35: sparse: sparse: cast to restricted __le16
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:46:35: sparse: sparse: cast to restricted __le32
>> drivers/arm/mm_monitor/spe-decoder/arm-spe-pkt-decoder.c:49:35: sparse: sparse: cast to restricted __le64

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
