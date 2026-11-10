Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308569;
	b=IMnmHPfDm/X7XmDAbsuC5bieCYsmrJGhDXw11gO3zN4r7DvOeH0SC8XHRKQvN/+P0UWL
	 jrPxM4VOHVw9hM705sNXnJxeiohrG5JgB/zD83oUk2WssIiYSwhtXJkNoLpQd34qjeaF8
	 PKSTgovvXKnA5el8vscyJA2qWFrUQRRZaMBV8fvIjQz87q3Yszd80/MW+lpzsbOgofjIT
	 9V9CYryfcOdicmAFgL7KPfL68jhdpIENm+FymlDwkGF/tCIVcXROxmf9uIO329LMLV5ul
	 yvUtnq7lNFx6jRo1G/8G1QPRgJVw45/MMPO1XfQ/Q8Me9VhGYB5BmAJNmnRned3plng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308569;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wEGSf+/hfTCuh8Nt4NVGGLnTln5lo8lnKGzyaYzEY+g=;
	b=3bvkHsTUak1vKqZRMqQ8fc14YEPK/DJVCUXencpoZOKGAGy/PsPoMDBjb8yi1DTBeO2E
	 Lv6dfFIwiOWhfdR6SMpZA5cr9eOYWzfbc0rnszMvG5Q2dtuG7QMVR13Elddjksn4mkaue
	 WIomBOVzlTGqOfL4uMTuIwFqFL3gOAo209KSXeZjVp3BUiT6jZYDK5P9Q14Ply1IUdWhl
	 HND1IgF8rnjGwkoTVRI9e3IYLDUZQ1pztNogYHJg+3/YyzG2+/Khicfb5s4iaZAwGXVMB
	 RpwNmgC+cgg1cYbOXZCN65Q2XvWRT8uiLwQmIvte+vwvP1IVEmfy1owQztXkNS5N2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnesdDuB;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E006606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E006606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnesdDuB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794308568; x=1825844568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L6tv8Puv3bmo8paZD0sDn+ZLcVAqdz6eZBaI9jgbL0w=;
  b=UnesdDuBblTCK+bPTqBZeS9X7Ms2hRufAAUF6541Vkh8/jx4SSHODGo4
   mD9is/kTMXTpsrs918hCdsSDwb2JUwSmB5ozlAkGAviNoamJU8+DSUFz0
   RBvNxbEku7qFZy9uZUmozrF6P2YOwtpuGrJpPVAfT1HZrFr7AmvSxFCrj
   iGF3V3CpZPjWXPhKX079hoZx6ShiYD4603X8fQ8Xuz9xkeavbSyYRbDoc
   A+R5yaVLisYnmjE0VRFLCYCWPmZezDVSiRHvAFNXDbgUwl43ZfbfqVNkK
   QyCiZ1X+SCRMhs4WthoC9kG7zksQaxx1g8U/J/zTam5Ec/2hVvLYakfwl
   w==;
X-CSE-ConnectionGUID: AF0tj3MYQoCtkMpxiIHBLw==
X-CSE-MsgGUID: jBsgBqfDSiyVKxXaZam2ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3081138"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3081138"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:02:47 -0800
X-CSE-ConnectionGUID: AfKwJFtXRUaeBRQ8UJaCtg==
X-CSE-MsgGUID: F5s46HDrQNeOiooQ8dtksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8164732"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2026 03:02:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQjcg-00000000wfT-3pqp;
	Tue, 10 Nov 2026 11:02:42 +0000
Date: Tue, 10 Nov 2026 19:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't lose a minute-resolution alarm that rounds
 down into the past
Message-ID: <202611101839.fRQuN29G-lkp@intel.com>
References: <20261110-rtc-minute-alarm-v1-1-be9d7c5227a1@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-rtc-minute-alarm-v1-1-be9d7c5227a1@gmail.com>

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7485659ecb81d5fce3a3edf2cae9fcb29c17b1cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-Iyengar-via-B4-Relay/rtc-Don-t-lose-a-minute-resolution-alarm-that-rounds-down-into-the-past/20261110-071347
base:   7485659ecb81d5fce3a3edf2cae9fcb29c17b1cd
patch link:    https://lore.kernel.org/r/20261110-rtc-minute-alarm-v1-1-be9d7c5227a1%40gmail.com
patch subject: [PATCH] rtc: Don't lose a minute-resolution alarm that rounds down into the past
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611101839.fRQuN29G-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101839.fRQuN29G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101839.fRQuN29G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/rtc.h:18,
                    from drivers/rtc/interface.c:11:
   drivers/rtc/interface.c: In function 'rtc_set_alarm':
>> drivers/rtc/interface.c:562:60: warning: integer overflow in expression of type 'long int' results in '-129542144' [-Woverflow]
     562 |                         alarm_time = ktime_add_ns(down, 60 * NSEC_PER_SEC);
         |                                                            ^
   include/linux/ktime.h:60:50: note: in definition of macro 'ktime_add_ns'
      60 | #define ktime_add_ns(kt, nsval)         ((kt) + (nsval))
         |                                                  ^~~~~


vim +562 drivers/rtc/interface.c

   512	
   513	int rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
   514	{
   515		ktime_t alarm_time;
   516		int err;
   517	
   518		if (!rtc->ops)
   519			return -ENODEV;
   520		else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
   521			return -EINVAL;
   522	
   523		err = rtc_valid_tm(&alarm->time);
   524		if (err != 0)
   525			return err;
   526	
   527		err = rtc_valid_range(rtc, &alarm->time);
   528		if (err)
   529			return err;
   530	
   531		err = mutex_lock_interruptible(&rtc->ops_lock);
   532		if (err)
   533			return err;
   534		if (rtc->aie_timer.enabled)
   535			rtc_timer_remove(rtc, &rtc->aie_timer);
   536	
   537		alarm_time = rtc_tm_to_ktime(alarm->time);
   538		if (test_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features) &&
   539		    alarm->time.tm_sec) {
   540			ktime_t down = ktime_sub_ns(alarm_time,
   541						    (u64)alarm->time.tm_sec * NSEC_PER_SEC);
   542			struct rtc_time tm;
   543			ktime_t now;
   544	
   545			err = __rtc_read_time(rtc, &tm);
   546			if (err)
   547				goto unlock;
   548			now = rtc_tm_to_ktime(tm);
   549	
   550			/*
   551			 * Round down so we never miss a deadline. If that puts an alarm
   552			 * that is still in the future into the past, the timer would
   553			 * expire right away and the hardware alarm would never be
   554			 * armed: whoever relies on it, e.g. to wake the system from
   555			 * suspend, would wait forever. Round up to the next minute
   556			 * instead. An alarm already in the past is left alone, it is
   557			 * handled by __rtc_set_alarm.
   558			 */
   559			if (ktime_after(down, now) || !ktime_after(alarm_time, now))
   560				alarm_time = down;
   561			else
 > 562				alarm_time = ktime_add_ns(down, 60 * NSEC_PER_SEC);
   563		}
   564	
   565		rtc->aie_timer.node.expires = alarm_time;
   566		rtc->aie_timer.period = 0;
   567		if (alarm->enabled)
   568			err = rtc_timer_enqueue(rtc, &rtc->aie_timer);
   569	
   570	unlock:
   571		mutex_unlock(&rtc->ops_lock);
   572	
   573		return err;
   574	}
   575	EXPORT_SYMBOL_GPL(rtc_set_alarm);
   576	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
