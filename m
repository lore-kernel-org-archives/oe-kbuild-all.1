Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A72D63E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762694149; cv=none; b=LAEtO0Ptm3sE9WQB9hPzPud4a+82tw/terU0KdulYac9VpiWBuOXpClE8HHVGLZfGkBEq10m5hONRNDOtWy7xFkAxG3F0lRRwBu+F58RlmadLZbdUfj6GxFgnn4Klehoi5BeEGhvKewwL+/G2Aw/4C2l8qQEBx6+Pn4Tzvrl9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762694149; c=relaxed/simple;
	bh=fb1NGLRSSfro17sePmhYwCdlyEY0owaLZoQB6mCaKKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHJ2II/1HMB5tbLm0YKd3k/5p7TLcFGhPv7/9WoPw8ivVr9Hu9gy3b8/lh1ubFjHEPcg8jGP5izfHjiHtR8Clc/O8Nbv6Wvl1YNqfE/jjVoCa+IWBf0fqpWa1nzeQ35JnshhJjTufieoy8djLDOkbTnFFldcUUJQdLhucnL+jPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoSEQapY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoSEQapY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762694148; x=1794230148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fb1NGLRSSfro17sePmhYwCdlyEY0owaLZoQB6mCaKKY=;
  b=UoSEQapYterwsLdZv/WW/rehu461xi2GTzYcYIkVhSHtM7kZygAYk8He
   K5HdI3mAd4obFzlwuNa6n9gY/00G00hbVb/OSCxgQDuCKzvmN8U96kEX6
   sCijktTSf80+MJd+LbfB042+KAwvz7COFh+r90paCEhDB/vIhZOeU2I+k
   4mlRkl+Y809SaII3x83xzF15ykntnV7sd2sEM/NLZ85Ov2gkUwBXJC+4z
   bB2wnSDoFCt/iD50oJw3fEWJNvKZ0F4wk6gGuYTAmRA86Zxva46EMe2vY
   JaVXUhkfVrO8t4r85UCoye2XqTFFovG/B4zvFRcvmfkBg9IRIIrf/WPal
   g==;
X-CSE-ConnectionGUID: 5j40+xi+RMqJBLizalyA/Q==
X-CSE-MsgGUID: wzAMrN/RR6O+fy7IVb8Sow==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="82394397"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82394397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 05:15:48 -0800
X-CSE-ConnectionGUID: eLKaKMBxT4m8mC5rnsQdvA==
X-CSE-MsgGUID: K23XaatRREyRrKbRZMB7MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192567224"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 05:15:46 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI5Gi-00020r-0r;
	Sun, 09 Nov 2025 13:15:44 +0000
Date: Sun, 9 Nov 2025 21:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] vfs: remove the excl argument from the ->create()
 inode_operation
Message-ID: <202511092147.DCEwFtVj-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-remove-the-excl-argument-from-the-create-inode_operation/20251107-230938
base:   76ddfe7d66d631e5e31ef4e5dd59797fa03acbf7
patch link:    https://lore.kernel.org/r/20251107-create-excl-v2-1-f678165d7f3f%40kernel.org
patch subject: [PATCH v2] vfs: remove the excl argument from the ->create() inode_operation
config: i386-randconfig-002-20251109 (https://download.01.org/0day-ci/archive/20251109/202511092147.DCEwFtVj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511092147.DCEwFtVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511092147.DCEwFtVj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/vboxsf/dir.c: In function 'vboxsf_dir_mkfile':
   fs/vboxsf/dir.c:303:63: error: 'excl' undeclared (first use in this function)
     303 |         return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
         |                                                               ^~~~
   fs/vboxsf/dir.c:303:63: note: each undeclared identifier is reported only once for each function it appears in
>> fs/vboxsf/dir.c:304:1: warning: control reaches end of non-void function [-Wreturn-type]
     304 | }
         | ^


vim +304 fs/vboxsf/dir.c

0fd16957664845 Hans de Goede     2019-12-12  298  
6c960e68aaed33 Christian Brauner 2023-01-13  299  static int vboxsf_dir_mkfile(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner 2021-01-21  300  			     struct inode *parent, struct dentry *dentry,
695fb862eadb82 Jeff Layton       2025-11-07  301  			     umode_t mode)
0fd16957664845 Hans de Goede     2019-12-12  302  {
ab0c29687bc7a8 Hans de Goede     2021-01-21 @303  	return vboxsf_dir_create(parent, dentry, mode, false, excl, NULL);
0fd16957664845 Hans de Goede     2019-12-12 @304  }
0fd16957664845 Hans de Goede     2019-12-12  305  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
