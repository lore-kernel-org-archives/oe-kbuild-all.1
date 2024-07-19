Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CCB22071
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406335; cv=none; b=lnm+9NTgbjSpQHmpM7sNNwyjf3oCqfhZTznFtfKJYtVbyu/CrIv4aeYP3ve+pJT2pyR0Lq9DvBMDkqicv9IsPCUPqh7uv2E+PlKbtTHr8EbIn1iColBLPwts/mL/KfSlDjKw613U35CQ+B7NaC47ATFec5mBqT1fHfUrgjF0pSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406335; c=relaxed/simple;
	bh=4wP/awd1elbmfe/0kLNNZE2ECVySjr7VbMhKcH2Yhc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+yngLjYITjsoUQdU3kI4WrjvAiJTGTzMpjf+F8AIshpJDT3b2qZrX9+dTqAV3b+tWLmWIW/PwHu1VoaYuKS5/xga+wOnN8x4dfAi6+CvS6vj3HU6Rd7Nn5UHW5Y8J0VCiHIBe6f4ejPgEr54qXM0VOAoCjiSo0o3MQGn1BaqrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOvb8dck; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOvb8dck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721406334; x=1752942334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wP/awd1elbmfe/0kLNNZE2ECVySjr7VbMhKcH2Yhc8=;
  b=YOvb8dckmi85xA02te30FOrEHBh+DAPYSk8Z60UlEZc0Sc8dH0aTQTZT
   +mF2h/z8/vpZlXK/ALbf/NxHd5vtBKRT0qdUgIDF4xiOMKLp9+nPWcoMs
   of+BoW3NAKgiZ5mTfazOewHywZyq5SgIImunXbcLM9buTnf5MgxRAMgMu
   eoIr7JI/RbMRfZZxNDBtZX5AuKoPWKCVYBOS2VEwAzAsZHmOr9TaEfPr0
   ZouZA5OosT48ddHZkFpJg169J7MFBWgk5oA26mHV+LBL9aVjbvM9CllGr
   +jsN2QBoL15azOtkggixxoh1J3jsK30SaDP2BRGnJ4od3WznvdpuGctu2
   w==;
X-CSE-ConnectionGUID: LC8lIv19QtqytmB6YwHDfg==
X-CSE-MsgGUID: oxJujJwVQHGoC0Z1fExjmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18646137"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="18646137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:25:33 -0700
X-CSE-ConnectionGUID: Hp9DqlO0Txmt254/lwnrWQ==
X-CSE-MsgGUID: MASZjKHzQqiwaMOGav0gEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51778001"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jul 2024 09:25:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqQD-000iNK-37;
	Fri, 19 Jul 2024 16:25:29 +0000
Date: Sat, 20 Jul 2024 00:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] netconsole: Defer netpoll cleanup to avoid lock
 release during list traversal
Message-ID: <202407192328.P5nrBKoH-lkp@intel.com>
References: <20240718184311.3950526-3-leitao@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718184311.3950526-3-leitao@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master next-20240719]
[cannot apply to horms-ipvs/master v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/netpoll-extract-core-of-netpoll_cleanup/20240719-024801
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240718184311.3950526-3-leitao%40debian.org
patch subject: [RFC PATCH 2/2] netconsole: Defer netpoll cleanup to avoid lock release during list traversal
config: i386-buildonly-randconfig-005-20240719 (https://download.01.org/0day-ci/archive/20240719/202407192328.P5nrBKoH-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192328.P5nrBKoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407192328.P5nrBKoH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netconsole.c: In function 'netconsole_netdev_event':
>> drivers/net/netconsole.c:1053:2: error: implicit declaration of function 'netconsole_process_cleanups_core' [-Werror=implicit-function-declaration]
    1053 |  netconsole_process_cleanups_core();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/netconsole_process_cleanups_core +1053 drivers/net/netconsole.c

   996	
   997	/* Handle network interface device notifications */
   998	static int netconsole_netdev_event(struct notifier_block *this,
   999					   unsigned long event, void *ptr)
  1000	{
  1001		unsigned long flags;
  1002		struct netconsole_target *nt, *tmp;
  1003		struct net_device *dev = netdev_notifier_info_to_dev(ptr);
  1004		bool stopped = false;
  1005	
  1006		if (!(event == NETDEV_CHANGENAME || event == NETDEV_UNREGISTER ||
  1007		      event == NETDEV_RELEASE || event == NETDEV_JOIN))
  1008			goto done;
  1009	
  1010		mutex_lock(&target_cleanup_list_lock);
  1011		spin_lock_irqsave(&target_list_lock, flags);
  1012		list_for_each_entry_safe(nt, tmp, &target_list, list) {
  1013			netconsole_target_get(nt);
  1014			if (nt->np.dev == dev) {
  1015				switch (event) {
  1016				case NETDEV_CHANGENAME:
  1017					strscpy(nt->np.dev_name, dev->name, IFNAMSIZ);
  1018					break;
  1019				case NETDEV_RELEASE:
  1020				case NETDEV_JOIN:
  1021				case NETDEV_UNREGISTER:
  1022					nt->enabled = false;
  1023					list_move(&nt->list, &target_cleanup_list);
  1024					stopped = true;
  1025				}
  1026			}
  1027			netconsole_target_put(nt);
  1028		}
  1029		spin_unlock_irqrestore(&target_list_lock, flags);
  1030		mutex_unlock(&target_cleanup_list_lock);
  1031	
  1032		if (stopped) {
  1033			const char *msg = "had an event";
  1034	
  1035			switch (event) {
  1036			case NETDEV_UNREGISTER:
  1037				msg = "unregistered";
  1038				break;
  1039			case NETDEV_RELEASE:
  1040				msg = "released slaves";
  1041				break;
  1042			case NETDEV_JOIN:
  1043				msg = "is joining a master device";
  1044				break;
  1045			}
  1046			pr_info("network logging stopped on interface %s as it %s\n",
  1047				dev->name, msg);
  1048		}
  1049	
  1050		/* Process target_cleanup_list entries. By the end, target_cleanup_list
  1051		 * should be empty
  1052		 */
> 1053		netconsole_process_cleanups_core();
  1054	
  1055	done:
  1056		return NOTIFY_DONE;
  1057	}
  1058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
