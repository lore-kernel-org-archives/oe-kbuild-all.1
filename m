Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F522F0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMQZjyEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697315361; x=1728851361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CwUaiwu/anajycCO/09r6K08x3++4gPe/DXKlXMNQ+4=;
  b=hMQZjyEZj11JcNPSTqSSce7ku0T+b5ohJsiLjl/yMqPL6vP6L4uTpnRc
   cCT/US6Lwkaf0TwWwskoXwtNCFE9ZQ2n/NUi4PklQZdr5mdm+RZyS/weR
   JA9cRX85lYA0eEudJblbbA6sHcqiuCs5fLPpd62HWTrqpmwniZYshuX5C
   PUvQHqud1pI1cnx+IGEQHpLnubbtJUWeidu/MTbzBpfH3piXWT1mvg/lW
   mhxEH1sa3A36vr017AgwRYN3nHbN/tRe+tTpofINLPRORs3lbt8D+oQCH
   PtLGtwqUxNz/CK8jbQFIuyKMvxXvKBPjrIOr1qcyeIvsFUrXHDjYbtbFU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375698739"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375698739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="898955883"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898955883"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 13:27:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrlG3-0006cV-2a;
	Sat, 14 Oct 2023 20:29:11 +0000
Date: Sun, 15 Oct 2023 04:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Angelina Vu <angelinavu@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com
Subject: Re: [PATCH] hv_balloon: Add module parameter to configure balloon
 floor value
Message-ID: <202310150425.g4PXZjIU-lkp@intel.com>
References: <1696978087-4421-1-git-send-email-angelinavu@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696978087-4421-1-git-send-email-angelinavu@linux.microsoft.com>

Hi Angelina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Angelina-Vu/hv_balloon-Add-module-parameter-to-configure-balloon-floor-value/20231011-064921
base:   linus/master
patch link:    https://lore.kernel.org/r/1696978087-4421-1-git-send-email-angelinavu%40linux.microsoft.com
patch subject: [PATCH] hv_balloon: Add module parameter to configure balloon floor value
config: i386-randconfig-061-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150425.g4PXZjIU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150425.g4PXZjIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150425.g4PXZjIU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hv/hv_balloon.c:1100:15: sparse: sparse: symbol 'balloon_floor' was not declared. Should it be static?
   drivers/hv/hv_balloon.c:2079:9: sparse: sparse: context imbalance in 'balloon_remove' - wrong count at exit

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
