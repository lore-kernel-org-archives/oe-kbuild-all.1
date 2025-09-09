Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD82EB87F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 05:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757394870; cv=none; b=jWF0cqPrT98AqG6mjhjQXeJQmO6WS/+OO1EK5FoD/eXvysLiqq5lkZVzCUuRtIx9WIGgltj5g4sKe93ucyFO6A1mzI/r9HL12O+yUFCCGoFkb2ZlbFjnlZQFomLWP/B+VDl6w/UD8FsawLDC56gXMzUGJeMTb3sG02A+d4CwqTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757394870; c=relaxed/simple;
	bh=hH3ZezytTq51Qj9BKKfC0R83WETDH4xFeT3UqMzhB/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frl62pCnrodj6dfitW1lWD6NcOa+LGmG3RsE38o12TZ+4i57PiMfZgTrqrahx6lQTlwfSzLnEc/LL436gNeMhZvXTqUYNzZouPTwOGg3frNyrxdND/V9roRXxvH6UVieLaExxGnDbn8FKdldIlUHiHpjNDZR1Jng79QQY2iheOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcyHmZjR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcyHmZjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757394869; x=1788930869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hH3ZezytTq51Qj9BKKfC0R83WETDH4xFeT3UqMzhB/w=;
  b=VcyHmZjRRdCVQLmr5tw3Rreb86WOdinZGN9ADeuw+kpoWk3PrHyv/Olr
   B21iC8Hk9r4XvUcoeBHrjQ5CfGX8uhRy+oY6Aokj+eY/XJCuPvwb3kTLp
   HRiNCcsV82OzZj+nAUGXmkI4Vw3q7xRZ4oZQkfBiP7RzqwLVQ0P2M9pWk
   zK0bBi0JjfrHjFmglrC1JZmnxsZ1XppMpS3SngQh+0d1HDwKRl0epJ41q
   MORseZbROvMkQo23Ohkq7UqSECIJ6xkypCtn1exZbf/vtI7k7CtLnQzwn
   btqMigUfCIRez+rQTEf2DhLMX76RB7Qde2kWJMKSOpFinUmrZt3+xHe/4
   w==;
X-CSE-ConnectionGUID: R6enCyXWSvqERaOkXAtA+Q==
X-CSE-MsgGUID: u4ZNqjIMTuyAD+3yhpIRYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70287777"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="70287777"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:14:27 -0700
X-CSE-ConnectionGUID: zU82kBGmQj2jLq6KBnXuMA==
X-CSE-MsgGUID: vTdDNb+WQASILktnygxmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172912681"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 22:14:24 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvqgQ-0004Sx-04;
	Tue, 09 Sep 2025 05:14:22 +0000
Date: Tue, 9 Sep 2025 13:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v6 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
Message-ID: <202509091256.nwELaisA-lkp@intel.com>
References: <20250908030458.1139163-4-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908030458.1139163-4-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.17-rc5 next-20250908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250908-110839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250908030458.1139163-4-haren%40linux.ibm.com
patch subject: [PATCH v6 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
config: powerpc64-randconfig-r111-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091256.nwELaisA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250909/202509091256.nwELaisA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091256.nwELaisA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     expected restricted __poll_t
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     got int

vim +121 arch/powerpc/platforms/pseries/papr-hvpipe.c

   108	
   109	/*
   110	 * The user space waits for the payload to receive.
   111	 * The hypervisor sends HVPIPE event message to the partition
   112	 * when the payload is available. The event handler wakeup FD
   113	 * depends on the source ID in the message event.
   114	 */
   115	static __poll_t papr_hvpipe_handle_poll(struct file *filp,
   116			struct poll_table_struct *wait)
   117	{
   118		struct hvpipe_source_info *src_info = filp->private_data;
   119	
   120		if (!src_info)
 > 121			return -EIO;
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
