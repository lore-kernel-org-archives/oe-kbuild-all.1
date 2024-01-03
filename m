Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB561D55C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9WYpfWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704316519; x=1735852519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cs2iz1Na513KSyHZstP7Zg4QnAmZEXJxEsQ/0Gi9wH4=;
  b=F9WYpfWmdn0QBSaqcOZYOjKgxVwmfr+6K+24YxAWzah39e2jT4vwkDGy
   eVjF3+zXHYgbMCclnJOC+JeszzGIWuwuQK435hJK6OF0gdGKgzZhtoO2e
   GAcHYUTGxQocFHi3bxFZC0d+wnKay1J14Ks1yGkSZTgRRGaP7qbQLhjcp
   fZ+4kQ0JRMqA7YGndy0DED0iToaJhGv0wEkMBt/iQEdAbAg5Wskt0IHsH
   zbJNU1H9It8enIw2V8hV/ldOn/xjN/HI2fi074CijK9ne74GzKZI2CF3H
   y+zj7ewFW75k3r6Dx/rj+WTOnBOSmPRRezXw9v78gqG+RRZXemocxDju0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="382028789"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="382028789"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 13:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814374194"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="814374194"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Jan 2024 13:15:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL8Zv-000MZp-1X;
	Wed, 03 Jan 2024 21:15:07 +0000
Date: Thu, 4 Jan 2024 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 3356/30000]
 sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of
 function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'?
Message-ID: <202401040531.RPiBeXxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Youlin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   4fb32a1f29a698f38b6044a5271361a73ae45a49
commit: b4b11198edb99eb17a4d032c3a80854d3a817b0d [3356/30000] ANDROID: sound: Add hikey960 i2s audio driver
config: i386-randconfig-061-20240104 (https://download.01.org/0day-ci/archive/20240104/202401040531.RPiBeXxq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040531.RPiBeXxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040531.RPiBeXxq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_probe':
>> sound/soc/hisilicon/hi3660-i2s.c:377:22: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                      ^~~~~~~~~~~~~~~~
         |                      of_pinctrl_get
>> sound/soc/hisilicon/hi3660-i2s.c:377:20: warning: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     377 |         i2s->pctrl = devm_pinctrl_get(dev);
         |                    ^
>> sound/soc/hisilicon/hi3660-i2s.c:384:28: error: implicit declaration of function 'pinctrl_lookup_state' [-Werror=implicit-function-declaration]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/hisilicon/hi3660-i2s.c:384:26: warning: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     384 |         i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
         |                          ^
>> sound/soc/hisilicon/hi3660-i2s.c:394:13: error: implicit declaration of function 'pinctrl_select_state' [-Werror=implicit-function-declaration]
     394 |         if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   sound/soc/hisilicon/hi3660-i2s.c: In function 'hi3660_i2s_remove':
>> sound/soc/hisilicon/hi3660-i2s.c:422:9: error: implicit declaration of function 'pinctrl_put'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
     422 |         pinctrl_put(i2s->pctrl);
         |         ^~~~~~~~~~~
         |         of_pinctrl_get
   cc1: some warnings being treated as errors


vim +377 sound/soc/hisilicon/hi3660-i2s.c

   332	
   333	static int hi3660_i2s_probe(struct platform_device *pdev)
   334	{
   335		struct device *dev = &pdev->dev;
   336		struct hi3660_i2s *i2s;
   337		struct resource *res;
   338		int ret;
   339	
   340		i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
   341		if (!i2s)
   342			return -ENOMEM;
   343	
   344		i2s->dev = dev;
   345		spin_lock_init(&i2s->lock);
   346	
   347		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   348		if (!res) {
   349			ret = -ENODEV;
   350			return ret;
   351		}
   352		i2s->base_phys = (phys_addr_t)res->start;
   353	
   354		i2s->dai = dai_init;
   355		dev_set_drvdata(&pdev->dev, i2s);
   356	
   357		i2s->base = devm_ioremap_resource(dev, res);
   358		if (IS_ERR(i2s->base)) {
   359			dev_err(&pdev->dev, "ioremap failed\n");
   360			ret = PTR_ERR(i2s->base);
   361			return ret;
   362		}
   363	
   364		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
   365		if (!res) {
   366			ret = -ENODEV;
   367			return ret;
   368		}
   369		i2s->base_syscon = devm_ioremap(dev, res->start, resource_size(res));
   370		if (IS_ERR(i2s->base_syscon)) {
   371			dev_err(&pdev->dev, "ioremap failed\n");
   372			ret = PTR_ERR(i2s->base_syscon);
   373			return ret;
   374		}
   375	
   376		/* i2s iomux config */
 > 377		i2s->pctrl = devm_pinctrl_get(dev);
   378		if (IS_ERR(i2s->pctrl)) {
   379			dev_err(dev, "could not get pinctrl\n");
   380			ret = -EIO;
   381			return ret;
   382		}
   383	
 > 384		i2s->pin_default = pinctrl_lookup_state(i2s->pctrl,
   385						PINCTRL_STATE_DEFAULT);
   386		if (IS_ERR(i2s->pin_default)) {
   387			dev_err(dev,
   388				"could not get default state (%li)\n",
   389				PTR_ERR(i2s->pin_default));
   390			ret = -EIO;
   391			return ret;
   392		}
   393	
 > 394		if (pinctrl_select_state(i2s->pctrl, i2s->pin_default)) {
   395			dev_err(dev, "could not set pins to default state\n");
   396			ret = -EIO;
   397			return ret;
   398		}
   399	
   400		ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
   401					&dmaengine_pcm_config, 0);
   402		if (ret)
   403			return ret;
   404	
   405		ret = snd_soc_register_component(&pdev->dev, &component_driver,
   406					&i2s->dai, 1);
   407		if (ret) {
   408			dev_err(&pdev->dev, "Failed to register dai\n");
   409			return ret;
   410		}
   411	
   412		return 0;
   413	}
   414	
   415	static int hi3660_i2s_remove(struct platform_device *pdev)
   416	{
   417		struct hi3660_i2s *i2s = dev_get_drvdata(&pdev->dev);
   418	
   419		snd_soc_unregister_component(&pdev->dev);
   420		dev_set_drvdata(&pdev->dev, NULL);
   421	
 > 422		pinctrl_put(i2s->pctrl);
   423	
   424		return 0;
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
