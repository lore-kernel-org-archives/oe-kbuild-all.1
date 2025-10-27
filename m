Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41913C695
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 05:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761541383; cv=none; b=l+zgNfGPTWHgJeSDjVs7TxS9N6FfPez0wNy5C+dhhIrcw5OHnYuT3bTrVHdFQimXx6dyZhtc385KaPHWRe9GqsuGDrVxPIe9rkGeiagUwWuVRsQLy98VDjg1PF05fGGovJVXrhjSV/eBMq7ptpaSUkDrEIYXqMnwJfOt8vXsFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761541383; c=relaxed/simple;
	bh=DqZJwzGpumf2bYjGJ3ub6DRT5h5rV2H1XUJWun+0vtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVtSTtmSrT2AHXxg1cWbRatKZ+Dv69JLKsHjt7gXLHFVtZPjsJHH30xnR8NzjcIrrnP6K93+/VEVzc8hG1mlswk0HEec1kLk6lCZLfsvlEeuy/mn131kXdgT6LPthnaUPmdkdVFnqcRbrIQxBu3KdXtDrdxRDbUVUxxU2+aFUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3AVvrZl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3AVvrZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761541382; x=1793077382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqZJwzGpumf2bYjGJ3ub6DRT5h5rV2H1XUJWun+0vtE=;
  b=c3AVvrZlfSlzog2X7gAKIQSwPqEmDOsMa6TWKFCZqRZnvj85nVraAKac
   QF+5j6PMF7+cw8bbSSxyhf8Qw30KOQWyj+JAIKCgsgrVPZ3AK29X3tuX6
   s5RdpHbHiuWI/OANue/6YUHg5OYXRCLWCN4taoJ/L0gIumK2mZBew/nVI
   GviZKpghzYKpEbJIU4pJmxFrrME69Uo+SqR6IMIzjq6rKVJhC5Cc/bAIE
   wrztPPgdBkpjoMwxWyyP9ophwfXY8PKoSGAplq0hDIqaXm04LA+/77AEx
   ppHtfi109KObwZMtDLWM8H9H1IPkNXcllHxabHzdxkuE8ZfmrK/zrglXG
   A==;
X-CSE-ConnectionGUID: c1M7Px9JTwiEAFT9s/knHw==
X-CSE-MsgGUID: 6hxcoGlfTjON56HdgxdO6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63539498"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63539498"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 22:03:01 -0700
X-CSE-ConnectionGUID: ABjxpCRZQ0+e3lMbfKAFpA==
X-CSE-MsgGUID: cubBpUYmQJueGInwXob3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184170834"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2025 22:02:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDFNh-000GWD-1n;
	Mon, 27 Oct 2025 05:02:57 +0000
Date: Mon, 27 Oct 2025 13:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 58/95] ld.lld: error: undefined symbol:
 i2c_verify_client
Message-ID: <202510271347.115BMnsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   89cba586b8b4cde09c44b1896624720ea29f0205
commit: 59a07f0557a645594e56c08d619e553b0703b75a [58/95] iio: accel: bma220: add i2c watchdog feature
config: x86_64-randconfig-104-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271347.115BMnsC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271347.115BMnsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271347.115BMnsC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_verify_client
   >>> referenced by bma220_core.c:394 (drivers/iio/accel/bma220_core.c:394)
   >>>               vmlinux.o:(bma220_common_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
