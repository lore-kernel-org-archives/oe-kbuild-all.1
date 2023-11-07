Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B319469
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 00:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEcCEjBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699317073; x=1730853073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6N7YRvDe2tAbBLyFRyO3d+riUvZiVz1lR9705NEy5E=;
  b=PEcCEjBaFcu5ZP3GKrEgUSbt/rXQTzE93GEEhMqrRvnbI1s3n+VCRBd7
   H/T3r0AJJyEjfYVEO1NqgVz60FdbTUyGqLEWWpojaoMFVEuFV3vV81+XG
   rPd8dK9OMndlGOtjCyDuP3NNCqW9WCftoESeRZ+LyFybdBcr9syKAOXms
   OEuwoqYPNTfWNdZUN1yBBqAFI4MGrh+psjE4ePZnhm4aQ69NaSsfbqGjq
   YXT4Q2EcDGlC9MO9L8V4ssc+My1YLVPw5iamAdaarXJsgCPV6Aifpgqre
   f6Y8EmttjQBe57U5LGX/vLWlPqK3bVaO1tmiVlAnQTM09e98pWdOvXW3v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="389204524"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="389204524"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 16:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766122983"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="766122983"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2023 16:31:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r09zp-0006qS-0l;
	Tue, 07 Nov 2023 00:31:09 +0000
Date: Tue, 7 Nov 2023 08:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/645 45/15769]
 drivers/soc/imx/busfreq-imx8mq.c:226:6: error: redefinition of
 'request_bus_freq'
Message-ID: <202311070836.5vGg2Wek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/645
head:   d9e9cb8ce9bc751887fd5ed53e0cfac82c8aae13
commit: fee42f75d8786f28af722e29cde3050e2cce611c [45/15769] MLK-16689-03 driver: soc: Add busfreq driver for imx8mq
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311070836.5vGg2Wek-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070836.5vGg2Wek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070836.5vGg2Wek-lkp@intel.com/

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
