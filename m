Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF993145A03
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731191807; cv=none; b=kcvUvYkhrO0TEaka++W//uRTXLge87Ysq5TzhpZWP+OiJyZMesEjAXTfUMD+v+/5QM+uzf7VUgEXu29WBAPO7tW2UCdwPWpuAs2SR2I1+2Onqaj/DTYU9SWw9NWOiP1CMoEKeOQ+n9t4lyx0sG1/2UfU0agr8lEzG1Zj2r7JRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731191807; c=relaxed/simple;
	bh=eC0FLbe0qNbwANw7fYphdjAUMux1sNKUx7mA9iyztrs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=rAfSMvNBKBbnxkEgi/jkVowrbNnS97slCsTTXCjDvezk6xvcPRnMWvb4BrRZviGNTFNXZDaAsBaF1f4T+Ss+iyVIZpCWzuHUbqImgge1HtR/hmPybijqhcL21X3KWa4SMPh70OzxM0pYM6YNUN2dftDbec+/hVIlavmZY6AAIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=pkxu/I3G; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="pkxu/I3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/btgNFizxV2bHkbEACIZFP8EeNhVLEaFeXf0Qeo4gM=;
  b=pkxu/I3GDCI0da4hkHXOhJiz3GE27BFrrm2BkB3TZF+bLNxHdBpKnS4P
   sabu0ShNcfreVVUu8eDmRZ2KmmPq94KKFv6XLcSUMFwdXC8AW+Z1WIUhf
   PgXU1fT8PjmH1e0v6Lyx/LqxtfXcpriYokLFmXmEGfZ0kiMEMlPwAOOU4
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,142,1728943200"; 
   d="scan'208";a="193071758"
Received: from unknown (HELO hadrien) ([50.226.245.43])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 23:36:40 +0100
Date: Sat, 9 Nov 2024 17:36:38 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2303/10559] drivers/gpio/gpio-mvebu.c:910:7-16:
 opportunity for str_hi_lo(out & msk) (fwd)
Message-ID: <b984e927-16b5-5a8c-a0d4-97a4ae49885a@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 10 Nov 2024 03:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2303/10559] drivers/gpio/gpio-mvebu.c:910:7-16:
    opportunity for str_hi_lo(out & msk)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 956ee0c5c969c9caf6744e166f5a80526be10c5b [2303/10559] gpio: mvebu: allow building the module with COMPILE_TEST=y
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r064-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100336.QRGrlbYy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411100336.QRGrlbYy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-mvebu.c:910:7-16: opportunity for str_hi_lo(out & msk)
>> drivers/gpio/gpio-mvebu.c:916:6-30: opportunity for str_hi_lo(( data_in ^ in_pol ) & msk)
>> drivers/gpio/gpio-mvebu.c:917:6-18: opportunity for str_lo_hi(in_pol & msk)

vim +910 drivers/gpio/gpio-mvebu.c

a4ba5e1b92b69b Simon Guinot     2013-03-24  882
a4ba5e1b92b69b Simon Guinot     2013-03-24  883  static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
a4ba5e1b92b69b Simon Guinot     2013-03-24  884  {
bbe760041a05d5 Linus Walleij    2015-12-07  885  	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
a4ba5e1b92b69b Simon Guinot     2013-03-24  886  	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
86661fd7faacbb Andy Shevchenko  2020-06-15  887  	const char *label;
a4ba5e1b92b69b Simon Guinot     2013-03-24  888  	int i;
a4ba5e1b92b69b Simon Guinot     2013-03-24  889
b6730b20837e74 Gregory CLEMENT  2017-06-12  890  	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset, &out);
b6730b20837e74 Gregory CLEMENT  2017-06-12  891  	regmap_read(mvchip->regs, GPIO_IO_CONF_OFF + mvchip->offset, &io_conf);
b6730b20837e74 Gregory CLEMENT  2017-06-12  892  	regmap_read(mvchip->regs, GPIO_BLINK_EN_OFF + mvchip->offset, &blink);
b6730b20837e74 Gregory CLEMENT  2017-06-12  893  	regmap_read(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset, &in_pol);
b6730b20837e74 Gregory CLEMENT  2017-06-12  894  	regmap_read(mvchip->regs, GPIO_DATA_IN_OFF + mvchip->offset, &data_in);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  895  	cause	= mvebu_gpio_read_edge_cause(mvchip);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  896  	edg_msk	= mvebu_gpio_read_edge_mask(mvchip);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  897  	lvl_msk	= mvebu_gpio_read_level_mask(mvchip);
a4ba5e1b92b69b Simon Guinot     2013-03-24  898
86661fd7faacbb Andy Shevchenko  2020-06-15  899  	for_each_requested_gpio(chip, i, label) {
a4ba5e1b92b69b Simon Guinot     2013-03-24  900  		u32 msk;
a4ba5e1b92b69b Simon Guinot     2013-03-24  901  		bool is_out;
a4ba5e1b92b69b Simon Guinot     2013-03-24  902
d2cabc4a23f8de Ralph Sennhauser 2017-03-17  903  		msk = BIT(i);
a4ba5e1b92b69b Simon Guinot     2013-03-24  904  		is_out = !(io_conf & msk);
a4ba5e1b92b69b Simon Guinot     2013-03-24  905
a4ba5e1b92b69b Simon Guinot     2013-03-24  906  		seq_printf(s, " gpio-%-3d (%-20.20s)", chip->base + i, label);
a4ba5e1b92b69b Simon Guinot     2013-03-24  907
a4ba5e1b92b69b Simon Guinot     2013-03-24  908  		if (is_out) {
a4ba5e1b92b69b Simon Guinot     2013-03-24  909  			seq_printf(s, " out %s %s\n",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @910  				   out & msk ? "hi" : "lo",
a4ba5e1b92b69b Simon Guinot     2013-03-24  911  				   blink & msk ? "(blink )" : "");
a4ba5e1b92b69b Simon Guinot     2013-03-24  912  			continue;
a4ba5e1b92b69b Simon Guinot     2013-03-24  913  		}
a4ba5e1b92b69b Simon Guinot     2013-03-24  914
a4ba5e1b92b69b Simon Guinot     2013-03-24  915  		seq_printf(s, " in  %s (act %s) - IRQ",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @916  			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @917  			   in_pol & msk ? "lo" : "hi");
a4ba5e1b92b69b Simon Guinot     2013-03-24  918  		if (!((edg_msk | lvl_msk) & msk)) {
a4319a611bcdc3 Andrew Lunn      2015-01-10  919  			seq_puts(s, " disabled\n");
a4ba5e1b92b69b Simon Guinot     2013-03-24  920  			continue;
a4ba5e1b92b69b Simon Guinot     2013-03-24  921  		}
a4ba5e1b92b69b Simon Guinot     2013-03-24  922  		if (edg_msk & msk)
a4319a611bcdc3 Andrew Lunn      2015-01-10  923  			seq_puts(s, " edge ");
a4ba5e1b92b69b Simon Guinot     2013-03-24  924  		if (lvl_msk & msk)
a4319a611bcdc3 Andrew Lunn      2015-01-10  925  			seq_puts(s, " level");
a4ba5e1b92b69b Simon Guinot     2013-03-24  926  		seq_printf(s, " (%s)\n", cause & msk ? "pending" : "clear  ");
a4ba5e1b92b69b Simon Guinot     2013-03-24  927  	}
a4ba5e1b92b69b Simon Guinot     2013-03-24  928  }
a4ba5e1b92b69b Simon Guinot     2013-03-24  929  #else
a4ba5e1b92b69b Simon Guinot     2013-03-24  930  #define mvebu_gpio_dbg_show NULL
a4ba5e1b92b69b Simon Guinot     2013-03-24  931  #endif
a4ba5e1b92b69b Simon Guinot     2013-03-24  932

:::::: The code at line 910 was first introduced by commit
:::::: a4ba5e1b92b69b9c7a15529657bb1cebed4539f3 gpio: mvebu: add dbg_show function

:::::: TO: Simon Guinot <simon.guinot@sequanux.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
