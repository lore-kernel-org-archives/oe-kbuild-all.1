Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B014F8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnX8DLQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697627438; x=1729163438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2eFgv4ub6r3lqOiSpkPPRvgr18WwP8wFra4nlBpc6Ro=;
  b=QnX8DLQyx+/kjW65/z9ypC38DwQnp3IEC962zf6kYVKQlSw6LH1hBN3+
   +Bmgrb30vy2CvIA5h5Sahs2OwK+aL1byjcLahbPXioDI6ad+xvThVQJNb
   0CWlyApmRMb3eb6pW7G1fB8urugbIgYJC/WMPfHVtKckat/aorIF4nzJc
   5+C0TU+BKLD65hBZq0++pX1vk5OzD1EY+pzvcFdNGR+C/ZJNTVukcTpfz
   SQFzTUln8Zta/oT+PvDYBodE0gzOFeXG2nuBs10813B6KnarxSHK38ctS
   BFQnvEH9AmcckO+OJYPsb0tRJVVkze9oGU5nmR8fckvxYzXK7Yyx7Mjqa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385823366"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="385823366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="930147830"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="930147830"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 04:10:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt4Rd-0000HI-1B;
	Wed, 18 Oct 2023 11:10:33 +0000
Date: Wed, 18 Oct 2023 19:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Patrick Wang <patrick.wang.shcn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/7] mm: kmemleak: split __create_object into two
 functions
Message-ID: <202310181800.klUnXhvI-lkp@intel.com>
References: <20231018102952.3339837-5-liushixin2@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018102952.3339837-5-liushixin2@huawei.com>

Hi Liu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Shixin/bootmem-use-kmemleak_free_part_phys-in-put_page_bootmem/20231018-173249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231018102952.3339837-5-liushixin2%40huawei.com
patch subject: [PATCH v3 4/7] mm: kmemleak: split __create_object into two functions
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181800.klUnXhvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181800.klUnXhvI-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#36: FILE: mm/kmemleak.c:626:
+static struct kmemleak_object * __alloc_object(gfp_t gfp)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
