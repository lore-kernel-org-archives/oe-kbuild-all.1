Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292E3849C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 04:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762749378; cv=none; b=KSWQIWfGEJ3StOtcVX8j/wO1LecBs/VMMgEC5HByA8wVNwnO57R0XS1meLIfA8WKIAL++EEpIZ2M7Rw7aqIA5DmFp+ceJ/7i+qXVl6f8n77uIVq/VGOTr3fvjdCnsFVoO+qrsKZ8lyqbcK7AvI6a/2bI+VYuUs6ZGuM1M7kMOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762749378; c=relaxed/simple;
	bh=Ur5rH+rok7T+1pKZGjLtmI/yy1CPns7L6cm6yjS9LTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCu4nUKgqjQwuFGJ6Bh33/RpLjisZBqEQrdpmLUPlhtlPVUMYaRNCTEjKi0IABrzowCfcP+VyvfjGhPwKLACCGZQHBiLUvRwAyoN7krMHV0liPIV/z+RLWgNXtn/6Tx0eHwzhxeFYbH09uE0dUpVneU/c2Q/NAXxgRXUq2Mm3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdbciRDH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdbciRDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762749376; x=1794285376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ur5rH+rok7T+1pKZGjLtmI/yy1CPns7L6cm6yjS9LTk=;
  b=jdbciRDHCUriGaEP/m50tmcMYxZbyvdmLOHLiaFbM0rQY7g+nEYh/IAe
   Q6na8T2tCqT3U0YyBlGxdPs7yA1QKIdfgPhdWbLqIGXPZwZwqhhLEggp7
   CEA095gTi3d6IffULLLZegfq/AZMpB0kFUCWYhGvi0PorjV8W8HSAagxe
   +s+hJLjcuztikz5BinlgjpPPteim6SVWiPqmcwvM/tGEpxEgK//paDPn4
   /Q2Fx1y4/LW0/N2TAhHpS7+5F8kfCj1E4CGHYvqqMfHHuWed7x5ki4rH5
   6jQHxhuYFZiGGEHL5yFkPo0QsiN1vQk36B1ziGU3If+ZVhjBba79BNMuk
   g==;
X-CSE-ConnectionGUID: FzVMLL8xQuOllfhry8iMhQ==
X-CSE-MsgGUID: RKsEPVj9QnOKoNZ5RoZASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64707859"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="64707859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 20:36:15 -0800
X-CSE-ConnectionGUID: Q8Abi0g3RU6NffCW0M0TIg==
X-CSE-MsgGUID: wb1QoMnrQmyCgEWgPqPgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="192834151"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Nov 2025 20:36:14 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIJdU-0002f5-2o;
	Mon, 10 Nov 2025 04:36:12 +0000
Date: Mon, 10 Nov 2025 12:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] vfs: remove the excl argument from the ->create()
 inode_operation
Message-ID: <202511101241.ZZFTaw5J-lkp@intel.com>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-remove-the-excl-argument-from-the-create-inode_operation/20251107-230938
base:   76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7
patch link:    https://lore.kernel.org/r/20251107-create-excl-v2-1-f678165d7f3f%40kernel.org
patch subject: [PATCH v2] vfs: remove the excl argument from the ->create() inode_operation
config: i386-randconfig-002-20251109 (https://download.01.org/0day-ci/archive/20251110/202511101241.ZZFTaw5J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101241.ZZFTaw5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101241.ZZFTaw5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/vboxsf/dir.c: In function 'vboxsf_dir_mkfile':
>> fs/vboxsf/dir.c:303:63: error: 'excl' undeclared (first use in this function)
     303 |         return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
         |                                                               ^~~~
   fs/vboxsf/dir.c:303:63: note: each undeclared identifier is reported only once for each function it appears in
   fs/vboxsf/dir.c:304:1: warning: control reaches end of non-void function [-Wreturn-type]
     304 | }
         | ^


vim +/excl +303 fs/vboxsf/dir.c

0fd16957664845 Hans de Goede     2019-12-12  298  
6c960e68aaed33 Christian Brauner 2023-01-13  299  static int vboxsf_dir_mkfile(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner 2021-01-21  300  			     struct inode *parent, struct dentry *dentry,
695fb862eadb82 Jeff Layton       2025-11-07  301  			     umode_t mode)
0fd16957664845 Hans de Goede     2019-12-12  302  {
ab0c29687bc7a8 Hans de Goede     2021-01-21 @303  	return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
0fd16957664845 Hans de Goede     2019-12-12  304  }
0fd16957664845 Hans de Goede     2019-12-12  305  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
