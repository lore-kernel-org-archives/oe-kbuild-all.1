Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D102747773
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMJSoWA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701347113; x=1732883113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3GGjppcJ/Mo+AqDpyx9FY1mOLuRqGSqSJ55FGLclXEQ=;
  b=YMJSoWA7ySqydHjBap5oPgsNovs8/ShM3iO0S7w37bfmSyzQ7mi2RAmk
   XmVL+rqne1vW3i0jIy7UB9qUH5aBQ4aORyErL0+zdf7GYQi3hATCwKBT2
   DhgiHENd7vlan2rh69LK8gdya56s6JMevIFy0jINKSgpYXSpJ8Ygo4zo+
   AMauQ5tulQfRAj8lGgT/n8mPrEsS7iOmSGS/5QA6a7UJ6Wsi3UX9cfaXy
   9lxPSRIdGcfW64rVEW8qwTIunwDNzgtDM/AbO40oLtut+Wj6TMTeqm+oq
   7zu1LhYG+yLZUU0i8K/PowslbRu8K5sQqBR4rscaqizuhyjMzgV70/qro
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393059321"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="393059321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942696269"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942696269"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 04:25:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8g6L-0001sU-2E;
	Thu, 30 Nov 2023 12:25:05 +0000
Date: Thu, 30 Nov 2023 20:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>,
	Matt Coster <matt.coster@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>
Subject: [linux-next:master 2075/4102]
 drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning:
 'pvr_fw_trace_group_mask_fops' defined but not used
Message-ID: <202311302054.MVYPxFCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cd3fe06ff81cfb3a969acb12a56796cff5af23d
commit: cb56cd61086645e46cc54d1837de803b1c471df6 [2075/4102] drm/imagination: Add firmware trace to debugfs
config: arm64-randconfig-r051-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302054.MVYPxFCE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302054.MVYPxFCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302054.MVYPxFCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning: 'pvr_fw_trace_group_mask_fops' defined but not used [-Wunused-const-variable=]
     205 | static const struct file_operations pvr_fw_trace_group_mask_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pvr_fw_trace_group_mask_fops +205 drivers/gpu/drm/imagination/pvr_fw_trace.c

   204	
 > 205	static const struct file_operations pvr_fw_trace_group_mask_fops = {
   206		.owner = THIS_MODULE,
   207		.open = fw_trace_group_mask_open,
   208		.read = seq_read,
   209		.write = fw_trace_group_mask_write,
   210		.llseek = default_llseek,
   211		.release = single_release,
   212	};
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
