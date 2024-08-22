Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135117ADE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315162; cv=none; b=aIQ2PNAKQUNYcZxyqw6WIMO9nqfd4gqGQYrFxUckhEQnrUUJKBFEK3+Xmv/X61/DAhpk0X8titVPnSlLzzJxzEqIUvuhppjn2l7l9M3H+aALDAWJQWwL3c8RHD/ao4P4LisHZFqV3nfDKeGs+juuz5q8XTgt7z1xZfMObvuJMeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315162; c=relaxed/simple;
	bh=g9B2buvld4AoZeGaHiGAdw5GDmLMh7aCEy2IT0s7JoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azD31oHJN4vEAMjgv39h/bseP5lsARDFVTf/7NGbH/VJnEw3G4K8S7Xvi4G6xyRYgbfWRJpAMix/NEUFO/SS+c6uwaICNqJRB01woebIvHfZBK2Z5b6Av9l3nd1u9voJhbnU7IUkyyDhb1QnpXAzM2EpLMXf88XFu//hzLoyZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVVc810l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVVc810l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724315161; x=1755851161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g9B2buvld4AoZeGaHiGAdw5GDmLMh7aCEy2IT0s7JoY=;
  b=SVVc810lUfGWgok3gZvP/1lNtmCIDfR2T7E/Hv66lJzbvEKbeY5nhF1z
   41oMij0LXkRK759DMWkuZGrepBUkp2Ke0fv91geWMs8MtxuVCr9QB6Zj9
   rR5mvLOKeXTzEN/gkhXN5baWnAI0BIZOTeH/WilK1AWOyHrYEEyKG7dhX
   tRmPbL6Pb0YQ1jVP7mLgWN6Rj8KXiHjkZ4Xr4dREL6MMzdAHH0Vb0ombX
   u/Lujj5vw2nn+4z5/LMm6zOw6p+fM/DXglFBIYY8KK46/6czlnEJJ+clS
   KG4Sfw0QWewKDHLvOWbDDEFHUjUr3liWifkIUhqMnObea2B7mW6YgO4o9
   Q==;
X-CSE-ConnectionGUID: u2pl9seLRCm9+M1LDIBJEQ==
X-CSE-MsgGUID: Yq+zTepHSw6ers5rcvXwHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13148892"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="13148892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:25:58 -0700
X-CSE-ConnectionGUID: kMDUw4fwQemTxbXfeolDUg==
X-CSE-MsgGUID: p9HjqjyjTXC4ymzDN3fNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66310541"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 01:25:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh38l-000CZk-1T;
	Thu, 22 Aug 2024 08:25:55 +0000
Date: Thu, 22 Aug 2024 16:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 20/20]
 drivers/mtd/nand/spi/core.c:422:32: warning: format '%x' expects argument of
 type 'unsigned int', but argument 4 has type 'ssize_t' {aka 'long int'}
Message-ID: <202408221647.lct7uM4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   a84bb95001ed7e4eaed415147f3ed18063df8ff7
commit: a84bb95001ed7e4eaed415147f3ed18063df8ff7 [20/20] HACK: additional debug info
config: x86_64-buildonly-randconfig-003-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221647.lct7uM4b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221647.lct7uM4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221647.lct7uM4b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/mtd/nand/spi/core.c:12:
   drivers/mtd/nand/spi/core.c: In function 'spinand_read_from_cache_op':
>> drivers/mtd/nand/spi/core.c:422:32: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'ssize_t' {aka 'long int'} [-Wformat=]
     422 |                         printk("while (read 0x%x bytes) column 0x%x [ret 0x%x]\n", nbytes, column, ret);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                  ~~~
         |                                                                                                    |
         |                                                                                                    ssize_t {aka long int}
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/mtd/nand/spi/core.c:422:25: note: in expansion of macro 'printk'
     422 |                         printk("while (read 0x%x bytes) column 0x%x [ret 0x%x]\n", nbytes, column, ret);
         |                         ^~~~~~
   drivers/mtd/nand/spi/core.c:422:77: note: format string is defined here
     422 |                         printk("while (read 0x%x bytes) column 0x%x [ret 0x%x]\n", nbytes, column, ret);
         |                                                                            ~^
         |                                                                             |
         |                                                                             unsigned int
         |                                                                            %lx
   drivers/mtd/nand/spi/core.c: In function 'spinand_mtd_continuous_page_read':
>> drivers/mtd/nand/spi/core.c:732:24: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     732 |                 printk("from: %llx, len 0x%x\n", from, ops->len);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~        ~~~~~~~~
         |                                                           |
         |                                                           size_t {aka long unsigned int}
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/mtd/nand/spi/core.c:732:17: note: in expansion of macro 'printk'
     732 |                 printk("from: %llx, len 0x%x\n", from, ops->len);
         |                 ^~~~~~
   drivers/mtd/nand/spi/core.c:732:44: note: format string is defined here
     732 |                 printk("from: %llx, len 0x%x\n", from, ops->len);
         |                                           ~^
         |                                            |
         |                                            unsigned int
         |                                           %lx


vim +422 drivers/mtd/nand/spi/core.c

   383	
   384	static int spinand_read_from_cache_op(struct spinand_device *spinand,
   385					      const struct nand_page_io_req *req)
   386	{
   387		struct nand_device *nand = spinand_to_nand(spinand);
   388		struct mtd_info *mtd = spinand_to_mtd(spinand);
   389		struct spi_mem_dirmap_desc *rdesc;
   390		unsigned int nbytes = 0;
   391		void *buf = NULL;
   392		u16 column = 0;
   393		ssize_t ret;
   394	
   395		if (req->datalen) {
   396			buf = spinand->databuf;
   397			if (!req->continuous)
   398				nbytes = nanddev_page_size(nand);
   399			else
   400				nbytes = round_up(req->dataoffs + req->datalen,
   401						  nanddev_page_size(nand));
   402			column = 0;
   403		}
   404	
   405		if (req->ooblen) {
   406			WARN_ON_ONCE(req->continuous);
   407			nbytes += nanddev_per_page_oobsize(nand);
   408			if (!buf) {
   409				buf = spinand->oobbuf;
   410				column = nanddev_page_size(nand);
   411			}
   412		}
   413	
   414		if (req->mode == MTD_OPS_RAW)
   415			rdesc = spinand->dirmaps[req->pos.plane].rdesc;
   416		else
   417			rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
   418	
   419		while (nbytes) {
   420			ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
   421			if (en_printk && req->continuous)
 > 422				printk("while (read 0x%x bytes) column 0x%x [ret 0x%x]\n", nbytes, column, ret);
   423			if (ret < 0)
   424				return ret;
   425	
   426			if (!ret || ret > nbytes)
   427				return -EIO;
   428	
   429			nbytes -= ret;
   430			column += ret;
   431			buf += ret;
   432	
   433			/*
   434			 * Dirmap accesses are allowed to toggle the CS.
   435			 * Toggling the CS during a continuous read is forbidden.
   436			 */
   437			if (nbytes && req->continuous)
   438				return -EIO;
   439		}
   440	
   441		if (req->datalen) {
   442			if (req->continuous && en_printk)
   443				printk("copy buf from offs 0x%x, 0x%x bytes\n", req->dataoffs, req->datalen);
   444			memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
   445			       req->datalen);
   446		}
   447	
   448		if (req->ooblen) {
   449			if (req->mode == MTD_OPS_AUTO_OOB)
   450				mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
   451							    spinand->oobbuf,
   452							    req->ooboffs,
   453							    req->ooblen);
   454			else
   455				memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
   456				       req->ooblen);
   457		}
   458	
   459		return 0;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
