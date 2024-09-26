Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB614A615
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727363665; cv=none; b=on8iVEpV4yJM8F0ZorQjXluhqu4kVqeygc4KWRNs6sBRGCCQYd03Tuxol4Ll5EMlZKYcSlGynV1VrRa8HUi8+pOzX/dCxRtrU4Z10JWeO3BgiDAS6xCfD6PYt2xP5tlV7X1n+VfBOa495MbSABhKZ40l5Ta4EZvLvrXfHD7A7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727363665; c=relaxed/simple;
	bh=JuuyEd5ygWXoer3sJn1ctfl6CSW3TtZNYqXUG3o4YMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2/E6+BPBGOfzRgeRAisfWdkwq0dYNmROQE9TGpTXbJO4S749O0L3fVq1BAvBnlmGOxVK1ABQ5OVSFeOl4ZdsbAKaCiUKqsVo7nM5JzAbDm/yNXvzEyITibPytDbkVxex6+dTjUR2t6pLXIPCnXzcDY/fKAFWakmjBYFEV+H3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HASZqoL8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HASZqoL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727363664; x=1758899664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JuuyEd5ygWXoer3sJn1ctfl6CSW3TtZNYqXUG3o4YMk=;
  b=HASZqoL8fHttZbHKKVdgrhXcAyxyDISZ7oqQ2GnrYu5/uDwdY/bkS6Y+
   HrDundMyTd6bCDTUMyYPQ5+xkNUE4z9WSj2Rla+KVp5HGb5AtVi2lMBgz
   WBrXrzE1vqjlyGVRIDd25Ysj7CmRKk0E6WjXitIdM4iTFjcvJPdqgEWjY
   IlF/tuIDe+SOE76L+f+tsuM6aIoONhEJ/xv05Qy7fSL/EijT+G9cT07c8
   zL5858kNJP02Kkj8p9yYKbxScyDfDn//Vc5BzaESdgV9te2VTLvdBfQf1
   PhZQI6VGFooFAawBsv9RkKLjZiOtyHEdZXDrVEBp1BhEA6xhttKo0Uf+D
   g==;
X-CSE-ConnectionGUID: ueBNo8IST/2Fxd07kEnBAA==
X-CSE-MsgGUID: 7ZU1XFunQTucJcbC0UZ0UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26339962"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26339962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:14:23 -0700
X-CSE-ConnectionGUID: 0r+AFkz/QiCxr7Zx/aJ8vA==
X-CSE-MsgGUID: /+5qi4x1Ss2VsX+8SEWUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72340291"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2024 08:14:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stqC9-000Kqr-1n;
	Thu, 26 Sep 2024 15:14:17 +0000
Date: Thu, 26 Sep 2024 23:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	heikki.krogerus@linux.intel.com, tzungbi@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jthies@google.com, pmalani@chromium.org,
	akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: typec: Add driver for Thunderbolt 3 Alternate
 Mode
Message-ID: <202409262224.Bnlmjakc-lkp@intel.com>
References: <20240925092505.1.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.1.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>

Hi Abhishek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on chrome-platform/for-firmware-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Pandit-Subedi/usb-typec-Add-driver-for-Thunderbolt-3-Alternate-Mode/20240926-002931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20240925092505.1.I3080b036e8de0b9957c57c1c3059db7149c5e549%40changeid
patch subject: [PATCH 1/8] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409262224.Bnlmjakc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262224.Bnlmjakc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409262224.Bnlmjakc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/altmodes/thunderbolt.c:15: warning: expecting prototype for USB Typec(). Prototype was for USB_TYPEC_VENDOR_INTEL() instead


vim +15 drivers/usb/typec/altmodes/thunderbolt.c

    14	
  > 15	#define USB_TYPEC_VENDOR_INTEL		0x8087
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
