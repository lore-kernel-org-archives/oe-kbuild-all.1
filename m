Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A8C1774D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580033; x=1723116033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QIDh3pzE+Zr4ShbNWCBh3w3ia9ZWoGFsWqGoT0RGVF4=;
  b=XmytTMuid0nOILcfO7sJ55l/to3qberJGEW56o51PPhZjdE6lEqT5BK+
   nHsdczyQh2JH7E7lxwUYZd1cYzzWhy1Z97ilM8WX6vI25mYSOaX4Xz+qt
   Gi1+rjuUlBfzDf/I5M8viiEX7FOxaBwxI9kB2GZMrpVhnEyvXc9GGcFKq
   pFdgluCZ1VUFapn7M3rY0loraQEd8wD9h39Cnoj8inyGL7YFGvw4I7BS3
   em8rEJBXPbK5Uh61zzJTYEVBBO5LmW+aONhqHzJJUYmt1nH0B8S+Mu/2V
   PM13nI4DU9KatO3uFPivfeN/QNYt5C49BFBN16izOwjEovgNZZW/8n5gC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437461207"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="437461207"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="725364072"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="725364072"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Aug 2023 04:20:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThEt-00064G-08;
	Wed, 09 Aug 2023 11:20:31 +0000
Date: Wed, 9 Aug 2023 19:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 23/29] kernel/printk/printk_safe.c:66:5: warning: no
 previous prototype for 'ghcb_printf2'
Message-ID: <202308091918.Vk3lVZyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: 541d489f20d057b7f1b262baf28fe2fc3ed39072 [23/29] cpuid workaround
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230809/202308091918.Vk3lVZyd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091918.Vk3lVZyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091918.Vk3lVZyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk_safe.c:66:5: warning: no previous prototype for 'ghcb_printf2' [-Wmissing-prototypes]
      66 | int ghcb_printf2(const char *fmt)
         |     ^~~~~~~~~~~~
   kernel/printk/printk_safe.c: In function 'ghcb_printf2':
>> kernel/printk/printk_safe.c:69:17: warning: unused variable 'args' [-Wunused-variable]
      69 |         va_list args;
         |                 ^~~~
   kernel/printk/printk_safe.c: At top level:
>> kernel/printk/printk_safe.c:82:5: warning: no previous prototype for 'hv_sev_printf' [-Wmissing-prototypes]
      82 | int hv_sev_printf(const char *fmt, va_list ap)
         |     ^~~~~~~~~~~~~
   kernel/printk/printk_safe.c: In function 'hv_sev_printf':
   kernel/printk/printk_safe.c:92:9: warning: function 'hv_sev_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      92 |         len = vsnprintf(buf, sizeof(buf), fmt, ap);
         |         ^~~
   kernel/printk/printk_safe.c: At top level:
>> kernel/printk/printk_safe.c:116:6: warning: no previous prototype for 'hv_sev_debugbreak' [-Wmissing-prototypes]
     116 | void hv_sev_debugbreak(u32 val)
         |      ^~~~~~~~~~~~~~~~~


vim +/ghcb_printf2 +66 kernel/printk/printk_safe.c

    65	
  > 66	int ghcb_printf2(const char *fmt)
    67	{
    68	
  > 69	        va_list args;
    70	
    71	        int printed = 0;
    72	
    73		//        va_start(args, fmt);
    74	
    75	        printed = hv_sev_printf2(fmt);
    76	
    77		//       va_end(args);
    78	
    79	        return printed;
    80	}
    81	
  > 82	int hv_sev_printf(const char *fmt, va_list ap)
    83	{
    84		char buf[1024];
    85		int len;
    86		int idx;
    87		int left;
    88		unsigned long flags;
    89		u32 orig_low, orig_high;
    90		u32 low, high;
    91	
    92		len = vsnprintf(buf, sizeof(buf), fmt, ap);
    93	
    94		local_irq_save(flags);
    95		spin_lock(&printk_lock);
    96		asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
    97		for (idx = 0; idx < len; idx += 6) {
    98			left = len - idx;
    99			if (left > 6) left = 6;
   100			low = 0xf03;
   101			high = 0;
   102			memcpy((char *)&low+2, &buf[idx], left == 1 ? 1 : 2);
   103			if (left > 2)
   104				memcpy((char *)&high, &buf[idx+2], left-2);
   105			asm volatile ("wrmsr\n\r"
   106					"rep; vmmcall\n\r"
   107					:: "c" (0xc0010130), "a" (low), "d" (high));
   108		}
   109		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
   110		spin_unlock(&printk_lock);
   111		local_irq_restore(flags);
   112	
   113		return len;
   114	}
   115	
 > 116	void hv_sev_debugbreak(u32 val)
   117	{
   118		u32 low, high;
   119		val = ((val & (u32)0xf) << 12) | (u32)0xf03;
   120		asm volatile ("rdmsr" : "=a" (low), "=d" (high) : "c" (0xc0010130));
   121		asm volatile ("wrmsr\n\r"
   122			      "rep; vmmcall\n\r"
   123			      :: "c" (0xc0010130), "a" (val), "d" (0x0));
   124		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (low), "d" (high));
   125	}
   126	EXPORT_SYMBOL_GPL(hv_sev_debugbreak);
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
