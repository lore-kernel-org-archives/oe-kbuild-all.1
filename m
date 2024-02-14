Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642953390
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915722; cv=none; b=Tcq5Uqv0CaQ1OWawlrira3ZCjzcgh6STUz4fgm2R6W7QP24iZMLLi6n9Kbm8+HTS4XJg+BRMBEWpXKaiU9l0W7L3wf5TvKfmrXE3ARWWP/oUE7zZ+iBC5OPNGiPajhCHKNaVgA2cdkNMKIUgg97rOn5T4mKwagiMuo8jAjyRwPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915722; c=relaxed/simple;
	bh=9blVDC/41ChWBWC4FFw4X8bKcmqd6NZRPKQPYwEfwq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3OXOgePd6OBFYepLzzEXaHtagFakTxpRArIkbZVUQrtHgmqkeCqSTOr0SP1iphtTOeQyb6OYZipJjB9Vq0vPI+9VNaUa/GEZd/9Va7XeWh7JlT5JbRQIUJEw/WQC8u5ciDd29nmsH2TJJ6TSpZRVXvL6ovVsTX98DwTGYgZsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNzOQZ44; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNzOQZ44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707915720; x=1739451720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9blVDC/41ChWBWC4FFw4X8bKcmqd6NZRPKQPYwEfwq8=;
  b=PNzOQZ44iuSkWJW/qeABMCX/evH9vjWHiKbIS85tKPWtoFXDn88Nsn7z
   GXE/a6/nuDdPzJ3mMYWR/oZnpuYuzfMYiJa8ktESOA6HSu19PyA66xJCL
   G5XlHgnDWgurJAuanBeDoDf3Ma/hw5Pt3UE2chcp/LWrxXd6AlwgDhLpM
   15q2w/cEVzA4h1XpgJvkLdfXIWUUbylc9I0Ptv6nB2t/EzcSBcxhvQdhM
   8IXt5n6ZE+GoqOYw7RXwC2MvQWzFa2pty2f66cNK7rWM8vLLQfnGMxLt9
   k3PhDZgsxdfyDDHhn3F4o0bPlB7f5JkhLGmvNvaQO5vgKLptJcfslqaMY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1826964"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1826964"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="40669653"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2024 05:01:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raEtY-0008m4-1q;
	Wed, 14 Feb 2024 13:01:48 +0000
Date: Wed, 14 Feb 2024 21:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-mmc:next 9/22] drivers/mmc/host/davinci_mmc.c:214:16: warning:
 variable 'sglen' set but not used
Message-ID: <202402142042.vg0lnLdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   0deb3c2ac93640a98d0acc775acbf5efe8de9082
commit: ed01d210fd910f7fa7933638df14ffb8d4aac2a9 [9/22] mmc: davinci_mmc: Use sg_miter for PIO
config: mips-randconfig-c003-20211228 (https://download.01.org/0day-ci/archive/20240214/202402142042.vg0lnLdb-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142042.vg0lnLdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142042.vg0lnLdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/davinci_mmc.c: In function 'davinci_fifo_data_trans':
>> drivers/mmc/host/davinci_mmc.c:214:16: warning: variable 'sglen' set but not used [-Wunused-but-set-variable]
     214 |         size_t sglen;
         |                ^~~~~


vim +/sglen +214 drivers/mmc/host/davinci_mmc.c

   208	
   209	/* PIO only */
   210	static void davinci_fifo_data_trans(struct mmc_davinci_host *host,
   211						unsigned int n)
   212	{
   213		struct sg_mapping_iter *sgm = &host->sg_miter;
 > 214		size_t sglen;
   215		u8 *p;
   216		unsigned int i;
   217	
   218		/*
   219		 * By adjusting sgm->consumed this will give a pointer to the
   220		 * current index into the sgm.
   221		 */
   222		if (!sg_miter_next(sgm)) {
   223			dev_err(mmc_dev(host->mmc), "ran out of sglist prematurely\n");
   224			return;
   225		}
   226		p = sgm->addr;
   227		sglen = sgm->length;
   228	
   229		/* NOTE:  we never transfer more than rw_threshold bytes
   230		 * to/from the fifo here; there's no I/O overlap.
   231		 * This also assumes that access width( i.e. ACCWD) is 4 bytes
   232		 */
   233		if (host->data_dir == DAVINCI_MMC_DATADIR_WRITE) {
   234			for (i = 0; i < (n >> 2); i++) {
   235				writel(*((u32 *)p), host->base + DAVINCI_MMCDXR);
   236				p = p + 4;
   237			}
   238			if (n & 3) {
   239				iowrite8_rep(host->base + DAVINCI_MMCDXR, p, (n & 3));
   240				p = p + (n & 3);
   241			}
   242		} else {
   243			for (i = 0; i < (n >> 2); i++) {
   244				*((u32 *)p) = readl(host->base + DAVINCI_MMCDRR);
   245				p  = p + 4;
   246			}
   247			if (n & 3) {
   248				ioread8_rep(host->base + DAVINCI_MMCDRR, p, (n & 3));
   249				p = p + (n & 3);
   250			}
   251		}
   252	
   253		sgm->consumed = n;
   254		host->bytes_left -= n;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
