Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97F259C91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821109; cv=none; b=Rwl42ZUhpHcMB9eBTqCDdhKMApUSe7Mm8kmQqu6nrxCSODusz4FF19k4AGZ7op6rPqBPHI/IWoNfzL/zuxSutjCkAjDF+KEcCQh4cGR4UA/+zoC7K1ipOAO1ht0+ArINoX4aB7vRsOA4KPDcJN+dijxMq4+bGA8k7NqhOWLo//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821109; c=relaxed/simple;
	bh=nfbEjV0T4T1getVpg5GIisJpvPkxatulP54GSHOoNaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQE9tQs7xQi09yRf1DE+5RQSCgO+NN2yFrnzqj6m5CxqNHhzU0/gMKTaNDRIDfkOBjXc1ARAzEmKOsmV4YlRIWlf1cU9oWPWEObKIjFJN5ldWfWC3uGfLiwBs/W4pLzdJmOeQbwchUjG26hH0YJiOZd0ApXAtaFJIDLPL7Mk3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPyke1dR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPyke1dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747821107; x=1779357107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfbEjV0T4T1getVpg5GIisJpvPkxatulP54GSHOoNaA=;
  b=dPyke1dRQIixtBsHygv81zLbJ0yojsgPNBC0k2UHikUY5XMTEmiYiwFB
   3R70gFMzWh9ywEhIqJukDPLyed5EDNfnsfNhYJl9/FrasmUdeTMB5MI6Z
   BUH0W4xgZgUrWxP8ZeaUH7pHhJFJWBc3elCA9NVW/1hdybdHz1a3gEjmu
   RFjYUxyOYp99yO9DNkv+po9eVz4CPWKRMfiJD1/UY8hp6045YPvi88fUA
   AED8gB5OYp4yIAgARxXI/sP8ku/yyNPoOJb8eHV6c7NaXhWoAHaFBIQ49
   GtYf35RUIX/w5wy9cW98VWT44OGXaJFkF9uvzMPeo4wUlliwXzNvitdSm
   A==;
X-CSE-ConnectionGUID: hqn/0zjZR0K9YsfbPGs1DQ==
X-CSE-MsgGUID: OqKrsa//SM6JoSqT6fPJZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49051128"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49051128"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:51:44 -0700
X-CSE-ConnectionGUID: ZRCeMf94T8CL/YttmHq0ZA==
X-CSE-MsgGUID: CCiU+BHxS96FL18oWQVEgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="177139719"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 02:51:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHg6u-000O6y-2o;
	Wed, 21 May 2025 09:51:40 +0000
Date: Wed, 21 May 2025 17:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 36/43] fs/nfsd/filecache.c:746: undefined reference
 to `nfsd_handle_dir_event'
Message-ID: <202505211739.hqVud436-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   0f5740633a2679479da26057d462e4586d88ab90
commit: e8d81f6e93c8e360920520ad08096b8937def9e0 [36/43] nfsd: add notification handlers for dir events
config: microblaze-randconfig-r071-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211739.hqVud436-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211739.hqVud436-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211739.hqVud436-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/nfsd/filecache.o: in function `nfsd_file_fsnotify_handle_event':
>> fs/nfsd/filecache.c:746: undefined reference to `nfsd_handle_dir_event'


vim +746 fs/nfsd/filecache.c

   734	
   735	static int
   736	nfsd_file_fsnotify_handle_event(struct fsnotify_mark *mark, u32 mask,
   737					struct inode *inode, struct inode *dir,
   738					const struct qstr *name, u32 cookie)
   739	{
   740		if (WARN_ON_ONCE(!inode))
   741			return 0;
   742	
   743		trace_nfsd_file_fsnotify_handle_event(inode, mask);
   744	
   745		if (dir)
 > 746			return nfsd_handle_dir_event(mask, inode, dir, name);
   747	
   748		/* Should be no marks on non-regular files */
   749		if (!S_ISREG(inode->i_mode)) {
   750			WARN_ON_ONCE(1);
   751			return 0;
   752		}
   753	
   754		/* don't close files if this was not the last link */
   755		if (mask & FS_ATTRIB) {
   756			if (inode->i_nlink)
   757				return 0;
   758		}
   759	
   760		nfsd_file_close_inode(inode);
   761		return 0;
   762	}
   763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
