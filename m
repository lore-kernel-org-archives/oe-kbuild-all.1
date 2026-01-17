Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C022F12BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768632288; cv=none; b=IDAnjdG8gRyvKeTjpJQ5eUoEMZ59XCRGzddTVOGEfnJpw2K7zbp3ZCRnLEWTr9+Zy9Uq0OMLa8whgn8FYMsdHpa700j5YytTJCdIh+uWO6M3t4S2in2SMG58YlY66L3l+VGDRDMHNk0NWyF4WfHxAqe7VkUxYt5XuvmP3w9IXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768632288; c=relaxed/simple;
	bh=h5zEsATfnYScF22N+HZNR9SRqd2Wz8gbmo392H7S5jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sew7B3liQIhaQSWpfydiXGQ9ye93wUC/LVZA0N97T8UBV00PN8E2+QXF9DJ8msxGfD2i0zRUyHU6J4OLbMroJ1KfUVzJR+BymLwQ/LUjN2pscCA0y74Bxi/vm2WSnFraH0EA2zFxBsP4bp5snReQuWsF0Gq/Y3KwbXd5d6I4aj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT3oNL3U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT3oNL3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768632286; x=1800168286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5zEsATfnYScF22N+HZNR9SRqd2Wz8gbmo392H7S5jo=;
  b=AT3oNL3USDUQnDzOZG0e1Wcrpf8Pw7h8hqn6Pd0P424aq9BqEKWL20C8
   niCb3DbmI+LpsPUR5GWa9ANbXHL9lvFZ0EWH3Ag9j17whUsne8GK6q9VN
   +udhcDCvpwNmBk4bSUo71Ghjq5PDd/6EoBL8aCtdeJzO75IFSkVEdOC4n
   Dx1s38PSj0+aRcDDATfslNpzeQnuFe6s9kMp5e23/KxM5tfG7dj7Rbzu1
   23r/0URmhTw4Bkuz0xU2ReQEXhm2bl7g7UZPTLynzneLJaTBDy+0x8RaV
   3GauCzXyqEYdCyO+VI/2DzlgYrs6A9Af9y88bohy0o6PZSLFXw/CDBrQB
   w==;
X-CSE-ConnectionGUID: hB9om+gOTyy+lbRwF2izfA==
X-CSE-MsgGUID: x2WfwQSBQOeEuce0kqq3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81308788"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81308788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:44:45 -0800
X-CSE-ConnectionGUID: RrOnrlNdRzmGR0eHn+2eEw==
X-CSE-MsgGUID: dflrg5N6Tae84BQKUAXiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210436377"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 22:44:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh036-00000000Ld6-2c23;
	Sat, 17 Jan 2026 06:44:40 +0000
Date: Sat, 17 Jan 2026 14:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, jason.wessel@windriver.com,
	danielt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-spdx@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH] kernel: debug: Add SPDX license ids to kdb files
Message-ID: <202601171534.EStWXGGO-lkp@intel.com>
References: <20260117003621.669382-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117003621.669382-1-tim.bird@sony.com>

Hi Tim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc5]
[also build test WARNING on linus/master next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/kernel-debug-Add-SPDX-license-ids-to-kdb-files/20260117-083842
base:   v6.19-rc5
patch link:    https://lore.kernel.org/r/20260117003621.669382-1-tim.bird%40sony.com
patch subject: [PATCH] kernel: debug: Add SPDX license ids to kdb files
config: sparc-randconfig-002-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171534.EStWXGGO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171534.EStWXGGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171534.EStWXGGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/debug/gdbstub.c:38:
>> kernel/debug/debug_core.h:2:1: warning: "/*" within comment [-Wcomment]
    /*
     


vim +2 kernel/debug/debug_core.h

53197fc4954924 Jason Wessel 2010-04-02 @2  /*
53197fc4954924 Jason Wessel 2010-04-02  3   * Created by: Jason Wessel <jason.wessel@windriver.com>
53197fc4954924 Jason Wessel 2010-04-02  4   *
53197fc4954924 Jason Wessel 2010-04-02  5   * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
53197fc4954924 Jason Wessel 2010-04-02  6   */
53197fc4954924 Jason Wessel 2010-04-02  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
