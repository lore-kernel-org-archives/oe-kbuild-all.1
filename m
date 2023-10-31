Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B0D2E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 05:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A485tbE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698730795; x=1730266795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pReuXUznbAHwJ0ozeh/N4tD75S0yEhjYwojoNHEEn2g=;
  b=A485tbE2cF/70sWRE3od2R4mmiMBl/nFhZDJ/cJePhsAUtsVC3e/F1Wb
   yTtZu6Zn82LEzFTTqpycXYOjm5oUDf5FI1AdQ3S65vffj7omcraXLB6Nt
   wIxYrSDpzkQ5/BoO+2k1EVAKKmmo/tJ8gYS/+VN8kAN9qEs0scSkBJ68L
   TdKPZ1vbvqUXfuiTMSdEEQb9NVAtYCR28jmiICmUGfc+L+9hV8X9l4Y4/
   czcSpJmzOZbK9aGVZ6o3tgpXLNFBmlYpp6lWl6u21dizLeL9eiT0y/1RX
   cWnMgXc9N/K2XSWkUATmIDnG0BgYKSn8+XPDUt9j7dDNy3UoTHRuWCxpg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373270407"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="373270407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 22:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764138731"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="764138731"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 22:39:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxhTk-000DrS-0I;
	Tue, 31 Oct 2023 05:39:52 +0000
Date: Tue, 31 Oct 2023 13:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm_buf 9/10] drivers/char/tpm/tpm-buf.c:176:16:
 sparse: sparse: cast to restricted __be16
Message-ID: <202310311311.4rF3TQTV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   19f6e9fedbf68841c13485638dae42d3026b134f
commit: 9292e45b5f892da139d04bfb4d6a96089563934d [9/10] tpm: Add tpm_buf_read_{u8,u16,u32}
config: x86_64-randconfig-121-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311311.4rF3TQTV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311311.4rF3TQTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311311.4rF3TQTV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted __be16
>> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted __be32

vim +176 drivers/char/tpm/tpm-buf.c

   162	
   163	/**
   164	 * tpm_buf_read_u16() - Read 16-bit word from a TPM buffer
   165	 * @buf:	&tpm_buf instance
   166	 * @offset:	offset within the buffer
   167	 *
   168	 * Return: next 16-bit word
   169	 */
   170	u16 tpm_buf_read_u16(const struct tpm_buf *buf, off_t *offset)
   171	{
   172		u16 value;
   173	
   174		tpm_buf_read(buf, offset, sizeof(value), &value);
   175	
 > 176		return be16_to_cpu(value);
   177	}
   178	EXPORT_SYMBOL_GPL(tpm_buf_read_u16);
   179	
   180	/**
   181	 * tpm_buf_read_u32() - Read 32-bit word from a TPM buffer
   182	 * @buf:	&tpm_buf instance
   183	 * @offset:	offset within the buffer
   184	 *
   185	 * Return: next 32-bit word
   186	 */
   187	u32 tpm_buf_read_u32(const struct tpm_buf *buf, off_t *offset)
   188	{
   189		u32 value;
   190	
   191		tpm_buf_read(buf, offset, sizeof(value), &value);
   192	
 > 193		return be32_to_cpu(value);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
