Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D800BA21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771704429; cv=none; b=C/sl/xde+tjytzvDPv+hjEn5X3w7jdTrBW5E6VNtilGBX/vGxUoVUTaXOWAypDBnu8ZU64P+5sYqlzZ0qAxaO85KIPodK26uXbvD6pY3OSgqxnWou46msf9xSJm7UteSjp4IVwbQZo7SljCmQ6Gsx1QBx6fT8LaTvibmnEfQAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771704429; c=relaxed/simple;
	bh=+QQsqSJx0+ZpFSLLwPkrnUaJ+QZasFfzuP+24I0zGY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo5c5bAREfjg6CPTCos7vi2e4MT0zk4NjX/Su/I3jP26XzS9Wbg/PE0JTOzaJ+0e/YoQvpG6H54zpOXoRi6UT2VJpNUz1Kp2pxHUkXg/voNg3dk5drO+C/sBGzQjHJ06Ya/PjCtwgSL3i8Ac20D5mzx8Wj6/OkfVLJAFA2DJKKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp9rRYOf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp9rRYOf"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-503347dea84so32563341cf.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771704426; x=1772309226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ie30Qfev+sRyKQqoyrxQeAzD17ENRiuG5jOorvnh4M=;
        b=bp9rRYOfvgcxdallaeDOq2DHJvAAyhq3AhDl4b7rZEAdPcSkeyr23LXXDAt8XxxkwF
         0HaucGNYKR+KtqRt4Ga9tiZhVOIqvjrz9YMF0L0kD7ayFNgIs3n7nwMiYtgVcBahUTSX
         e4tmVahWVA4s6oFRaDP+X8YQJaL3XH1E1fD99ApkZ8M+Yi+ZT9wpBuM8VOH856xXXgj1
         mzNb3VUDp8oPgnYBQgw5t1VdZhxkU5395NySjamRcSMNDsNc652C6R73XjQRx/brEQBX
         ZJ6sQ3ixx8C7m1zTVXmtNcqy4ew/auV2GtLKTTfmYZH5DNiAEJmkGFNI+1m9CdCC/1s4
         ADJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771704426; x=1772309226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ie30Qfev+sRyKQqoyrxQeAzD17ENRiuG5jOorvnh4M=;
        b=c6PpDtaxLNc57uMcVg4DJ8b/cYIy7aRxMUrEY8QZEatV8VlzuTOwMzS90p0Dy9ylmV
         FgknbWjZo61o+D92JHBl5cYMfu/Y6yF0Yjui9UHx4uhyug9Y5BzdDLiAIQxva9qz8Da2
         lsmqw5Ii/I+jqs32u4VjjR4OR4F0236KjFtOtwikRMDJVaG3GLKC5gnRVvTl9AatH6qI
         lq/A4u6Sjb+SymyMek9O4EOOYny6g0wd9lyRGCscsvjz8VXV4VXxoJXgRlQbw2YAFXwC
         rWVV9fStqQ25gPbc7PZWgKy2Rtx4S2sDV3iewdKGPcK2lzkGJPLo/Xx3wj96Q33DgSmH
         7qeA==
X-Forwarded-Encrypted: i=1; AJvYcCW8RARV4ms1jfmeleh7aOhtwmW+rfxMdgmCN3/K+BbhNRt4hN9M8g632Xv5ec02y+Y/pq51P+XxsdiffGyp@lists.linux.dev
X-Gm-Message-State: AOJu0YyLbpLQiYGuhVNWwRLBlzU9ZnndnjR0P6lrdzg1mgocEn5Kt1aR
	7wD1hk0ga3sTjJxe/xlT/WpXdPiFzvGqEBTYnA9siKaCjIpVRazMdGsW
X-Gm-Gg: AZuq6aJWaGKEPlQVc0MnBXqauDILVmyuOwqs0E+k5euxEk0aCWzg+jd5rhwH/+zy8jp
	TnFasYvIl0oAU5WVvHBwCgTNsUvBULizZz4cwAYY5v1xgjH4lhyexsNAc5ucXfnX1myNb5MU1bT
	+O/sWBbm30LvRqzzPlaDLIFYHHiZDZzh1d7Fcmm+1s1mT+V7YCYIO5YgYVSftQCpzMa7hLTsRYT
	4SGBeAbmqhpC5MDagNEEpYQUN0EJdYbwmS1noVxtJqKUGVIp3lIeiqYwIslm5eonBEcutmahpTd
	9Rjg88sHUzVYixwDWOxtDakP+Psy8o13Ooa5aoNEe2LenJFfhenbb7PdVl0MSovVa+aJ6LUXhBq
	KT59Chc3n6uZWinIFtEBcBiC6kT69gKHBPiCkSMqmAc5sW5ZS6IXFybfT4xOK/yUr8moWX2LJ46
	B8KQPzhecwkpLwO2OfXwH9NG66zg==
X-Received: by 2002:ac8:5794:0:b0:501:502b:8c6b with SMTP id d75a77b69052e-5070bba48b8mr58118421cf.9.1771704426505;
        Sat, 21 Feb 2026 12:07:06 -0800 (PST)
Received: from errol.ini.cmu.edu ([72.95.245.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691243sm23869776d6.3.2026.02.21.12.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 12:07:06 -0800 (PST)
Date: Sat, 21 Feb 2026 15:07:04 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [litex-hub:litex-rebase 14/15]
 drivers/clk/clk-litex.c:1579:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before return around line
 1592. (fwd)
Message-ID: <aZoQaL5CWYxgUITm@errol.ini.cmu.edu>
References: <ffa6cd9e-db1a-2e7d-a02b-3e7417789cf0@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffa6cd9e-db1a-2e7d-a02b-3e7417789cf0@inria.fr>
X-Clacks-Overhead: GNU Terry Pratchett

Hi Julia,

Thanks for the heads-up! I've lined up a fix in the out-of-tree
litex-rebase branch; this will eventually be subsumed (squashed)
into the original patch introducing the driver being fixed.

Many thanks,
--Gabriel

On Sat, Feb 07, 2026 at 08:40:15AM -0500, Julia Lawall wrote:
> 
> 
> ---------- Forwarded message ----------
> Date: Sat, 07 Feb 2026 17:49:54 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:1579:1-23:
>     WARNING: Function "for_each_child_of_node" should have of_node_put() before
>     return around line 1592.
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
> CC: Gabriel Somlo <gsomlo@gmail.com>
> CC: Mateusz Holenko <mholenko@antmicro.com>
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   09ab312cebb66737cf7dc5c3c448b282dc937e16
> commit: 6767f577aa05c563cba3399f2383b60f59a67806 [14/15] LiteX: driver for MMCM
> :::::: branch date: 10 hours ago
> :::::: commit date: 10 hours ago
> config: alpha-randconfig-r053-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071733.Nf6w84P8-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 11.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202602071733.Nf6w84P8-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1592.
>    drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1611.
>    drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1621.
>    drivers/clk/clk-litex.c:1579:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1627.
> 
> vim +/for_each_child_of_node +1579 drivers/clk/clk-litex.c
> 
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1564
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1565  static int litex_clk_init_clkouts(struct device *dev,
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1566  				  struct device_node *node,
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1567  				  struct litex_clk_device *l_dev)
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1568  {
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1569  	struct device_node *child_node;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1570  	struct clk_hw *hw;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1571  	struct clk_duty duty;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1572  	u32 dt_lock_timeout, dt_drdy_timeout;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1573  	int i = 0, ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1574
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1575  	ret = litex_clk_get_timeouts(node, &dt_lock_timeout, &dt_drdy_timeout);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1576  	if (ret != 0)
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1577  		return ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1578
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22 @1579  	for_each_child_of_node(node, child_node) {
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1580  		struct litex_clk_clkout *clkout;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1581  		struct clk_init_data clkout_init;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1582
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1583  		clkout = &l_dev->clkouts[i];
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1584  		clkout->is_clkout = true;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1585
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1586  		clkout->lock_timeout = dt_lock_timeout;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1587  		clkout->drdy_timeout = dt_drdy_timeout;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1588  		clkout->sys_clk_freq = l_dev->sys_clk_freq;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1589
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1590  		ret = litex_clk_read_clkout_dts(child_node, clkout);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1591  		if (ret != 0)
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22 @1592  			return ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1593
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1594  		clkout_init.name = child_node->name;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1595  		clkout_init.ops = &litex_clk_ops;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1596  		clkout_init.num_parents = 0;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1597  		clkout_init.flags = CLK_SET_RATE_UNGATE | CLK_GET_RATE_NOCACHE;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1598  		clkout->clk_hw.init = &clkout_init;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1599  		clkout->base = l_dev->base;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1600
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1601  		duty.num = clkout->default_duty_num;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1602  		duty.den = clkout->default_duty_den;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1603
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1604  		/* set global divider and multiplier once */
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1605  		if (i == 0) {
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1606  			hw = &l_dev->clkouts[i].clk_hw;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1607  			litex_clk_enable(hw);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1608  			ret = litex_clk_set_dm(hw);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1609  			litex_clk_disable(hw);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1610  			if (ret != 0)
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1611  				return ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1612  		}
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1613
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1614  		ret = litex_clk_set_def_clkout(&clkout->clk_hw,
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1615  						clkout->default_freq,
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1616  						clkout->default_phase, &duty);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1617  		ret = devm_clk_hw_register(dev, &clkout->clk_hw);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1618  		if (ret != 0) {
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1619  			pr_err("devm_clk_hw_register failure, %s ret: %d\n",
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1620  						child_node->name, ret);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1621  			return ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1622  		}
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1623
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1624  		ret = of_clk_add_hw_provider(child_node, of_clk_hw_simple_get,
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1625  							     &clkout->clk_hw);
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1626  		if (ret != 0)
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1627  			return ret;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1628  		i++;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1629  	}
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1630  	return 0;
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1631  }
> 6767f577aa05c5 Pawel Czarnecki 2020-12-22  1632
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
