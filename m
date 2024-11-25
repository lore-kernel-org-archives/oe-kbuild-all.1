Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284318D64B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526008; cv=none; b=dU4ccH9DO8PyOMKjPhSa3awulfHkJOE5Y95IUKJ45EMT/3Kkl6FSIuIrYm0G7x20D/kLwXnTa9YLYywGR1JKbRY6/2UHsqfkzW4ta3jaT7DBVNWsewFImtAGNHGkSnM+hzVJStfnzFUtEuAiBYAOhUEw8Lu39yKuBq27D99qhQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526008; c=relaxed/simple;
	bh=DkJf5AMP4d9vjOyHUcqRwcO2sqcLziDFuR/lAQOnWv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2F2iFbsnBLuM/UlUpDrE31lFhaDZOfBTmqA8FDaLWkL3XZ3a8EB19tsSePMzsXex7d202d9i4N50XAxi31qawS1IAPSQd/1x3Bqe6XG9pGFWZwGTFnGn4EuciRSDXEDh9Eu/y9yFp2FbIQ4G0lROkFbaI4Z/IRP6EMHFJVWjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQv5gex+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQv5gex+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732526006; x=1764062006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DkJf5AMP4d9vjOyHUcqRwcO2sqcLziDFuR/lAQOnWv4=;
  b=RQv5gex+kEcE4lUKcPDKx/n0dQwSEjLz5o4Evy0aSa2Fa3AcJTJt7apQ
   ybtvEoW/xt2Bq+nOETW16ID7j1l7RZ8uNovzMs35DdSPodPd55YSseckA
   yjZuu3Mp1c/xT+CwqfdmWeIVtPA2Nn+bvMoNPj9CGW9sxo6XXmX/KtgRV
   GNBKJL2U6SG5n/uHIZgHNIr7dSZjkflLE17zR3IP2TgiQHmtvWel02qmE
   dmlvNUI6ADRN62nsyHzVbYro+Ll7NmjuKpkX5rymM20Lyzttsk3pA5EgN
   7FxW88QJ3LUYRjp7AHsb3orVk7vmJJGqBObHCXec6zd8XBhhQjUbe5N4d
   g==;
X-CSE-ConnectionGUID: wb+3CQKHQcCGFI3AjDN14A==
X-CSE-MsgGUID: vQo+1D5cQaO3I3156NxxCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43241115"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43241115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:13:26 -0800
X-CSE-ConnectionGUID: 9plhBgB1T1SifwCarbiKAg==
X-CSE-MsgGUID: 4S47R/QiTyuBtbw1C/YStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90836452"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2024 01:13:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFV9m-00066j-2Y;
	Mon, 25 Nov 2024 09:13:22 +0000
Date: Mon, 25 Nov 2024 17:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 03/12] RDMA/bnxt_re: Remove deliver net device event
Message-ID: <202411251625.VrcLuTRx-lkp@intel.com>
References: <20241122105308.2150505-4-huangjunxian6@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122105308.2150505-4-huangjunxian6@hisilicon.com>

Hi Junxian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[cannot apply to linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxian-Huang/RDMA-core-Add-ib_query_netdev_port-to-query-netdev-port-by-IB-device/20241125-101856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20241122105308.2150505-4-huangjunxian6%40hisilicon.com
patch subject: [PATCH RFC 03/12] RDMA/bnxt_re: Remove deliver net device event
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241125/202411251625.VrcLuTRx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251625.VrcLuTRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251625.VrcLuTRx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/main.c:838:28: warning: 'bnxt_re_from_netdev' defined but not used [-Wunused-function]
     838 | static struct bnxt_re_dev *bnxt_re_from_netdev(struct net_device *netdev)
         |                            ^~~~~~~~~~~~~~~~~~~


vim +/bnxt_re_from_netdev +838 drivers/infiniband/hw/bnxt_re/main.c

1ac5a404797523 Selvin Xavier 2017-02-10  837  
1ac5a404797523 Selvin Xavier 2017-02-10 @838  static struct bnxt_re_dev *bnxt_re_from_netdev(struct net_device *netdev)
1ac5a404797523 Selvin Xavier 2017-02-10  839  {
66832705c4d01e Selvin Xavier 2020-02-26  840  	struct ib_device *ibdev =
66832705c4d01e Selvin Xavier 2020-02-26  841  		ib_device_get_by_netdev(netdev, RDMA_DRIVER_BNXT_RE);
66832705c4d01e Selvin Xavier 2020-02-26  842  	if (!ibdev)
1ac5a404797523 Selvin Xavier 2017-02-10  843  		return NULL;
66832705c4d01e Selvin Xavier 2020-02-26  844  
66832705c4d01e Selvin Xavier 2020-02-26  845  	return container_of(ibdev, struct bnxt_re_dev, ibdev);
1ac5a404797523 Selvin Xavier 2017-02-10  846  }
1ac5a404797523 Selvin Xavier 2017-02-10  847  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
