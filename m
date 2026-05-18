Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EA3C5853
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083890; cv=none; b=bHqgj5Yj9qDI30zx4mKj8JhDsHHC7xfID8uruSQdjYUtrsPIuH4JliVaIHJ7emNTipkfo77wbZZ73ic6I+UtHjnyhlpbCn7uNNtlYRzxk2kUM6xKH8sqd0I91XnlRDlkpPa/aqJiEN/gBTwY9KjelF5qUMHGkfXafOc86MG97q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083890; c=relaxed/simple;
	bh=oB4qyStI+9yaFdAF3iZoTduXeuGcp1du33bQUo74aGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0oCFp1b5aKgdW9A7/6zRoRGNtwZHzI5rGEDBko7fzNBoxBDLrvPLEW6xZKsKkXdFNYHhIyQPCCQHYryG9rURsusMOCcSnTv5dxWWJqTBuh8MegYeTOpotq0mRIE0y7M3X1J0TIDNX8xNR5oxvLji7UqluFXXDjCY+2WbyOmYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSLrrnU9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSLrrnU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779083885; x=1810619885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oB4qyStI+9yaFdAF3iZoTduXeuGcp1du33bQUo74aGs=;
  b=dSLrrnU9cUg1ry9a/xhXHU+l1zfUat60J+dbpDCkNnmSpxp8T1DwLF4L
   52HYWQbVgwZulJnF/7usw5vrU8A1/cBofC+nkyBasb6ZwCTmUSWLlyl7M
   geDLeMBEEitdcJomch5+uwxqzlba9P6Tph6yB/7MxLRYyjqk9R/2BVmAE
   5Kac2aiufU7QA/bSDbEsACIDkmpUNkILiLfc8btgqPwt6uZyKLSmtcwPi
   c+DABAgssHgF1gEYMn6XUUdUlkM9ZDM8IrJQZj0M/r92zSSqSGhoB/vgJ
   ULBAAR5ucfaRSB03IweHdIPSf7Rt4xX05fNFWsiNFy6O5Tg3u6LVMmdLt
   w==;
X-CSE-ConnectionGUID: EN8A/siwSFKq1mIhY66agA==
X-CSE-MsgGUID: L8nN/M2cRIqWSIIipApaUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79976617"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79976617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 22:57:58 -0700
X-CSE-ConnectionGUID: Tl2F3YnzQH2IXptTU+aNyA==
X-CSE-MsgGUID: mjK81a06SaK8S6o4WMRQog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238328003"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2026 22:57:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOqz8-000000009jx-3GUp;
	Mon, 18 May 2026 05:57:50 +0000
Date: Mon, 18 May 2026 07:57:25 +0200
From: kernel test robot <lkp@intel.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/2] selftest: add tests for
 open*(O_CREAT|O_DIRECTORY)
Message-ID: <202605180713.QOAWUxaa-lkp@intel.com>
References: <20260517170244.1832119-3-jkoolstra@xs4all.nl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517170244.1832119-3-jkoolstra@xs4all.nl>

Hi Jori,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes brauner-vfs/vfs.all viro-vfs/for-next linus/master v7.1-rc4 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jori-Koolstra/vfs-add-O_CREAT-O_DIRECTORY-to-open-2/20260518-010601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20260517170244.1832119-3-jkoolstra%40xs4all.nl
patch subject: [RFC PATCH v3 2/2] selftest: add tests for open*(O_CREAT|O_DIRECTORY)
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260518/202605180713.QOAWUxaa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180713.QOAWUxaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180713.QOAWUxaa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/namei.c:5298 function parameter 'di' not described in 'vfs_mkdir'
>> Warning: fs/namei.c:5298 function parameter 'di' not described in 'vfs_mkdir'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
