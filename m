Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5268194C9E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714506525; cv=none; b=LMsEBjKk2Sgfo0G9fsihKvbtwFA1M/+sf2IySqoGw1IWef2uX016BtgAQYxcE3bPqAANNFmFiz3W3GZeuEN6uh9L0VJyvJEeKIuOLOiBNA+ErrMchxMO+TeiFz4EacxDAy+OxXj7aXsB3PC40Quj7BMjOE7I3GzxNTx/egWVGes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714506525; c=relaxed/simple;
	bh=+ZBIIWKe08wl5+iTz051O8bKENMV0M1QynDD1Pwe4iU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvkhVQ980lE3LuDLtczncDGfHNS+pkcGODzlWSayPuwGAR9OlYW/kiUoYEKN1kjPWEZBng/DGinaYFWA1O7QkqGJqlEMVHtiRad2tYGJ+mOh/w9yryggVDqZbQOx7aZNWrW7EfJ9VfVocGuB64otMH2HdkSEWBwUzBbnwtdrANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJI9oE6N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJI9oE6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714506524; x=1746042524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZBIIWKe08wl5+iTz051O8bKENMV0M1QynDD1Pwe4iU=;
  b=aJI9oE6Nks7VThPu+Mrw0QzA8pxZXtRfZebqV8Tsfcm0f/HQAFPhphjI
   9h5uK2rVI8U1MLO/s2Hvtz+y3u7Z721B4PtchvPknIyoMDfwsQ2b8FwSj
   2EqQSzVi9Aap6VgGx85H6LRORyAQCjLDMUsN27DK+MNy7CNcyATPKmvRa
   1fbOtYzxqLRxYv3WJCX8unYHMFVNUzub+1l4Xa1Hgda69N6p4nRdAr9Ai
   +M5ZVFCQZAmK4mUeG/aMDvWcgI0OWMAl6fBvnCDavisx4ik0+GQ2+4iTC
   IXE9+YU8GmlWLc3Pfhy0f5gkY4s1w2XiNSdtmlNR0qzT819G2H1J+efVn
   w==;
X-CSE-ConnectionGUID: ptapmhbdQZW7KZ9UlyK+iQ==
X-CSE-MsgGUID: /0ub8xRER32F6gWhoeSYBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21384664"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="21384664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 12:48:44 -0700
X-CSE-ConnectionGUID: 6IMqi4UCSza3fOloTtcbjQ==
X-CSE-MsgGUID: YDxZuvbQS9KCSRAsea3jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="26574886"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2024 12:48:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1tSx-0008UT-2k;
	Tue, 30 Apr 2024 19:48:39 +0000
Date: Wed, 1 May 2024 03:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5948/11730]
 drivers/firmware/imx/sm-bbm.c:122:5: warning: no previous prototype for
 function 'scmi_imx_bbm_pwrkey_event'
Message-ID: <202405010333.hRlDU2dZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: bd493ca3f0194d0b2b41e5b3b03f35ce6f4d792d [5948/11730] LF-10711-7 firmware: imx: sm-bbm: support pwrkey
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010333.hRlDU2dZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010333.hRlDU2dZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010333.hRlDU2dZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/imx/sm-bbm.c:11:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/firmware/imx/sm-bbm.c:11:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/firmware/imx/sm-bbm.c:11:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/firmware/imx/sm-bbm.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/imx/sm-bbm.c:122:5: warning: no previous prototype for function 'scmi_imx_bbm_pwrkey_event' [-Wmissing-prototypes]
     122 | int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
         |     ^
   drivers/firmware/imx/sm-bbm.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
         | ^
         | static 
   8 warnings generated.


vim +/scmi_imx_bbm_pwrkey_event +122 drivers/firmware/imx/sm-bbm.c

  > 14	#include <linux/suspend.h>
    15	
    16	#define DEBOUNCE_TIME		30
    17	#define REPEAT_INTERVAL		60
    18	
    19	struct scmi_imx_bbm {
    20		struct rtc_device *rtc_dev;
    21		struct scmi_protocol_handle *ph;
    22		const struct scmi_imx_bbm_proto_ops *ops;
    23		struct notifier_block nb;
    24		int keycode;
    25		int keystate;  /* 1:pressed */
    26		bool suspended;
    27		struct delayed_work check_work;
    28		struct input_dev *input;
    29	};
    30	
    31	static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
    32	{
    33		struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
    34		struct scmi_protocol_handle *ph = bbnsm->ph;
    35		u64 val;
    36		int ret;
    37	
    38		ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
    39		if (ret)
    40			dev_err(dev, "%s: %d\n", __func__, ret);
    41	
    42		rtc_time64_to_tm(val, tm);
    43	
    44		return 0;
    45	}
    46	
    47	static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
    48	{
    49		struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
    50		struct scmi_protocol_handle *ph = bbnsm->ph;
    51		u64 val;
    52		int ret;
    53	
    54		val = rtc_tm_to_time64(tm);
    55	
    56		ret = bbnsm->ops->rtc_time_set(ph, 0, val);
    57		if (ret)
    58			dev_err(dev, "%s: %d\n", __func__, ret);
    59	
    60		return 0;
    61	}
    62	
    63	static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
    64	{
    65		return 0;
    66	}
    67	
    68	static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
    69	{
    70		struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
    71		struct scmi_protocol_handle *ph = bbnsm->ph;
    72		struct rtc_time *alrm_tm = &alrm->time;
    73		u64 val;
    74		int ret;
    75	
    76		val = rtc_tm_to_time64(alrm_tm);
    77	
    78		ret = bbnsm->ops->rtc_alarm_set(ph, 0, val);
    79		if (ret)
    80			dev_err(dev, "%s: %d\n", __func__, ret);
    81	
    82		return 0;
    83	}
    84	
    85	static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
    86		.read_time = scmi_imx_bbm_read_time,
    87		.set_time = scmi_imx_bbm_set_time,
    88		.set_alarm = scmi_imx_bbm_set_alarm,
    89		.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
    90	};
    91	
    92	static void scmi_imx_bbm_pwrkey_check_for_events(struct work_struct *work)
    93	{
    94		struct scmi_imx_bbm *bbnsm = container_of(work, struct scmi_imx_bbm, check_work.work);
    95		struct scmi_protocol_handle *ph = bbnsm->ph;
    96		struct input_dev *input = bbnsm->input;
    97		u32 state = 0;
    98		int ret;
    99	
   100		ret = bbnsm->ops->button_get(ph, &state);
   101		if (ret) {
   102			pr_err("%s: %d\n", __func__, ret);
   103			return;
   104		}
   105	
   106		pr_debug("%s: state: %d, keystate %d\n", __func__, state, bbnsm->keystate);
   107	
   108		/* only report new event if status changed */
   109		if (state ^ bbnsm->keystate) {
   110			bbnsm->keystate = state;
   111			input_event(input, EV_KEY, bbnsm->keycode, state);
   112			input_sync(input);
   113			pm_relax(bbnsm->input->dev.parent);
   114			pr_debug("EV_KEY: %x\n", bbnsm->keycode);
   115		}
   116	
   117		/* repeat check if pressed long */
   118		if (state)
   119			schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(REPEAT_INTERVAL));
   120	}
   121	
 > 122	int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
   123	{
   124		struct input_dev *input = bbnsm->input;
   125	
   126		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
   127	
   128		/*
   129		 * Directly report key event after resume to make no key press
   130		 * event is missed.
   131		 */
   132		if (bbnsm->suspended) {
   133			bbnsm->keystate = 1;
   134			input_event(input, EV_KEY, bbnsm->keycode, 1);
   135			input_sync(input);
   136		}
   137	
   138		return 0;
   139	}
   140	static void scmi_imx_bbm_pwrkey_act(void *pdata)
   141	{
   142		struct scmi_imx_bbm *bbnsm = pdata;
   143	
   144		cancel_delayed_work_sync(&bbnsm->check_work);
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
