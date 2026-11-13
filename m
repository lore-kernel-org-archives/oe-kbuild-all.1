Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590065;
	b=YoVWoyTwbHFptWyxPbx/zGL6fWPt3gkmjRg3vmKLNuHsL8xtQNmJpoFB60rchE9ufgjC
	 2+a+4j/uXWcNOyZ9lPvBMH4+w5DFHHJg/nEL51rr/s+KOqjaVumPm9yIdqEmbFCKl7sw2
	 tFYxBCbRh55LGP+eyftiv7Vh22QdIDbj/mpZohbBiZXJZE1DDY6ZQbkcHKuguXlEqTjZw
	 SdNwaDRr4HqVTIqu6MOzuVzMzC4rXcUB/octIPrD5Hn70xy1yxfrha85vXzBsGbH3XKM6
	 qew6tE0dMkeSYZEzEqVdeF1qnL4mMN6Hbja53zDoXoGCLK6nZ5HrxJF/vrwnOuZ4Oog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590065;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=qyc4OkhuXwtqnsSiKyz5VKbAZX9fGa22sPOH8Ok+fYE=;
	b=QF/aGJZ1G/rYb/INabyh+/1vS0WC4HCfSyEo2hBmuaDPIN3dGfav3Ydqpp5v6v/PR4QC
	 LI8pytAt08CgeF2LzIKXDm5z15ITw1tDmjFq5XxPpZikodhljhqfk5nIKvvd3+3LqF7x+
	 eMc3RR++8akACHt88XFAq4N3ApgrM+ZUQ7JFN3rUQj9uYOGryMUTepWBRBJuDdcLknX99
	 +60BjnbD3uvM9tTCWiq7Fm/IlyzlT9srZ9lWR5YAAbcJ0qEQYmzUl7ETCZQ7I3zXZJueh
	 uwuiYAmCej2t+Gd1vEPX1UibuB43KNVKgNsl5BcUmnQ1RCJskFGJnEoKmJJgd6E2iNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAHvQS2i;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67715606A8AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 17:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67715606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAHvQS2i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794590064; x=1826126064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pypMBCTOIvAoIkfFLZyuLcHSjmnILlH11e/xP7ryf0=;
  b=OAHvQS2iooLQKBUp/qfccIdoGFR4noNf1ZhqpOczzK/5NVYtwzsfVTMl
   mH1wlfll+ziNHABEHZy8TX2vrXOmpg58W7h9DvAX+NE6fVAJ6KCt9eTf2
   /4zpsRAKO9eMNiqJFbfYvlZ05IJO7RqUwl3KWArHeCPiQ3bD7lRJi0wqa
   LsQE4D1OJtphPdeDo+ro+NUmyCCw2GX8AISH1ORa0nGnLvYo3CCrgwUuP
   hnBT/6zfFXh2EBTpeZrib4xKJlViXAaYBzjAKIqrzmKVZT3Lz0YKKiCEC
   hecsN21ROafz0bfnWeubhCpL9xa7HnQIIZ05KR5wOCYCBAWBFDvJlD7rU
   Q==;
X-CSE-ConnectionGUID: bnrSbb94RRO5qBGofZSsOg==
X-CSE-MsgGUID: CPQ+U5MiTV20kumd0NzaLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3428680"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3428680"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:14:24 -0800
X-CSE-ConnectionGUID: SwXftBAfQoiK3xYBMLqaow==
X-CSE-MsgGUID: LjTdZVbiQpaS91pIrnwbTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10685297"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Nov 2026 09:14:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRuqx-000000001JT-3iBR;
	Fri, 13 Nov 2026 17:14:19 +0000
Date: Fri, 13 Nov 2026 18:13:20 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Cl=C3=A9ment?= Le Goffic" <clegoffic@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Subject: [linusw-pinctrl:for-next 7/8]
 drivers/pinctrl/pinctrl-scmi.c:425:22: error: 'const struct
 scmi_pinctrl_proto_ops' has no member named 'function_flags_get'; did you
 mean 'function_groups_get'?
Message-ID: <202611131822.1IMmC3nP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   e45b85490f2d1a00f7e41cb72025fc3fa791e597
commit: 1b5848e1170359a8c708b5527e8f8f20c62f8e2d [7/8] pinctrl: scmi: give no groups to pin-only functions
config: arm64-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131822.1IMmC3nP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131822.1IMmC3nP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131822.1IMmC3nP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-scmi.c: In function 'pinctrl_scmi_get_functions':
>> drivers/pinctrl/pinctrl-scmi.c:425:22: error: 'const struct scmi_pinctrl_proto_ops' has no member named 'function_flags_get'; did you mean 'function_groups_get'?
      ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
                         ^~~~~~~~~~~~~~~~~~
                         function_groups_get


vim +425 drivers/pinctrl/pinctrl-scmi.c

   407	
   408	static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
   409	{
   410		unsigned int nr_funcs, nr_groups, i, j;
   411		const unsigned int *group_ids;
   412		bool pin_only, gpio;
   413		const char *fname;
   414		const char **gnames;
   415		int ret;
   416	
   417		nr_funcs = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
   418	
   419		for (i = 0; i < nr_funcs; i++) {
   420			ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE,
   421						    &fname);
   422			if (ret)
   423				return ret;
   424	
 > 425			ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
   426							      &gpio);
   427			if (ret)
   428				return ret;
   429	
   430			ret = pinctrl_ops->function_groups_get(pmx->ph, i,
   431							       &nr_groups,
   432							       &group_ids);
   433			if (ret)
   434				return ret;
   435	
   436			if (pin_only)
   437				nr_groups = 0;
   438			else if (!nr_groups)
   439				dev_warn(pmx->dev,
   440					 "Function %s contains no groups\n",
   441					 fname);
   442	
   443			gnames = devm_kmalloc_array(pmx->dev, nr_groups,
   444						    sizeof(*gnames), GFP_KERNEL);
   445			if (!gnames)
   446				return -ENOMEM;
   447	
   448			for (j = 0; j < nr_groups; j++) {
   449				ret = pinctrl_ops->name_get(pmx->ph, group_ids[j],
   450							    GROUP_TYPE, &gnames[j]);
   451				if (ret)
   452					return ret;
   453			}
   454	
   455			ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
   456					  nr_groups, NULL);
   457			if (ret < 0)
   458				return ret;
   459			if (ret != i) {
   460				dev_err(pmx->dev,
   461					"Duplicate function name: %s index: %u selector: %d\n",
   462					fname, i, ret);
   463				return -EINVAL;
   464			}
   465		}
   466	
   467		return 0;
   468	}
   469	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
