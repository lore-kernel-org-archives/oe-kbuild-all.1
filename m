Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80051381A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710511337; cv=none; b=Xr5XhGTQbB7yDpav82iKYYYqciCEtj5fWAe3Ozo06bBWhSSl4DNzTU1H6+wpfVagJGzzXA9gOaB1B6rnNee92MdKwN6f/sAGC6DQYoiyMJ4Omx0aYj3PO5rMbYY5PbTwCurcKkLdozc5Xb5RH1dtQQoe0PxJOTT5nP/fBsN/CU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710511337; c=relaxed/simple;
	bh=RC6OE++0YlUFw7X3o+6H44I5PozJc3TGpe59CRn0NgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbnpMJPptIrXUciNN+cl1x3ENugqzmh9J9P3fnjq248ztBdg5FfCf69cDjUT/9XSsWY/asjs5Puoe27pWD1f2ZiMjY+Hs4rys8Yt6zXOemUBC26KKzndBxt7qLOFsXLm5hQ4ruRT2rjjfZXqu3vhyvenxUr3rupj23Sju4jFoMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZzg31oT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZzg31oT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710511335; x=1742047335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RC6OE++0YlUFw7X3o+6H44I5PozJc3TGpe59CRn0NgQ=;
  b=OZzg31oTm7/3aXj4vCYfhknqm8Dkc33t9yaOcgVEEpPBRIw3WfwxTdx4
   MOwWphnMNCkSjZd3sY5ogYoh7/YCwYk6xcGjTksp45lme9UOlmNxxdKwh
   aCcc7oR0+VKKe3df3KUkainpRT2st9825Ih89Cai4xDcRI/l/ZUuAibpl
   /bN99OSBRUSQ9UlUTqghQUj2x2knQ66MbbLAHOAzvo/bz2EUeMv8eKfHj
   INiziwv5YXvSrsFdUFn26ZKGe7qwL3XgBtSOYzLw2Z8qGyTJYhevmRBOZ
   zwrVzA8iS4fFjeL/lBW64zWh4oazA59lcRKrEhFILxmIIC9ZI2GWm6az5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5513887"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5513887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 07:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12719407"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2024 07:02:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl88P-000EU5-1B;
	Fri, 15 Mar 2024 14:02:09 +0000
Date: Fri, 15 Mar 2024 22:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26594/27507]
 kernel/sched/batch.c:727:12: warning: 'balance_bt' defined but not used
Message-ID: <202403152150.6rB4wpi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 973e86cbd623239474c590d6884d3b0b5c300d82 [26594/27507] rue/cpu: Add basic framework of offline scheduler class
config: x86_64-randconfig-r053-20240315 (https://download.01.org/0day-ci/archive/20240315/202403152150.6rB4wpi2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152150.6rB4wpi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152150.6rB4wpi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/batch.c:139:25: warning: no previous prototype for '__pick_first_bt_entity' [-Wmissing-prototypes]
     139 | struct sched_bt_entity *__pick_first_bt_entity(struct bt_rq *bt_rq)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/batch.c:727:12: warning: 'balance_bt' defined but not used [-Wunused-function]
     727 | static int balance_bt(struct rq *rq, struct task_struct *prev,
         |            ^~~~~~~~~~


vim +/balance_bt +727 kernel/sched/batch.c

   726	
 > 727	static int balance_bt(struct rq *rq, struct task_struct *prev,
   728			      struct rq_flags *rf)
   729	{
   730		return 1;
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
