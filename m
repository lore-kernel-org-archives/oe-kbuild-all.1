Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9618C22
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725797412; cv=none; b=CFUrgXoyMcWdj4l5mDlON4jfal74SYHVRq3rIemVmOgp98YQfBc1jF1+iGtjMkozVjQzP5XmVYscBE78fRg2+KCHJJc7LW1HJWnTes4AD32y3L0okYTJVG28ZeHVyKovRWbsUzVJTPn7zsrBZnHucvLGsYyC26z63XssT0vhPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725797412; c=relaxed/simple;
	bh=AgmGOqrF1fmyBRsVlFcYwRPNoipuKzdVtJdNQ5cO+8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QE0W0ToNEN7yG3/NvB4qy1ovXC7n+98ON8YG8iuII+8i45BbAYalwja4KFAZ6VcL92iRfSuJz7zxDYbneKapd49Zd4UAmuwRIalbc5KbIIwKKjpN0sdwHXA5eENQDlxvNWXf6TKsOBE7YpadTv+vb1Pe3WQZmRDhU17KYdC9tCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7BV7tfy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7BV7tfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725797411; x=1757333411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgmGOqrF1fmyBRsVlFcYwRPNoipuKzdVtJdNQ5cO+8I=;
  b=L7BV7tfylJvOEykM9sY7FmeR5ICFOh89rf0QQoi1+xIvdGWUamDzaB70
   ntUSVyDMDpK6O3DC0eA8RStucxqwD0zoAGgaJuON+ybXksWiW0VV50lvW
   /Jcx9kFjcsoEYALkhBEDDom1oEXSklzxC22lNlVttP7X1QPsi8O9y48fX
   HWsZVPFOcUar6PPd24TVBUdc15UtP6/oY2Q0wXZvPOkPjp3Wu1h6lEfAC
   3aElE/StjhHi9tZWiGVj6Y2ypoO3yS3VPN/6SYCwMiQExbTFD8//lVeAe
   0Zwi6s779cW0v21w1VUzzWy9z8NgtoxKR4SLoPSiYOt/pb47cRnjUFZad
   g==;
X-CSE-ConnectionGUID: BiZdntMcQoaqXL3hMqX51g==
X-CSE-MsgGUID: n72XyC/yQaGVKqxxyEWc9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27419470"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27419470"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:10:10 -0700
X-CSE-ConnectionGUID: VdLX9VpjSH2076PTlg8g5w==
X-CSE-MsgGUID: fnXHF70hQWOrXunqpGQIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103860738"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2024 05:10:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snGk3-000DVP-2A;
	Sun, 08 Sep 2024 12:10:07 +0000
Date: Sun, 8 Sep 2024 20:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.11-rc1 43/129] fs/resctrl/internal.h:
 linux/resctrl.h is included more than once.
Message-ID: <202409082051.0DRBOfzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   a3cc1ee01f0d935f82db885e4ec4772dc6032efa
commit: 2f205b6692deba18059565550f6183cfa016c592 [43/129] AUTO SPLIT
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082051.0DRBOfzn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/resctrl/internal.h: linux/resctrl.h is included more than once.

vim +5 fs/resctrl/internal.h

     4	
   > 5	#include <linux/resctrl.h>
     6	#include <linux/sched.h>
     7	#include <linux/kernfs.h>
     8	#include <linux/fs_context.h>
     9	#include <linux/jump_label.h>
  > 10	#include <linux/resctrl.h>
    11	#include <linux/tick.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
