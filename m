Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87213379C20
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925047; cv=none; b=Lzrz5X9II1LNBTlN/xUb80NvVF8sFJUqOTfzNWK0N0lzw90B/gHcUKITUqCfmYGQLo2jcH+D9yLPyav4vhhmkCRLioQkNkZlS5pn5/xDuFEgxqvTE1hpuvnHsacw2uaRd28wZOOXd37zDbHMmJo2CJoqrXxafLIF1U6yJjSBzmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925047; c=relaxed/simple;
	bh=thnABHiUd6u2qgsA7mIvkdMc0X5pwcr9n+GekgvDUZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEO5zlHuwiydbaTzyBtzVJC2wNdcJEMnb6beHxjNvoShDVJFeN7mcpQfn/TT3qZF5AYoRnijURoK1BATT1V8YvFzFqppq+S9zsOxW2fppKxvVaIjsI4aaVPHTOjah50QRDWkqwJmKIQEjmmgcvodNFBr9CcQKSeV+XX9l64dVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPcUlJqN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPcUlJqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782925046; x=1814461046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=thnABHiUd6u2qgsA7mIvkdMc0X5pwcr9n+GekgvDUZY=;
  b=CPcUlJqNf9WTWhwG0PMojLuupK5E6T8Mcdl10hqeAPLt9ZM6J4q3umD8
   ddfZfWiljon07d63UAFf8Nq4HAdHPI8MtExApG9tEZjrOPkIixRWRneew
   h73wJnt0k9rxM5w6TmyFY7jSLeQyCAhzNWbeGk3ZFssVVcTeHyaDgt0EO
   FiixXt81kPb+clFVdnCKAXnGrcRqAoMwck/oAuj0PLnqqeSHIADVhRf2r
   1KHuju61LFoHB8yR8rJkIwthaKHId4zFAlyHA9K3evC5wt2fT85qFgiz5
   U3lqh2pFSW6XG9eP4r0VFW/HQpnI3OMnGHbnTVFnm/C3qzSVF4sQD5iwi
   w==;
X-CSE-ConnectionGUID: yJAfYGKLTSqkKAl82rUpDA==
X-CSE-MsgGUID: P2wNiJqvTd6owmf4h326ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83538292"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83538292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 09:57:26 -0700
X-CSE-ConnectionGUID: /HWo8nqXRpuP8BMJWbztxA==
X-CSE-MsgGUID: B+K3U9cvSnOHdRUMWH73jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248635787"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 09:57:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weyFU-000000009Ul-3TD8;
	Wed, 01 Jul 2026 16:57:20 +0000
Date: Thu, 2 Jul 2026 00:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next] net: hns3: add VF representor for tc flower
 queue selection
Message-ID: <202607020021.909sTNav-lkp@intel.com>
References: <20260701130806.695180-1-shaojijie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701130806.695180-1-shaojijie@huawei.com>

Hi Jijie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1c664ec4b9ea827b609d296921ed5bad8a40a158]

url:    https://github.com/intel-lab-lkp/linux/commits/Jijie-Shao/net-hns3-add-VF-representor-for-tc-flower-queue-selection/20260701-213500
base:   1c664ec4b9ea827b609d296921ed5bad8a40a158
patch link:    https://lore.kernel.org/r/20260701130806.695180-1-shaojijie%40huawei.com
patch subject: [PATCH RFC net-next] net: hns3: add VF representor for tc flower queue selection
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607020021.909sTNav-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020021.909sTNav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020021.909sTNav-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_vf_rep.c: In function 'hclge_create_vf_reps':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_vf_rep.c:107:45: warning: '_rep' directive output may be truncated writing 4 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
     107 |                 snprintf(name, IFNAMSIZ, "%s_rep%d",
         |                                             ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_vf_rep.c:107:42: note: directive argument in the range [0, 2147483646]
     107 |                 snprintf(name, IFNAMSIZ, "%s_rep%d",
         |                                          ^~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_vf_rep.c:107:17: note: 'snprintf' output between 6 and 30 bytes into a destination of size 16
     107 |                 snprintf(name, IFNAMSIZ, "%s_rep%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     108 |                          hdev->vport[0].nic.netdev->name, i);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_rep +107 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_vf_rep.c

    89	
    90	int hclge_create_vf_reps(struct hnae3_ae_dev *ae_dev, int num_vfs)
    91	{
    92		struct hclge_dev *hdev = ae_dev->priv;
    93		struct hclge_vf_rep *vf_rep;
    94		struct net_device *ndev;
    95		char name[IFNAMSIZ];
    96		int ret, i;
    97	
    98		if (!num_vfs)
    99			return 0;
   100	
   101		hdev->vf_reps = kcalloc(num_vfs, sizeof(struct hclge_vf_rep *),
   102					GFP_KERNEL);
   103		if (!hdev->vf_reps)
   104			return -ENOMEM;
   105	
   106		for (i = 0; i < num_vfs; i++) {
 > 107			snprintf(name, IFNAMSIZ, "%s_rep%d",
   108				 hdev->vport[0].nic.netdev->name, i);
   109			ndev = alloc_netdev(sizeof(struct hclge_vf_rep), name,
   110					    NET_NAME_UNKNOWN, ether_setup);
   111			if (!ndev) {
   112				ret = -ENOMEM;
   113				goto err;
   114			}
   115	
   116			hclge_vf_rep_net_setup(ndev);
   117	
   118			vf_rep = netdev_priv(ndev);
   119			vf_rep->hdev = hdev;
   120			vf_rep->vport = &hdev->vport[i + HCLGE_VF_VPORT_START_NUM];
   121			vf_rep->netdev = ndev;
   122	
   123			ret = register_netdev(ndev);
   124			if (ret) {
   125				free_netdev(ndev);
   126				goto err;
   127			}
   128	
   129			hdev->vf_reps[i] = vf_rep;
   130		}
   131	
   132		hdev->num_vf_reps = num_vfs;
   133		return 0;
   134	
   135	err:
   136		while (i--)
   137			unregister_netdev(hdev->vf_reps[i]->netdev);
   138		kfree(hdev->vf_reps);
   139		hdev->vf_reps = NULL;
   140		return ret;
   141	}
   142	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
