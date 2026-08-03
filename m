Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34C2931FA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769502; cv=none; b=AodpEYkwjxfUhEdSJdN9yRuTs4nnGuWMH3WBMvSwC5/mTIg1KIsYedbgdxNK71iFRUgF7tMmHfpo6Lr3VewhoxgjBLctOZtVw4vMuoiK+ZaYYR8/rUpKQ5o/bJ1qrNuw+MxKXIBw9zpOWonk/Q/q7ZEfMFBUko6B6pWVgUckpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769502; c=relaxed/simple;
	bh=ciXSvr6JT7A1pHbO54Y099EuvOXcKI/MUHBtMiHKr4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmpK7p4VXYJ/IXKv6eoWNpyYU/phbDabQx2Bb4DJUUBAqIW/vEYbApm6oLMs5uQ5/QjXivzkZdjrWhUuqnCi8sEKfW66Asn+1QfQ+jP0WrkEqVVCLfSKnMJ7eLLfpUyaBftHEw82XK7T6OsBA3SiOlq2Pak1NMeK9tK/st6b4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deuvw9KW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deuvw9KW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785769501; x=1817305501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ciXSvr6JT7A1pHbO54Y099EuvOXcKI/MUHBtMiHKr4A=;
  b=deuvw9KWF05u97jNpdctLkkB/cGD8WF+CBpwW9DKQ4PbSm8oOE+ADE9t
   lkDrKifSNdeXfGdAuvc9OIwtx0uXOekAHVnwvGacslS8e7Te5OS9dySJK
   zpIhdlybYMP1vcTPOVmWJiJaV6nyyZ9pZZFr3APDXLtmz3qObLzm2F6Zs
   OJbxmXEnfZAvsh20+9/ML+Bo8XChGQ25FhUQ2uky7kaAWhvjLBQgJhsMs
   cG6iYxFPOwCgXGrdjhIKU8OaOITKu4oCEMgQNc4FN4cfKEJ7Di/yEagi4
   AXXrVJayqS2vxK8UnVUTQH/PqAEPSYsb21dDiLX5v6eC9ot9a1pk4l2Op
   Q==;
X-CSE-ConnectionGUID: Zt4r2F1/T6ykQV9xQTSShw==
X-CSE-MsgGUID: Yke+ABGpRyS/PSCfAmRcaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103706147"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="103706147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 08:05:00 -0700
X-CSE-ConnectionGUID: xkzujyIrQXCyPdXtRx/RpQ==
X-CSE-MsgGUID: fJd8gHoOTmCNnpFhAnco6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="291176003"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 08:04:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wquDo-000000007AX-2kkM;
	Mon, 03 Aug 2026 15:04:56 +0000
Date: Mon, 3 Aug 2026 23:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Seliverstov Daniil Denisovich <daniil.seliverstov2003@gmail.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>
Subject: Re: [PATCH] drm/xe: add DG2 HuC GSC support and MEI integration
Message-ID: <202608032214.SO0sxuT6-lkp@intel.com>
References: <20260731120427.864560-1-daniil.seliverstov2003@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731120427.864560-1-daniil.seliverstov2003@gmail.com>

Hi Seliverstov,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.2-rc6 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seliverstov-Daniil-Denisovich/drm-xe-add-DG2-HuC-GSC-support-and-MEI-integration/20260803-151027
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260731120427.864560-1-daniil.seliverstov2003%40gmail.com
patch subject: [PATCH] drm/xe: add DG2 HuC GSC support and MEI integration
config: um-randconfig-001-20260803 (https://download.01.org/0day-ci/archive/20260803/202608032214.SO0sxuT6-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608032214.SO0sxuT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608032214.SO0sxuT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/gpu/drm/xe/xe_mei_dg2.o: in function `xe_mei_dg2_auth_huc':
>> xe_mei_dg2.c:(.text+0x13f): undefined reference to `mei_cldev_enabled'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1a1): undefined reference to `mei_cldev_send'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1bd): undefined reference to `mei_cldev_recv'
>> /usr/bin/ld: xe_mei_dg2.c:(.text+0x1f4): undefined reference to `mei_cldev_enable'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
