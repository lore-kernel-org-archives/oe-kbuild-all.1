Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89312E1D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447070; cv=none; b=WKsbmwDkweoZ/c3OrbVlPkiS5BagDqcJzd4437bQ4BUpQAv2h32RUSYnOrKoaTxTNrwyag1Q3ATpmX5Nvz75xdSQNNfQUI5i9fgc9/gn9Ri5WI8EKvAN+jndiLQ7C7SptGP0LcO3J0GBlnfk80N5D8kaJCttXUk3t9uw1QldqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447070; c=relaxed/simple;
	bh=PYAg1ZqmNUaJogahcmu2kjJiVsQaBbIvYTdKDkCeMtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKbig6HpbIhPYiHdePxrmTet2VgFyEMfXWEz8oGRzjcy3e0pWSKbW8zoSxw61mMkYnPI5By/ZlpxAuKBf4KMzrjb88mqxygugNJr2E9jRRFBu5WqMz0QquKI5pDcSds/f9mwOV9jd+7CMrpXTbgJrUcbB+KtrP5LWEXPDCuMf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNBxbNid; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNBxbNid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447069; x=1758983069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYAg1ZqmNUaJogahcmu2kjJiVsQaBbIvYTdKDkCeMtE=;
  b=cNBxbNidpEKe7/aVeqLKj1Dmg34XZPiUNB4G4HJi/aBubJXskn8DAXxL
   LfrN2pm+pbdT5LicRkQM7DtynIbZW94sg9olJ/80DpXHZB/tGGDgIuX5a
   /1Lm+fN+eSqjzmq6WH5ucKD9SPKAn390nKcIX5/ZpNagCwkZv5s93H3/a
   nQQGCpSujtpqa6iz65PnciJpLEwvvLuGa5H4pIOJtltuw1IJOLajTmCfN
   llRZd2CwMrL1w/3zcouvhSGsN3EV2zCUM52xwXg0lZALr2u+7rlh2yAnu
   +7g/5UZ0QrhNiIuOwXuHhtp3okKYGZPDcrNc/jx2DL5vS9D8swe388Q2D
   w==;
X-CSE-ConnectionGUID: I6KiyC1KRQ+ZiuC4ZZ/xhg==
X-CSE-MsgGUID: II/9AiVVRoe3jp6Brd7wFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49119854"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="49119854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:24:26 -0700
X-CSE-ConnectionGUID: taYo73WoRjWckqIuHcVrsA==
X-CSE-MsgGUID: 51l1VsGuTS2ZxmRf9nRLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76927138"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 07:24:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBtP-000ME7-0l;
	Fri, 27 Sep 2024 14:24:23 +0000
Date: Fri, 27 Sep 2024 22:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Athavale <rohit.athavale@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 229/1001]
 drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: warning:
 'xcsc_correct_coeff' accessing 48 bytes in a region of size 16
Message-ID: <202409272220.NKi46Ayf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 124e3f264793a4c64792bd416046a1df463995c7 [229/1001] v4l: xilinx-vpss-csc: driver support for xilinx vpss csc
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240927/202409272220.NKi46Ayf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272220.NKi46Ayf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272220.NKi46Ayf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'xcsc_set_red_gain',
       inlined from 'xcsc_s_stream' at drivers/media/platform/xilinx/xilinx-vpss-csc.c:759:2:
>> drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: warning: 'xcsc_correct_coeff' accessing 48 bytes in a region of size 16 [-Wstringop-overflow=]
     660 |                 xcsc_correct_coeff(xcsc, xcsc->shadow_coeff);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-vpss-csc.c:660:17: note: referencing argument 2 of type 's32[3][4]' {aka 'int[3][4]'}
   drivers/media/platform/xilinx/xilinx-vpss-csc.c: In function 'xcsc_s_stream':
   drivers/media/platform/xilinx/xilinx-vpss-csc.c:552:1: note: in a call to function 'xcsc_correct_coeff'
     552 | xcsc_correct_coeff(struct xcsc_dev *xcsc,
         | ^~~~~~~~~~~~~~~~~~


vim +/xcsc_correct_coeff +660 drivers/media/platform/xilinx/xilinx-vpss-csc.c

   641	
   642	static void xcsc_set_red_gain(struct xcsc_dev *xcsc)
   643	{
   644		dev_dbg(xcsc->xvip.dev,
   645			"%s: Red Gain %d Red Gain Active %d", __func__,
   646			(xcsc->red_gain - 20) / 2,
   647			(xcsc->red_gain_active - 20) / 2);
   648	
   649		if (xcsc->red_gain != xcsc->red_gain_active) {
   650			xcsc->shadow_coeff[0][0] = (xcsc->shadow_coeff[0][0] *
   651						    xcsc->red_gain) /
   652						    xcsc->red_gain_active;
   653			xcsc->shadow_coeff[0][1] = (xcsc->shadow_coeff[0][1] *
   654						    xcsc->red_gain) /
   655						    xcsc->red_gain_active;
   656			xcsc->shadow_coeff[0][2] = (xcsc->shadow_coeff[0][2] *
   657						    xcsc->red_gain) /
   658						    xcsc->red_gain_active;
   659			xcsc->red_gain_active = xcsc->red_gain;
 > 660			xcsc_correct_coeff(xcsc, xcsc->shadow_coeff);
   661			xcsc_write_coeff(xcsc);
   662		}
   663	#ifdef DEBUG
   664		xcsc_print_k_hw(xcsc);
   665		xcsc_print_coeff(xcsc);
   666	#endif
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
