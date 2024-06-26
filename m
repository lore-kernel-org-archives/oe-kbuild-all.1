Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE513AA4C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 17:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421485; cv=none; b=f7bBjzIvngCeaz/jbKXCAGIRy709WLf3z0I50EccjYkNY3OIIcWFn4/DL2XvEUdK9IaeFDktorwiEiAqw1wonwL15RZjIO5d20jihTT0weOHpR243u3Rbuauw1dZd0pUqdhvPLFWTaY91RpVVYyuGvQBnveF1Ec8td9VqKpjFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421485; c=relaxed/simple;
	bh=Lp+BP2hXkjKeedMkpGZAcnxGy2y2jg4oVaQ99pAktBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0T46r4+RmXwulTs2NeJB4oAx6p+Pmu0JMXaQNztZGr0qscpB3qMhBsBYDebevOGE8Fmc+M4uuw+MHFk/Xiru502oSlTl5OdyCl7P6IkuU5Fx+s8+VyCdW4b9s/QMxDsXbMD10xf2Z8+UuPjik/eV2Oy1utHxT8hku8ecDppcGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/aQmPlK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/aQmPlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719421484; x=1750957484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lp+BP2hXkjKeedMkpGZAcnxGy2y2jg4oVaQ99pAktBA=;
  b=K/aQmPlKR/U18cT9+ybMyeSRU58FwQ72DLdJyCBwJ6nqDAQfZJg3xTow
   5eRBCRKvJV3TC2tk6UWmA4RgAxupPGDJBUQfhhrIE3qdCxK8GAtnxmNer
   ijkynBetalACvDDRzFAPHD/gXUGC7iKIgvJqSuzMjWfYAVGCpcivgb70E
   Az/m9UxG0JL+2WVp5xxwLtoF07JATtuINDIssvmXhnXqU/mXgWKFdb5aD
   9j3naOpQPWsYRLEEa7gOzkA74zGrjtPGs2Hm4ypsX9fmugNyvvr++MXmS
   TmTkJeHMQspwrMLOViDdIfjcxd83yrgtxSydvB3SFJAe7nWA11pVFy/PJ
   g==;
X-CSE-ConnectionGUID: dYH71vJERXC6idBtwhUWRw==
X-CSE-MsgGUID: 5w7VzB4LStSmSH5QzDsfmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16188792"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="16188792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 10:04:43 -0700
X-CSE-ConnectionGUID: YiSn/o4XTjy/auNli2nUMQ==
X-CSE-MsgGUID: xipnlctaTzOqJs9P0B58Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="49242198"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jun 2024 10:04:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMW4V-000FPe-1C;
	Wed, 26 Jun 2024 17:04:39 +0000
Date: Thu, 27 Jun 2024 01:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
Message-ID: <202406270052.BmX047TT-lkp@intel.com>
References: <20240624122723.134292-6-mpe@ellerman.id.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624122723.134292-6-mpe@ellerman.id.au>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes robh/for-next linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Ellerman/powerpc-boot-Remove-all-40x-platforms-from-boot/20240626-015314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240624122723.134292-6-mpe%40ellerman.id.au
patch subject: [PATCH v2 6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
config: powerpc-kismet-CONFIG_I2C_IBM_IIC-CONFIG_AKEBONO-0-0 (https://download.01.org/0day-ci/archive/20240627/202406270052.BmX047TT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406270052.BmX047TT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270052.BmX047TT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_IBM_IIC when selected by AKEBONO
   WARNING: unmet direct dependencies detected for I2C_IBM_IIC
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && 4xx
     Selected by [y]:
     - AKEBONO [=y] && PPC_47x [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
