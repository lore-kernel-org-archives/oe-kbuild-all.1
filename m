Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F582FC21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFMOWPTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840547; x=1732376547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rk2f9rTTzCcdlEJAvgjLk4TKr6joCWJcKPDGHFrVngs=;
  b=eFMOWPTadQCKUwwbv+rjqAwH2Ho13FWkgUOjTukqES8G9Nn496cPfXZC
   QWKSmTLmu9il5XPUH49Z2Z5SpuZ3Im66AFbXydVWI6jnhVH1oeesFb1GO
   ciFm6SqPqN98lQJLR9Hmd+8AbHUBLpiZO7Jw7ZJRTONrD1xiiz5gNNb9I
   enx6jiTdAHski0ROu8f5cKZAMxMXDpxBIeHHtP+H9klX2WWYLeVRlAHdm
   Ik82sKsN/sxbYX+ApzjBPnqelkkySeUfRz+wZJLhOaq0bKPYXBc3eC2cQ
   +99BHxQIc1OSNmHyYSbOEITaxTC3LR5g8QLoiONRCM250lekLp4PlJGAA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257437"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257437"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510981"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510981"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002yY-0b;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the
 memory consistency model
Message-ID: <202311242003.esZBgqBn-lkp@intel.com>
References: <20231124072142.2786653-4-christoph.muellner@vrull.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124072142.2786653-4-christoph.muellner@vrull.eu>

Hi Christoph,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Muellner/RISC-V-Add-basic-Ssdtso-support/20231124-153009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231124072142.2786653-4-christoph.muellner%40vrull.eu
patch subject: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the memory consistency model
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311242003.esZBgqBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242003.esZBgqBn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/mm/dynamic-memory-consistency-model.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
