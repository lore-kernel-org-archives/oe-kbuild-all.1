Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5061DE8A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 20:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738097192; cv=none; b=Un5kwFuZJX5jLb3G8rAk5WDoo0hDpvkRqaKlxhiamvD0X0lqNYAKr2oT415+Yj6ZrUZ//DkNG5YUeQ4metVuFJHvV4VEehUyQRnyoA2VquUG4Jm2n2fZYrHgfc0iA1KAx6l4OGZEwknH0L6zEspHm3QKhFhyRxkf9xy/j6ysnYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738097192; c=relaxed/simple;
	bh=cO9QEnxlouILbonXqUy8Z57P2jb4sFAWpZ70EHqGgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAtUIgp0Qnxy6cd22Y7coEwVlJquVxpmAu501CqTir9/TIDcsEdOie3S1XcqIyBUDAhdtcd5x/aLmQiroJMx1yKkucbv3hGlS0NCfU7YJVM6eNfYO+KXWl5HXB8t7e2Qca4sk00m7o2LZhbsBb0vvAc6G4LtoAbxnblz2C/DaKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfrBohYM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfrBohYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738097190; x=1769633190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cO9QEnxlouILbonXqUy8Z57P2jb4sFAWpZ70EHqGgtY=;
  b=FfrBohYMa5eHKUGl58VzncJehQJ1HMHTj1GDxV/x/wekep9sBu+sO0Zj
   KK4D5U/O015D6Cg9aFju8lP2jM93ZMA1ysXe/jqyQWM0IBHDFo+VszLqn
   YHCXRVBqCbdbFhNKydVvu7h+lW+00cv8E2eNsuySB5LSUMyj6tH/F02i6
   BIf3gtE6JWgH35YqE1yyJf6HaBwmUBUlXFr5N/1cHJAALrysjtQS5tSZ/
   HJS/8AKoma3fRwSXg1EA/ji7NJSsyrk1XloenvD+GIO4DiMf14HcKeRia
   gP6xEVW7OVJuYE3VuUzjc/qTm0xxz6ZdDMRvmaVYLjTQbsOuF3+4z9l0h
   g==;
X-CSE-ConnectionGUID: LbN8KAwXQ5aOvOuVyoCZqA==
X-CSE-MsgGUID: 53xOT/7rRIKUrMudKXz/1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37844662"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="37844662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 12:46:30 -0800
X-CSE-ConnectionGUID: eY1KLVcJTW6trTWiQ33oDw==
X-CSE-MsgGUID: Uxbh4G2GT+uICt3YmEYO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108725336"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2025 12:46:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcsTZ-000iBx-2x;
	Tue, 28 Jan 2025 20:46:25 +0000
Date: Wed, 29 Jan 2025 04:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	John Harrison <john.c.harrison@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 5/6] drm/xe/xe_hw_engine: Update
 hw_engine_snapshot_capture for debugfs
Message-ID: <202501290445.TQXo9Zc9-lkp@intel.com>
References: <20250128183653.4027915-6-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128183653.4027915-6-alan.previn.teres.alexis@intel.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8b47c9cdb6a78364fe68f8af0abfd6f265577001]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-xe-guc-Rename-__guc_capture_parsed_output/20250129-023915
base:   8b47c9cdb6a78364fe68f8af0abfd6f265577001
patch link:    https://lore.kernel.org/r/20250128183653.4027915-6-alan.previn.teres.alexis%40intel.com
patch subject: [PATCH v6 5/6] drm/xe/xe_hw_engine: Update hw_engine_snapshot_capture for debugfs
config: csky-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250129/202501290445.TQXo9Zc9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290445.TQXo9Zc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290445.TQXo9Zc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_capture.c:1597: warning: expecting prototype for xe_guc_capture_snapshot_store_and_get_manual_hwe(). Prototype was for xe_guc_capture_snapshot_manual_hwe() instead


vim +1597 drivers/gpu/drm/xe/xe_guc_capture.c

  1585	
  1586	/**
  1587	 * xe_guc_capture_snapshot_store_and_get_manual_hwe - Generate and get manual engine register dump
  1588	 * @guc: Target GuC for manual capture
  1589	 * @hwe: The engine instance to capture from
  1590	 *
  1591	 * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
  1592	 * without any queue association. This capture node is not stored in outlist or cachelist,
  1593	 * Returns: New capture node and caller must "put"
  1594	 */
  1595	struct xe_guc_capture_snapshot *
  1596	xe_guc_capture_snapshot_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 1597	{
  1598		struct xe_guc_capture_snapshot *new;
  1599	
  1600		new = guc_capture_get_manual_snapshot(guc, hwe);
  1601		if (!new)
  1602			return NULL;
  1603	
  1604		new->guc_id = 0;
  1605		new->lrca = 0;
  1606		new->is_partial = 0;
  1607		new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
  1608	
  1609		return new;
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
