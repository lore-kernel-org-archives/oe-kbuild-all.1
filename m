Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AF13BCD15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366032; cv=none; b=sTYno3gtbsXGxcWiPJkqirFIngRnMZsdSlqaxHTPhrEta6MRFgixZTdjxkOFDH4pugOtS3QnuRCybinOo4YkqK5YWBYgEq1y/yAB78AWIv/HnwGO9PZvmxsZFciEvz1EAy55ozAAxB1aUpDkKhMAVPANfqEG1peElvZWhfXFKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366032; c=relaxed/simple;
	bh=UDCrdDr2Z4QRtCb9eXSARB5kp4OgIYJ+nZD3APdV9xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFZvJ/qU8nTbZtVmnnmfvSHz53I5HOxz6IIkz9amrkPvBlBU4mfDiD82hp6Q+Q78IBVJlN47mEH+VBfSo3o1Jouw2Kf7kMGf99QxMsJagmId60lefF6htKTgrkZ1OLLt+/KcAK6r1lkHeD3WPyYvz3YnqrNj8jd1h7J5yE5HzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyfRpI4l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyfRpI4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789366029; x=1820902029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDCrdDr2Z4QRtCb9eXSARB5kp4OgIYJ+nZD3APdV9xY=;
  b=QyfRpI4lPKM+hA4VE63eR3w2l/VbvMc72yPcmyt+/y2NnA5OICb3NvGO
   TExCfnuO5Qr7a5ApVcISYHtTVryRYq0w+f9uFDaJJo0Y4ulaXOke4Ea8s
   cIgoAlSt7UOBBl7TzTvYV+dmFAKTyPw6PPkr4RETggIYJgUtwfNrDSfDt
   +b6tCjwaD98MxSZFRnAQ4q3L5+Yu4i64ghk9X3lQ2T8GSRqD8V+tHCRg4
   ZdNOA7Ic/Pd8gYwhsyR8rW9+Ij3LmUAlDti3cft1cs9iVG9NHGut4YJxC
   q1fRxwrddknEb5zji2+NYNQGpW9w7A6qhsMVUYnzGwY9jN3RxRkgBQisC
   g==;
X-CSE-ConnectionGUID: amvZ77WURFeVesdyh5tt5w==
X-CSE-MsgGUID: SuyeynYMS7ainkP9QRQR1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89729538"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89729538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 23:07:07 -0700
X-CSE-ConnectionGUID: Yvj2c5dBQ7elpb9hUbickQ==
X-CSE-MsgGUID: C+vBA5QDS76Os5swCQEy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270749630"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2026 23:07:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5zqH-000000002X1-3qQx;
	Mon, 14 Sep 2026 06:07:01 +0000
Date: Mon, 14 Sep 2026 14:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpib: tnt4882: fix memory leak on probe failure
Message-ID: <202609141321.qGDHzSqJ-lkp@intel.com>
References: <20260913063603.1443403-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913063603.1443403-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master kees/for-next/pstore v7.3-rc3 next-20260911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/gpib-tnt4882-fix-memory-leak-on-probe-failure/20260913-143603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20260913063603.1443403-1-lgs201920130244%40gmail.com
patch subject: [PATCH] gpib: tnt4882: fix memory leak on probe failure
config: x86_64-randconfig-r133-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141321.qGDHzSqJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141321.qGDHzSqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141321.qGDHzSqJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpib/tnt4882/tnt4882_gpib.c: In function 'ni_gpib_probe':
>> drivers/gpib/tnt4882/tnt4882_gpib.c:1588:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1588 |         ret = ni_gpib_config(link);
         |         ^~~
         |         net
   drivers/gpib/tnt4882/tnt4882_gpib.c:1588:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpib/tnt4882/tnt4882_gpib.c:1595:1: warning: control reaches end of non-void function [-Wreturn-type]
    1595 | }
         | ^


vim +1588 drivers/gpib/tnt4882/tnt4882_gpib.c

  1557	
  1558	/*
  1559	 * ni_gpib_probe() creates an "instance" of the driver, allocating
  1560	 * local data structures for one device.  The device is registered
  1561	 * with Card Services.
  1562	 */
  1563	
  1564	static int ni_gpib_probe(struct pcmcia_device *link)
  1565	{
  1566		struct local_info_t *info;
  1567		//struct struct gpib_board *dev;
  1568	
  1569		/* Allocate space for private device-specific data */
  1570		info = kzalloc_obj(*info);
  1571		if (!info)
  1572			return -ENOMEM;
  1573	
  1574		info->p_dev = link;
  1575		link->priv = info;
  1576	
  1577		/*
  1578		 * General socket configuration defaults can go here.  In this
  1579		 * client, we assume very little, and rely on the CIS for almost
  1580		 * everything.  In most clients, many details (i.e., number, sizes,
  1581		 * and attributes of IO windows) are fixed by the nature of the
  1582		 * device, and can be hard-wired here.
  1583		 */
  1584		link->config_flags = CONF_ENABLE_IRQ | CONF_AUTO_SET_IO;
  1585	
  1586		/* Register with Card Services */
  1587		curr_dev = link;
> 1588		ret = ni_gpib_config(link);
  1589		if (ret) {
  1590			kfree(info);
  1591			link->priv = NULL;
  1592		}
  1593	
  1594		return ret;
  1595	}
  1596	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
