Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A992E402
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 23:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QChp3Emx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697583930; x=1729119930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MrDYjBcjorP7QGjbHSEE9MCQa4rpswbwKsRTmPsNSEM=;
  b=QChp3EmxOgs9JRn0jcleUaVMbUxXHr86785ec7vTzPyAdDofQuqYUTxX
   DMmYYznPVbXJEQczOsDPvgHPm6lP7xwpRmEcv9WoLjt/gAtqt2nix8sQc
   BO19JVJriBqqapVnio3qMfxcR7TiTc1hUu0fM4m6ehx+LQb4bhkpgVjDK
   hwcfN62TJTYfctvCagj3OPCT8sdTfdMsMMHbYOlzwrVe+gr2Ra0Ql6/kw
   BEQm7tdJ0W6E2i39AfHG74rqLm98SLnQgaTvdFs5IDVZ5zFpnLG3cXMoT
   pZDHnwDBj+KkHGAhMkLhGBnhymcx4qG5YoLYuxTtaQut0FCKsKRx689Zb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366154025"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="366154025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="4109715"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Oct 2023 16:04:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qst7t-000ACh-2N;
	Tue, 17 Oct 2023 23:05:25 +0000
Date: Wed, 18 Oct 2023 07:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 11/14] scsi_debug: Rework subpage code error handling
Message-ID: <202310180625.WS8qZdmF-lkp@intel.com>
References: <20231017204739.3409052-12-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017204739.3409052-12-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/fs-Move-enum-rw_hint-into-a-new-header-file/20231018-045042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017204739.3409052-12-bvanassche%40acm.org
patch subject: [PATCH v3 11/14] scsi_debug: Rework subpage code error handling
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180625.WS8qZdmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180625.WS8qZdmF-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#123: FILE: drivers/scsi/scsi_debug.c:2460:
+		if (0xff == subpcode) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
