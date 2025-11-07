Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355ED32E142
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539068; cv=none; b=hQoHeHldf7WNVKtF1wyY8ZrHkmbBmMWe1f8UqCqKlTRkUwtYZeUhhprS803baNiNqNWUjbPiIayGIhl/PrRjntd0p4Rc3q366jrpTfgKv+3XEXIa/XPJ5bBz2/+HZzfPHLRquZsIQSMEcAtjV+y2eMQYKXPE7CX9sAp9EQ8F0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539068; c=relaxed/simple;
	bh=Mn11s7WJd4og0P65ikvgqT6UxVrTqFWNFNsLsPOmYvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1BtZ2sVuNy2G5/bmYxgCR8bcK6K9dr8m3L5cLsMVm5xDRZBVYNTh3WtKOidzwc8ZMSfjvNA5ofAd3DquHJqP8HOi6NdaUKIOoSeKBWxBoa/shP9iUpyBeOSY3U9L5WpAmPym/pA1u7EJo6fQkAdeU3t7vYnEnNctUk23AxyG9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkQNlVxt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkQNlVxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762539066; x=1794075066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mn11s7WJd4og0P65ikvgqT6UxVrTqFWNFNsLsPOmYvI=;
  b=AkQNlVxt5BnEFMIaHdl2ADF2DoCtNJOMQhAOk0JJfA/MMtZsu+Q8seUI
   NeXDtm/6NJIzcHA17h5MqcyzDPzvRXZqtncGb1cy66B5wjGnUKf0B4Lko
   btEZZIhn+RIkA/V1AlOfjYhi66czmsX6KR+wZR562PgnMJv0EpCVq3Wl9
   VZrdGPdsi42xKtXr3rdtSd0fa9AHmN4zKdFJEcClP4Tqd8MEZEx/nRaro
   ujxVZm40UVVJdDSm4DWeCHlAnxiZ7Zq4xPvvGvvs8MI+XY126vE2jrczc
   +pShS6sWRnLCgcN3aS84jq6Ub25D1UoX0TF8eKZDTlsx+6AChpd7++FBE
   g==;
X-CSE-ConnectionGUID: XGENwlpDQcizegQQFbhxxA==
X-CSE-MsgGUID: UKIExtn4TZyjSjEbNuDGEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64619593"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64619593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:11:05 -0800
X-CSE-ConnectionGUID: TT6Z2PUUQmGG4216C4fhEg==
X-CSE-MsgGUID: R5gYPh+wRBSSOAxm7nea2g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2025 10:11:04 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHQvO-0000Cl-1E;
	Fri, 07 Nov 2025 18:11:02 +0000
Date: Sat, 8 Nov 2025 02:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/sysfs.c:395:5:
 warning: no previous prototype for function 'ub_create_sysfs_dev_files'
Message-ID: <202511080120.CzSyQkhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: 9039065cf6d07af72879991553397629d8bd4e92 [3075/3075] ub:ubus: Adding a ue Creation Destruction Mechanism
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511080120.CzSyQkhc-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080120.CzSyQkhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080120.CzSyQkhc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/sysfs.c:395:5: warning: no previous prototype for function 'ub_create_sysfs_dev_files' [-Wmissing-prototypes]
     395 | int ub_create_sysfs_dev_files(struct ub_entity *uent)
         |     ^
   drivers/ub/ubus/sysfs.c:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     395 | int ub_create_sysfs_dev_files(struct ub_entity *uent)
         | ^
         | static 
>> drivers/ub/ubus/sysfs.c:406:6: warning: no previous prototype for function 'ub_remove_sysfs_ent_files' [-Wmissing-prototypes]
     406 | void ub_remove_sysfs_ent_files(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/sysfs.c:406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     406 | void ub_remove_sysfs_ent_files(struct ub_entity *uent)
         | ^
         | static 
   2 warnings generated.


vim +/ub_create_sysfs_dev_files +395 drivers/ub/ubus/sysfs.c

   394	
 > 395	int ub_create_sysfs_dev_files(struct ub_entity *uent)
   396	{
   397		int retval;
   398	
   399		retval = ub_create_capabilities_sysfs(uent);
   400		if (retval)
   401			return retval;
   402	
   403		return 0;
   404	}
   405	
 > 406	void ub_remove_sysfs_ent_files(struct ub_entity *uent)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
