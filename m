Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19B20F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 23:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgPOUQ8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698537166; x=1730073166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdYR+HriRlOht5r4MaygUAf3s6zVVcrnfpDe/LRA3BA=;
  b=AgPOUQ8+kU7RgwaoZ82Ep5DFTHRwrXp6Bu/4CWEB8ZCSzbyIGPAOu/qb
   zNhiefkdqL0DXAsxQJp5nOEJfkNCIwGStC43t9NHOSblS4Rrpqhf+MP23
   BsokfCJdZF8bXC4et158veeBpzOLaozuV9UcwRKmPkl0khQ44irVrcEyA
   RKC9EA35az8WEox9Zby/09tZNqU+/VB4lV1qL/Fer5R/MFUgI0q5yhBW6
   BnsyMjGjHwQ4DLBTNkMKz6Ajd+75vkoNhWKmPS9VNH7YumBAc6xay1KvN
   42goo1+hfoLNKUBla5kZGZxUCfWv8S5pQu2PJasq8Gr0CAQWe+fosIIGf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454390466"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="454390466"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 16:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1007077005"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="1007077005"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Oct 2023 16:52:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwt6f-000CBT-2J;
	Sat, 28 Oct 2023 23:52:41 +0000
Date: Sun, 29 Oct 2023 07:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Harald Mommer <Harald.Mommer@opensynergy.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/3] virtio-spi: Add virtio-spi.h (V4 draft
 specification).
Message-ID: <202310290719.FXkIwPxS-lkp@intel.com>
References: <20231027161016.26625-3-Harald.Mommer@opensynergy.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027161016.26625-3-Harald.Mommer@opensynergy.com>

Hi Harald,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harald-Mommer/virtio-spi-Add-virtio-spi-h-V4-draft-specification/20231028-015225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20231027161016.26625-3-Harald.Mommer%40opensynergy.com
patch subject: [RFC PATCH v1 2/3] virtio-spi: Add virtio-spi.h (V4 draft specification).
config: x86_64-buildonly-randconfig-002-20231029 (https://download.01.org/0day-ci/archive/20231029/202310290719.FXkIwPxS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290719.FXkIwPxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290719.FXkIwPxS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/virtio_spi.h:13:1: error: C++ style comments are not allowed in ISO C90
      13 | // clang-format off
         | ^
   ./usr/include/linux/virtio_spi.h:13:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/virtio_spi.h:45:9: error: unknown type name 'u8'
      45 |         u8 cs_timing_setting_enable;
         |         ^~
   ./usr/include/linux/virtio_spi.h:47:9: error: unknown type name 'u8'
      47 |         u8 reserved[3];
         |         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
