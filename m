Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388202A1B2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736697874; cv=none; b=PKgfhm9YnPUgQsnOeoy4mzZGItWhFJTl5i/l3PTMgPCXetpZnXJEAoAPA+lxgjTZJiv+UVwkZWUXILZRYwqgNeXRtNf7cOnzwpW+V/mBYk37k7OyPDbWwcPARzRbsxjvGqkliPq0r/JK3XJQ+A/GOalbwxg5K6Ad5x1i2SwOT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736697874; c=relaxed/simple;
	bh=th+wh4H6bpiOUN5aiS/0zWLPFZaooxlnpa9NrtOPaiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpjfijfjHIVVrIKinuxDVLz8QsHfICBAFKiZIpAITjOkuItLgVR1KcLhuYeS1QOXFHqrqcgo/z68gtrmL193d4UeCI3a+fooPYTTMuIaGXSjEM47gDpHH1mB9EAqPxu1rQAowqK9ZjRx7X9T7K01UeY8Wy21HYs5/TclQK3hrzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMhdFK7J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMhdFK7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736697872; x=1768233872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=th+wh4H6bpiOUN5aiS/0zWLPFZaooxlnpa9NrtOPaiw=;
  b=jMhdFK7JwBmxMWomw7SoNxeSyTVc3exhusaOJnDGzYGHNM5M3IYCEjNK
   KkbROzM42OLQcC0/X2sKENLxKwbyIBtxxMzR3N4OZEhZa+R2StSrAK0mQ
   Pnq5KhZptDrIhvp/xs9eIQXPqSBEjrpnQK2ciyq6eLKCrSIgEwmK3nfXa
   1NrKMXu0IfOFhxiUqSzYFvps/Nc2iS4kXQrZ82byjPPQV/RxVlYZQGQHF
   EbcjWbbQvjv4m7qfq3A5xT9COsUgHE/2UD8tOTZFZfMjOHLxdhmjFgzVc
   6kjGDxYxu5LZhMyh7CGx5uw1US7mPvRLdCRh79eVwFtvm+SoY36XajLlA
   g==;
X-CSE-ConnectionGUID: ZNVCaDM+QdmcN1T5qOyRQw==
X-CSE-MsgGUID: enUGCytNQNi2PnCW/KjW5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36145809"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36145809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 08:04:31 -0800
X-CSE-ConnectionGUID: LobFNv74Q0Sqi2ITR8miPw==
X-CSE-MsgGUID: RdiUihK1TKy7hjpq49nS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104374479"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2025 08:04:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX0Rw-000M83-2E;
	Sun, 12 Jan 2025 16:04:28 +0000
Date: Mon, 13 Jan 2025 00:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Korinsky" <kirill@korins.ky>, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add HONOR MagicBook Art 14
 devicetree
Message-ID: <202501122343.SKoJXYQa-lkp@intel.com>
References: <871px910m1.wl-kirill@korins.ky>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871px910m1.wl-kirill@korins.ky>

Hi Kirill,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250110]
[cannot apply to robh/for-next v6.13-rc6 v6.13-rc5 v6.13-rc4 linus/master v6.13-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Korinsky/arm64-dts-qcom-x1e80100-add-HONOR-MagicBook-Art-14-devicetree/20250112-061420
base:   next-20250110
patch link:    https://lore.kernel.org/r/871px910m1.wl-kirill%40korins.ky
patch subject: [PATCH] arm64: dts: qcom: x1e80100: add HONOR MagicBook Art 14 devicetree
config: arm64-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501122343.SKoJXYQa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122343.SKoJXYQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122343.SKoJXYQa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts:1093.1-12 Label or path ufs_mem_hc not found
>> Error: arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts:1102.1-13 Label or path ufs_mem_phy not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
