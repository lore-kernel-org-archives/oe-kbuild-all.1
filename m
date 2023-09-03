Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BC138E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693723187; x=1725259187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVVPidrsr+VyGXNSqwjCLwtUNESYPN4At2gOuAwoCtM=;
  b=A7Z8NyatCFDu5fHimVitiTHNi/sGTb+/mhaggCecWO/mA9z83dW5HE4t
   P68v876bONSAinFaF0Q+2wAp0MUiJBIByuXdjAQinHexwnChLiUXU5Dle
   jzPC52wPpJ4hwlOOlF3F8JQGzAXZuKdVvT9sFdNTuk4vUT7a2q1FVA7BS
   ziFGg7CXNpztoEzlE4o+tXeq9uqaJ7piMnKRpxIFyo9l+dtvYTLte6TVz
   2XMgAzp5MZocyHy+lYusGkK38eeJY+bMV91Vnq5sXnHsvtKd9TJhic3Ny
   HuRkUgQsm7H68nrmWqWyrMbIkw0Sns2IF12HyG12d+3eb/hqPcU+R5yuA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="361447274"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="361447274"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 23:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="743592014"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="743592014"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Sep 2023 23:39:46 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcglr-0002yJ-3C;
	Sun, 03 Sep 2023 06:39:43 +0000
Date: Sun, 3 Sep 2023 14:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 52/24604]
 drivers/soc/imx/busfreq-imx8mq.c:226:6: error: redefinition of
 'request_bus_freq'
Message-ID: <202309031446.ZvoJwJPT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bai,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 110b17ce9caa3e77b3b5474bdafa4d6771df4b92 [52/24604] MLK-16689-03 driver: soc: Add busfreq driver for imx8mq
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230903/202309031446.ZvoJwJPT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031446.ZvoJwJPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031446.ZvoJwJPT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/busfreq-imx8mq.c:226:6: error: redefinition of 'request_bus_freq'
     226 | void request_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/soc/imx/busfreq-imx8mq.c:16:
   include/linux/busfreq-imx.h:58:20: note: previous definition of 'request_bus_freq' with type 'void(enum bus_freq_mode)'
      58 | static inline void request_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:262:6: error: redefinition of 'release_bus_freq'
     262 | void release_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:61:20: note: previous definition of 'release_bus_freq' with type 'void(enum bus_freq_mode)'
      61 | static inline void release_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/soc/imx/busfreq-imx8mq.c:314:5: error: redefinition of 'get_bus_freq_mode'
     314 | int get_bus_freq_mode(void)
         |     ^~~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:72:19: note: previous definition of 'get_bus_freq_mode' with type 'int(void)'
      72 | static inline int get_bus_freq_mode(void)
         |                   ^~~~~~~~~~~~~~~~~


vim +/request_bus_freq +226 drivers/soc/imx/busfreq-imx8mq.c

   225	
 > 226	void request_bus_freq(enum bus_freq_mode mode)
   227	{
   228		mutex_lock(&bus_freq_mutex);
   229	
   230		if (mode == BUS_FREQ_HIGH)
   231			high_bus_count++;
   232		else if (mode == BUS_FREQ_AUDIO)
   233			audio_bus_count++;
   234		else if (mode == BUS_FREQ_LOW)
   235			low_bus_count++;
   236	
   237		if (busfreq_suspended || !bus_freq_scaling_initialized ||
   238			!bus_freq_scaling_is_active) {
   239			mutex_unlock(&bus_freq_mutex);
   240			return;
   241		}
   242	
   243		cancel_low_bus_freq_handler();
   244	
   245		if ((mode == BUS_FREQ_HIGH) && (!high_bus_freq_mode)) {
   246			set_high_bus_freq(1);
   247			mutex_unlock(&bus_freq_mutex);
   248			return;
   249		}
   250	
   251		if ((mode == BUS_FREQ_AUDIO) && (!high_bus_freq_mode) &&
   252			 (!audio_bus_freq_mode)) {
   253			set_low_bus_freq();
   254			mutex_unlock(&bus_freq_mutex);
   255			return;
   256		}
   257	
   258		mutex_unlock(&bus_freq_mutex);
   259	}
   260	EXPORT_SYMBOL(request_bus_freq);
   261	
 > 262	void release_bus_freq(enum bus_freq_mode mode)
   263	{
   264		mutex_lock(&bus_freq_mutex);
   265		if (mode == BUS_FREQ_HIGH) {
   266			if (high_bus_count == 0) {
   267				dev_err(busfreq_dev, "high bus count mismatch!\n");
   268				dump_stack();
   269				mutex_unlock(&bus_freq_mutex);
   270				return;
   271			}
   272			high_bus_count--;
   273		} else if (mode == BUS_FREQ_AUDIO) {
   274			if (audio_bus_count == 0) {
   275				dev_err(busfreq_dev, "audio bus count mismatch!\n");
   276				dump_stack();
   277				mutex_unlock(&bus_freq_mutex);
   278				return;
   279			}
   280			audio_bus_count--;
   281		} else if (mode == BUS_FREQ_LOW) {
   282			if (low_bus_count == 0) {
   283				dev_err(busfreq_dev, "low bus count mismatch!\n");
   284				dump_stack();
   285				mutex_unlock(&bus_freq_mutex);
   286				return;
   287			}
   288			low_bus_count--;
   289		}
   290	
   291		if (busfreq_suspended || !bus_freq_scaling_initialized ||
   292			!bus_freq_scaling_is_active) {
   293			mutex_unlock(&bus_freq_mutex);
   294			return;
   295		}
   296	
   297		if ((!audio_bus_freq_mode) && (high_bus_count == 0) &&
   298			(audio_bus_count != 0)) {
   299			set_low_bus_freq();
   300			mutex_unlock(&bus_freq_mutex);
   301			return;
   302		}
   303	
   304		if ((!low_bus_freq_mode) && (high_bus_count == 0) &&
   305			(audio_bus_count == 0)) {
   306			set_low_bus_freq();
   307			mutex_unlock(&bus_freq_mutex);
   308		}
   309	
   310		mutex_unlock(&bus_freq_mutex);
   311	}
   312	EXPORT_SYMBOL(release_bus_freq);
   313	
 > 314	int get_bus_freq_mode(void)
   315	{
   316		return cur_bus_freq_mode;
   317	}
   318	EXPORT_SYMBOL(get_bus_freq_mode);
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
