Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F60254841
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471619; cv=none; b=eS4xaphqixXRNf3ref+6R1f4fXAwIK3alZ5uAf9oVHb/nUW6OBzMLeX1vYQXHkkWXgYY6F4tunAieyEYs4mH0pjX+CZlez74J7AbN+qmNt99wt1YJJKRzYG4Cch/PuaFCVKr65AJ65Cc3XOnMk5mFKcr9zDMPEqZJwldZw03QIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471619; c=relaxed/simple;
	bh=t+P2p5AZ3zokf9Tb/JhbATjX3cwpg0al8e35UWr22wg=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lvzwtl34ituDdbet+Wog/h0JosHftFL0urfjEAq+qdtQMn8Q5v5oAKp3VgWqoIBA3fNKhlx2NeiiitnUmXHixZ7cPNnhQzxNrIXjqtd0X3nH/QGNHczcgEJHWgzN87zRpkZhp6+X7A4SagKKRF9sLXjHocoyVLWAotz5upmkTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=pRNYiroG; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="pRNYiroG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uELjYpu6nRS7xMx+Us7D0TLtb9ceba2XSz09ZJ52uJ0=;
  b=pRNYiroGQsdFyqW6XF/3+N0FPJRNFgf8jCqbvqm+oOhGjkLpe/bRZKkg
   34iQyaC6YvigOMv/WjcAMVYMbRRWhSeTvc/SvXcVSVGVgKLPOxyVFxxGM
   AMVmsXJHweIeBhL3nkjGHpM3WX1Lmly+WE+cmcFa5PpIbRGM719qK7F1N
   c=;
X-CSE-ConnectionGUID: DfCv1uhPT2KsjRX15yPdng==
X-CSE-MsgGUID: gdFgYHFFTBy6n0hAKbRstQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,278,1763420400"; 
   d="scan'208";a="262387685"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 14:40:16 +0100
Date: Sat, 7 Feb 2026 08:40:15 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Pawel Czarnecki <pczarnecki@internships.antmicro.com>, 
    Gabriel Somlo <gsomlo@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:1579:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 return around line 1592. (fwd)
Message-ID: <ffa6cd9e-db1a-2e7d-a02b-3e7417789cf0@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sat, 07 Feb 2026 17:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:1579:1-23:
    WARNING: Function "for_each_child_of_node" should have of_node_put() before
    return around line 1592.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Mateusz Holenko <mholenko@antmicro.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   09ab312cebb66737cf7dc5c3c448b282dc937e16
commit: 6767f577aa05c563cba3399f2383b60f59a67806 [14/15] LiteX: driver for MMCM
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: alpha-randconfig-r053-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071733.Nf6w84P8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602071733.Nf6w84P8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1592.
   drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1611.
   drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1621.
   drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1627.

vim +/for_each_child_of_node +1579 drivers/clk/clk-litex.c

6767f577aa05c5 Pawel Czarnecki 2020-12-22  1564
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1565  static int litex_clk_init_clkouts(struct device *dev,
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1566  				  struct device_node *node,
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1567  				  struct litex_clk_device *l_dev)
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1568  {
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1569  	struct device_node *child_node;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1570  	struct clk_hw *hw;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1571  	struct clk_duty duty;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1572  	u32 dt_lock_timeout, dt_drdy_timeout;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1573  	int i = 0, ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1574
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1575  	ret = litex_clk_get_timeouts(node, &dt_lock_timeout, &dt_drdy_timeout);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1576  	if (ret != 0)
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1577  		return ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1578
6767f577aa05c5 Pawel Czarnecki 2020-12-22 @1579  	for_each_child_of_node(node, child_node) {
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1580  		struct litex_clk_clkout *clkout;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1581  		struct clk_init_data clkout_init;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1582
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1583  		clkout = &l_dev->clkouts[i];
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1584  		clkout->is_clkout = true;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1585
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1586  		clkout->lock_timeout = dt_lock_timeout;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1587  		clkout->drdy_timeout = dt_drdy_timeout;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1588  		clkout->sys_clk_freq = l_dev->sys_clk_freq;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1589
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1590  		ret = litex_clk_read_clkout_dts(child_node, clkout);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1591  		if (ret != 0)
6767f577aa05c5 Pawel Czarnecki 2020-12-22 @1592  			return ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1593
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1594  		clkout_init.name = child_node->name;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1595  		clkout_init.ops = &litex_clk_ops;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1596  		clkout_init.num_parents = 0;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1597  		clkout_init.flags = CLK_SET_RATE_UNGATE | CLK_GET_RATE_NOCACHE;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1598  		clkout->clk_hw.init = &clkout_init;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1599  		clkout->base = l_dev->base;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1600
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1601  		duty.num = clkout->default_duty_num;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1602  		duty.den = clkout->default_duty_den;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1603
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1604  		/* set global divider and multiplier once */
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1605  		if (i == 0) {
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1606  			hw = &l_dev->clkouts[i].clk_hw;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1607  			litex_clk_enable(hw);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1608  			ret = litex_clk_set_dm(hw);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1609  			litex_clk_disable(hw);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1610  			if (ret != 0)
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1611  				return ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1612  		}
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1613
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1614  		ret = litex_clk_set_def_clkout(&clkout->clk_hw,
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1615  						clkout->default_freq,
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1616  						clkout->default_phase, &duty);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1617  		ret = devm_clk_hw_register(dev, &clkout->clk_hw);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1618  		if (ret != 0) {
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1619  			pr_err("devm_clk_hw_register failure, %s ret: %d\n",
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1620  						child_node->name, ret);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1621  			return ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1622  		}
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1623
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1624  		ret = of_clk_add_hw_provider(child_node, of_clk_hw_simple_get,
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1625  							     &clkout->clk_hw);
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1626  		if (ret != 0)
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1627  			return ret;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1628  		i++;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1629  	}
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1630  	return 0;
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1631  }
6767f577aa05c5 Pawel Czarnecki 2020-12-22  1632

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
