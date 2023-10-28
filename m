Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7338C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iejclfp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698523479; x=1730059479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TkeMiECYuHik6VsHLFL+PPZ8mjsRgN9kZefP9d9OPfo=;
  b=iejclfp1QDTaD1aO3Ig1iQVz4efRaVFq8IQJTPfIty5IHvK1iIJKNUho
   XcFjvwwZiFw9W0IxMQMq6ma4krxNCF/LIsWKeLfiq269Q5tjGI2IHSGPQ
   ZmCvKBP+Q+K1jF31mFg5tNCUPNAXbMKuCqfjtfEFOxacAbQ12DJWJT+Xd
   Lf9iAc/J3kCoI3VsnLIMUMRHpMt9Bemr1PX+UAkYHyORY1px4x5WYQCCt
   CXgTv3IkCKJqmK+kc5SCfscbh4nDXMnTYAs7FVJoZAl0EzPqjXW6cL1ZR
   2Ip4SXXdCNnQ/7c6tisaD/6rLNsAOPbDTNdinQ8cnw4Mz0yCyx/y1Su/Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="6548999"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="6548999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 13:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763542270"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="763542270"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Oct 2023 13:04:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwpXu-000C2p-20;
	Sat, 28 Oct 2023 20:04:34 +0000
Date: Sun, 29 Oct 2023 04:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] rust: types: Add read_once and write_once
Message-ID: <202310290344.AQCvYxXt-lkp@intel.com>
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025195339.1431894-1-boqun.feng@gmail.com>

Hi Boqun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boqun-Feng/rust-types-Add-read_once-and-write_once/20231026-035626
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20231025195339.1431894-1-boqun.feng%40gmail.com
patch subject: [RFC] rust: types: Add read_once and write_once
reproduce: (https://download.01.org/0day-ci/archive/20231029/202310290344.AQCvYxXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290344.AQCvYxXt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: rust/kernel/types.rs references a file that doesn't exist: tools/memory-memory/Documentation/access-marking.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
