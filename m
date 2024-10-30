Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBDA1E907F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298076; cv=none; b=ptQqNrq0EwwCeqiA7m6AQpXYnOFMvSnYTfOycon09sVpbF6c8HMZcrZiS7D90jpWQ30LLZkcV1VpxRkoRpV0HWvnEGgVTv7R+wYDGCgvi6+g7rysusmA8tscpkFOJ6Jxgf674embbdT4AyhmgXgqFKiWf+dtFjrbL33lC7V4fEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298076; c=relaxed/simple;
	bh=97b8mld7VPSGB4X2IzAd5UaGmHUxEICq010VGDa82as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SMxxYZ3uxAWYefDrHqekd58GUEkmOSDJGD18xpapl/AVXKah1eCu5BfXwElcUrEM3S1TDHXW/NQPzXVgnhVAytEn+ehR6eweV6aWFod9nSBIZN4edCkVUOHn/qiDEBAeIGQYAY+vlieg/xiiV7VOPV8FYb2tGgbYFqswHUKqVl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkQ7WEjb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkQ7WEjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730298075; x=1761834075;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=97b8mld7VPSGB4X2IzAd5UaGmHUxEICq010VGDa82as=;
  b=PkQ7WEjbmoCdcxNHHTPwPJYIX86NoPnKK6USauGyhDKEj3v6RuEnscIw
   sV1HVJQJ/3xXNsdnnTF6kVzXNSVSA/4PqHkdqcAWl4lrKWigAn0QKWDuu
   Pzbee7x5PoLdjgCwzbBmvfvB5XNsxxLuKIxNTvJzHrfwzFcf4fyRlqTJv
   4Q20Kv6iIrbBtHFEJ5MEETc0BQcT7KY3DXGbg3oEZxlEqiWkq2XU3X/hB
   ev3Yi87BoFDuC06Q8c6q8GpG4J42tPvRHfTjbvUQT11PDGgauWB1FAkHs
   lvRiL1wJb+NQpANaUo3IZSWcN6MME2LQW6asy96DS0d635mynBjhFKy+f
   w==;
X-CSE-ConnectionGUID: JIvo65N1QBawUdnGSYUwVw==
X-CSE-MsgGUID: aRDJmTQjREiMWmwrBCzpuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52557951"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52557951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:21:14 -0700
X-CSE-ConnectionGUID: 4KlIC5PdQf6lxZGq9oeEBQ==
X-CSE-MsgGUID: cwVX7rVHRve276Glai3PZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86260724"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2024 07:21:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t69ZO-000evq-0f;
	Wed, 30 Oct 2024 14:21:10 +0000
Date: Wed, 30 Oct 2024 22:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/6] phy: core: Simplify API of_phy_simple_xlate()
 implementation
Message-ID: <ZyJA0MOrP0HdNbD3@96212614dfde>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-phy_core_fix-v3-6-19b97c3ec917@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 6/6] phy: core: Simplify API of_phy_simple_xlate() implementation
Link: https://lore.kernel.org/stable/20241030-phy_core_fix-v3-6-19b97c3ec917%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



