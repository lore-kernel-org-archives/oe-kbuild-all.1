Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405922F21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674062591; x=1705598591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nRGjbbyv2HXHlRyPNMqVNagdLEu6+mvT8YFbc1ZLIVA=;
  b=JIATK/8Mh+WPobDFwpSep2egKYxRVKzW8eVxPHsIMWM8QPhBIWpgNJ7g
   x5d6Osj0NuRvrA/KuaHUn8qZDj+bS4Me6RebmW8APji1OZgFPodRo7JII
   8/J/RSFl4SJn6KYS0XbZfTtAn7tiYeEXL9UxugSnqv8Ipnjc34jswzaPf
   iektbrw5hNPmfEF3bdFS53llb7J1zfYBwl5lWf9ioYlxwXxPyH72mWCV3
   SqeIZdt9ElvX85SX36eskXF4hi1xeJeNSP3P3nO3Y6Xhv8uhnXjnlahpc
   XfshgEzN+mIp4FQwJMryKWTOgdpWwY957V5CWTQVezmsgw19TWyA4RwiO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389538374"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="389538374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 09:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609732977"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609732977"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 09:23:09 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIC9K-0000ZQ-2I;
	Wed, 18 Jan 2023 17:22:58 +0000
Date: Thu, 19 Jan 2023 01:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 12/37] drivers/clk/clk-apple-nco.c:306:
 undefined reference to `devm_clk_hw_register'
Message-ID: <202301190120.Rx1W5lhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   3dfab1933a51b42de8c58ab36a3b2552cb7baad8
commit: 5d6c14c8b47d94d358a3ec606ae5096758392ccd [12/37] ASoC: apple: Add macaudio machine driver
config: ia64-randconfig-c041-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190120.Rx1W5lhQ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5d6c14c8b47d94d358a3ec606ae5096758392ccd
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout 5d6c14c8b47d94d358a3ec606ae5096758392ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/clk/clk-apple-nco.o: in function `applnco_probe':
>> drivers/clk/clk-apple-nco.c:306: undefined reference to `devm_clk_hw_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
   Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +306 drivers/clk/clk-apple-nco.c

6641057d5dba87 Martin Povišer 2022-02-08  254  
6641057d5dba87 Martin Povišer 2022-02-08  255  static int applnco_probe(struct platform_device *pdev)
6641057d5dba87 Martin Povišer 2022-02-08  256  {
6641057d5dba87 Martin Povišer 2022-02-08  257  	struct device_node *np = pdev->dev.of_node;
6641057d5dba87 Martin Povišer 2022-02-08  258  	struct clk_parent_data pdata = { .index = 0 };
6641057d5dba87 Martin Povišer 2022-02-08  259  	struct clk_init_data init;
6641057d5dba87 Martin Povišer 2022-02-08  260  	struct clk_hw_onecell_data *onecell_data;
6641057d5dba87 Martin Povišer 2022-02-08  261  	void __iomem *base;
6641057d5dba87 Martin Povišer 2022-02-08  262  	struct resource *res;
6641057d5dba87 Martin Povišer 2022-02-08  263  	struct applnco_tables *tbl;
6641057d5dba87 Martin Povišer 2022-02-08  264  	unsigned int nchannels;
6641057d5dba87 Martin Povišer 2022-02-08  265  	int ret, i;
6641057d5dba87 Martin Povišer 2022-02-08  266  
6641057d5dba87 Martin Povišer 2022-02-08  267  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
6641057d5dba87 Martin Povišer 2022-02-08  268  	if (IS_ERR(base))
6641057d5dba87 Martin Povišer 2022-02-08  269  		return PTR_ERR(base);
6641057d5dba87 Martin Povišer 2022-02-08  270  
6641057d5dba87 Martin Povišer 2022-02-08  271  	if (resource_size(res) < NCO_CHANNEL_REGSIZE)
6641057d5dba87 Martin Povišer 2022-02-08  272  		return -EINVAL;
6641057d5dba87 Martin Povišer 2022-02-08  273  	nchannels = (resource_size(res) - NCO_CHANNEL_REGSIZE)
6641057d5dba87 Martin Povišer 2022-02-08  274  			/ NCO_CHANNEL_STRIDE + 1;
6641057d5dba87 Martin Povišer 2022-02-08  275  
6641057d5dba87 Martin Povišer 2022-02-08  276  	onecell_data = devm_kzalloc(&pdev->dev, struct_size(onecell_data, hws,
6641057d5dba87 Martin Povišer 2022-02-08  277  							nchannels), GFP_KERNEL);
6641057d5dba87 Martin Povišer 2022-02-08  278  	if (!onecell_data)
6641057d5dba87 Martin Povišer 2022-02-08  279  		return -ENOMEM;
6641057d5dba87 Martin Povišer 2022-02-08  280  	onecell_data->num = nchannels;
6641057d5dba87 Martin Povišer 2022-02-08  281  
6641057d5dba87 Martin Povišer 2022-02-08  282  	tbl = devm_kzalloc(&pdev->dev, sizeof(*tbl), GFP_KERNEL);
6641057d5dba87 Martin Povišer 2022-02-08  283  	if (!tbl)
6641057d5dba87 Martin Povišer 2022-02-08  284  		return -ENOMEM;
6641057d5dba87 Martin Povišer 2022-02-08  285  	applnco_compute_tables(tbl);
6641057d5dba87 Martin Povišer 2022-02-08  286  
6641057d5dba87 Martin Povišer 2022-02-08  287  	for (i = 0; i < nchannels; i++) {
6641057d5dba87 Martin Povišer 2022-02-08  288  		struct applnco_channel *chan;
6641057d5dba87 Martin Povišer 2022-02-08  289  
6641057d5dba87 Martin Povišer 2022-02-08  290  		chan = devm_kzalloc(&pdev->dev, sizeof(*chan), GFP_KERNEL);
6641057d5dba87 Martin Povišer 2022-02-08  291  		if (!chan)
6641057d5dba87 Martin Povišer 2022-02-08  292  			return -ENOMEM;
6641057d5dba87 Martin Povišer 2022-02-08  293  		chan->base = base + NCO_CHANNEL_STRIDE * i;
6641057d5dba87 Martin Povišer 2022-02-08  294  		chan->tbl = tbl;
6641057d5dba87 Martin Povišer 2022-02-08  295  		spin_lock_init(&chan->lock);
6641057d5dba87 Martin Povišer 2022-02-08  296  
6641057d5dba87 Martin Povišer 2022-02-08  297  		memset(&init, 0, sizeof(init));
6641057d5dba87 Martin Povišer 2022-02-08  298  		init.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
6641057d5dba87 Martin Povišer 2022-02-08  299  						"%s-%d", np->name, i);
6641057d5dba87 Martin Povišer 2022-02-08  300  		init.ops = &applnco_ops;
6641057d5dba87 Martin Povišer 2022-02-08  301  		init.parent_data = &pdata;
6641057d5dba87 Martin Povišer 2022-02-08  302  		init.num_parents = 1;
6641057d5dba87 Martin Povišer 2022-02-08  303  		init.flags = 0;
6641057d5dba87 Martin Povišer 2022-02-08  304  
6641057d5dba87 Martin Povišer 2022-02-08  305  		chan->hw.init = &init;
6641057d5dba87 Martin Povišer 2022-02-08 @306  		ret = devm_clk_hw_register(&pdev->dev, &chan->hw);
6641057d5dba87 Martin Povišer 2022-02-08  307  		if (ret)
6641057d5dba87 Martin Povišer 2022-02-08  308  			return ret;
6641057d5dba87 Martin Povišer 2022-02-08  309  
6641057d5dba87 Martin Povišer 2022-02-08  310  		onecell_data->hws[i] = &chan->hw;
6641057d5dba87 Martin Povišer 2022-02-08  311  	}
6641057d5dba87 Martin Povišer 2022-02-08  312  
6641057d5dba87 Martin Povišer 2022-02-08  313  	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
6641057d5dba87 Martin Povišer 2022-02-08  314  							onecell_data);
6641057d5dba87 Martin Povišer 2022-02-08  315  }
6641057d5dba87 Martin Povišer 2022-02-08  316  

:::::: The code at line 306 was first introduced by commit
:::::: 6641057d5dba87338780cf3e0d0ae8389ef1125c clk: clk-apple-nco: Add driver for Apple NCO

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
