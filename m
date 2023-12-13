Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3683C1C693
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFZhyoVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702455007; x=1733991007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ignz5BgAlWWZlNn5QU5DLY4bYA5XmU6BAPgjMHUuIwA=;
  b=NFZhyoVzocFx9uAroyQhxDmXQr0HNvLZ7t9/kY14fwhXHPJPLvMkx21V
   UymkDaJTa9FPXLgTn+PEQz6iPS9Lf7x8nVT9CzD5Jq5olPiyWWJutkGoz
   KUKLyKk/KcHCjuebYyZz4WjkdZKUtQ/T9O9hMUF0oZBvO/MBnVLxSqkSL
   btKCOZp7fHusYLsPZImRlfMS+InDSBW9IO3l7Z6EiNCck9cFkMpRrOwW/
   bFb9AGEtNbzcyqFSkPTNHQlCa+1bsioSnZjgbtTtb2qNksDl3DgJfRSaX
   PJmix/1uG0AxXAm8mTDHovr+VLHW5Lblj/bXUKAxfFxqXhLDdlkbjfHUb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375083554"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="375083554"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:10:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773861027"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773861027"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 00:10:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDKJU-000KFN-2I;
	Wed, 13 Dec 2023 08:09:54 +0000
Date: Wed, 13 Dec 2023 16:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] usb: gadget: f_fs: fix fortify warning
Message-ID: <202312131514.x4csSoVu-lkp@intel.com>
References: <20231212112923.61799-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212112923.61799-1-dmantipov@yandex.ru>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/usb-gadget-f_fs-fix-fortify-warning/20231212-193946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231212112923.61799-1-dmantipov%40yandex.ru
patch subject: [PATCH] usb: gadget: f_fs: fix fortify warning
config: x86_64-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131514.x4csSoVu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131514.x4csSoVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131514.x4csSoVu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:
>> ./usr/include/linux/usb/functionfs.h:76:2: error: expected specifier-qualifier-list before 'struct_group'
      76 |  struct_group(IDs,
         |  ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
