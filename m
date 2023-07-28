Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67745107AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690536272; x=1722072272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7FM3pbBZiFwqz1C2GVZ90TOxTcFq6n5gA++6Z6VbHk=;
  b=C9wVlJzS/49tSenhSNKgAQ97y8zh7yJb/rDGYbulf3LdFcSnp0W6t64K
   gbovCWJ1yf4jKGb6iICM70ltKEpAARL170P4hOIrkmidls/l0LNlTBIW5
   zUnxvNFfmc9z5xxdd+MMSNgr6iLT1PlS8vwFRO9II4nf/wzmWCpHZAi6n
   Q1t46ZNLtUavzqro1rYxs0ebtQcCFUg3Jdc5o8wDXtRX2iszVmIFxC7pk
   r3q/XYFCALBhq3hhMNIm9y3bnad9FRijzwr0ao3TIvrFKn6/C+w7vKBUJ
   sZVhkm+HK2KdYxve+eUK3JljuMeAO9JEBKjdZsLIAbPPnaUbR5r23fp1x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348152400"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="348152400"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 02:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792867061"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="792867061"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 02:24:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPJgz-00034B-0I;
	Fri, 28 Jul 2023 09:23:39 +0000
Date: Fri, 28 Jul 2023 17:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Girish Mahadevan <girishm@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Dilip Kota <dkota@codeaurora.org>,
	Alok Chauhan <alokc@codeaurora.org>,
	Douglas Anderson <dianders@chromium.org>,
	Ryan Case <ryandcase@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 376/6555]
 drivers/spi/spi-geni-qcom.c:373:9: sparse: sparse: cast removes address
 space '<asn:2>' of expression
Message-ID: <202307281739.C1ioI8IL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 29b66344a0e6d794f57e1424cd7072b45286ed02 [376/6555] FROMLIST: spi: spi-geni-qcom: Add SPI driver support for GENI based QUP
config: m68k-randconfig-r092-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281739.C1ioI8IL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281739.C1ioI8IL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281739.C1ioI8IL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-geni-qcom.c:373:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:160:20: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:174:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:186:24: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:187:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:188:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:220:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:221:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:222:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:223:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:224:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:225:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:226:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:291:22: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:318:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:319:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:342:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:346:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:349:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:359:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:442:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:455:26: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:494:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:520:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c:534:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/spi/spi-geni-qcom.c: note: in included file (through arch/m68k/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:306:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:306:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:306:9: sparse:     expected unsigned int volatile
   include/asm-generic/io.h:306:9: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:306:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:306:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:306:9: sparse:     expected unsigned int volatile
   include/asm-generic/io.h:306:9: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:274:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:274:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:306:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:306:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:306:9: sparse:     expected unsigned int volatile
   include/asm-generic/io.h:306:9: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:306:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:306:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:306:9: sparse:     expected unsigned int volatile
   include/asm-generic/io.h:306:9: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:306:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   include/asm-generic/io.h:306:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:306:9: sparse:     expected unsigned int volatile
   include/asm-generic/io.h:306:9: sparse:     got restricted __le32 [usertype]

vim +373 drivers/spi/spi-geni-qcom.c

   361	
   362	static void handle_fifo_timeout(struct spi_master *spi,
   363					struct spi_message *msg)
   364	{
   365		struct spi_geni_master *mas = spi_master_get_devdata(spi);
   366		unsigned long time_left, flags;
   367		struct geni_se *se = &mas->se;
   368	
   369		spin_lock_irqsave(&mas->lock, flags);
   370		reinit_completion(&mas->xfer_done);
   371		mas->cur_mcmd = CMD_CANCEL;
   372		geni_se_cancel_m_cmd(se);
 > 373		writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
   374		spin_unlock_irqrestore(&mas->lock, flags);
   375		time_left = wait_for_completion_timeout(&mas->xfer_done, HZ);
   376		if (time_left)
   377			return;
   378	
   379		spin_lock_irqsave(&mas->lock, flags);
   380		reinit_completion(&mas->xfer_done);
   381		geni_se_abort_m_cmd(se);
   382		spin_unlock_irqrestore(&mas->lock, flags);
   383		time_left = wait_for_completion_timeout(&mas->xfer_done, HZ);
   384		if (!time_left)
   385			dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
