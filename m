Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187EC15D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiebPcvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697336360; x=1728872360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vp2zWAsP3LoRVGqqUNhbqwII6Z4ftFNq9FkPJfZqduU=;
  b=IiebPcvyLnqosMULrj1EEmrXXBIQrTWO9V0nLAKlKJgqd5IE+On1b/Uk
   AyaCtatfBKp5TY+JDm7AchBSTTX4IbMX3Zlbm3LnuYAesxud+TLpKrpPz
   30kMxFbFxgcGI3tnSPgVtWhPdr2dWCuBFzEaJ4BjfD0EShKRrWkuTlnnZ
   1ggYmCF11F68BW/0Qi1vP2JZO/VP4stmJTysGJk29nOzZAT9JH4RAnCx1
   vOzh5jd2+aUKCGJpe5xaxDIj1/c+oSqTiCRDMiDvzJtGby2rrXij2ohl/
   gkno97Fn2kDZsGh+1kh4rE9vuIjulWCG/CD4JJAE2qCsrknGWlo9cMPbP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364721046"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364721046"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="928914667"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="928914667"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2023 19:19:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrqil-0006vd-3A;
	Sun, 15 Oct 2023 02:19:11 +0000
Date: Sun, 15 Oct 2023 10:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6827/29071] htmldocs: Warning:
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Message-ID: <202310151009.DGLdFfEc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   99d2841c81a763168b0a0bda36c03a032058038c
commit: 70ef2cc4d51e006d23e5d2559f395e1c1e4e7dbc [6827/29071] UPSTREAM: dt-bindings: memory: mediatek: Convert SMI to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151009.DGLdFfEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151009.DGLdFfEc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
