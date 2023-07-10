Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D3156E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 22:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689029133; x=1720565133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qgwu8rOmjRd4oYWKL8FL2cfS0KRY8DdL7mWQSczX/jo=;
  b=apqc0kdh9Eje/b7nob1HMx/0svahUWmYiyFqHEIwEFGdNFR00SGqlV9Z
   XTywAi0pVIpSCpmRAr9VQ2cSFAYAqZt4yKujP47eBi0EBjg3S8DbhjdZP
   CgZZFGwQCsjVbO938BY0mtltMH+rIw/hzJYva0mjFMnNcnhT03ei2UD/9
   s8nxevhBcrbplSlz/gffqw61F8/TL0Im2LCtmDKKVII7/lJ10PDTHkf1l
   w8JhoePPgz8E9VNxt3INW9/kNNkjFYDxTwkrhvu6J9vBJnXRcRUFtgTuy
   sglADq+vRzpCRkvplKoDZw0y60WZvaDDRh2Tuk8lB3TKK49UXkCESS0AA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349280791"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="349280791"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 15:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790951845"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="790951845"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 15:45:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIzdK-00044W-0f;
	Mon, 10 Jul 2023 22:45:30 +0000
Date: Tue, 11 Jul 2023 06:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Documentation/gpu: Draft VM_BIND locking document
Message-ID: <202307110644.G0WAfAgD-lkp@intel.com>
References: <20230630164452.9228-1-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630164452.9228-1-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip linus/master v6.5-rc1 next-20230710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/Documentation-gpu-Draft-VM_BIND-locking-document/20230701-004608
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230630164452.9228-1-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH] Documentation/gpu: Draft VM_BIND locking document
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110644.G0WAfAgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110644.G0WAfAgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-vm-bind-locking.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
