Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397D1DDE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6F7YkNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698963599; x=1730499599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pOomK60vReoHoxtpV622grZQ+xKJAZalF61nf6xRPAw=;
  b=H6F7YkNw/Mhq2Byof84dcD/Iu0t6CjQKz7WJepF0tQjdPjIypLyvgqHn
   XhW1sf3YQboM1nFky2QJboMuFyYub3eGPoMWsMYq2Zkc+4POf09N3ot2h
   sr+yi2Z9xF7zobcvMIewfqxhP/Soe3jxnykcWEUFiNKxhmNEeQhMoT7Ll
   Mscit4JztGmDUU0ZpntVl1p0X3LsJ1OqYI7FgAFM9FChk1/L9EMI0Peiu
   gxkgrPniAvS2AkF8pqd57NEKldR1NhG5O2t/S0Hb/tvi4bPwPQE3x5qlu
   L6c4WSF5JV8Us+DckiebjNhBvIgcliv6jp4mu2goTJHUF+sVXVj1IjT4y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387718242"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="387718242"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 15:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885020179"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="885020179"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2023 15:11:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyfuX-0001ui-02;
	Thu, 02 Nov 2023 22:11:33 +0000
Date: Fri, 3 Nov 2023 06:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] firmware: meson_sm: Add chipid number sysfs entry
Message-ID: <202311030513.HxyDUCuc-lkp@intel.com>
References: <20231102074916.3280809-3-adeep@lexina.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102074916.3280809-3-adeep@lexina.in>

Hi Viacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.6 next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/firmware-meson-sm-change-sprintf-to-scnprintf/20231102-172556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231102074916.3280809-3-adeep%40lexina.in
patch subject: [PATCH 2/4] firmware: meson_sm: Add chipid number sysfs entry
config: arm64-randconfig-003-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030513.HxyDUCuc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030513.HxyDUCuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030513.HxyDUCuc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/meson/meson_sm.c: In function 'chipid_show':
>> drivers/firmware/meson/meson_sm.c:315:17: error: 'ch' undeclared (first use in this function)
     315 |                 ch = (uint8_t *)(id_buf + 4);
         |                 ^~
   drivers/firmware/meson/meson_sm.c:315:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/firmware/meson/meson_sm.c:316:22: error: 'i' undeclared (first use in this function)
     316 |                 for (i = 0; i < 12; i++)
         |                      ^


vim +/ch +315 drivers/firmware/meson/meson_sm.c

   277	
   278	static ssize_t chipid_show(struct device *dev, struct device_attribute *attr,
   279				 char *buf)
   280	{
   281		struct platform_device *pdev = to_platform_device(dev);
   282		struct meson_sm_firmware *fw;
   283		uint8_t *id_buf;
   284		int ret;
   285	
   286		fw = platform_get_drvdata(pdev);
   287	
   288		id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
   289		if (!id_buf)
   290			return -ENOMEM;
   291	
   292		ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
   293					 2, 0, 0, 0, 0);
   294		if (ret < 0) {
   295			kfree(id_buf);
   296			return ret;
   297		}
   298	
   299		int version = *((unsigned int *)id_buf);
   300	
   301		if (version == 2)
   302			ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
   303		else {
   304			/**
   305			 * Legacy 12-byte chip ID read out, transform data
   306			 * to expected order format.
   307			 */
   308			uint8_t *buff;
   309	
   310			buff = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
   311			if (!buff)
   312				return -ENOMEM;
   313			((uint32_t *)buff)[0] = 0; // CPU_ID is empty
   314			/* Transform into expected order for display */
 > 315			ch = (uint8_t *)(id_buf + 4);
 > 316			for (i = 0; i < 12; i++)
   317				buff[i + 4] = ch[11 - i];
   318			ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &buff);
   319			kfree(buff);
   320		}
   321	
   322		kfree(id_buf);
   323		return ret;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
