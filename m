Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965323DB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709977467; cv=none; b=kQbujRmwwtG3uWnwnCgHhIhfmrPCbaNWV87zVD0MLh7UqFIHsGAihAQ2Fc8kAqkdnXW1TQ+M8HvWtdz7F8g8kqYXv2NxNSH8DlYOvn65wJni02pYBGBMrS6+zCzZ2E3yry2pfscBlsektznBh6EKbg7a/yDMPL9DS3Z3ttSSm4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709977467; c=relaxed/simple;
	bh=A6OFjPus9L4RyFGKl72F6tmjIUiRk6Wm+ak2sHGUr5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCbaN8dm7xU51GuKstzb9aT53YsgyGCQv9W+vEQVdZhsFQeZlrTI3RFJmc9w1WQUrcDPxf1Sw8mzCqoldg8kQ1ReyTeP3ngC51KBSIpb5JBdMs7KcpKOydx4pjeOuTEDKv8pZrD56CFZz8DLL4YXbMIttiCXne8vIa5cZBAcnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8T6z7yi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8T6z7yi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709977465; x=1741513465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6OFjPus9L4RyFGKl72F6tmjIUiRk6Wm+ak2sHGUr5s=;
  b=l8T6z7yivDlvfOEIFVkRMdY6Xj+7Ot0nY70Z4Y6Vggb8HNWjWMtn4siA
   s8JsAqbo09gyCjbaqViVQny3kAbSUaU6PflsryR9xCQTCnu0xcobeK0+L
   Jsvd9miihmJN8REm/USMsEVUR0QLA9TStKTV2fRr9+xL0dvNxCib2S+Y4
   WhLoA60Tp80l/HDRv/T3M1Ih2PtRy9gUVzpYWD+3ciHgBxJ3CYZgRkOQe
   OFSlOKHzBnZ+O5EkIkPStgqh060QX/5AL4k26jKKuUC4Z/mKJ3so4lvPJ
   xuDnSqL5birwpij1larDJ9vKUyPYXbnRdpg1hPuJgPQU4trtqwtURGmUV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16109767"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="16109767"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 01:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10760041"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2024 01:44:21 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ritFa-0007D1-2j;
	Sat, 09 Mar 2024 09:44:18 +0000
Date: Sat, 9 Mar 2024 17:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26659/27434] block/blk-wbt.c:1740:1:
 error: type defaults to 'int' in declaration of 'module_init'
Message-ID: <202403091724.ZfnqV1Ip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: db965f08a3d7693d3d436747f493580e583149f7 [26659/27434] rue/io: introduce wbt class for cgroup priority
config: arm64-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240309/202403091724.ZfnqV1Ip-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091724.ZfnqV1Ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091724.ZfnqV1Ip-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> block/blk-wbt.c:1476:5: warning: no previous prototype for 'blk_wbt_init' [-Wmissing-prototypes]
    1476 | int blk_wbt_init(struct request_queue *q)
         |     ^~~~~~~~~~~~
>> block/blk-wbt.c:1740:1: warning: data definition has no type or storage class
    1740 | module_init(wbt_policy_init);
         | ^~~~~~~~~~~
>> block/blk-wbt.c:1740:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
>> block/blk-wbt.c:1740:1: warning: parameter names (without types) in function declaration
   block/blk-wbt.c:1741:1: warning: data definition has no type or storage class
    1741 | module_exit(wbt_policy_exit);
         | ^~~~~~~~~~~
>> block/blk-wbt.c:1741:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   block/blk-wbt.c:1741:1: warning: parameter names (without types) in function declaration
>> block/blk-wbt.c:1729:19: warning: 'wbt_policy_init' defined but not used [-Wunused-function]
    1729 | static int __init wbt_policy_init(void)
         |                   ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1740 block/blk-wbt.c

  1728	
> 1729	static int __init wbt_policy_init(void)
  1730	{
  1731		/*create for wbt structure for each blkcg */
  1732		return blkcg_policy_register(&blkcg_policy_wbt);
  1733	}
  1734	
  1735	static void __exit wbt_policy_exit(void)
  1736	{
  1737		return blkcg_policy_unregister(&blkcg_policy_wbt);
  1738	}
  1739	
> 1740	module_init(wbt_policy_init);
> 1741	module_exit(wbt_policy_exit);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
