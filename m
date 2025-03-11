Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DB1D79BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741711617; cv=none; b=MGoHG86c9MXwok/PMpd2s+LyL4pWcwyYtCqaXCr7ANikutf7gwMjM7n8a0bmqSiirOtF++bL8hoDcEC5kfH81Ww5Nk6I7s0gvAz5QYSn5Y5CyTGYpUCjQNGkXYOtGq/lRHSiplSwmFlp7EQyr/OIUsU9D/SeWpH5FdahI+oBNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741711617; c=relaxed/simple;
	bh=ryYaZEJqKVsWMB4oFW89zMEF9slzIEb9YbCprlRduXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8KX+dkn8M/78aQr1S+h4BGVrPX10ovwDiXOeapKIQB9k+Hou8eXV53MHw9wkN1GgIWNldrWZ7aaW/JvNabYLhvJrEAhxL4mn4v9WqsHSq2K01R8keL53zVKFC2A0sYMAj3s+chRZRhCUAdJWS9ZAwwImLivRJ5SB6KpnntPi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hll61pc1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hll61pc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741711615; x=1773247615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ryYaZEJqKVsWMB4oFW89zMEF9slzIEb9YbCprlRduXk=;
  b=Hll61pc1PPuqg7TC6PYTwWnOsDf9fXu8j7mbwHto1iQWWHV1VpdYE+Dw
   VbVCKUXWM/TZAuk0R7sJbo5bwQXXKV0hYqQnO34npMZ3BiaPTVqTEPcZl
   ZfgBRnQTFxY4vZKhJGML51PUeQwEdO1UaDFcP1q5T9qq2ilp7cKqXVZuR
   7dTaipxhtiLjeeU6UZ2wWWhluCAa5azhTx1Ddi9BNNEFiy0DdwVam1Mpk
   Zbln+fpZpypeJsWsVH/yocZPdNIV9ALOCC63O5tzp9ZMS/X5BgQTk8M/C
   88+595PtuxkuUvfkjYzGwm14ksmEXO+6eil5w3OAdUo9JOhC1/GgaGrVM
   A==;
X-CSE-ConnectionGUID: sjxMagISSBSxMVr67UtdJA==
X-CSE-MsgGUID: eymq5+S+SQW8o0ciJMJ1nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46543892"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="46543892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 09:46:55 -0700
X-CSE-ConnectionGUID: jenPyYg8S7+mVfZ123TjPg==
X-CSE-MsgGUID: Oef1rB85ScmbrGrhIyZneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="120200229"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2025 09:46:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts2kj-0007ds-2I;
	Tue, 11 Mar 2025 16:46:50 +0000
Date: Wed, 12 Mar 2025 00:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <202503120028.JHoKfjCI-lkp@intel.com>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310122305.209534-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on sailus-media-tree/master v6.14-rc6 next-20250311]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/media-v4l2-common-Add-a-helper-for-obtaining-the-clock-producer/20250310-202543
base:   linus/master
patch link:    https://lore.kernel.org/r/20250310122305.209534-1-mehdi.djait%40linux.intel.com
patch subject: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining the clock producer
config: i386-randconfig-053-20250311 (https://download.01.org/0day-ci/archive/20250312/202503120028.JHoKfjCI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120028.JHoKfjCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120028.JHoKfjCI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_hw_register_fixed_rate
   >>> referenced by v4l2-common.c:667 (drivers/media/v4l2-core/v4l2-common.c:667)
   >>>               drivers/media/v4l2-core/v4l2-common.o:(devm_v4l2_sensor_clk_get) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
