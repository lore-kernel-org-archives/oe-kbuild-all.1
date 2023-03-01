Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C567E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 03:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677640267; x=1709176267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wk3JjSam+vOSq3prirEXuTOTY39Ksl2q9J269nhLmFA=;
  b=XQgNUQPw6nppia3PeHSLHC3t/i5Y3bbtxmNwVMIldK77lEeVVlsd09Ez
   +0+xMHJQQ93fVAF5IFLW8/qG61QJTBRag3tNY80EsyD4eM2zNyF9b425x
   h7esb5sROGFYiM3uBp0IB6aEsqI4m35Tlnih3j+/1f7gViEKK0RDzecml
   LKHXHw3ye4/Wbb2hgnPzvdN3Ss/btmP6R+j6EYp+3TF/f8l/snVhwmLyQ
   LhB4MzUiErYFg9qlGr4USAei1oVcU0DEKWaATsMlmSJkAhmTLb5LNM8AN
   RQ56kHDIY7PhrKdk95TE4YeFZy+iq98uFiZalKkLZl0zyZhkn3qChoPl8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="334344445"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="334344445"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 19:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="784154555"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="784154555"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 19:11:02 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXCrt-0005qV-24;
	Wed, 01 Mar 2023 03:11:01 +0000
Date: Wed, 1 Mar 2023 11:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Xiang <xiang.ye@intel.com>, Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Tyrone Ting <kfting@nuvoton.com>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
	heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
	wentong.wu@intel.com, lixu.zhang@intel.com,
	Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH v3 5/5] Documentation: Add ABI doc for attributes of LJCA
 device
Message-ID: <202303011034.QrSQepq1-lkp@intel.com>
References: <20230228065618.2686550-6-xiang.ye@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228065618.2686550-6-xiang.ye@intel.com>

Hi Ye,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes wsa/i2c/for-next broonie-spi/for-next linus/master v6.2 next-20230228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230228-150024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230228065618.2686550-6-xiang.ye%40intel.com
patch subject: [PATCH v3 5/5] Documentation: Add ABI doc for attributes of LJCA device
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/4073fac1618098db6eaffaa9b3b8cef9968bfd12
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/mfd-Add-support-for-Intel-LJCA-device/20230228-150024
        git checkout 4073fac1618098db6eaffaa9b3b8cef9968bfd12
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011034.QrSQepq1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-usb-devices-ljca:12: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-bus-usb-devices-ljca:12: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +12 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca

  > 12	Date:		July 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
