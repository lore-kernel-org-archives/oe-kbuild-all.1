Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0744064E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 19:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169314; cv=none; b=NPsN8NMwjZmMNiXoJH8QH5lwI62SRdeCnbgqculoD+N16/SekPnjW1LxoFBE4tubclSC3qBOJ4s2efmmtgz85nIqfnok9iZHuv5KeFjG9iS/LWhT+099DfG9M9W+lg5qP5+9W7IrBwTC9JNYsbv9OglSFD0I3UO31KZSyCfiing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169314; c=relaxed/simple;
	bh=oGsqZHXUXRDstnRGcLiByRG8dKVnJ/m1JrIR+NIsFc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTbr2UQSwSJX8X0KSK924kODUCa+LXl8zGjDFLTDaEgeXSzPprYxHMbYTgmZ8sxTlhR1PK2rgmqWAW6r7Pzlc9Hy5l7I0F64gg3toTQNVsrotCVkawx3/G8Xl5/6JarDk9cZzmZIQeGE7WBKHupT12rVEVgShK5ULvUhBCAd/Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek2CM80C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek2CM80C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787169313; x=1818705313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGsqZHXUXRDstnRGcLiByRG8dKVnJ/m1JrIR+NIsFc8=;
  b=Ek2CM80CuQkgFPhQcpw0mO9O6RMJUfWit9isjLrgP53hLM8RaViK9W7I
   UbgUYF8fJz3Pwe6hQlkpwt0DJDuYesyao6J4aNMDFpy7RqIuaCfFTokNO
   XVKNmWNeg/P5rpqoyZp7eGa6fm3JdhLJmn9OD8OmSmbWfK6UGNpwLDbX3
   NXYycblONLYEqIGaDMZUX2No9Snbl/H7mwsrvw52ftqiWHIVwVt5W53ZZ
   SCX0kula+LCKNGTCqwJLUjHen4CFt1pwyi6Z+hmhfJWqpbZJyrXonQ69w
   H+pj6X8dqpTcnUyNReQqF5XFg+EQL3N3p0UWCUZk3qwvTGR7ucVktttEN
   w==;
X-CSE-ConnectionGUID: zx3XA1FFTI+EHJ+1aLIJwA==
X-CSE-MsgGUID: ki2bWkNxRfGqYl6lKFGl0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87460199"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87460199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 12:55:12 -0700
X-CSE-ConnectionGUID: 0jEzhfqsQCyoYkRwCXZKhA==
X-CSE-MsgGUID: NGyNDkn6QnuJ0VttJaSkig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269162626"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2026 12:55:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwmNR-000000007OT-0u5E;
	Wed, 19 Aug 2026 19:55:09 +0000
Date: Wed, 19 Aug 2026 21:54:46 +0200
From: kernel test robot <lkp@intel.com>
To: Jaspinder Budhal <j-budhal@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] accel/npac: Add NPAC client driver
Message-ID: <202608192150.mGwberqw-lkp@intel.com>
References: <20260701062505.1091840-3-j-budhal@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701062505.1091840-3-j-budhal@ti.com>

Hi Jaspinder,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on drm-misc/drm-misc-next drm-tip/drm-tip linus/master v7.2 next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaspinder-Budhal/Documentation-accel-Add-NPAC-client-driver-documentation/20260813-183039
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260701062505.1091840-3-j-budhal%40ti.com
patch subject: [RFC PATCH 2/2] accel/npac: Add NPAC client driver
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260819/202608192150.mGwberqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192150.mGwberqw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/accel/npac.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
