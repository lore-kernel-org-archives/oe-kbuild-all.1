Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210568;
	b=PPuWFBuuGjstQgV77ZRn+2cFCT8XqHmAC6bhYGB4rJSoDYXeUgvat17L6LBQfkdmWrVj
	 VzzcYdLrX9Id1X3gVeynNhsmngihqPvHSFJYQ+eXYLmaIz3xW8SfbIWhVjn94t7QXn3As
	 xo00sOU78ReTtudHQ8I5OC31y9kKNUfBNViCGh2GdWbSIUJD/XRp789/Lqx99XZRgVjMh
	 2vCsxND9dysOZVm8Y7ReY8w+jUsV1neKkpwLFBUVxxEabEgFcvtaG5YGbmiCPT7wDmo6x
	 4LzpX1+dkaaOIJL/QyYmLVysDDYUGOFOMjXoXyxOpQuxIgmSko9O3AbUHymkS5sxdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210568;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=AQqkcirMIXmlhBoK0qPlkkM6rjXi5WYS/WP4HdtRylU=;
	b=YVmndrIXsL+nK416RTzPYhZA4adYjng0tKOOAuWZhST3Euz473S6bNnipSXzNAmbAHwT
	 30ulDgmhgjNKFQ7lbPT9/pyiT2Ph799ZGvXFj/8/22QNaTy6skAvS/WbhKiXGC8R0PWCH
	 C9urW4OwY81sF807y7drTXoqd1Peb7WkkKnKyV6kmbfQZSn0RdkrQFMA8xjmb8FQN+udQ
	 LdnBsDzriYmaROQaBo5YQnYqBt4W6TOADVfdfl0UPRQ2W/5AK82bnigCGjVry7oIotkA+
	 HOSWWrY/cNTZdPV5kAxV1NMVmcceU7EVqzQGSiBhe2dTkMQhyOgDzLf0oirSBS2rOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4SjCy7d;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E4606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 18:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4SjCy7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793210567; x=1824746567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGHJ9o7/U93RmW5bmVgS309iKG5pqhrbfr0kymLbA6E=;
  b=i4SjCy7dMgrXazlfP3UAf9KZiBMbRtQ5E9m6YCo6b3g3qYww0MSMmKZ1
   xNDPObHo0ih2WoGah7xOjjWV4AfgaNjh34SSgrV1iLSs4TbFTbeZcVRDh
   2DwHdCbqiHS0K+RnIkoz7/x9HrsbzTzwM6ftfAVOD3itLVh9LyUx00wWs
   F+bB/jbEerxyi1FqqgB8EOGCoYzK9Xwe1ul3JH5XfpOJzMoLsahIFacd0
   I0sahbTd8OR5+JL9WkET0XUvbVV28dks0pmCamN+D3bUr//WlZe6cUA/q
   IKCvkSgMPHyWZMAjXMVHA0wexUGFFMzQxfAfDBgemSGqreJiF7D0xAXSf
   w==;
X-CSE-ConnectionGUID: 7DwJYl4tT0StsDx7hplMsA==
X-CSE-MsgGUID: V/gXJnT/SjWQiWqO+H1EjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1823600"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1823600"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:02:43 -0700
X-CSE-ConnectionGUID: PM2ql1WnRDO+9vsn9qErnw==
X-CSE-MsgGUID: HH8Hib/zQKmK7thf3dmxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6724561"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 10:58:10 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM7uZ-000000004wC-1E7D;
	Wed, 28 Oct 2026 17:58:07 +0000
Date: Wed, 28 Oct 2026 18:57:57 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 35/41]
 kernel/time/timer_list.c:117:69: error: 'struct hrtimer_cpu_base' has no
 member named 'disabled_bases'
Message-ID: <202610281842.jJRZX76T-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   b07585bb535605fb7baff6811b5b778c83af0805
commit: e135d1b5014d752a74322230ad9e2708ea093ebf [35/41] timer_list: Add auxiliary clock support
config: x86_64-randconfig-2200-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281842.jJRZX76T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281842.jJRZX76T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281842.jJRZX76T-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/timer_list.c: In function 'print_base':
>> kernel/time/timer_list.c:117:69: error: 'struct hrtimer_cpu_base' has no member named 'disabled_bases'
     117 |                 bool enabled = ((1U << base->index) & base->cpu_base->disabled_bases);
         |                                                                     ^~


vim +117 kernel/time/timer_list.c

   107	
   108	static void
   109	print_base(struct seq_file *m, struct hrtimer_clock_base *base, ktime_t now)
   110	{
   111		SEQ_printf(m, "  .base:       %p\n", base);
   112		SEQ_printf(m, "  .index:      %d\n", base->index);
   113	
   114		SEQ_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
   115	#ifdef CONFIG_HIGH_RES_TIMERS
   116		if (clockid_is_aux_clock(base->clockid)) {
 > 117			bool enabled = ((1U << base->index) & base->cpu_base->disabled_bases);
   118			const struct tk_aux_mono_conv *conv = base->aux_mono_conv;
   119	
   120			SEQ_printf(m, ".enabled:      %d\n", enabled);
   121			if (enabled) {
   122				SEQ_printf(m, "  .mono_base:  %lld nsecs\n", (long long)conv->mono_base);
   123				SEQ_printf(m, "  .aux_base:   %lld nsecs\n", (long long)conv->aux_base);
   124				SEQ_printf(m, "  .mono_mult:  %u\n", conv->mono_mult);
   125				SEQ_printf(m, "  .aux_mult:   %u\n", conv->aux_mult);
   126			}
   127		} else {
   128			SEQ_printf(m, "  .offset:     %lld nsecs\n", (long long)*base->offset);
   129		}
   130	#endif
   131		SEQ_printf(m,   "active timers:\n");
   132		print_active_timers(m, base, base_now(base, now));
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
