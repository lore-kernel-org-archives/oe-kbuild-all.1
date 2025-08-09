Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58027276058
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754753448; cv=none; b=NNtXfSH5W8NT5SfE7rQMZeHvELcU19OVW5CFO15OWgLJib5UhFPJJVqm+M/lV6TU0GLpyBcg0n7hVj9JPhujda53KSYUVpyndWvFv3Eeqi8ipYj3GwAxC0TxxhjLKHa9E8ij8NXxXDDjbRt3ah+uV2PMmpM2jKkDRXjSS4fluHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754753448; c=relaxed/simple;
	bh=f+HK2VJeFXZ66mzCW414RG/x+xWx9dy0RDZzXGAwlCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvBCT4O1cfpQTFdVMnopl98+wW7b2a815IXEj3smf7FiSx2TXv3wjF7zat7I0vHBMJUI1kkuE+2ljKhzjfi8XHQunaDIAxMVlc6yvAb/8OHx4osAo4RqXl6xfudKCsNmncB/kZBTOYJK/AHB+ZxEpz2yPZQEs/UZZ5PAv0aV6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp8IVI8k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp8IVI8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754753447; x=1786289447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+HK2VJeFXZ66mzCW414RG/x+xWx9dy0RDZzXGAwlCY=;
  b=Xp8IVI8kFWQP7J3c4RV+XReMqPeIA1kD7B8mwvIcloqrRBosMMFV52X4
   1hQBaJJDUiYnDBZsszkK6fSlH09bNiBQ9GDKa3ZVzwncrZvwvG57PwOFU
   bbMja3nS9SaHY7ZsuRFodiRONoru9N78+ttRjUIjE1Q2TU7OlX5rPBp5P
   hxYBsvs1VjqppluNFAogN5X0jMwigmvQTOvnoBazXqStnRFCRXXUCL09i
   SZQCyf5iAUUCk31TAL+iFx06tuXIi5a2bpWnqJtbnXGFK53STK0wgHI1P
   +gOmrLJw/F2ik4mDdyiotRA+h7sAYV7ZyJPveQNgqZNweurkCZp1O+nkv
   w==;
X-CSE-ConnectionGUID: hGa7+0RaSuSbkZ9wWyL0Ww==
X-CSE-MsgGUID: y0dvD8ZXQLqZ2bs1PX4M8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60705365"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60705365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 08:30:46 -0700
X-CSE-ConnectionGUID: c2puHhK8QJmT48DZsOS8mw==
X-CSE-MsgGUID: AoMsAoP3SJ+p0V26BtRxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165965915"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2025 08:30:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uklWq-0004sC-1a;
	Sat, 09 Aug 2025 15:30:40 +0000
Date: Sat, 9 Aug 2025 23:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <202508092329.U0OxBRAh-lkp@intel.com>
References: <20250809102326.6032-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809102326.6032-2-hansg@kernel.org>

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus brgl/gpio/for-next andi-shyti/i2c/i2c-host linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/usb-misc-Add-Intel-USBIO-bridge-driver/20250809-182506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250809102326.6032-2-hansg%40kernel.org
patch subject: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250809/202508092329.U0OxBRAh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092329.U0OxBRAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508092329.U0OxBRAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/misc/usbio.c:132 struct member 'nr_gpio_banks' not described in 'usbio_device'
>> Warning: drivers/usb/misc/usbio.c:132 struct member 'gpios' not described in 'usbio_device'
>> Warning: drivers/usb/misc/usbio.c:132 struct member 'nr_i2c_buses' not described in 'usbio_device'
>> Warning: drivers/usb/misc/usbio.c:132 struct member 'i2cs' not described in 'usbio_device'
>> Warning: drivers/usb/misc/usbio.c:132 struct member 'nr_spi_buses' not described in 'usbio_device'
>> Warning: drivers/usb/misc/usbio.c:132 struct member 'spis' not described in 'usbio_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
