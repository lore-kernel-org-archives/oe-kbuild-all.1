Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196715A87C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100700; cv=none; b=niw9/lZZjO2n6+KcwSTvW7KUcjXo9ZbCQp1cT+yOCbG43bE8kz9/tz/3+yhX0QRmvCMi+MlBQ7vWGkvlOQY53HBxyDHQc2XeC5unewb30RraACfd9/kSybccI593FHy2AiJS0nz8OpI8XxsQ/0Jc0OBUQ5RZyBX/HmX+1UQCLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100700; c=relaxed/simple;
	bh=beW5uXdDs1vYTChWZI7QQEisYeUs1uY2gXjwZVDVV8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tz4CMkiAPsifEuVoRKZRV4msWcfIBpcY+Cy4ebCCo5ZrgPFJUNZHX1D0sFLBLepQdwFssAplW8p5AhfEw6vAT34b1Rl62vKelZSsitdcERbMIUZhTAZ6RvfaB0WhUeyCCVw9qdcqybJAOYT7JI/94lWxzwLoefj76tklAlBB/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGZiH2KA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGZiH2KA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739100698; x=1770636698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=beW5uXdDs1vYTChWZI7QQEisYeUs1uY2gXjwZVDVV8s=;
  b=AGZiH2KAjb4Qg+3uO4Gf4FV1ww/aVjc8zWZmbW+QugtpJKAtn6I7tegV
   75Bx6gd8hhEsv584GjKcxgP2vAjJ8sCaXywKk82PHg0Akd5JFtr4GqFsH
   3WSfbkTwD+B5NfopfzJNSOjqeXWZbh9imTuHlezg0zSTUqC6netBqlDt4
   jMmT1S7BL5i1AsaXLanKsKOeJsDKteg4gArI3W2maaHqKFiZq6dRSNeSX
   sdC4JAy12vGT5E/0Sq3xFaYHmDs1eFWNoR5EdozjgbEaRbVGYrEbgHMy6
   ZyftZhqbUHzUesarOCaxnAkO89g8FvI7TZmEHyqNIsIXChlZ7xHFEMPag
   g==;
X-CSE-ConnectionGUID: 41BhHmD3SFKSDa0+d7XAkw==
X-CSE-MsgGUID: UUFVDGH7T8OJ8twJIx8fKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39807945"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39807945"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 03:31:38 -0800
X-CSE-ConnectionGUID: tNKIGTqOTAq5A1r36uAXUg==
X-CSE-MsgGUID: MzfVJorzTGKB0/6L4WUtgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116015505"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2025 03:31:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th5XC-0011P9-0R;
	Sun, 09 Feb 2025 11:31:34 +0000
Date: Sun, 9 Feb 2025 19:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot+extras/v6.14-rc1 137/165]
 drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted
 __le32
Message-ID: <202502091954.KSuOsOcP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.14-rc1
head:   5ae8648f2b4bc8b0af2425c5a22548d5bcfd3a69
commit: acf6e613a77a2b3cf5d46838d6a940e7a672b4fe [137/165] firmware: arm_scmi: add MPAM-FB SCMI protocol stub
config: m68k-randconfig-r121-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091954.KSuOsOcP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091954.KSuOsOcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091954.KSuOsOcP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32

vim +32 drivers/firmware/arm_scmi/mpam.c

    12	
    13	static int scmi_mpam_transfer_buf(const struct scmi_protocol_handle *ph,
    14					  u8 msg_id, void *msg_buf, size_t msg_len,
    15					  u32 *ret_val)
    16	{
    17		int ret;
    18		struct scmi_xfer *t;
    19	
    20		ret = ph->xops->xfer_get_init(ph, msg_id, msg_len,
    21					      ret_val ? sizeof(*ret_val) : 0, &t);
    22		if (ret)
    23			return ret;
    24	
    25		memcpy(t->tx.buf, msg_buf, msg_len);
    26	
    27		ret = ph->xops->do_xfer(ph, t);
    28		if (!ret && ret_val) {
    29			u32 value;
    30	
    31			memcpy(&value, t->rx.buf, sizeof(value));
  > 32			*ret_val = le32_to_cpu((__le32)value);
    33		}
    34	
    35		ph->xops->xfer_put(ph, t);
    36	
    37		return ret;
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
