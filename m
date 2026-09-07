Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFAE471D1A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786769; cv=none; b=hh+AMxIGjFc128pVpjDQb4iq/1f2pxhQsX8xZG3OHZD96eApz0BRTTEIrtg2HqcdOf+UHgu3Px7rgUwL3K/z0Ss20wlt3b+7uBhv2W42JK1/Cg9HSCcIETE2HG3zW3l0OIRU134XyMa7he2d7KjV6FIywXaYVQOR74mmycGShTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786769; c=relaxed/simple;
	bh=sZTe0taKwe6hw5mzI19qcgnyOELh00J0kKHxQzzL+NY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eXwEr9iPvRT/1DmCaAjqSUzsFttB51xI9HbiO1coIMsCS8GScmILRQjSiz02NpbjznXY5/HX/qFhej3G6mmWJcA6gs3QbemUJDsAgUfGN+knrrN+xxyX6fPGay191NrF0z6kpAcVwlzBm+/xeNjiKMqBflMfrIv/OZV22rgQlo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTPX8vVD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTPX8vVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788786764; x=1820322764;
  h=date:from:to:cc:subject:message-id;
  bh=sZTe0taKwe6hw5mzI19qcgnyOELh00J0kKHxQzzL+NY=;
  b=LTPX8vVDx44w9R/rjgWM3aKydcJkvTzfIm9dzNkr9KnAM9np0zfRkfDG
   p/yOtDrsia8wkX1sMjuwWbhbdNuyfHTcTOu1Zp3obtdktis7P1BF8te/1
   Eevi3/fSYzptoRSDWDMOxdxlKwlqyMQw4NBnXsEJ/B65n36BcdxnwHNPy
   R0/2geIhJh83MwBZqZAwW6L/lLpaRg0iP+61QZ3oSYaA91RBj8eMIOVRO
   VzHzZyz0spMf1wqh5gabCQwdCl47/fLnNGZj+bMlOmyE+URwa1OzVtKeH
   ADDT7YLZqJDD0CEx0EwoDwUYathY21nOG9VrACT8UuTKgZERFliZVZ3cG
   g==;
X-CSE-ConnectionGUID: jAx+46yUST6IvEV+vf9XhA==
X-CSE-MsgGUID: YA//qDC9RHS/V9z73sRWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88950522"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88950522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 06:12:42 -0700
X-CSE-ConnectionGUID: 6cEfPEyNR26lL+sjXY5XPw==
X-CSE-MsgGUID: Tre+91zlTESYHXy0970PYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="264511757"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Sep 2026 06:12:41 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Z9K-000000000vB-3p8i;
	Mon, 07 Sep 2026 13:12:38 +0000
Date: Mon, 07 Sep 2026 21:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [remoteproc:rpmsg-next 6/6]
 samples/rpmsg/rpmsg_client_sample.c:68:59: warning: format specifies type
 'long' but the argument has type 'ssize_t' (aka 'int')
Message-ID: <202609072042.wraEH9fu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   1029c89bafc714c1b987f29e3bc124a7b63d28d5
commit: 1029c89bafc714c1b987f29e3bc124a7b63d28d5 [6/6] samples: rpmsg: Add MTU size info
config: i386-randconfig-063-20260907 (https://download.01.org/0day-ci/archive/20260907/202609072042.wraEH9fu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072042.wraEH9fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072042.wraEH9fu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/rpmsg/rpmsg_client_sample.c:68:59: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
         |                                                                 ~~~     ^~~
         |                                                                 %zd
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:72:50: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
         |                                                 ~~~     ^~~
         |                                                 %zd
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:79:17: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
      78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
         |                                                                  ~~~
         |                                                                  %zd
      79 |                         strlen(MSG), mtu);
         |                                      ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   3 warnings generated.


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
