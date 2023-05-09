Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E088137A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 04:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683606119; x=1715142119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQV+vIuYik094P6UilIgAG25twl+EiYQWGWqDvEAXe0=;
  b=f+kOIOvYOJdlBE2nZGr+Ne5rTr2AzB+cZxGPDHYmvd9JKtAG88cfYNVC
   FXcY5s8rEO8Cxr6JR/LlG4bdTPMBqieFw27nMBNZT2J4Tn0bpX2h7r5QU
   jlLb8393FrDPf3xqQ/Xsqr1UqasVYAFZdqLSJuWzhykUej2bUz53yjzz6
   EQTLkLgU9vbctYjrSB0gk62YeSGzEUf/crLUOatjAQSAvKYjrHqXSU2im
   q5+SDoibdHyFJ8ejrPIy1o3ggJoIOPSs0bekrC9erE3bytDi8li8erw1a
   Lr/GgVXhon1k3e78D8qE1RcWtxrBixU6OrUPZWDmVCwEJSJluS6IvfwKO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436124661"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="436124661"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698744716"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="698744716"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 21:21:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwErM-0001gS-0m;
	Tue, 09 May 2023 04:21:56 +0000
Date: Tue, 9 May 2023 12:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:fix/sdw-runtime-pm 1/1]
 drivers/soundwire/master.c:101:28: error: 'pm_generic_runtime_suspend'
 undeclared here (not in a function); did you mean 'pm_generic_suspend'?
Message-ID: <202305091257.9PaWvmb3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound fix/sdw-runtime-pm
head:   a216e8e0a87bbabf7868d6d175dd6919b06675da
commit: a216e8e0a87bbabf7868d6d175dd6919b06675da [1/1] soundwire: master: clean-up pm_runtime support
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305091257.9PaWvmb3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/plbossart/sound/commit/a216e8e0a87bbabf7868d6d175dd6919b06675da
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound fix/sdw-runtime-pm
        git checkout a216e8e0a87bbabf7868d6d175dd6919b06675da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091257.9PaWvmb3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:25,
                    from drivers/soundwire/master.c:4:
>> drivers/soundwire/master.c:101:28: error: 'pm_generic_runtime_suspend' undeclared here (not in a function); did you mean 'pm_generic_suspend'?
     101 |         SET_RUNTIME_PM_OPS(pm_generic_runtime_suspend,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:337:28: note: in definition of macro 'RUNTIME_PM_OPS'
     337 |         .runtime_suspend = suspend_fn, \
         |                            ^~~~~~~~~~
   drivers/soundwire/master.c:101:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     101 |         SET_RUNTIME_PM_OPS(pm_generic_runtime_suspend,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/soundwire/master.c:102:28: error: 'pm_generic_runtime_resume' undeclared here (not in a function); did you mean 'pm_generic_resume'?
     102 |                            pm_generic_runtime_resume, NULL)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:338:27: note: in definition of macro 'RUNTIME_PM_OPS'
     338 |         .runtime_resume = resume_fn, \
         |                           ^~~~~~~~~
   drivers/soundwire/master.c:101:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     101 |         SET_RUNTIME_PM_OPS(pm_generic_runtime_suspend,
         |         ^~~~~~~~~~~~~~~~~~


vim +101 drivers/soundwire/master.c

946bab81f3286c Pierre-Louis Bossart 2020-02-24    3  
946bab81f3286c Pierre-Louis Bossart 2020-02-24   @4  #include <linux/device.h>
946bab81f3286c Pierre-Louis Bossart 2020-02-24    5  #include <linux/acpi.h>
946bab81f3286c Pierre-Louis Bossart 2020-02-24    6  #include <linux/soundwire/sdw.h>
946bab81f3286c Pierre-Louis Bossart 2020-02-24    7  #include <linux/soundwire/sdw_type.h>
946bab81f3286c Pierre-Louis Bossart 2020-02-24    8  #include "bus.h"
946bab81f3286c Pierre-Louis Bossart 2020-02-24    9  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   10  /*
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   11   * The sysfs for properties reflects the MIPI description as given
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   12   * in the MIPI DisCo spec
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   13   *
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   14   * Base file is:
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   15   *	sdw-master-N
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   16   *      |---- revision
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   17   *      |---- clk_stop_modes
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   18   *      |---- max_clk_freq
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   19   *      |---- clk_freq
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   20   *      |---- clk_gears
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   21   *      |---- default_row
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   22   *      |---- default_col
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   23   *      |---- dynamic_shape
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   24   *      |---- err_threshold
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   25   */
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   26  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   27  #define sdw_master_attr(field, format_string)				\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   28  static ssize_t field##_show(struct device *dev,				\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   29  			    struct device_attribute *attr,		\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   30  			    char *buf)					\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   31  {									\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   32  	struct sdw_master_device *md = dev_to_sdw_master_device(dev);	\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   33  	return sprintf(buf, format_string, md->bus->prop.field);	\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   34  }									\
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   35  static DEVICE_ATTR_RO(field)
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   36  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   37  sdw_master_attr(revision, "0x%x\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   38  sdw_master_attr(clk_stop_modes, "0x%x\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   39  sdw_master_attr(max_clk_freq, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   40  sdw_master_attr(default_row, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   41  sdw_master_attr(default_col, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   42  sdw_master_attr(default_frame_rate, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   43  sdw_master_attr(dynamic_frame, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   44  sdw_master_attr(err_threshold, "%d\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   45  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   46  static ssize_t clock_frequencies_show(struct device *dev,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   47  				      struct device_attribute *attr, char *buf)
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   48  {
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   49  	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   50  	ssize_t size = 0;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   51  	int i;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   52  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   53  	for (i = 0; i < md->bus->prop.num_clk_freq; i++)
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   54  		size += sprintf(buf + size, "%8d ",
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   55  				md->bus->prop.clk_freq[i]);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   56  	size += sprintf(buf + size, "\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   57  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   58  	return size;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   59  }
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   60  static DEVICE_ATTR_RO(clock_frequencies);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   61  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   62  static ssize_t clock_gears_show(struct device *dev,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   63  				struct device_attribute *attr, char *buf)
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   64  {
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   65  	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   66  	ssize_t size = 0;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   67  	int i;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   68  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   69  	for (i = 0; i < md->bus->prop.num_clk_gears; i++)
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   70  		size += sprintf(buf + size, "%8d ",
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   71  				md->bus->prop.clk_gears[i]);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   72  	size += sprintf(buf + size, "\n");
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   73  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   74  	return size;
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   75  }
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   76  static DEVICE_ATTR_RO(clock_gears);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   77  
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   78  static struct attribute *master_node_attrs[] = {
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   79  	&dev_attr_revision.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   80  	&dev_attr_clk_stop_modes.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   81  	&dev_attr_max_clk_freq.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   82  	&dev_attr_default_row.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   83  	&dev_attr_default_col.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   84  	&dev_attr_default_frame_rate.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   85  	&dev_attr_dynamic_frame.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   86  	&dev_attr_err_threshold.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   87  	&dev_attr_clock_frequencies.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   88  	&dev_attr_clock_gears.attr,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   89  	NULL,
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   90  };
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   91  ATTRIBUTE_GROUPS(master_node);
ce6dcce753258a Pierre-Louis Bossart 2020-04-09   92  
946bab81f3286c Pierre-Louis Bossart 2020-02-24   93  static void sdw_master_device_release(struct device *dev)
946bab81f3286c Pierre-Louis Bossart 2020-02-24   94  {
946bab81f3286c Pierre-Louis Bossart 2020-02-24   95  	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
946bab81f3286c Pierre-Louis Bossart 2020-02-24   96  
946bab81f3286c Pierre-Louis Bossart 2020-02-24   97  	kfree(md);
946bab81f3286c Pierre-Louis Bossart 2020-02-24   98  }
946bab81f3286c Pierre-Louis Bossart 2020-02-24   99  
26d970225d8764 Bard Liao            2020-05-19  100  static const struct dev_pm_ops master_dev_pm = {
26d970225d8764 Bard Liao            2020-05-19 @101  	SET_RUNTIME_PM_OPS(pm_generic_runtime_suspend,
26d970225d8764 Bard Liao            2020-05-19 @102  			   pm_generic_runtime_resume, NULL)
26d970225d8764 Bard Liao            2020-05-19  103  };
26d970225d8764 Bard Liao            2020-05-19  104  

:::::: The code at line 101 was first introduced by commit
:::::: 26d970225d876437287ec47a60cf4a07fe08733d soundwire: master: add runtime pm support

:::::: TO: Bard Liao <yung-chuan.liao@linux.intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
