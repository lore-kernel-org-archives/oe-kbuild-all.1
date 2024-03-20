Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604E7E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 00:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710893998; cv=none; b=NokPn3luch+3WDDlzrMooU3lCd/IjLwOy79zS1ti1k8dEbjSEnJLOcRHY4NSwRwXDLoTOt4Z/iLfGc0DS/fH78sEzCHUBNPVP10VJuv/XAyg9vefCSw0KNOZ9PQtyzgYj27m7GBHWorpV/pyHJq/ahWTPABpn8vQvuECM3nlKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710893998; c=relaxed/simple;
	bh=4NbjuCJq6nZq19nUWS0sDYyTztJ62VKYU8EsIriopx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=guvZQ/VZhRhYLpRs9hHGS3kD2/jtAw1Fa4ohxuPAALPVRlVJMT/DligNiYJM6P6n7F9HlSHpREOyVqa+bJfLwYBsn7B5bScl1g7OyxpRdG5ITxjGbqXJ4Cz2T8pwObxkp9abSery6Hi2Xe+X7HzwmPMIEVkZ59tEQ98SFCHNEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6/kjtVW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6/kjtVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710893996; x=1742429996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NbjuCJq6nZq19nUWS0sDYyTztJ62VKYU8EsIriopx8=;
  b=P6/kjtVWgfAKsyOgMtipkocQcubvPgg6L8p6nKa/bN1gRUW4E2OKZihC
   BQuCE2bpiXHPCsIDNq7s/JH2g5n4ne4EgQc88BpaIjYJZ++I+cxmv9qBR
   U1XuDyLfDFQxmqYtprF8AzOs5Ej90KGo4LH3qgMhLe2flGSNsbF6NJ9zm
   c55bRTXM++x2SRoLqDdcEMexBWfTNUU3cP2YPjJrcQmeYS+QV/8H+/siD
   EogpMdPZPLbvrKG7aGOuu99aadfrKTTNfPLq/QrYMmI2xMA5W0Tj55fW3
   eAn28wIu46h8FdfQbQySF+qcrMee6UOYcR6l0e1xQ+PImAbZr5v9YGYd6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5636171"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5636171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 17:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="14371765"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2024 17:19:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmjgN-000IBj-23;
	Wed, 20 Mar 2024 00:19:51 +0000
Date: Wed, 20 Mar 2024 08:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 313/395]
 drivers/extcon/extcon-adc-jack.c:108:64: error: passing argument 2 of
 'devm_extcon_dev_allocate' from incompatible pointer type
Message-ID: <202403200845.bzRq9223-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: f4be2628637d93d86a29fa5b6f55612c6a6def88 [313/395] Add upstream swait
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403200845.bzRq9223-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200845.bzRq9223-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200845.bzRq9223-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/bug.h:32,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:63,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:18,
                    from include/linux/module.h:10,
                    from drivers/extcon/extcon-adc-jack.c:17:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     117 |         WARN_ON_ONCE(cpu >= nr_cpumask_bits);
         |                          ^~
   include/asm-generic/bug.h:112:34: note: in definition of macro 'WARN_ON_ONCE'
     112 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   drivers/extcon/extcon-adc-jack.c: In function 'adc_jack_handler':
   drivers/extcon/extcon-adc-jack.c:74:34: warning: comparison of integer expressions of different signedness: 'u32' {aka 'unsigned int'} and 'int' [-Wsign-compare]
      74 |                 if (def->min_adc <= adc_val && def->max_adc >= adc_val) {
         |                                  ^~
   drivers/extcon/extcon-adc-jack.c:74:61: warning: comparison of integer expressions of different signedness: 'u32' {aka 'unsigned int'} and 'int' [-Wsign-compare]
      74 |                 if (def->min_adc <= adc_val && def->max_adc >= adc_val) {
         |                                                             ^~
   drivers/extcon/extcon-adc-jack.c: In function 'adc_jack_probe':
>> drivers/extcon/extcon-adc-jack.c:108:64: error: passing argument 2 of 'devm_extcon_dev_allocate' from incompatible pointer type [-Werror=incompatible-pointer-types]
     108 |         data->edev = devm_extcon_dev_allocate(&pdev->dev, pdata->cable_names);
         |                                                           ~~~~~^~~~~~~~~~~~~
         |                                                                |
         |                                                                const enum extcon *
   In file included from include/linux/extcon/extcon-adc-jack.h:19,
                    from drivers/extcon/extcon-adc-jack.c:25:
   include/linux/extcon.h:185:72: note: expected 'const unsigned int *' but argument is of type 'const enum extcon *'
     185 |                                                    const unsigned int *cable);
         |                                                    ~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/devm_extcon_dev_allocate +108 drivers/extcon/extcon-adc-jack.c

19939860dcae5a anish kumar    2012-08-17   92  
44f34fd4a7f804 Bill Pemberton 2012-11-19   93  static int adc_jack_probe(struct platform_device *pdev)
19939860dcae5a anish kumar    2012-08-17   94  {
19939860dcae5a anish kumar    2012-08-17   95  	struct adc_jack_data *data;
7c0f6558f893eb Jingoo Han     2013-09-11   96  	struct adc_jack_pdata *pdata = dev_get_platdata(&pdev->dev);
19939860dcae5a anish kumar    2012-08-17   97  	int i, err = 0;
19939860dcae5a anish kumar    2012-08-17   98  
19939860dcae5a anish kumar    2012-08-17   99  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
19939860dcae5a anish kumar    2012-08-17  100  	if (!data)
19939860dcae5a anish kumar    2012-08-17  101  		return -ENOMEM;
19939860dcae5a anish kumar    2012-08-17  102  
19939860dcae5a anish kumar    2012-08-17  103  	if (!pdata->cable_names) {
19939860dcae5a anish kumar    2012-08-17  104  		dev_err(&pdev->dev, "error: cable_names not defined.\n");
4b5dd738837aaa Sangjung Woo   2014-04-21  105  		return -EINVAL;
19939860dcae5a anish kumar    2012-08-17  106  	}
19939860dcae5a anish kumar    2012-08-17  107  
1876fd9af59904 Chanwoo Choi   2014-04-21 @108  	data->edev = devm_extcon_dev_allocate(&pdev->dev, pdata->cable_names);
1876fd9af59904 Chanwoo Choi   2014-04-21  109  	if (IS_ERR(data->edev)) {
1876fd9af59904 Chanwoo Choi   2014-04-21  110  		dev_err(&pdev->dev, "failed to allocate extcon device\n");
1876fd9af59904 Chanwoo Choi   2014-04-21  111  		return -ENOMEM;
1876fd9af59904 Chanwoo Choi   2014-04-21  112  	}
19939860dcae5a anish kumar    2012-08-17  113  
19939860dcae5a anish kumar    2012-08-17  114  	if (!pdata->adc_conditions ||
19939860dcae5a anish kumar    2012-08-17  115  			!pdata->adc_conditions[0].state) {
19939860dcae5a anish kumar    2012-08-17  116  		dev_err(&pdev->dev, "error: adc_conditions not defined.\n");
4b5dd738837aaa Sangjung Woo   2014-04-21  117  		return -EINVAL;
19939860dcae5a anish kumar    2012-08-17  118  	}
19939860dcae5a anish kumar    2012-08-17  119  	data->adc_conditions = pdata->adc_conditions;
19939860dcae5a anish kumar    2012-08-17  120  
19939860dcae5a anish kumar    2012-08-17  121  	/* Check the length of array and set num_conditions */
19939860dcae5a anish kumar    2012-08-17  122  	for (i = 0; data->adc_conditions[i].state; i++)
19939860dcae5a anish kumar    2012-08-17  123  		;
19939860dcae5a anish kumar    2012-08-17  124  	data->num_conditions = i;
19939860dcae5a anish kumar    2012-08-17  125  
5aa57f0a655276 Guenter Roeck  2013-02-04  126  	data->chan = iio_channel_get(&pdev->dev, pdata->consumer_channel);
4b5dd738837aaa Sangjung Woo   2014-04-21  127  	if (IS_ERR(data->chan))
4b5dd738837aaa Sangjung Woo   2014-04-21  128  		return PTR_ERR(data->chan);
19939860dcae5a anish kumar    2012-08-17  129  
19939860dcae5a anish kumar    2012-08-17  130  	data->handling_delay = msecs_to_jiffies(pdata->handling_delay_ms);
19939860dcae5a anish kumar    2012-08-17  131  
033d9959ed2dc1 Linus Torvalds 2012-10-02  132  	INIT_DEFERRABLE_WORK(&data->handler, adc_jack_handler);
19939860dcae5a anish kumar    2012-08-17  133  
19939860dcae5a anish kumar    2012-08-17  134  	platform_set_drvdata(pdev, data);
19939860dcae5a anish kumar    2012-08-17  135  
1876fd9af59904 Chanwoo Choi   2014-04-21  136  	err = devm_extcon_dev_register(&pdev->dev, data->edev);
19939860dcae5a anish kumar    2012-08-17  137  	if (err)
4b5dd738837aaa Sangjung Woo   2014-04-21  138  		return err;
19939860dcae5a anish kumar    2012-08-17  139  
19939860dcae5a anish kumar    2012-08-17  140  	data->irq = platform_get_irq(pdev, 0);
19939860dcae5a anish kumar    2012-08-17  141  	if (!data->irq) {
19939860dcae5a anish kumar    2012-08-17  142  		dev_err(&pdev->dev, "platform_get_irq failed\n");
4b5dd738837aaa Sangjung Woo   2014-04-21  143  		return -ENODEV;
19939860dcae5a anish kumar    2012-08-17  144  	}
19939860dcae5a anish kumar    2012-08-17  145  
19939860dcae5a anish kumar    2012-08-17  146  	err = request_any_context_irq(data->irq, adc_jack_irq_thread,
19939860dcae5a anish kumar    2012-08-17  147  			pdata->irq_flags, pdata->name, data);
19939860dcae5a anish kumar    2012-08-17  148  
03019759b98de9 Axel Lin       2012-10-02  149  	if (err < 0) {
19939860dcae5a anish kumar    2012-08-17  150  		dev_err(&pdev->dev, "error: irq %d\n", data->irq);
4b5dd738837aaa Sangjung Woo   2014-04-21  151  		return err;
19939860dcae5a anish kumar    2012-08-17  152  	}
19939860dcae5a anish kumar    2012-08-17  153  
03019759b98de9 Axel Lin       2012-10-02  154  	return 0;
19939860dcae5a anish kumar    2012-08-17  155  }
19939860dcae5a anish kumar    2012-08-17  156  

:::::: The code at line 108 was first introduced by commit
:::::: 1876fd9af59904078a73bdd4283c3924fd6cf18e extcon: adc-jack: Use devm_extcon_dev_allocate for extcon_dev

:::::: TO: Chanwoo Choi <cw00.choi@samsung.com>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
