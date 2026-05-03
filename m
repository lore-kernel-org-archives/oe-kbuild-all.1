Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B6299AAB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777789935; cv=none; b=BpMMQpzM26DRDWSiv8L9jFn9Dgwgcu+4tJVTyujBAV+1F1besy1b3yiVIe7teIOoi25nUriicVOhh0XfVs+dSwpU6SRWdNIq40LV4agILh6tUKwjqzFxfHDn0hLQfXe5iM5V1YsbMk3Gv1R0PBOB1469F6d5rbeipCcSVOcMSDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777789935; c=relaxed/simple;
	bh=V9dgB3+oFN+7HnNfxhKOvyYdLn+NIhWVFb5Ud8yVyIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCvVfQV3EZ8u9AJE1ETGcFzPepUZPVmXSIT7qi11msamelk2uSc/Iy3BiWSKvV5du9nnivOeo7EV29jGgGr1Ecg15hQ5BfFKf5RzV5EVWUX3eICztKMaSGMG0MkVC35D0jGZzKQp689TQckM8KLtNX7H2qBj9/Gkxfu/hyb9DS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHhwdkdU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHhwdkdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777789934; x=1809325934;
  h=date:from:to:cc:subject:message-id;
  bh=V9dgB3+oFN+7HnNfxhKOvyYdLn+NIhWVFb5Ud8yVyIk=;
  b=gHhwdkdUCqQMTkzxAvteZBWptrdEnQO09F+X5GMYwRmJ+vTsFl4grNau
   BNh+hmpvySGBjk6LlixrQi8nriz88dxUQ9yR97QG6GCWvhrReQF+W8eK+
   u6gN4JuFSZXKYQoxptmZ4WArsTnLMxXULpTPELk3ASemepk+pHYLDjYEY
   KAj7AVRpKQVnlOS1io4eMc1vwWBqhh3UEPoP/E8rXG22FLBkkqHcCU2jN
   qYx3An4SuMicnlXf4JkYr+Zb6Uv48Z2G8ThDFTpWQBKyX8uUsWZ8xw1bm
   QFEwVp8IXZCVWCQgiaCh0gXPL0fDTL5SweCWlbUgsnrpJ/JIS9qyIoOZp
   g==;
X-CSE-ConnectionGUID: hLKYxv8iQlG5EY/h3CYnvw==
X-CSE-MsgGUID: QwZC4+kTQOig3SK2vOrTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="90065786"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="90065786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 23:32:13 -0700
X-CSE-ConnectionGUID: ap931OgCSCK2aougZg0xzA==
X-CSE-MsgGUID: xvNJaGkJSRqfwLwJKAzYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240220990"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2026 23:32:11 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQN6-000000002G5-3CAZ;
	Sun, 03 May 2026 06:32:08 +0000
Date: Sun, 03 May 2026 14:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, MD Danish Anwar <danishanwar@ti.com>
Subject: [mda-next:icssg-dev 1/8] include/linux/if_hsr.h:58:19:
 error: implicit declaration of function 'skb_ext_find'
Message-ID: <202605031429.Vd6jaWrJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   a5d36e904451db02a17787219fd06b6d2ba16f1b
commit: 756ed4bc4a527cdddc3f9f09240637ceb3408645 [1/8] hsr: Allow to send a specific port and with HSR header
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605031429.Vd6jaWrJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031429.Vd6jaWrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031429.Vd6jaWrJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/dsa/dsa.c:12:
>> include/linux/if_hsr.h:54:46: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
      54 | static inline bool hsr_skb_has_header(struct sk_buff *skb)
         |                                              ^~~~~~~
   include/linux/if_hsr.h: In function 'hsr_skb_has_header':
>> include/linux/if_hsr.h:58:19: error: implicit declaration of function 'skb_ext_find' [-Wimplicit-function-declaration]
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^~~~~~~~~~~~
>> include/linux/if_hsr.h:58:37: error: 'SKB_EXT_HSR' undeclared (first use in this function)
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^~~~~~~~~~~
   include/linux/if_hsr.h:58:37: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/if_hsr.h: At top level:
   include/linux/if_hsr.h:64:52: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
      64 | static inline unsigned int hsr_skb_has_port(struct sk_buff *skb)
         |                                                    ^~~~~~~
   include/linux/if_hsr.h: In function 'hsr_skb_has_port':
   include/linux/if_hsr.h:71:37: error: 'SKB_EXT_HSR' undeclared (first use in this function)
      71 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^~~~~~~~~~~
   include/linux/if_hsr.h: At top level:
   include/linux/if_hsr.h:77:51: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
      77 | static inline bool hsr_skb_get_header_port(struct sk_buff *skb, bool *header,
         |                                                   ^~~~~~~
   include/linux/if_hsr.h: In function 'hsr_skb_get_header_port':
   include/linux/if_hsr.h:85:37: error: 'SKB_EXT_HSR' undeclared (first use in this function)
      85 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                                     ^~~~~~~~~~~
   include/linux/if_hsr.h: At top level:
   include/linux/if_hsr.h:94:51: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
      94 | static inline bool hsr_skb_add_header_port(struct sk_buff *skb, bool header,
         |                                                   ^~~~~~~
   include/linux/if_hsr.h: In function 'hsr_skb_add_header_port':
>> include/linux/if_hsr.h:99:19: error: implicit declaration of function 'skb_ext_add' [-Wimplicit-function-declaration]
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^~~~~~~~~~~
   include/linux/if_hsr.h:99:36: error: 'SKB_EXT_HSR' undeclared (first use in this function)
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                                    ^~~~~~~~~~~
   In file included from include/net/net_namespace.h:44,
                    from include/linux/netdevice.h:38,
                    from net/dsa/dsa.c:15:
   include/linux/skbuff.h: At top level:
>> include/linux/skbuff.h:5060:7: error: conflicting types for 'skb_ext_add'; have 'void *(struct sk_buff *, enum skb_ext_id)'
    5060 | void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         |       ^~~~~~~~~~~
   include/linux/if_hsr.h:99:19: note: previous implicit declaration of 'skb_ext_add' with type 'int()'
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^~~~~~~~~~~
>> include/linux/skbuff.h:5105:21: error: conflicting types for 'skb_ext_find'; have 'void *(const struct sk_buff *, enum skb_ext_id)'
    5105 | static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
         |                     ^~~~~~~~~~~~
   include/linux/if_hsr.h:58:19: note: previous implicit declaration of 'skb_ext_find' with type 'int()'
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^~~~~~~~~~~~


vim +/skb_ext_find +58 include/linux/if_hsr.h

    45	
    46	#if IS_ENABLED(CONFIG_HSR)
    47	extern bool is_hsr_master(struct net_device *dev);
    48	extern int hsr_get_version(struct net_device *dev, enum hsr_version *ver);
    49	struct net_device *hsr_get_port_ndev(struct net_device *ndev,
    50					     enum hsr_port_type pt);
    51	int hsr_get_port_type(struct net_device *hsr_dev, struct net_device *dev,
    52			      enum hsr_port_type *type);
    53	
  > 54	static inline bool hsr_skb_has_header(struct sk_buff *skb)
    55	{
    56		struct hsr_ptp_ext *ptp_ext;
    57	
  > 58		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    59		if (!ptp_ext)
    60			return false;
    61		return ptp_ext->header;
    62	}
    63	
    64	static inline unsigned int hsr_skb_has_port(struct sk_buff *skb)
    65	{
    66		struct hsr_ptp_ext *ptp_ext;
    67	
    68		if (!skb)
    69			return 0;
    70	
    71		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    72		if (!ptp_ext)
    73			return 0;
    74		return ptp_ext->port;
    75	}
    76	
    77	static inline bool hsr_skb_get_header_port(struct sk_buff *skb, bool *header,
    78						   enum hsr_port_type *port_type)
    79	{
    80		struct hsr_ptp_ext *ptp_ext;
    81	
    82		*port_type = HSR_PT_NONE;
    83		*header = false;
    84	
    85		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
    86		if (!ptp_ext)
    87			return false;
    88	
    89		*port_type = ptp_ext->port;
    90		*header = ptp_ext->header;
    91		return true;
    92	}
    93	
    94	static inline bool hsr_skb_add_header_port(struct sk_buff *skb, bool header,
    95						   enum hsr_port_type port)
    96	{
    97		struct hsr_ptp_ext *ptp_ext;
    98	
  > 99		ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
   100		if (!ptp_ext)
   101			return false;
   102		ptp_ext->port = port;
   103		ptp_ext->header = header;
   104		return true;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
