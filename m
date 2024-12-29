Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F66259499
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431796; cv=none; b=JIt6/9GmOMrAlZ7ohjtGuXOOU4IxJ+5rXu813FJNpEY2OwimwNNSO0JlN9uOZHOaUlPpBwfgF2tOphNOpQbNZCiZGUr3Vxm/HmocGkLv1wj8JeQBG8ouZl78HVb3NwHKjzylMSqlgSrPpdBdhxdkAehsX76/0OjBHuI8Z0n00Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431796; c=relaxed/simple;
	bh=uvMknTaMtGewq1bOON+5pmUqzAP3Zq0kV/Q62qcQP9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SG9d+om8t+uiTRdauegL6FJ3JRH5UMN3KMGnfz9B2/zY97QYP+Wd3PDAW5VYf1mUTN16x/nnXXHublxPe2nBgK2b7aVAfT27ZaudHdfmWYIBjtbYDwgh/LsS2OF+r1NmkJGuk8JyUkZq2zuzTuxkV9GRSxJFTtZDU5bn6+9OIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUoXb3qs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUoXb3qs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735431794; x=1766967794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvMknTaMtGewq1bOON+5pmUqzAP3Zq0kV/Q62qcQP9o=;
  b=HUoXb3qsNSczsUV5DR+wCBYq6x6Mrb1MERdp44M2EEJGMrCZbQKRbjX9
   BfCyjWVjtVu0+vWMe9gT5j7PawzlWD6Q3xo+xmUxIm2njP5OEaYDTEVuP
   dsJhTB4Kmp9C8xVlGXDaKLudQLMbpOj5dU5IpJcBsGfLwyguLIPvDfT9q
   K+gnYSxtRwcaau/AYzS/byqqqpWl4DfK2JTrkC7ZU7lZDjp2Nbd3k57jW
   jOdTjZJdhf0P4eZcCyqmDjP1XgrTKjpBh/Vo8g8Ef4pvMBRGfcPdZ+HPy
   i6MPJH5tSaaKrUWcg4p6qgAAp0djLnSSjjzqKU4JAUAfj0zAn9w1l4ZkI
   w==;
X-CSE-ConnectionGUID: GstQh2HzRfqxIGgx3LCAQQ==
X-CSE-MsgGUID: 5b4a/t+3RFG/dZ+/YJ9k6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23366729"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="23366729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 16:23:12 -0800
X-CSE-ConnectionGUID: gnYuIkhPQi6iqZ/uP0ndTg==
X-CSE-MsgGUID: iXpw31/OR5uH2Hv0pEQ2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100294836"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Dec 2024 16:23:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRh5I-0004Om-1n;
	Sun, 29 Dec 2024 00:23:08 +0000
Date: Sun, 29 Dec 2024 08:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: drivers/tty/serial/samsung_tty.c:1391:48: warning: '%d' directive
 writing between 1 and 3 bytes into a region of size 2
Message-ID: <202412290849.Jr98Z8HI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 6e1e48b6ef2613ff4c28a34f7a57c29a4367ad87 tty: serial: samsung: shrink the clock selection to 8 clocks
date:   11 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241229/202412290849.Jr98Z8HI-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290849.Jr98Z8HI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290849.Jr98Z8HI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_set_termios':
>> drivers/tty/serial/samsung_tty.c:1391:48: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                                                ^~
   In function 's3c24xx_serial_getclk',
       inlined from 's3c24xx_serial_set_termios' at drivers/tty/serial/samsung_tty.c:1492:9:
   drivers/tty/serial/samsung_tty.c:1391:34: note: directive argument in the range [0, 254]
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                                  ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1391:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    1391 |                 sprintf(clkname, "clk_uart_baud%d", cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_init_port':
   drivers/tty/serial/samsung_tty.c:1789:49: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                                 ^~
   In function 's3c24xx_serial_enable_baudclk',
       inlined from 's3c24xx_serial_init_port' at drivers/tty/serial/samsung_tty.c:1895:8:
   drivers/tty/serial/samsung_tty.c:1789:35: note: directive argument in the range [0, 254]
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1789:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    1789 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1391 drivers/tty/serial/samsung_tty.c

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1372  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1373  static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1374  			unsigned int req_baud, struct clk **best_clk,
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1375  			u8 *clk_num)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1376  {
97a6cfe8115b04 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  1377  	const struct s3c24xx_uart_info *info = ourport->info;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1378  	struct clk *clk;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1379  	unsigned long rate;
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1380  	unsigned int baud, quot, best_quot = 0;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1381  	char clkname[MAX_CLK_NAME_LENGTH];
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1382  	int calc_deviation, deviation = (1 << 30) - 1;
6e1e48b6ef2613 drivers/tty/serial/samsung_tty.c Tudor Ambarus       2024-01-19  1383  	u8 cnt;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1384  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1385  	for (cnt = 0; cnt < info->num_clks; cnt++) {
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1386  		/* Keep selected clock if provided */
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1387  		if (ourport->cfg->clk_sel &&
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker     2020-05-08  1388  			!(ourport->cfg->clk_sel & (1 << cnt)))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1389  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1390  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24 @1391  		sprintf(clkname, "clk_uart_baud%d", cnt);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1392  		clk = clk_get(ourport->port.dev, clkname);
7cd88831feb03c drivers/tty/serial/samsung.c     Kyoungil Kim        2012-05-20  1393  		if (IS_ERR(clk))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1394  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1395  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1396  		rate = clk_get_rate(clk);
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1397  		if (!rate) {
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1398  			dev_err(ourport->port.dev,
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1399  				"Failed to get clock rate for %s.\n", clkname);
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1400  			clk_put(clk);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1401  			continue;
a9c09546e903f1 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1402  		}
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1403  
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1404  		if (ourport->info->has_divslot) {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1405  			unsigned long div = rate / req_baud;
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1406  
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1407  			/* The UDIVSLOT register on the newer UARTs allows us to
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1408  			 * get a divisor adjustment of 1/16th on the baud clock.
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1409  			 *
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1410  			 * We don't keep the UDIVSLOT value (the 16ths we
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1411  			 * calculated by not multiplying the baud by 16) as it
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1412  			 * is easy enough to recalculate.
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1413  			 */
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1414  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1415  			quot = div / 16;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1416  			baud = rate / div;
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1417  		} else {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1418  			quot = (rate + (8 * req_baud)) / (16 * req_baud);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1419  			baud = rate / (quot * 16);
090f848da00008 drivers/serial/samsung.c         Ben Dooks           2008-12-12  1420  		}
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1421  		quot--;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1422  
f3710f5e9e1a68 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1423  		calc_deviation = abs(req_baud - baud);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1424  
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1425  		if (calc_deviation < deviation) {
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1426  			/*
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1427  			 * If we find a better clk, release the previous one, if
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1428  			 * any.
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1429  			 */
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1430  			if (!IS_ERR(*best_clk))
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1431  				clk_put(*best_clk);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1432  			*best_clk = clk;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1433  			best_quot = quot;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1434  			*clk_num = cnt;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1435  			deviation = calc_deviation;
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1436  		} else {
832e231cff4761 drivers/tty/serial/samsung_tty.c Christophe JAILLET  2023-06-10  1437  			clk_put(clk);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1438  		}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1439  	}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1440  
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham      2011-10-24  1441  	return best_quot;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1442  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  1443  

:::::: The code at line 1391 was first introduced by commit
:::::: 5f5a7a5578c5885201cf9c85856f023fe8b81765 serial: samsung: switch to clkdev based clock lookup

:::::: TO: Thomas Abraham <thomas.abraham@linaro.org>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
