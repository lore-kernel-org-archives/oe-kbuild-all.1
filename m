Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC338CFEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288637; cv=none; b=rPmUXxAK191Gtwlt8dVl+eGuIVyrn/S9pv2iyGf6Gl29kbAaqFjWPLT/dcgB9/lC00TmJi6cc0yUyKnHetzb688lkTGp3eJkJ5XRQ0Ld4kaTT7ZvQ2UuSQyA+L5y63yidN/BF/kU4RWX0IDpoahthpKqMQI0ghpHvQd+mOmDMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288637; c=relaxed/simple;
	bh=QY+CebeWEwDcZCMgxBuQg4zAZshAjfR71umM1BVHfos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWRfvsBap6ww/NmjREe4iR2JDAB8kp5YF4J/ATV7efyiIxCKU2QCv5C5ML1tuIuIslDmE021w3sD2Kl+hL8XpQNohDQoEHwtayQWOwUDiJWs4DOZaET37M4KlMnLAQNI7w+3HE4Q8OcWU33Sa6fm0bP+hlyLkHyJmSQbpgBW9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHkVpRlp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHkVpRlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773288634; x=1804824634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QY+CebeWEwDcZCMgxBuQg4zAZshAjfR71umM1BVHfos=;
  b=dHkVpRlpGuomGsxFq+FJ1JJ0tKTCBZCCXl7UtxYRFbVTAlj8Sg7Vbgib
   4bMGTHGplHWf7h5ZTlt+qqvpwmnwJrfrs3CJDT6GOO1riLswEjOB2MBOC
   9tgcxNQVKdY2CLAMZmtvo+F8GK3jO7mIACqvBp4a9YhroijxKGaYSRrCw
   SH+/s5vq2tCFt0NSnSpiJkZU+Umshp8aZC5sBybigR4EVXNWKDxSPs6dU
   XoLxYO45Yog+Bso4VpBJdEoEWilfVbvMJb1EHvT9eb7Wix0/W078eTJPr
   9iSVrHBwHT8WOI9kSU1RERxbBETLnTg2CbF5ddiHRfo4nIM/JCJCfPfLF
   A==;
X-CSE-ConnectionGUID: tNkDiGknRGq2AWWZ8MgThw==
X-CSE-MsgGUID: a+NQj0hKRb+C5ocCrtmVww==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84689867"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84689867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:10:33 -0700
X-CSE-ConnectionGUID: j3Zl+w8BQXOG4aUF2V5gog==
X-CSE-MsgGUID: Df4CUo8vTpiZdGMlBIF5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="246144300"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 21:10:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XNV-0000000023f-3QBC;
	Thu, 12 Mar 2026 04:10:29 +0000
Date: Thu, 12 Mar 2026 12:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 1/2] hsr: Allow to send a specific port
 and with HSR header
Message-ID: <202603121144.VLHSROR4-lkp@intel.com>
References: <20260309-hsr_ptp-v2-1-798262aad3a4@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-hsr_ptp-v2-1-798262aad3a4@linutronix.de>

Hi Sebastian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/hsr-Allow-to-send-a-specific-port-and-with-HSR-header/20260310-001021
base:   3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f
patch link:    https://lore.kernel.org/r/20260309-hsr_ptp-v2-1-798262aad3a4%40linutronix.de
patch subject: [PATCH RFC net-next v2 1/2] hsr: Allow to send a specific port and with HSR header
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603121144.VLHSROR4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121144.VLHSROR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121144.VLHSROR4-lkp@intel.com/

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
>> include/linux/skbuff.h:5034:7: error: conflicting types for 'skb_ext_add'; have 'void *(struct sk_buff *, enum skb_ext_id)'
    5034 | void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         |       ^~~~~~~~~~~
   include/linux/if_hsr.h:99:19: note: previous implicit declaration of 'skb_ext_add' with type 'int()'
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^~~~~~~~~~~
>> include/linux/skbuff.h:5079:21: error: conflicting types for 'skb_ext_find'; have 'void *(const struct sk_buff *, enum skb_ext_id)'
    5079 | static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
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
  > 85		ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
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
