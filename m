Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289F7FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 01:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710032811; cv=none; b=TlZ3//csPqUnF7EpFXDKm9oJU547mJ8ZDKVCYNKapu98uDG+Q8KYAsnFaNA6A+v2pVF3onsv6P3QEN4+r+2yisqkU7NBVv7hTj2aTMWlkdTuvKkFdaRiI3CvY0WEnaoDCSpVOUUjRj/XWvdZvwKyR2T8VjOf8ZSMHqOAuc5thDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710032811; c=relaxed/simple;
	bh=4HPcWPcDujUVnyfYq3jHXy0IqzroABnQNMV7mUHL0Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpDV/5B9/Wcl2C//7cXCDhJUugMi4+d/3mW2Nj3lu6vVJ2XjfFZ1b6cl3xvVO8YXuATMfdZ0fKYAD1L5nhSS66oW2fDOz1w9xVhZ+Dvtqo5//P/bJV6QevCLut1XU2CH7ndAxm7M28KH92E4zQri6n71F5OdBwQTeuY9N6D5j1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7PD7buX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7PD7buX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710032810; x=1741568810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HPcWPcDujUVnyfYq3jHXy0IqzroABnQNMV7mUHL0Nw=;
  b=F7PD7buXQiY5Y3KRMzapWqws3oEYlXgd9vbyBbpzs2toaG99VYO4RWS7
   4Bjescwjpp3rIO1YtErvBTTwdOFIrk+/zLVKZtJK4SWuAVnDHeddT2oZ8
   ztdmbWd5TCE6kZV082+c+dHEsvs0oBjnuNcw/8gV4G0xkV0mBdM/NIj7F
   TsBsu74eywzB+VHb1uo6cQYeFHRd95cHq2BwAR1cX++eMetcl0F5lZZXh
   fSByQBkT6xeJUVPBA6aoBMszr1jduHHtcjeJj7nan/jKwOEktQGVbSQAz
   O2hLpLfxUc/57e7ul3xowzEZECduXYqmstD1iDuBi/n7tYYfuKlI8cgze
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22183827"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="22183827"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 17:06:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15391329"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2024 17:06:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj7eH-0007mx-37;
	Sun, 10 Mar 2024 01:06:45 +0000
Date: Sun, 10 Mar 2024 09:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ashyti:test/i2c-host 40/40]
 drivers/i2c/busses/i2c-qcom-geni.c:493:18: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202403100913.b7Rhdt6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ashyti/linux test/i2c-host
head:   313d6aa4c64875ed8a10339a2db8766f49108efb
commit: 313d6aa4c64875ed8a10339a2db8766f49108efb [40/40] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240310/202403100913.b7Rhdt6W-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100913.b7Rhdt6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100913.b7Rhdt6W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-qcom-geni.c: In function 'i2c_gpi_cb_result':
>> drivers/i2c/busses/i2c-qcom-geni.c:493:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     493 |         status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
         |                  ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +493 drivers/i2c/busses/i2c-qcom-geni.c

   486	
   487	static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
   488	{
   489		struct gpi_i2c_result *i2c_res = cb;
   490		struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
   491		u32 status;
   492	
 > 493		status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
   494		if (status == BIT(NACK)) {
   495			geni_i2c_err(gi2c, NACK);
   496		} else if (status == BIT(BUS_PROTO)) {
   497			geni_i2c_err(gi2c, BUS_PROTO);
   498		} else if (status == BIT(ARB_LOST)) {
   499			geni_i2c_err(gi2c, ARB_LOST);
   500		} else if (result->result != DMA_TRANS_NOERROR) {
   501			dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
   502			gi2c->err = -EIO;
   503		} else if (result->residue) {
   504			dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
   505		}
   506	
   507		complete(&gi2c->done);
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
