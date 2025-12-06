Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5421ADC83
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764997723; cv=none; b=m8NeejW5L2+RnPkvEIKjfK//QJjw//BmVkk6bV0JviaTBq2HSL6U7k/NvNPsS+yJAACckN25cSjGhOZaZjmW/dnQEO4o6K9YJXrlssFFGrfp08T7nLh0sH3TgmNBg5HegfXMCSe+a85LPlLKQzou4oEq7xgGTg9iDCOt12MWRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764997723; c=relaxed/simple;
	bh=i4eZbh90/dXtI+RO+dqTkK2XlXBfTjz0i75FE3jkEPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBNCb7SVygAoCxKCuNulvfv8PboUU6yt2X2WEijeab0TYqxZRJlOXfjDJUvqek9p8YrWPoXjtjAl6xHqbF2DPINKVUvOx0p6p/bdHiV1k9jJQA9xAFeXnjoxWo/dJ+E7l63OkWnJJqiH1O55znaUtvc/GaaIICOpKEBBdh50I70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxiatdHe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxiatdHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764997723; x=1796533723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4eZbh90/dXtI+RO+dqTkK2XlXBfTjz0i75FE3jkEPI=;
  b=kxiatdHexx7AOK20oyVHkcn+ygqxkW2UP0NQXzlDZYOQUj4TINKDLWNp
   E76kB85apLiNzBLr6oxks3KggX/9TL33PouKZYcPDDYdb8cRVEqdKvel6
   mKqvRuQ9gLIfvxS/tx5WU5nAQJQlCzDh3secQKsdC+JaBHiCBCMJwcFcQ
   cusOw80gk2PFk3w76oToZo88p6jDrpddG1BnsfO6RJCcU4ciXRhGQq499
   OCfxR+a1aDJaGA31TGUhQ2UsJuOSAvsowgmpoCwosWtAJ/GsPE0HAJzAb
   J055lH1l5zwPNYAZa6NJM0FE0KGMSIp/0dkS08l47Mx7qlUXfcRkMv3dc
   Q==;
X-CSE-ConnectionGUID: CNXFvN7vROisXN1R89PCNw==
X-CSE-MsgGUID: x+KWQZyMSkqRmA0tftO6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78495336"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78495336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:08:42 -0800
X-CSE-ConnectionGUID: I4OZjqtfTXK8E7qqm+r7kg==
X-CSE-MsgGUID: 7J5EECH7QGWKBstfAoTTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199911933"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 21:08:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRkX6-00000000Fs9-3wHJ;
	Sat, 06 Dec 2025 05:08:36 +0000
Date: Sat, 6 Dec 2025 13:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	vbabka@suse.cz, harry.yoo@oracle.com, da.gomez@kernel.org,
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload if
 profiling was not enabled
Message-ID: <202512061207.7zufoIcC-lkp@intel.com>
References: <20251204220957.360838-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204220957.360838-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f43be96f919cc611dcb2a4e38dd464831f4513e]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-skip-rcu-barrier-on-module-unload-if-profiling-was-not-enabled/20251205-061310
base:   3f43be96f919cc611dcb2a4e38dd464831f4513e
patch link:    https://lore.kernel.org/r/20251204220957.360838-1-surenb%40google.com
patch subject: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload if profiling was not enabled
config: parisc-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061207.7zufoIcC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061207.7zufoIcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061207.7zufoIcC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/codetag.c:37:13: warning: 'flush_rcu_on_module_unload' defined but not used [-Wunused-variable]
      37 | static bool flush_rcu_on_module_unload;
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_rcu_on_module_unload +37 lib/codetag.c

    34	
    35	static DEFINE_MUTEX(codetag_lock);
    36	static LIST_HEAD(codetag_types);
  > 37	static bool flush_rcu_on_module_unload;
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
