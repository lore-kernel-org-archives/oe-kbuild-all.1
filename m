Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA323914EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665726; cv=none; b=k/009Fe+csUIeJWon9kbsbnT/CylQBfXGH9MwiCwk/AldKrOoNZS9O7IvwEQtf9PJHHxtpN8Q0Ua1whEY+YkRFXiYmJqC6l6Eva6bdYbUwm0s3+0akLLqksIS6UQBAj0/FGz35N5MHRfC4asHim61LEFVJEWVE93AB0OOAALYbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665726; c=relaxed/simple;
	bh=Om1HO60SPxH3vTTTm7kOcRXlH/7T8EhefRjGDaK3l9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfVC5JyINwYM7wUGn40a9/tEkr1bqhk7YNpDB2YCR3a8pvp5CQPvpsX/w7pNJWesK7Uxej18YAavmk/vnWePeasdwIKZtqXlVSEo6l7WK7eTfCRdyqKxQ2CXIIMXugKoptCMT1yPSD7Q02TBvRXrbJeL6xQxznzwUHEKbFEDP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDyaP0WL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDyaP0WL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772665724; x=1804201724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Om1HO60SPxH3vTTTm7kOcRXlH/7T8EhefRjGDaK3l9g=;
  b=RDyaP0WLMWTi/eH4pR9w5ZRctUC0t+hoNuuLROttm27RTSzsbZUQJpCt
   2TXvSj+kZAG5KggAjuL1kpFwHxs/UUjZ6Eu5mz1fLVsbAeq/yv49moKOJ
   vMzKR8EttTaTev+96yprJptepROPMgoVxKhQyIRwWRwybZCdkMsv7VqZL
   Nc7wa/ZD31QoCLQt+WvwRqTNS+TM0bu7mx8oP2LntXnS4BVKKX62Qf3Fp
   v6mIw1g7L5dkChX3YW6q8YM1AIUQpZiDLsdlBEUTbLbpmp8jk3SlXOHvv
   R+6pMf9rVAgOGm6h1q3QSpJfiZWRWs6D+AJBdgCkeKAr8KmF7QhfVpLIa
   w==;
X-CSE-ConnectionGUID: AVH7+T2yRWiBmJHsdjYYIA==
X-CSE-MsgGUID: hIhzy6YWSua1Ekmp1On46g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73647866"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73647866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:08:44 -0800
X-CSE-ConnectionGUID: tidI9B6pSA2ERLotc7hDmA==
X-CSE-MsgGUID: ixbTbVstT7W2dDxUgjHFzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222632139"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 15:08:41 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvKY-000000004er-0nVQ;
	Wed, 04 Mar 2026 23:08:38 +0000
Date: Thu, 5 Mar 2026 07:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	pawell@cadence.com, rogerq@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <202603050731.SDNJ7lx5-lkp@intel.com>
References: <20260302030339.324196-2-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-2-peter.chen@cixtech.com>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Chen/usb-cdns3-Add-USBSSP-platform-driver-support/20260302-110634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260302030339.324196-2-peter.chen%40cixtech.com
patch subject: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
config: x86_64-buildonly-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050731.SDNJ7lx5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050731.SDNJ7lx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050731.SDNJ7lx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-plat.c:26:28: warning: 'cdns3_plat' defined but not used [-Wunused-const-variable=]
      26 | static const unsigned long cdns3_plat;
         |                            ^~~~~~~~~~


vim +/cdns3_plat +26 drivers/usb/cdns3/cdns3-plat.c

    25	
  > 26	static const unsigned long cdns3_plat;
    27	static const unsigned long cdnsp_plat;
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
