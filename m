Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BC349CFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156986; cv=none; b=kLWlBcOqlHPsQlGP8YGjC5kwkm4XKg46JPcz0rk27+ki1G81mKRlP24mtlezfk6yZC+UaoJz2vT/MEyETwH0+2S0iFGqb8vxiS3l5cqDs8qJ/ba/LWR49Iqk8INhi3v6NoFghtqmbywV59SxnEHq58PbY5HOnq8krdh+nhlI7nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156986; c=relaxed/simple;
	bh=VbAZ9kR6b4BWFUOMY0E08vbegPOcRmKyNUMhHIE9OS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jr6dOavpXxhUlT53byWxJZ56NbcxO+V4LIY5JprkjAzMYRzecYflvROzbwT6oub/hJGocyqoi+lfQD4AQDm21YCPtE+Hkqnp6q4B7FL6D/rkYBmW+4ktkfFY3WHHCyhk8H3kKGxiFIphp+ndsEJrKO1Wsw4TY7msGuFUJxKA+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN5mp+ZE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN5mp+ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782156982; x=1813692982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbAZ9kR6b4BWFUOMY0E08vbegPOcRmKyNUMhHIE9OS4=;
  b=QN5mp+ZEhGcyiSNU0yQ2xXS9UNrDUR07O9MvzssfXe8jSkvP8QGGgBtH
   1GWXe3AWd7lam9jjys7fNnltMOiBxPSJ/50L6U1Wn7rJkDw7HOwJJY79z
   2G8lBnup3GrDinVz8ML24V0qnDHKMHNGQviMaWeyr6QXrFwNtprvh3YPL
   +nxin8Wjnr61AQ2G+cythyIu0Lp/e1xODjmhuUF19OfIa9ijwBsOam4hs
   1Gj+1eu86v5l2Cn8NTrr88uDadxKaUWHHZsmqbLptNKNbgTi/nuaFjWAN
   hNFpuEf/jKQlhz/JGFAmaykXnWLwAyiy52ceCfeZI4tj5ttmiKEcOSbDn
   g==;
X-CSE-ConnectionGUID: T8NbPmePRCCLPjg9RY5+ew==
X-CSE-MsgGUID: H6amwU8mSxqXHLGAVBrGiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83007838"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83007838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 12:36:22 -0700
X-CSE-ConnectionGUID: KVOT1aoqTm+ZiHIajdz3Ow==
X-CSE-MsgGUID: HGnBOLg6Ts6x0kCzQoglXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245174882"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 12:36:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbkQd-000000001mZ-0PC5;
	Mon, 22 Jun 2026 19:35:51 +0000
Date: Tue, 23 Jun 2026 03:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 59/124]
 drivers/rpmsg/zx29_smd.c:130:13: warning: 'zx29_smd_release_device' defined
 but not used
Message-ID: <202606230300.AY9cmB0Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: fc69b31c2281728e29ccc5e1477a98b1682f3e6a [59/124] rpmsg v1
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230300.AY9cmB0Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230300.AY9cmB0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230300.AY9cmB0Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/zx29_smd.c: In function 'zx29_smd_trysend':
   drivers/rpmsg/zx29_smd.c:98:31: warning: unused variable 'zx29_ept' [-Wunused-variable]
      98 |         struct zx29_endpoint *zx29_ept = to_zx29_rpmsg_endpoint(ept);
         |                               ^~~~~~~~
   drivers/rpmsg/zx29_smd.c: In function 'zx29_smd_probe':
   drivers/rpmsg/zx29_smd.c:147:22: warning: unused variable 'i' [-Wunused-variable]
     147 |         unsigned int i;
         |                      ^
   drivers/rpmsg/zx29_smd.c: At top level:
>> drivers/rpmsg/zx29_smd.c:130:13: warning: 'zx29_smd_release_device' defined but not used [-Wunused-function]
     130 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/zx29_smd_release_device +130 drivers/rpmsg/zx29_smd.c

    94	
    95	static int zx29_smd_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
    96	{
    97		struct zx29_smd *zx29_smd = to_zx29_rpmsg_device(ept->rpdev);
  > 98		struct zx29_endpoint *zx29_ept = to_zx29_rpmsg_endpoint(ept);
    99		dev_info(&zx29_smd->pdev->dev, "zx29_smd_trysend\n");
   100	
   101		/* TODO: Copy stuff into stuff */
   102		//mbox_send_message(zx29_ept->mbox_chan, NULL);
   103		//mbox_client_txdone(zx29_ept->mbox_chan, 0);
   104	
   105		return 0;
   106	}
   107	
   108	static __poll_t zx29_smd_poll(struct rpmsg_endpoint *ept,
   109					  struct file *filp, poll_table *wait)
   110	{
   111		struct zx29_smd *zx29_smd = to_zx29_rpmsg_device(ept->rpdev);
   112		dev_info(&zx29_smd->pdev->dev, "zx29_smd_poll\n");
   113		return 0;
   114	}
   115	
   116	static ssize_t zx29_get_mtu(struct rpmsg_endpoint *ept)
   117	{
   118		/* meh for now meh */
   119		return 0x8;
   120	}
   121	
   122	static const struct rpmsg_endpoint_ops zx29_smd_endpoint_ops = {
   123		.destroy_ept = zx29_smd_destroy_ept,
   124		.send = zx29_smd_send,
   125		.trysend = zx29_smd_trysend,
   126		.poll = zx29_smd_poll,
   127		.get_mtu = zx29_get_mtu,
   128	};
   129	
 > 130	static void zx29_smd_release_device(struct device *dev)
   131	{
   132		dev_info(dev, "zx29_smd_release_device\n");
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
