Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1C1F099C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759118205; cv=none; b=JPr0rE1zVyB+G83AKiYvl/QRijvty1JLS1GpN4FUwp6DzPYOxLzohM3miq6t2TqkBRJd4W/+rqtQSo4VVSilw2kGC/5DJIb64Q1krDMmW+Dd4yFjk7mpdGxYELi5q/JNL/zmVYjfACn3/gq6XNZ3NFqkJBlHShBcr95wTR2UhHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759118205; c=relaxed/simple;
	bh=Rf/uwTPBla5UKpsA9SxnlIHoPAMAsFhSKcisO7CygQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkUWwDee4TECdg1+RJi3lZADkSC4EgEHyZ7xpUL/irvs8O6Kjn/pIEm5xTAWP0nckcfkR/1ec/t1KJz94IxP7xCSQH2R7paoyYWoNo7jO6GUPOuNPl+PowaRBBrlRtmXGoO1TvxOIiL0EXL7a8p/U0LWhv29sl/tj3jr64V+xnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7tCQf3z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7tCQf3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759118204; x=1790654204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rf/uwTPBla5UKpsA9SxnlIHoPAMAsFhSKcisO7CygQE=;
  b=h7tCQf3zg+7NkxmSefFtSNqOIiw7w0sloey0WPlD13leexFNdX5ZIfn/
   8SPnRbFKexQTdAYL7VNlxb4/ihgzTeDKng1SHQNp5ErxeKXi1hNYPmRfr
   XL8zz9kYvBFplblhRYMgWwaHR6guSmyZtxxt4AmOjoKvW1FgefzqYOXG/
   5kXdaSEy3p4TL1wjL0n7rXEwtnrSeeeZdLhp7C/vLe/ua2JXBIekRMpwC
   18K27Nv9MyLRA5x0Cn5qxldtqiA/udhtCt66frznUJ05yUzxs4hn/Jpbb
   r0of+CdbV0CjryJEFBxAzr5xloGQ5oZVmprTsEXgNu9u7zeNq+hkE6+oh
   w==;
X-CSE-ConnectionGUID: l0uyAES+QWexmnyw63vCbg==
X-CSE-MsgGUID: ivLR1YKrT6GWSfKjrSzS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61266288"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61266288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 20:56:43 -0700
X-CSE-ConnectionGUID: BSD57PY5QyKQtYHKoEkMPQ==
X-CSE-MsgGUID: wm4ACMu2TXi7hjsvuQbiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="182421377"
Received: from lkp-server01.sh.intel.com (HELO a2c9da549b7f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2025 20:56:42 -0700
Received: from kbuild by a2c9da549b7f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v350B-00001r-1Z;
	Mon, 29 Sep 2025 03:56:39 +0000
Date: Mon, 29 Sep 2025 11:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Weifeng Liu <weifeng.liu.z@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Yifan Liu <yifan1.liu@intel.com>
Subject: [acrn:6.12/linux 9/10] drivers/gpu/drm/drm_atomic_helper.c:1765:16:
 warning: unused variable 'ret'
Message-ID: <202509291151.QLNxPwML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel 6.12/linux
head:   a3634b1a933e80ff672cc47bd32d2f036cfbe755
commit: 3cc37670a872d763017eb6d99a24be755d47df86 [9/10] drm: Add vblank_flip event
config: i386-buildonly-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291151.QLNxPwML-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291151.QLNxPwML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291151.QLNxPwML-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_helper.c: In function 'drm_atomic_helper_update_flip_sequence':
>> drivers/gpu/drm/drm_atomic_helper.c:1765:16: warning: unused variable 'ret' [-Wunused-variable]
    1765 |         int i, ret;
         |                ^~~


vim +/ret +1765 drivers/gpu/drm/drm_atomic_helper.c

  1759	
  1760	void drm_atomic_helper_update_flip_sequence(struct drm_device *dev,
  1761						  struct drm_atomic_state *old_state)
  1762	{
  1763		struct drm_crtc *crtc;
  1764		struct drm_crtc_state *new_crtc_state;
> 1765		int i, ret;
  1766	
  1767		for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
  1768			if (crtc->funcs && crtc->funcs->get_vblank_timestamp)
  1769				WRITE_ONCE(crtc->pending_flip_sequence,
  1770					drm_crtc_accurate_vblank_count(crtc) + 1);
  1771			else
  1772				WRITE_ONCE(crtc->pending_flip_sequence,
  1773					drm_crtc_vblank_count(crtc) + 1);
  1774		}
  1775	}
  1776	EXPORT_SYMBOL(drm_atomic_helper_update_flip_sequence);
  1777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
