Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63A2AE6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591394; cv=none; b=YbF1dnFDtajQ6yRVZMOdtrq6SmTLh0mTJSuFMwrHfEeHJsmi4lfJY5QOwE7aa4DDn3Qf8R89783LA7OKqilZt95s0OFT18FI1Oe71VZgv7H0HsRPahaaTZNS6zZLnKdbGbWkWH9kC9Fz8Bo+lJNjI8/v5bTVJzBo/CPUUd46PCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591394; c=relaxed/simple;
	bh=ggcf9cByrFIqaIxP7CoxpxxqlxzmyG135ZJSmnGewtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9epAgU2twcqAb5ucgsxspUe4fWZznO83BEZoAbKpO95D2Xi7y+SSbrtE1LljhEc8Lz6woCKmFeZcyGxgrKwU1dEQbukswz4bGL7vtU2s+oGkOz1pUbXemBH8KeFKnOAhlOP50mqCA7KbhatlTOHHYcCSKkcdnrcrxUmr6H10So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6LqoWiE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6LqoWiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748591393; x=1780127393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggcf9cByrFIqaIxP7CoxpxxqlxzmyG135ZJSmnGewtc=;
  b=h6LqoWiE8+tCuwHxZa8nOPwPlGQuS+MCR5KMwvqjOeC2sFzDEbTI1xHd
   ZSopBzLZQikbGqSJyTi2YyV3plB8Bob6o0AIg6JHLYzhjh2f7pbb6K0fs
   vFiELFrRaGk7HCLf1S/X7ZUeDHuE5EefMEV1xEf3dxuVTlFs/BK7JKNGw
   mpB/KUqEYAb3VxHu4rM4AJxdQF+sXJ+v5gQjP/DfIoW3OYKlqHMGUsik3
   GX3L6jB9I7K/6OC5lqXoFdfJk7y8k9KImBsxds579zPqm1vjW5/nv1yHQ
   qb+BVA9oTMDf/xpa/B70COU2Wg7qmTEJK2nFtHKFERVBE9+JzjBmbyl9p
   A==;
X-CSE-ConnectionGUID: vLpIFFAhSVWlEp3UO5ZK3w==
X-CSE-MsgGUID: /SwUjBmzSuyfmG2AaTioDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53301792"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="53301792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 00:49:52 -0700
X-CSE-ConnectionGUID: 2xbuZywMRQ6NnMEsQUobRA==
X-CSE-MsgGUID: wXpbtqMSS9KBcKMhbIGjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148831824"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2025 00:49:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKuUu-000XRQ-0s;
	Fri, 30 May 2025 07:49:48 +0000
Date: Fri, 30 May 2025 15:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [jlayton:uek-localio 2085/2261] drivers/xen/ovmapi.c:781:54:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <202505301521.rC5ljMbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonah,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   4b9dea34a1db89f3a32ad81ed20421fd7f836906
commit: d0e53262314ffa38d5e1ee6cd59abafe411d1977 [2085/2261] xen/ovmapi: Build OVM guest messaging driver
config: x86_64-buildonly-randconfig-004-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301521.rC5ljMbV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301521.rC5ljMbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301521.rC5ljMbV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/ovmapi.c: In function 'ovmapi_send_dom0_message.constprop':
>> drivers/xen/ovmapi.c:781:54: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     781 |                 snprintf(number, sizeof(number), "%ld", n);
         |                                                      ^
   drivers/xen/ovmapi.c:781:17: note: 'snprintf' output between 2 and 17 bytes into a destination of size 16
     781 |                 snprintf(number, sizeof(number), "%ld", n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +781 drivers/xen/ovmapi.c

b5194c8398f795 Boris Ostrovsky 2018-03-14  760  
b5194c8398f795 Boris Ostrovsky 2018-03-14  761  static int ovmapi_send_dom0_message(struct ovmapi_information *p_ovmapi_info,
b5194c8398f795 Boris Ostrovsky 2018-03-14  762  				    char *name, char *value, u32 value_len)
b5194c8398f795 Boris Ostrovsky 2018-03-14  763  {
b5194c8398f795 Boris Ostrovsky 2018-03-14  764  	unsigned long n;
b5194c8398f795 Boris Ostrovsky 2018-03-14  765  	char number[16];
b5194c8398f795 Boris Ostrovsky 2018-03-14  766  	char save;
b5194c8398f795 Boris Ostrovsky 2018-03-14  767  	char pathname[OVMM_MAX_NAME_LEN * 2];
b5194c8398f795 Boris Ostrovsky 2018-03-14  768  
b5194c8398f795 Boris Ostrovsky 2018-03-14  769  	OVMLOG(DGBLVL_INFO, "ovmapi_send_dom0_message: name:%s, value: %s, "
b5194c8398f795 Boris Ostrovsky 2018-03-14  770  			    "value_len: %d\n", name, value, value_len);
b5194c8398f795 Boris Ostrovsky 2018-03-14  771  
b5194c8398f795 Boris Ostrovsky 2018-03-14  772  	p_ovmapi_info->last_write_message++;
b5194c8398f795 Boris Ostrovsky 2018-03-14  773  
b5194c8398f795 Boris Ostrovsky 2018-03-14  774  	snprintf(pathname, OVMM_MAX_NAME_LEN,
b5194c8398f795 Boris Ostrovsky 2018-03-14  775  			 "control/oracle-vmapi/from-guest/%ld",
b5194c8398f795 Boris Ostrovsky 2018-03-14  776  			 p_ovmapi_info->last_write_message);
b5194c8398f795 Boris Ostrovsky 2018-03-14  777  
b5194c8398f795 Boris Ostrovsky 2018-03-14  778  	xenbus_write(XBT_NIL, pathname, "", name);
b5194c8398f795 Boris Ostrovsky 2018-03-14  779  
b5194c8398f795 Boris Ostrovsky 2018-03-14  780  	for (n = 0; n <= (value_len / OVMM_MAX_CHARS_PER_SEQUENCE); n++) {
b5194c8398f795 Boris Ostrovsky 2018-03-14 @781  		snprintf(number, sizeof(number), "%ld", n);
b5194c8398f795 Boris Ostrovsky 2018-03-14  782  		save = '\0';
b5194c8398f795 Boris Ostrovsky 2018-03-14  783  		if (value_len > ((n + 1) * OVMM_MAX_CHARS_PER_SEQUENCE)) {
b5194c8398f795 Boris Ostrovsky 2018-03-14  784  			save = value[((n + 1) * OVMM_MAX_CHARS_PER_SEQUENCE)];
b5194c8398f795 Boris Ostrovsky 2018-03-14  785  			value[((n + 1) * OVMM_MAX_CHARS_PER_SEQUENCE)] = '\0';
b5194c8398f795 Boris Ostrovsky 2018-03-14  786  		}
b5194c8398f795 Boris Ostrovsky 2018-03-14  787  
b5194c8398f795 Boris Ostrovsky 2018-03-14  788  		OVMLOG(DGBLVL_INFO, "ovmapi_send_dom0_message: xenbus_write "
b5194c8398f795 Boris Ostrovsky 2018-03-14  789  		       "pathname: %s, number: %s, value: %s\n", name, number,
b5194c8398f795 Boris Ostrovsky 2018-03-14  790  		       value + (n * OVMM_MAX_CHARS_PER_SEQUENCE));
b5194c8398f795 Boris Ostrovsky 2018-03-14  791  
b5194c8398f795 Boris Ostrovsky 2018-03-14  792  		xenbus_write(XBT_NIL, pathname, number,
b5194c8398f795 Boris Ostrovsky 2018-03-14  793  			     value + (n * OVMM_MAX_CHARS_PER_SEQUENCE));
b5194c8398f795 Boris Ostrovsky 2018-03-14  794  
b5194c8398f795 Boris Ostrovsky 2018-03-14  795  		if (save != '\0')
b5194c8398f795 Boris Ostrovsky 2018-03-14  796  			value[((n + 1) * OVMM_MAX_CHARS_PER_SEQUENCE)] = save;
b5194c8398f795 Boris Ostrovsky 2018-03-14  797  	}
b5194c8398f795 Boris Ostrovsky 2018-03-14  798  
b5194c8398f795 Boris Ostrovsky 2018-03-14  799  	snprintf(number, sizeof(number), "%ld",
b5194c8398f795 Boris Ostrovsky 2018-03-14  800  		 p_ovmapi_info->last_write_message);
b5194c8398f795 Boris Ostrovsky 2018-03-14  801  	xenbus_write(XBT_NIL, "control/oracle-vmapi/from-guest", "last-write",
b5194c8398f795 Boris Ostrovsky 2018-03-14  802  		     number);
b5194c8398f795 Boris Ostrovsky 2018-03-14  803  	OVMLOG(DGBLVL_INFO, "ovmapi_send_dom0_message: write name value path:"
b5194c8398f795 Boris Ostrovsky 2018-03-14  804  	       " %s value: %s\n", name, value);
b5194c8398f795 Boris Ostrovsky 2018-03-14  805  
b5194c8398f795 Boris Ostrovsky 2018-03-14  806  	return 0;
b5194c8398f795 Boris Ostrovsky 2018-03-14  807  }
b5194c8398f795 Boris Ostrovsky 2018-03-14  808  

:::::: The code at line 781 was first introduced by commit
:::::: b5194c8398f7957c3f36d96e24b3676b26108927 xen/ovmapi: Port ovmapi drivers from uek5 to uek6

:::::: TO: Boris Ostrovsky <boris.ostrovsky@oracle.com>
:::::: CC: LUCI Bot <vijayendra.suman@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
