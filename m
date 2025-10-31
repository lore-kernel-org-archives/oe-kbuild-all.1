Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43AA15CD74
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904867; cv=none; b=KbnqO2OVtmS2Scay4+ylubmFvEi4aaMc8QCJr3qKgadGkFxKSSctREreXe0cQPyS/iBTvYAqHMWQRoJDg8RTCvye/SHbHmUbZVzav5A1/guefl9GlKdBGhjK1EHNFnxCJotJDIXbsS/WH1vL8ylBMklECKHWVxvmodmHuxmtQEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904867; c=relaxed/simple;
	bh=lpRTAu5u96Fl2qSsJAb0TRm4JUAZjs5tGp1K4FEegto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKTLCAB+mYuQ4sdf7mrPjWFPVyXtS2Lp2NFc2tHlFRet2WqrYbdrkGg+LiUxmg5JyPVChf7ZzenyLN7OOHd6xR541Vf2uNK8EFG/eLu0nCP05O55ge5Vg+XVTCVF3f4dJuspC2p3Nva9emEyYmud+Rc4Sjd+pH3mxdMA9ZmfHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwRdGq+6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwRdGq+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761904865; x=1793440865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lpRTAu5u96Fl2qSsJAb0TRm4JUAZjs5tGp1K4FEegto=;
  b=CwRdGq+6ONgBmR1hdOBy38LrIVFiJzQtCIDWEHH0z8tmj+NXKa/cwg/x
   SjNOWl8eKOLz6sDTE/F5g1pc4UDABIpaam5ENqusUwNerb70+w2QnuUHk
   V+dsOHrPe2B4Gsq+s3FMc7aLIGK9vKaW+hzmeE5jqMNFjzPPRXzDy8MQN
   gM+1H48HoPm9p6Jgr2wVMAUXqWzVWMYbZ8GOPfyf/1H6PHBu8hYzLErM1
   cQ93mbQCaExU+TLwbny99md+zFqwWMExSF+NkB+h8KqdYtaT8nkXE0w9Y
   4ufK7paDmifxmtFfskWpsNdOxayn4vtbKrh07uIf8hdA9oZUQ8W3YOxzp
   g==;
X-CSE-ConnectionGUID: r1xNKwYzTJuU14bShH8R1g==
X-CSE-MsgGUID: 8tOMtJnTSfOQBGk5zaudFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63760041"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="63760041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:01:04 -0700
X-CSE-ConnectionGUID: GFOAN0ddQXa5pkW0RShgog==
X-CSE-MsgGUID: 2C3OJHvNR5u8/lRtrcy8tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185887156"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2025 03:01:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vElwJ-000Myg-1C;
	Fri, 31 Oct 2025 10:00:59 +0000
Date: Fri, 31 Oct 2025 17:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
	gustavo@embeddedor.com, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces
 and countries
Message-ID: <202510311740.AvZo1SI1-lkp@intel.com>
References: <20251030132149.2575138-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030132149.2575138-1-oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus staging/staging-testing staging/staging-next staging/staging-linus westeri-thunderbolt/next linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/uapi-cdc-h-cleanly-provide-for-more-interfaces-and-countries/20251030-212514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251030132149.2575138-1-oneukum%40suse.com
patch subject: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251031/202510311740.AvZo1SI1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311740.AvZo1SI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311740.AvZo1SI1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/usb/cdc.h:109:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     109 |                 DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
         |                 ^~~~~~~~~~~~~~~~~~
   ./usr/include/linux/usb/cdc.h:122:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     122 |                 DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
         |                 ^~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
