Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE4397E73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632076; cv=none; b=YEtiAEj9bk9wKryUpokCD1/0NM7UHBLSFNKt0H+9QzDiWmarS6Dy6X/12FHXqI9DghcT4A/F4SQM2unCRSOvblteGOp2Dwg/N17KfBCboN/3kSP3QlzgpGFwRDQRIfR5QsO1WD/Nc4/lwcvRhGT9xfvoBsnUcyncJZCQLVaosaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632076; c=relaxed/simple;
	bh=QjXQi6T9hOG8cVQ771UnTvXuqp5BmjE8U2mPKpnPP1g=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mdc9ilV5WIIa5f3L0DDzx0CoRfHkhKp7CeLBH7tI1JggZXRVNbt9Lvvh2BhzGFPfBKYN39Z/JhcQ3b8gB8wOxj0tcFq3yqh0sVxcTS5fGZixo82P217QfRNzcWXa0ZOd83DyuCwkTI+E3RSRdAkEhvG4mNGvAkiInLWATkOqN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmYatXS+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmYatXS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632075; x=1822168075;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=QjXQi6T9hOG8cVQ771UnTvXuqp5BmjE8U2mPKpnPP1g=;
  b=AmYatXS+t+W8DCtS7Q5PHq4jlEMLlk5ImSpuka9zSiYWAq04ZLBqxiGK
   OsdGBUURMcIAojx4vVahBBIx5O3pjEqjZhOl0dZ+RE9KCF2KQIA06QzVG
   yeg60nj/8j6F7YpxXqxcYQCV2MJtHrHm2zjUdHOZwznbbYLxPK0IZeJB+
   NquXjS8D2O/7fbbzZL5aG/++6ydE2ypn+Q/ITgT2m2TF/zkIOj75DYrL0
   q/KVo08MWH8Z8K5puPenCJW2CE4U8Z3o/7HiFg5JkcsAmvd2SfRrqKH27
   MMrDR4fq0eQVDtUiQ0TO95+f9pq3k+/TyHS8HuoHKYAWrrXnBuc3daO6o
   Q==;
X-CSE-ConnectionGUID: HYNop2vvTs26mnFT49k57Q==
X-CSE-MsgGUID: yQX0GkZaQY2jwKI1sbcCQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90243808"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90243808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:47:54 -0700
X-CSE-ConnectionGUID: BLOvqkzUSqmebCuZ0xZdHA==
X-CSE-MsgGUID: JX27Zuw1SPyBEKha70/+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278986455"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2026 14:47:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJCR-00000000OYt-0Y2m
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Sep 2026 21:47:51 +0000
Date: Tue, 29 Sep 2026 05:47:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: net: ethtool: add BaseC2C medium & AUI C2C link modes
Message-ID: <202609290519.cl1XRHun-lkp@intel.com>
References: <202609290519.cl1XRHun-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609290519.cl1XRHun-lkp@intel.com>

Hi Siddaraju,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Siddaraju-DH/net-ethtool-add-BaseC2C-medium-AUI-C2C-link-modes/20260928-040656
base:   
patch link:    https://lore.kernel.org/r/202609290519.cl1XRHun-lkp%40intel.com
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609290519.cl1XRHun-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290519.cl1XRHun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290519.cl1XRHun-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/phy/phy-core.c: In function 'phy_speed_to_str':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_448' declared with attribute error: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.
--
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
   683 |                         prefix ## suffix();                             \
   |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
   |                                     ^~~~~~~~~~~~~~~~~~
   drivers/net/phy/phy-core.c:21:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   21 |         BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
   |         ^~~~~~~~~~~~~~~~
   In function 'phy_speed_to_str',
   inlined from 'phy_check_downshift' at drivers/net/phy/phy-core.c:389:2:
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_448' declared with attribute error: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.
--
   In file included from <command-line>:
   phy-core.c: In function 'phy_speed_to_str':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_448' declared with attribute error: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.
--
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
   683 |                         prefix ## suffix();                             \
   |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
   |                                     ^~~~~~~~~~~~~~~~~~
   phy-core.c:21:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   21 |         BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
   |         ^~~~~~~~~~~~~~~~
   In function 'phy_speed_to_str',
   inlined from 'phy_check_downshift' at phy-core.c:389:2:
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_448' declared with attribute error: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.


vim +/__compiletime_assert_448 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
