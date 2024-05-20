Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F3468E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716204820; cv=none; b=n8z9CMNIqDfEI0ZJKn0zAaKzYTb6WxBLa7rkciEPMtFpoV+uBxV6Kgv8ksl5+g8Vvfie5OvWFBAIHgQty8f2jk4A7IyWMI6OrF28ejECNLVdXEvxr61p8nez3BIShgKdDuUSC6Ma3QOFwT8ZSktNRJKHN2VuHV+ndnPmdny6YAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716204820; c=relaxed/simple;
	bh=sMjCfV2JwM4Ydyx/0nRw1yshbQM7kSDv3V6vePeUEDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QAMrY/J10+6VsrNzfleLaSs0IKYzmxrTjrxEwVjsZKPvHbjxaxduMy55RLwMSEkUIJrAVeHQD8df0Nl4X7caiwlFfKJM7q+uYwAytB00toFmY71eXvM4ABHSlYFZK0jG0U+gNNdqejoWB+b/QpHApBdWIOYw/uVXXKpzSD9V2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOTME8DY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOTME8DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716204818; x=1747740818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMjCfV2JwM4Ydyx/0nRw1yshbQM7kSDv3V6vePeUEDs=;
  b=VOTME8DYdpzfXCh8Y0JyyqIcLuV0wWP3YJUsSxAALVQEsnGtCfeR6nke
   dbZhn7X+w6/jNwESAGSB7cv5se++vT83qCfYz92SrU8ffCAslMGr+Eq0h
   j4HKISWC/chAavu+N6NRuATd3uMvVbMtkV0xg4+uy7pUsSykFZDLAycMj
   XVWin9EV5HfwDdfOKEHGHBKVs8ZTxVuLuYGOWuNxn/j3v//VO3GvUhJI2
   P6+ZU9h5hFJX5NOGq48JcRRsEgVvXwR65IuCk1T7fl2AFurJI6+39fSBj
   aXTRyVKMFXRvgc06U3J8nhAJWfj7pBEcshFgHs64UKdJFCPjev+7ZNQBI
   w==;
X-CSE-ConnectionGUID: g1ZiE5K9QxGBQbP3GHJnMg==
X-CSE-MsgGUID: HoCx6hAuR3icuP9+wwzoag==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23741134"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="23741134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 04:33:37 -0700
X-CSE-ConnectionGUID: +hNcAAuARK+wIVAAmv1p0Q==
X-CSE-MsgGUID: av6htfLTRJGa/o4CWbTjOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32364288"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 04:33:35 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s91GX-0004pw-27;
	Mon, 20 May 2024 11:33:27 +0000
Date: Mon, 20 May 2024 19:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9619/9669]
 arch/x86/kernel/zhaoxin_kh40000.c:47:30: warning: bitwise or with non-zero
 value always evaluates to true
Message-ID: <202405201915.EtSGIZ33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9619/9669] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240520/202405201915.EtSGIZ33-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201915.EtSGIZ33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405201915.EtSGIZ33-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/zhaoxin_kh40000.c:47:30: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
      47 |         if (ZHAOXIN_P2CW_NODE_CHECK | zhaoxin_patch_code)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +47 arch/x86/kernel/zhaoxin_kh40000.c

    36	
    37	static int __init zhaoxin_patch_code_setup(char *str)
    38	{
    39		int err = kstrtoul(str, 0, &zhaoxin_patch_code);
    40	
    41		if (err || (zhaoxin_patch_code > ZHAOXIN_PATCH_CODE_MAX)) {
    42			pr_err("cmdline 'zhaoxin_patch_bitmask=%s' inappropriate\n", str);
    43			zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
    44			return err;
    45		}
    46	
  > 47		if (ZHAOXIN_P2CW_NODE_CHECK | zhaoxin_patch_code)
    48			pr_info("zhaoxin dma patch node check is enabled\n");
    49	
    50		return 0;
    51	}
    52	__setup("zhaoxin_patch_bitmask=", zhaoxin_patch_code_setup);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
