Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EA211707
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007175; cv=none; b=AkqN0klcTDuOyHcwDg0zoIs+nn1anw0werk5N30cV5vF9Y8zG6m29lr0OBiB8JhEfpNshZrL+NzFbyqYbnmRVd9wt41keVWf5vfod0A+fo5V6ZDhsMWzEg0Ru4CrnNP8FaZ4Vj/DjmyaDDGyB45ttCCQnbjQHDJEyC43hmqqHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007175; c=relaxed/simple;
	bh=mdOR8kfhKuJxf47oTNkW7uaBZdNrbqSGR94RuIvDhVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrKLFE4jBC5FHMsYgk/EqS1n2tDvK2x82dR17EWnkNchdQV58j6FOdCufcOFAo44tzABDLC9f93kk8UosVHGNIIjy0W4UbhyjwRE0yS987yfjrdPaIreNoDufi2tjxc0j9le1LypZfUaAUHNlpzwpRRBlDoeTmiT71Qy/s6WYhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDL2H0QM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDL2H0QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741007174; x=1772543174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdOR8kfhKuJxf47oTNkW7uaBZdNrbqSGR94RuIvDhVI=;
  b=BDL2H0QMNEU9xZo09fk6wq7vdO7u6awwrDjJs+8YSB48tOSzMrgda6PX
   C0sZVY0U/zpaIviiEzhOP/o4d04YhOIueR2oU/TxKDQQKHUFO2ZHj/irp
   aioPhB5UotWPOl/RvX1/zRrL0lwUUewrZkIGOfmqD2ftaDIFoLUfUWehz
   svbzAh6Zfu1SyhxHwCKn3WGDTuYNJZU8Mf0QPm/AJKJn60Qob8lwMj+qv
   GRPTy63ujVJN9urCb36mFm9AxXrZopklWpf1tcnY6bcDK7dtwpFhIs4hq
   oOtQzDSD94yhjYQY6mL89Gb46XlUnvB8W/Lj1Uycr9wYF/iI3xOxrpHFy
   A==;
X-CSE-ConnectionGUID: M/rfwH47QyG+AHZfgV3/cQ==
X-CSE-MsgGUID: EV0I7FazRkiTlCDxubaDpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41733893"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41733893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:06:13 -0800
X-CSE-ConnectionGUID: UFApUoekT2uBCy4sYKtZWA==
X-CSE-MsgGUID: mVZy7JgiSIaRxuiuN3eJvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117795082"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Mar 2025 05:06:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp5Un-000IWK-1O;
	Mon, 03 Mar 2025 13:06:09 +0000
Date: Mon, 3 Mar 2025 21:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345]
 net/netfilter/nf_nat_proto.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202503032046.ehJfxCPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df3541670ca99b09f2f70d1733516ef7a2289b29
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [1345/1345] netfilter: nat: remove csum_recalc hook
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20250303/202503032046.ehJfxCPP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032046.ehJfxCPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032046.ehJfxCPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for function 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^
   net/netfilter/nf_nat_proto.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         | ^
         | static 
   1 warning generated.
>> net/netfilter/nf_nat_proto.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
