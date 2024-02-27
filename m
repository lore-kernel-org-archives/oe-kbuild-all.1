Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A511BF24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 02:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709001343; cv=none; b=l4NJi50h2svHcwVOVOqsKAeKCQfLNO7D/amyoOkvtfQ96Oehys/IZYO3eKs/8CLpHHVKcp1PJUlFriUSORPC85ME+HlciMiyI5FGN/llnLd278Mm7Nq9FmYvyzFqLdNY/p2FNNSXH4WLigCMTYwU9bOS/ibr7nGe+8jvd+04MQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709001343; c=relaxed/simple;
	bh=Vjm+KtkUaMlwv8pQwmv0OVq4LV/2ziuFgqNgcx8kgUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhF1QWaqUWjL+B7t/qnEi/rraXUhxcagstME4uOvd0Y1viz+zj/WC3EgCpZ7ksIHyYqNhfvLJOilZ/PEAsPMvlB5PDjg40CGNXR/0Vf7dqcVPl9KLYrhROH3VVWCJtnf2ydk/LkNQ33jWwck5mTd1MbLuHqgfLs8rR0f+hVjd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGy7hy1e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGy7hy1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709001341; x=1740537341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vjm+KtkUaMlwv8pQwmv0OVq4LV/2ziuFgqNgcx8kgUo=;
  b=HGy7hy1efMu7z/Mmxm2oQYJMi6kTfngZZWBs1KPc2uoJGNJWOUN2I41u
   0tvqqgKaxma31L+vEru/zyLPSsOeS4nOFVzLjwmTs78qieVLg7vTCILwi
   rcd9xmzVasM040dEH3IipKifsq6wg7rjc9zxWIP9h2Dlrk4B4/NbtuJsT
   eKmqutoLx5NCW1Chig7E4LaRAyipL59h9m9+Uu0e9VYq1jnZfzyg6cm7H
   AEFKfWJNcTZ1qerqe62CYmusum0V9vvgycqWtXPybqdhH1H8N5TfWDWcg
   JjBPkImA1zekG+f3CrHPl1De3pQY8HSuV4QzEG3a6R+Zw06aPeEqHhwzs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3185960"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3185960"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 18:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7238604"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2024 18:35:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1renJg-000As3-2K;
	Tue, 27 Feb 2024 02:35:36 +0000
Date: Tue, 27 Feb 2024 10:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Juan Zhou <zhoujuan51@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3384/3397]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:4835:5: warning: no previous
 prototype for 'hns_roce_hw_v2_get_dscp'
Message-ID: <202402271032.NbR2jDIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   038c00b1896898752288ca81d9cac182afc6d6ab
commit: d0acb51bbfac2c66a43ca337314ba8611701b6c8 [3384/3397] RDMA/hns: Support DSCP of userspace
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240227/202402271032.NbR2jDIl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271032.NbR2jDIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271032.NbR2jDIl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:4835:5: warning: no previous prototype for 'hns_roce_hw_v2_get_dscp' [-Wmissing-prototypes]
    4835 | int hns_roce_hw_v2_get_dscp(struct hns_roce_dev *hr_dev, u8 dscp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/hns_roce_hw_v2_get_dscp +4835 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

  4834	
> 4835	int hns_roce_hw_v2_get_dscp(struct hns_roce_dev *hr_dev, u8 dscp,
  4836				    u8 *tc_mode, u8 *priority)
  4837	{
  4838		struct hns_roce_v2_priv *priv = hr_dev->priv;
  4839		struct hnae3_handle *handle = priv->handle;
  4840		const struct hnae3_ae_ops *ops = handle->ae_algo->ops;
  4841	
  4842		if (!ops->get_dscp_prio)
  4843			return -EOPNOTSUPP;
  4844	
  4845		return ops->get_dscp_prio(handle, dscp, tc_mode, priority);
  4846	}
  4847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
