Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31938F82
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782934; cv=none; b=IHM/V2kYPnbFlEjqNHC87ngInzzSFcFpfBr9CKKbLn4cXrfBTeJV7H27LEcm9I04mIfHOcEAycei2VYSOrpg4vAEF6XahdGtYqIcCJFHdWRm9/jguzXY3bi8eW09jDj1h4lPlihepkdiljz7IzCPJ0hnjcD06FCx+KejWCFXRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782934; c=relaxed/simple;
	bh=qbpf+Oixing9Z2yJiJvqvpNbSN8QzYn3DiOkgZNmxvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdlbQ4bELPhSuJP3QZ7cIKXiswWtUalM4tVDwapRRg9XmgiYrjbfIFJaCN/OIXAVfVGhlOx8NWIqRDBNi1EiKeueKB+0AkH2mjWvyUrU1HAcbn0r29KB0HBESHdUeHDq+Nr2du68SkmIu8hu29KWUyzrCjs6f1c2pha//HHh4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuHnA3vQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuHnA3vQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738782933; x=1770318933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbpf+Oixing9Z2yJiJvqvpNbSN8QzYn3DiOkgZNmxvo=;
  b=CuHnA3vQuAbjL7IvzX9rAOsV54+558Urg5rfOYO6/uZruFkxb4bvWWoC
   H4cv8JeTp6/yENKNoEZaz/2tCbunkP+ntEvsiv1cBpqzGc1FuUDdfb44G
   lHlbzP12OLmclRkL5FnWINpmHVIevjjVybcsK1XW5+ybV3ISMJo831ak+
   jqCIEB3CS59H6c+6Se5o5lOjePFsw6gzlcKt2By4HGpxTOCwN2JqBxB7U
   bkg5jJ1QjwIB5XM2FLY/N8p7J5ed4zb4nXws9BqjaMlyPl8LOYdfR+/8Z
   cNSFQQa9Bxii+tUBGaOsbz3nY2bbkzcaX8A5ZVSr05w9F5O4CjR/oDhg9
   A==;
X-CSE-ConnectionGUID: RzNDpAOWTuid95v3uUSWLw==
X-CSE-MsgGUID: VDQ280rJQfuIO3yYW3mncA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42202693"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="42202693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 11:15:30 -0800
X-CSE-ConnectionGUID: c7xckHJOTnqmdwo9jVhVfw==
X-CSE-MsgGUID: Xi124dl3Roid+FWNQqJmdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110838095"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2025 11:15:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfkru-000vyR-1x;
	Wed, 05 Feb 2025 19:15:26 +0000
Date: Thu, 6 Feb 2025 03:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/soc/mediatek/mtk-dvfsrc.c:139:5: warning: no previous prototype for
 function 'dvfsrc_get_required_opp_peak_bw'
Message-ID: <202502060345.XXR3I6Dk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: 4014ffff6b44438619d705ef34f0829617760be3 [192/192] CHROMIUM: soc: mediatek: vcore dvfs: add vcore dvfs driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502060345.XXR3I6Dk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060345.XXR3I6Dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060345.XXR3I6Dk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-dvfsrc.c:139:5: warning: no previous prototype for function 'dvfsrc_get_required_opp_peak_bw' [-Wmissing-prototypes]
     139 | u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
         |     ^
   drivers/soc/mediatek/mtk-dvfsrc.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
         | ^
         | static 
   1 warning generated.


vim +/dvfsrc_get_required_opp_peak_bw +139 drivers/soc/mediatek/mtk-dvfsrc.c

   124	
   125	#ifdef DVFSRC_OPP_BW_QUERY
   126	u32 dram_type;
   127	static inline struct device_node *dvfsrc_parse_required_opp(
   128		struct device_node *np, int index)
   129	{
   130		struct device_node *required_np;
   131	
   132		required_np = of_parse_phandle(np, "required-opps", index);
   133		if (unlikely(!required_np)) {
   134			pr_notice("%s: Unable to parse required-opps: %pOF, index: %d\n",
   135			       __func__, np, index);
   136		}
   137		return required_np;
   138	}
 > 139	u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
   140	{
   141		struct device_node *required_np;
   142		u32 peak_bw = 0;
   143	
   144		required_np = dvfsrc_parse_required_opp(np, index);
   145		if (!required_np)
   146			return 0;
   147	
   148		if (of_property_read_u32_index(required_np, "opp-peak-KBps", dram_type, &peak_bw))
   149			pr_info("%s: get fail\n", __func__);
   150	
   151		of_node_put(required_np);
   152		return peak_bw;
   153	}
   154	EXPORT_SYMBOL(dvfsrc_get_required_opp_peak_bw);
   155	#endif
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
