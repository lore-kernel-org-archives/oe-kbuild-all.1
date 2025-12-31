Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046122745E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767155534; cv=none; b=USIWL7pP2Pz3Jt8/7s8Io2eTq/Fi36fRs3lXC0lB1pOeZ92IJjYgsrWiknpHx6ULE/apNUOu6ktyyGeG8+47Ap0tRmW8grY9Oa4Bw3n/FD0UXIR8eonDS8PtqPpCMalagJVKj3KSouaLsBTK6dICNFcIj97+NNlxXuaRY9ZCp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767155534; c=relaxed/simple;
	bh=CeP7lUE4AwdJFyppjMXpVRO71tO34EVrcShKVXrgF2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MfQo1Zs8IxZH2wWfDfiW0aQ5HLiYFGtxEef+dgJg27fYQsTcFJ62CoSWI4sql/UwRDdL78gr7DuNK8nSDugE6T/ypIM1L824N+VbHuKPTresWtz3G5FLCLtiHIEZOIx3wysJeIKWU7rNkKHGs67gfuqLC6QrIMxHOzDiN1vsnGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juK61uG/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juK61uG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767155533; x=1798691533;
  h=date:from:to:cc:subject:message-id;
  bh=CeP7lUE4AwdJFyppjMXpVRO71tO34EVrcShKVXrgF2Y=;
  b=juK61uG/vwj1OkNlgphDy95PSOoDpzM+16YIR8wtdzzvNXY2fyqFCGy2
   s2HU9CiTOqxQi9Pwu2grLGVl77w0WIfKtl3bjnrsSbkfEykUFQzitEjzE
   xseTfQh7nQ9XXQ8mMn97kf1Ni0uYHAiuxYOibmhJxa9ORMPutOjQkrjU+
   Dtw1toR+oALFd4molpwj0QbFd4miO16/iul49/KLJGFfR2AwOAmQiDUC7
   0vEgMQLVrLMPZk2CBpOsjuJJoCGFffuXzk9DW1Z66brhPHFOZFnb+1idk
   gJul5zO0lMMr5PyxTItODoyFqeoA8B2wv6bkAxczUXDw1LjbllZ9Rfm/y
   A==;
X-CSE-ConnectionGUID: fmxMvyOCQ5Gls8tZS4vpzg==
X-CSE-MsgGUID: Kb4rZOLARdqY4XIVMVd8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68801408"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="68801408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 20:32:12 -0800
X-CSE-ConnectionGUID: t5uOCg4MRkiUTS06GKZErw==
X-CSE-MsgGUID: dc8VKzi6QSSr5Ei2ldQ9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="201604404"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2025 20:32:11 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vansX-000000000xV-0Bw7;
	Wed, 31 Dec 2025 04:32:09 +0000
Date: Wed, 31 Dec 2025 12:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 42/42]
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:384:24: sparse: sparse: symbol
 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be static?
Message-ID: <202512311241.e1odboZQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   d75d8c5a748d301e1e49f1375041dafe5a910cb4
commit: 8d0f798862731c62b09e7138a9032964d70566c2 [42/42] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: arm-randconfig-r111-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311241.e1odboZQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311241.e1odboZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311241.e1odboZQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:384:24: sparse: sparse: symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be static?
--
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse: sparse: symbol 'mtk_hdmi_v2_clk_names' was not declared. Should it be static?

vim +/mtk_hdmi_ddc_v2_driver +384 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

   383	
 > 384	struct platform_driver mtk_hdmi_ddc_v2_driver = {
   385		.probe = mtk_hdmi_ddc_v2_probe,
   386		.driver = {
   387			.name = "mediatek-hdmi-ddc-v2",
   388			.of_match_table = mtk_hdmi_ddc_v2_match,
   389		},
   390	};
   391	module_platform_driver(mtk_hdmi_ddc_v2_driver);
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
