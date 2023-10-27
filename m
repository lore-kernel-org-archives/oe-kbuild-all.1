Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD4BA50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4cAaEsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698406775; x=1729942775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sCLsYII0iIYQL0RY7KUb5/cg100s9wFU25OabDcN7+A=;
  b=c4cAaEsi1XNYq0WCcql5driHRJMMChwNEs0kx4IUL3vIECDJA81tEMoa
   QF3tOuYuDS87Bx3HQ1hcAVUT1CzcRfxdcBw4mzJV71vDJsSCRLg6aBn+O
   7yo+4mf6PutY2mHEWsdQI5joo7IGfa66q17WXY1YM5RxzvOvtz3HX2K6D
   KS+jk/VmuZZ8znBFv7jitBtW1Wc0qB6hFKpudfkC054AKQ+Y7XQZafItM
   BGynFT9Qu20XgrXFrlHlvN25lvGUaZjUn+6FqB2Fq9t73dtrdO2a9XMf1
   Xh30lND4zABySX/qNRwmdkkQWOQsj+iah/duTOnlTlV1ZC8Yn46nECVGO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="579437"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="579437"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876309651"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="876309651"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2023 04:39:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwLBY-000Amc-29;
	Fri, 27 Oct 2023 11:39:28 +0000
Date: Fri, 27 Oct 2023 19:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linhua Xu <Linhua.xu@unisoc.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	lh xu <xulh0829@gmail.com>, Linhua Xu <Linhua.Xu@unisoc.com>,
	Zhirong Qiu <zhirong.qiu@unisoc.com>,
	Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V3 4/6] pinctrl: sprd: Increase the range of register
 values
Message-ID: <202310271959.VUpjvnai-lkp@intel.com>
References: <20231027071426.17724-5-Linhua.xu@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027071426.17724-5-Linhua.xu@unisoc.com>

Hi Linhua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linhua-Xu/pinctrl-sprd-Modify-pull-up-parameters/20231027-151737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231027071426.17724-5-Linhua.xu%40unisoc.com
patch subject: [PATCH V3 4/6] pinctrl: sprd: Increase the range of register values
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310271959.VUpjvnai-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271959.VUpjvnai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271959.VUpjvnai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/sprd/pinctrl-sprd.c:29:
>> drivers/pinctrl/sprd/pinctrl-sprd.h:21: warning: "BIT_MASK" redefined
      21 | #define BIT_MASK        GENMASK(7, 0)
         | 
   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/pinctrl/sprd/pinctrl-sprd.c:7:
   include/linux/bits.h:9: note: this is the location of the previous definition
       9 | #define BIT_MASK(nr)            (UL(1) << ((nr) % BITS_PER_LONG))
         | 


vim +/BIT_MASK +21 drivers/pinctrl/sprd/pinctrl-sprd.h

    18	
    19	#define NUM_MASK	GENMASK(10, 0)
    20	#define TYPE_MASK	GENMASK(3, 0)
  > 21	#define BIT_MASK	GENMASK(7, 0)
    22	#define WIDTH_MASK	GENMASK(3, 0)
    23	#define REG_MASK	GENMASK(5, 0)
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
