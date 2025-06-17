Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518EC2FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129298; cv=none; b=d7/722XrCeEnH108snwplhjq1XqHPOK0k+e4yXXYpHydMmfzobycNLcvtif493YdhXViNa2vnAJuua2WtEmW4TCN+NssV+d+JCXYbdPezS5nJvHjh643UL/4PKqXzWUF08iDNcvpRa0iimyhjba6m6xlHK2rcIyvXQf/afcWO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129298; c=relaxed/simple;
	bh=c2yM9Ol0B7l9T1fDQNPw/dqe2OIfw6or7rh4liKKtbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/E1BC1vND2E8E4B1fjZSscPBJSoMIyx7Ciccd5jQEwOaAYXdyWZ49YVAw+KYB3gPOaLwPJuNPnUpLar4pkkfgr6e+WnUCF8EhVh5exL+QWCN0Ljs31rdpMlVKZBmLwi/0I9NzszHOdva99fL3Ngypbw3AGMP7Ke65L0AuHEQys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXeqCEIj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXeqCEIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750129296; x=1781665296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2yM9Ol0B7l9T1fDQNPw/dqe2OIfw6or7rh4liKKtbo=;
  b=HXeqCEIjH97MH6SCQwd3jq9wje3Rd1kcU/O6H9QLevv9ramQkrk0uqp/
   zJHOS/TLjmF/MdVKT+2dR9JNXndfWggEysWr3JdBziC0/8tEOCjwW2h/K
   RBuLF5aKQena6YSF7sUa5HZf5hb1hcK8pIakktUyyiRtzXLpxJWTy6zXZ
   6A2dZkeB/L9yqg6lr4lnqebGn9jIeoreV62/GNWVaupZ+YTZB+CiVN6aC
   rNhsAIJhwucuu2DYwH3s+ZXZk9y+g45cTNsOIU0FZ4UgkWtTSqKyxwTH0
   ba9kCeK64ycC2Q3mha3l3IG3UZQItToY7Pzy5yom8Q2enLAwCHxighIEm
   g==;
X-CSE-ConnectionGUID: IpFC4/2JRPamvhb5V+oFtg==
X-CSE-MsgGUID: y8uEVcAeRu+WuMwvzqivEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63321212"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63321212"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 20:01:36 -0700
X-CSE-ConnectionGUID: /rxyuJVXTQ+s94JEbeJz5g==
X-CSE-MsgGUID: ZNs8vh7dRU6eSWD+/jpz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148634292"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2025 20:01:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRMZo-000FXI-1t;
	Tue, 17 Jun 2025 03:01:32 +0000
Date: Tue, 17 Jun 2025 11:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 44/56]
 drivers/net/dsa/mxl862xx/mxl862xx-host.c:158:27: sparse: sparse: cast to
 restricted __le16
Message-ID: <202506171007.Z6Q6QtRz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   de2eef5af7055f0bc1f2c29e4025169aa41126ae
commit: 594c8e2819ea1ff1397f9572a5c8d15228d27586 [44/56] net: dsa: add mxl862xx driver
config: hexagon-randconfig-r112-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171007.Z6Q6QtRz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171007.Z6Q6QtRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171007.Z6Q6QtRz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx-host.c:158:27: sparse: sparse: cast to restricted __le16
>> drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse:     expected unsigned short [usertype]
   drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse:     got restricted __le16 [usertype]

vim +158 drivers/net/dsa/mxl862xx/mxl862xx-host.c

   128	
   129	int mxl862xx_api_wrap(struct mxl862xx_priv *priv, u16 cmd, void *_data,
   130			      u16 size, bool read)
   131	{
   132		u16 *data = _data;
   133		int16_t result = 0;
   134		u16 max, i;
   135		int ret;
   136	
   137		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
   138	
   139		max = (size + 1) / 2;
   140	
   141		ret = mxl862xx_busy_wait(priv);
   142		if (ret < 0)
   143			goto out;
   144	
   145		for (i = 0; i < max; i++) {
   146			u16 off = i % MXL862XX_MMD_REG_DATA_MAX_SIZE;
   147	
   148			if (i && off == 0) {
   149				/* Send command to set data when every
   150				 * MXL862XX_MMD_REG_DATA_MAX_SIZE of WORDs are written.
   151				 */
   152				ret = mxl862xx_set_data(priv, i);
   153				if (ret < 0)
   154					goto out;
   155			}
   156	
   157			mxl862xx_write(priv, MXL862XX_MMD_REG_DATA_FIRST + off,
 > 158				  le16_to_cpu(data[i]));
   159		}
   160	
   161		ret = mxl862xx_send_cmd(priv, cmd, size, &result);
   162		if (ret < 0)
   163			goto out;
   164	
   165		if (result < 0) {
   166			ret = result;
   167			goto out;
   168		}
   169	
   170		for (i = 0; i < max && read; i++) {
   171			u16 off = i % MXL862XX_MMD_REG_DATA_MAX_SIZE;
   172	
   173			if (i && off == 0) {
   174				/* Send command to fetch next batch of data
   175				 * when every MXL862XX_MMD_REG_DATA_MAX_SIZE of WORDs
   176				 * are read.
   177				 */
   178				ret = mxl862xx_get_data(priv, i);
   179				if (ret < 0)
   180					goto out;
   181			}
   182	
   183			ret = mxl862xx_read(priv, MXL862XX_MMD_REG_DATA_FIRST + off);
   184			if (ret < 0)
   185				goto out;
   186	
   187			if ((i * 2 + 1) == size) {
   188				/* Special handling for last BYTE
   189				 * if it's not WORD aligned.
   190				 */
   191				*(uint8_t *)&data[i] = ret & 0xFF;
   192			} else {
 > 193				data[i] = cpu_to_le16((u16)ret);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
