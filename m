Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C1381DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710154188; cv=none; b=bP1sCEnrEpdd3AXtBZxIGwmGcTXj6BwnuFAPW0w7f2fcGtjDR2PtVs1Xn9tr2tJ+3wP8lueIFCGEgDVv5+TZnujbKRY8cxzeFQj0RNzJOGj9yzRHLO5aKi0ZsH/aU/6snnIhmgYvX5kRzOYghX4Ao+R0KU5PbzTCtZZ2vMYKP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710154188; c=relaxed/simple;
	bh=+F0zakyZG2c4wMQk+17l/SpaNrpibOmQWtyl3KQCnnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QaSkp7tELgSs2I/+l1exd2FYAdsUdTE3AvrfJyHz2yUiClAZYxL37qrrC49vHJ1X1D+XpPZKR3h8aRkRyJV8R9+8J3jmnPYGVP0ICqGbpQyQke9gl3TrWHpDLIHTld9eLD549oaxaaGZCO6m/hXx4u10nMTJqy77lB7S+CCxr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7GSHJ9Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7GSHJ9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710154186; x=1741690186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+F0zakyZG2c4wMQk+17l/SpaNrpibOmQWtyl3KQCnnY=;
  b=a7GSHJ9Yu+NezT2M6pnPavQecFsuO640JhX5B6k9nIn4k+RofugeoVHa
   EvezM8zeywmETUwqf1H8sfHkPMkoiVwJaTkthTGsBaCk0vdhBsa8jTe+G
   VWMtv2qi2srusPJdgxYU++DCVoF1WHYkzCydxd6EU1GyIb3b8MlpGKvx0
   GqJftiAbUJDZA5elCWJ0PFFhN+Tzgrh7nmxjVA2miq1VvzNaKpXdnAbQG
   HbOazkoDH0TeUM1gcmCWtUUrhZh3tpQtQPr7S+nnH1wP3407qOF/1TZlh
   5yZESdFY5S0TpAy0P07UNIaP2zaM6qPd5F6ttmawq44nxZJxmmUNjtypP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8563371"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8563371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 03:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11552463"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 03:49:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjdDv-00095L-1s;
	Mon, 11 Mar 2024 10:49:39 +0000
Date: Mon, 11 Mar 2024 18:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 72/98] block/blk-cgroup.c:991:9: error: implicit
 declaration of function 'blkcg_dkstats_show_comm'; did you mean
 'blkcg_dkstats_show'?
Message-ID: <202403111809.k8yrtlP6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   7a0a83db002d240aaf4d8944c41aff4a2c2cb992
commit: 660e8c3de3cf153cd61c86479a730a56b67da7fc [72/98] cgroupfs: refactor cgroup resource statistics for reuse
config: x86_64-randconfig-012-20240311 (https://download.01.org/0day-ci/archive/20240311/202403111809.k8yrtlP6-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111809.k8yrtlP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111809.k8yrtlP6-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-cgroup.c: In function 'blkcg_dkstats_show':
>> block/blk-cgroup.c:991:9: error: implicit declaration of function 'blkcg_dkstats_show_comm'; did you mean 'blkcg_dkstats_show'? [-Werror=implicit-function-declaration]
     991 |  return blkcg_dkstats_show_comm(sf, v, blkcg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         blkcg_dkstats_show
   At top level:
   block/blk-cgroup.c:988:12: warning: 'blkcg_dkstats_show' defined but not used [-Wunused-function]
     988 | static int blkcg_dkstats_show(struct seq_file *sf, void *v)
         |            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +991 block/blk-cgroup.c

   987	
   988	static int blkcg_dkstats_show(struct seq_file *sf, void *v)
   989	{
   990		struct blkcg *blkcg = css_to_blkcg(seq_css(sf));
 > 991		return blkcg_dkstats_show_comm(sf, v, blkcg);
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
