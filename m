Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCF33F5BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780878; cv=none; b=fESqt7MOVto1Ww6WJVW0f34la8CnUUEtndHD2+1x6XB7QEUA9HYwaFtOALst75sTeHdI/e8gO7jMuRd5MT58wsLOsG8MZHvhrhl+0oZXIWuLuRiHIy1UjnZ4h6kq39guGpifNi0i4q0r4K1Y+wzStyzkOEz1DeLvY+FrRfPjBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780878; c=relaxed/simple;
	bh=30dKBqZQpKQbk1d3DKtDji4dOkcLGajZkfULQEbCjyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQj53YVyz5NXLJYEmnS1bA5p2huUCrWET7rfbak46LgCWhqoL1kAZCpebK2f0phbOmYo41jK6i6llS8wRWQn6RtFDLgXGVF4zw4qkXSl775zvosxLWyMrYTbh9NcUayakdhNulBzTHQSXQ79SOr6W1A+Zmv0zZqoNe1DaSQ6MJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6Cd1Ot9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6Cd1Ot9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788780876; x=1820316876;
  h=date:from:to:cc:subject:message-id;
  bh=30dKBqZQpKQbk1d3DKtDji4dOkcLGajZkfULQEbCjyg=;
  b=D6Cd1Ot9A5k8nLJHO3eM2McadPRk8j48AVxCxK1IQfs/lHzC+AlxmrRj
   6/iOFJs8Mdrg9vGOm17JhKpV97D3VuOp8DJdz0GyPgNvZGqoTSv7MJ43c
   inrki+TjTPmEqOdgl59rval1vbDzVVvA7AI3+pSr5SuPIbiyJ2PwUlasq
   iOTisrVZGlte97ZHb1P9s1khsStgthzUHC1/+WYe5MQIoXv4VoeFZ1rAP
   UrFX/E89XVgkwNvIPdhYOFnroyE4e4TlSjwi0GLmYP/07hQ0lu4dnLHQk
   DrDMDqf0VA43lSRq1LKEJFtELohaKSJHvqjlbx5DVwKBGr7xRruUEwPkU
   g==;
X-CSE-ConnectionGUID: zGXVme5ET7iW95y8HwOTkA==
X-CSE-MsgGUID: Gv5O/97cTh6JAxbGPj12DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89201785"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89201785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:34:36 -0700
X-CSE-ConnectionGUID: 3lDZf5CSQiexzAJDgQfCCw==
X-CSE-MsgGUID: Mkd1JZbfReqh2sr1/hCxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="274838505"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Sep 2026 04:34:34 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3XcO-000000000qB-0s59;
	Mon, 07 Sep 2026 11:34:32 +0000
Date: Mon, 07 Sep 2026 19:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [remoteproc:rpmsg-next 6/6]
 samples/rpmsg/rpmsg_client_sample.c:68:39: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'}
Message-ID: <202609071911.i1HFaseq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   1029c89bafc714c1b987f29e3bc124a7b63d28d5
commit: 1029c89bafc714c1b987f29e3bc124a7b63d28d5 [6/6] samples: rpmsg: Add MTU size info
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260907/202609071911.i1HFaseq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071911.i1HFaseq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071911.i1HFaseq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/rpmsg.h:14,
                    from samples/rpmsg/rpmsg_client_sample.c:14:
   samples/rpmsg/rpmsg_client_sample.c: In function 'rpmsg_sample_probe':
>> samples/rpmsg/rpmsg_client_sample.c:68:39: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:68:17: note: in expansion of macro 'dev_warn'
      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
         |                 ^~~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:68:67: note: format string is defined here
      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
         |                                                                 ~~^
         |                                                                   |
         |                                                                   long int
         |                                                                 %d
   samples/rpmsg/rpmsg_client_sample.c:72:31: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:72:9: note: in expansion of macro 'dev_info'
      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
         |         ^~~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:72:51: note: format string is defined here
      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
         |                                                 ~~^
         |                                                   |
         |                                                   long int
         |                                                 %d
   samples/rpmsg/rpmsg_client_sample.c:78:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'ssize_t' {aka 'int'} [-Wformat=]
      78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:77:17: note: in expansion of macro 'dev_err'
      77 |                 dev_err(&rpdev->dev,
         |                 ^~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:78:68: note: format string is defined here
      78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long int
         |                                                                  %d


vim +68 samples/rpmsg/rpmsg_client_sample.c

    50	
    51	static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
    52	{
    53		int ret;
    54		struct instance_data *idata;
    55		ssize_t mtu, msg_len;
    56	
    57		dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
    58						rpdev->src, rpdev->dst);
    59	
    60		idata = devm_kzalloc(&rpdev->dev, sizeof(*idata), GFP_KERNEL);
    61		if (!idata)
    62			return -ENOMEM;
    63	
    64		dev_set_drvdata(&rpdev->dev, idata);
    65	
    66		mtu = rpmsg_get_mtu(rpdev->ept);
    67		if (mtu < 0) {
  > 68			dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
    69			return mtu;
    70		}
    71	
    72		dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
    73	
    74		msg_len = strlen(MSG);
    75		/* make sure our message fits in a single rpmsg buffer */
    76		if (msg_len > mtu) {
    77			dev_err(&rpdev->dev,
    78				"message size %zu exceeds rpmsg MTU size %ld\n",
    79				strlen(MSG), mtu);
    80			return -EMSGSIZE;
    81		}
    82	
    83		/* send a message to our remote processor */
    84		ret = rpmsg_send(rpdev->ept, MSG, msg_len);
    85		if (ret) {
    86			dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
    87			return ret;
    88		}
    89	
    90		return 0;
    91	}
    92	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
