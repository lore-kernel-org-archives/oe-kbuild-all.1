Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE131195E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 21:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755637873; cv=none; b=ACQ+YGNpUS4/fOrAqeB3UqQxXAwuQkvFVuBaRFOiPc9Y4HDsCUJZoNaiYpaMmh94luDKFF/sHjOMlbp1PiEDE2kv9MRqa57leLYYHuq7I+yazIL01naHgqGzKs5CJ9paTpYPY0IxYg4jiBx6Jtk5UbmiG2p4JYJtLh8ynW2V9js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755637873; c=relaxed/simple;
	bh=33bEriRgl/iswnqENST1jenPz2IZWE3FjLu1ZtAiNqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERXHXPrnxuCexNwiHEKy+/M/Cb8SfbawDYGHNT6dUtl7nC6e9bpBhuAFz/H1ynMPVk0cwuMklWhhhVB3SXsaCnCzZrGojfel1fTAv5k7cwIxPRALcuDjjWSImq2hjkqFMc3177mEZLOWA/APyX7nhcytBLViKXUcOGK5KWyQbEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc46u1yz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc46u1yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755637872; x=1787173872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33bEriRgl/iswnqENST1jenPz2IZWE3FjLu1ZtAiNqA=;
  b=bc46u1yzDoER5zQQIOrpoLwLe81RYyg0f3y3Ea6xTxFCD6IHQWYZprAz
   1EEuZoF/sJQIewGoN5nYdh9Lt2TKO3Jq/eVGg5ZR10S39DmhR5i5h4WMc
   NHWYtlTumro75Ezoo9dpVVao5ux428GbayxVAcEzXiyAEid1pkQJrzY7m
   a7Ed/4RhabQiDei5JznrOduug4XTKLz4hsBnE+Oes9q/+QDHc1iDeZu4r
   t/rQ/mkcFN/CudDg94UOis32CTfXEvW4w0B/zi/kwdkdPz3jWabVzS1NQ
   quk3Cyw4vOUsXOzg6lBXqsJzVeSJXPJx6+Qj//G/tBwn1rJHZ7VANL/Hj
   g==;
X-CSE-ConnectionGUID: tznIlbiHTXG3z4Jh5vkgeQ==
X-CSE-MsgGUID: b3y4gC0WRCe/otvJLfLa8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58045760"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58045760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 14:11:11 -0700
X-CSE-ConnectionGUID: 6M2dZoCVQiqbkOVkaa5zCw==
X-CSE-MsgGUID: ozz1lzeAR5yMkdojgnNNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167575485"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2025 14:11:11 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoTbn-0001MX-2N;
	Tue, 19 Aug 2025 21:11:07 +0000
Date: Tue, 19 Aug 2025 23:10:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2695/2695] fs/resctrl/monitor.c:51: warning:
 Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each
 CLOSID has.
Message-ID: <202508192317.9HGj2DCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   41dcfa1c2607635577b73ad0317ad80729e58c1e
commit: 13e249bf4944afceae17195b7bb77c767ff61384 [2695/2695] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
config: x86_64-randconfig-2003-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192317.9HGj2DCx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192317.9HGj2DCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508192317.9HGj2DCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:51: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 51 - I thought it was a doc line


vim +51 fs/resctrl/monitor.c

    49	
    50	/**
  > 51	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    52	 *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    53	 *     Indexed by CLOSID. Protected by rdtgroup_mutex.
    54	 */
    55	static u32 *closid_num_dirty_rmid;
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
