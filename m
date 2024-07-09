Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236940858
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492139; cv=none; b=JFT6FIHBdBq0uFX9E3DavPGXOA92HK2HmDqQmZJhoqhVoFfg6CEVrlAKB+2FxLwf9pNCKCR4ibY2hhV9KDw4klnVX+kJ9H6sfCDk8CnCDvXGmz5fHTLk788LPomLQKwebX0t8SrxqyORC/uzwAiSQXNzPQFk4/HGaUONkg8usHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492139; c=relaxed/simple;
	bh=M3a/iRksigszTZMDafgbwDaqi0HIM1UQLzOcbeQRu/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qD+6NfmA3dcPP4bDXG6V4mSm/2OqQMCuah9dKftglyE/++IG0A25FToCVQUuWFKRfoydoZT+WpXh+/DxKjOk6OWdmExoYYOp+A8AM2fSQujv0eLPXAI+zLawcGrp7MhQ9KzG43Omme9LjRcEAn7QyKpeqiGzfEErXQensMIhtvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgFozmTc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgFozmTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720492138; x=1752028138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3a/iRksigszTZMDafgbwDaqi0HIM1UQLzOcbeQRu/I=;
  b=WgFozmTcIQs8EskAa6lbFBU7jIxDmmnkFq3P8ZtjIdVWQoH53jlYuuh/
   Cew+sVQTiCDtiKMw2oFfJzGd8yNvs8i087yMWxDdF5of/Fc1y3NMC0g8l
   fsh3JajUhe6VZtw/u3T8+msEPyotvWhBiL8kX81ltUehIq6vOhvp8kDg2
   7xPZVXdvqGvE2cXHVxGRBCYLgQ1WPFnUZJt1kWu4XXn2U/luTW6/XJF34
   /rgNozqws5UjJ1Ah/EAhcoDdtcamJFWnNr1/MH1zWmpy9VcYN73xK9vJE
   nl0hpZyluT2TxAbnBtwAnJmvbVX/7rorBQNTW2BTc9LWkLkUIFEdxrFhH
   A==;
X-CSE-ConnectionGUID: LCWvKjHbS/66ngT20ff92A==
X-CSE-MsgGUID: ZkOFX90bQO2WqThiNZQN8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17855473"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17855473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 19:28:57 -0700
X-CSE-ConnectionGUID: 7WR8ksrgTiGvOfwV49VPhw==
X-CSE-MsgGUID: p5hXCkcxRP6ezFcKs6i8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="70894275"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2024 19:28:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR0b8-000WFU-0Q;
	Tue, 09 Jul 2024 02:28:54 +0000
Date: Tue, 9 Jul 2024 10:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 11/17] ld:
 drivers/iio/adc/ad9467.o:include/linux/iio/backend.h:12: multiple definition
 of `d'; drivers/iio/industrialio-backend.o:include/linux/iio/backend.h:12:
 first defined here
Message-ID: <202407091022.qRT8WFxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: e18cc5c6741984280b0142955a2ea49bc6bf5484 [11/17] iio: backend: add debugFs interface
config: i386-randconfig-012-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091022.qRT8WFxt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091022.qRT8WFxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091022.qRT8WFxt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/iio/adc/ad9467.o:include/linux/iio/backend.h:12: multiple definition of `d'; drivers/iio/industrialio-backend.o:include/linux/iio/backend.h:12: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
