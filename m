Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575623ADBAD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631675; cv=none; b=cl7vsgiHNi4gO0cYjmC5eEoNZCQagm0AFbtpkND7aU9rRjmp9zQmcerD/i3BwnjxQXd/uR+6F6yNdWEN+bhKjed295hdwSeHMlW2Zy2hIovDZox2voPVB96yT3wZz1AnfN6rz1VekuO3XWAWNDJO5jjUJDAVw2cJccykfW4ak7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631675; c=relaxed/simple;
	bh=XcUpua6HSUWB/ivBbQGzkQx2wGgqnOKe8G+JHsYRKb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQLRUDwVf6lF605iNF1FKdXA8LxwJ8W3ICZfISm6t2xioEZu8tEbOCxHs6f06r5IXLnlzRTO1thxN8LWvhSMyWvcqomNTINDcn7E63VYiUR+FEVivaWv+6he+yPmOKaCWkkkJh4H00EEqWFRy8hOX4MSV8r7KTOGvdUc5BJKEJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5/+kJwG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5/+kJwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783631673; x=1815167673;
  h=date:from:to:cc:subject:message-id;
  bh=XcUpua6HSUWB/ivBbQGzkQx2wGgqnOKe8G+JHsYRKb8=;
  b=F5/+kJwGrUHXt9MKVuxSMsa3Uu7zdtqUoJqLURXorVq7dAqOCdo+DZcF
   lNZb/BausHsBrKSYUth28ictZQtVtwk/sI9caxCHzS/w2/rvXHbSskM/4
   XTFwxRvP4u0JfuDLCKzrIhoFvuGi3yovvNcUf1ILHpIMIuYvu3XvKxGGM
   I6NOmoFb37xzVXhJQao1v0IVcX1lanZRLj+bc9GuWn/khZitZacbYj3t5
   O5+3GkrsQiu4O3JGw4c009u2RykaVsA5FIHJHGBm4e0czFdNEUiK/F398
   cmEAIogT5CvVksWMoVKdy70jIlxgHNOMA6TVvIsKZxbccKW2BjG8Su7IR
   Q==;
X-CSE-ConnectionGUID: Md6W0mUgSFCOzuLB9uwjMQ==
X-CSE-MsgGUID: MWTwESMoTT+ApEB3KBnugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71855040"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71855040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 14:14:32 -0700
X-CSE-ConnectionGUID: dMbwgOYhSNCK6hef30N1LQ==
X-CSE-MsgGUID: ndilxYP9QASmL0PJ1VPDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259004217"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 14:14:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whw4h-00000000I9X-2a8q;
	Thu, 09 Jul 2026 21:14:27 +0000
Date: Fri, 10 Jul 2026 05:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-efi@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [efi:next 2/7] ld:
 drivers/firmware/efi/runtime-wrappers.o:(.debug_addr+0x104): undefined
 reference to `efi_runtime_lock_owner'
Message-ID: <202607100518.uMJJPDfP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
head:   cf790fdb851867532b9a0f88588dcce648dbffe9
commit: 3e5ba97c181e32ca9b810414272b57bb7600998e [2/7] efi/runtime-wrappers: factor out efi_rts_park_worker()
config: i386-buildonly-randconfig-001-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100518.uMJJPDfP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100518.uMJJPDfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100518.uMJJPDfP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/firmware/efi/runtime-wrappers.o:(.debug_addr+0x104): undefined reference to `efi_runtime_lock_owner'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
