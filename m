Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1F1E487
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757210221; cv=none; b=cmDWlZ031G1QS1SnwzKElZbLL4NojsdbecEz+LbDM+CYa47uaYKdWcYod1UMSdAQDOIw85GofdvmefLr4U9mskSa2XvIYQHxZAzOGXMII5r/dWjfH76wh/55moPIbtrs90MHRc5twv1ACQz8kH6Skrm03+zgkRrTxPSorvYIB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757210221; c=relaxed/simple;
	bh=4wMOzIRng/aDzFuS8qbTuFQOz2xnDUlDZ4jDRlwCzBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPqIgp0eUlCB9zh95BulOrO6HQliuhGALVR/SXLpI9FAKhKdfXHKmRK6quR19wckEEWUCVbLpifFMU2gr2yyoRruEQr/rDFgaobS7U1hSvnCgDVb2IOaVXs2P3ew+gGAAgx/rBcTZMFo3QT4o4bF/+Q88Xt6HRZ2adjOGks3/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9zV1fVj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9zV1fVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757210219; x=1788746219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wMOzIRng/aDzFuS8qbTuFQOz2xnDUlDZ4jDRlwCzBY=;
  b=N9zV1fVjCQ6cPl1SP6OEf9XhTtRRwdAIl4TzABk2zCJNlK/u9yjAgw8e
   Waacep+3qK6ze5uNxgMMKYerIPvD2Z6/Ul1GnY3zpm7Q/YquKQuOZFgKL
   ImydbCWHYN5qZkcr/+Gew4JxMVOIYjDx7w3YJaWN0JjbOOoQWr9cNUVYn
   FSNjU2Uc0mdA8mHuPonoPQB/bYBnfQUpqixFx+cOUzrcTjcA/9pg4ONdz
   jvtD3W0yH+KzLEhbN8+L200gRyFW7wAqBqyxw3v61QoXSyF/AIunJsgmh
   cvCoFp+nCCGzjnwO4BRlzEVVsFnAQmZbbLMosqAU/SZC6UC76BqFMAON7
   g==;
X-CSE-ConnectionGUID: K7cbWFEQRcKqnpevpKBvYw==
X-CSE-MsgGUID: ztu5sHlbSKK0pjBcE/ZorA==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="63337377"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="63337377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 18:56:59 -0700
X-CSE-ConnectionGUID: YMzh7tlUTkiNBnnCCN/FdQ==
X-CSE-MsgGUID: TbKhXoR2RR2PiKbTPb5glQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172398269"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2025 18:56:57 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv4eF-0001wF-0A;
	Sun, 07 Sep 2025 01:56:55 +0000
Date: Sun, 7 Sep 2025 09:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Fidal Palamparambil <rootuserhere@gmail.com>,
	linux-modules@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mcgrof@kernel.org, petr.pavlu@suse.com,
	da.gomez@kernel.org, samitolvanen@google.com,
	linux-kernel@vger.kernel.org,
	Fidal palamparambil <rootuserhere@gmail.com>
Subject: Re: [PATCH] tracing: Fix multiple issues in trace_printk module
 handling
Message-ID: <202509070951.9KQcO9l6-lkp@intel.com>
References: <20250906134148.55-1-rootuserhere@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906134148.55-1-rootuserhere@gmail.com>

Hi Fidal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fidal-Palamparambil/tracing-Fix-multiple-issues-in-trace_printk-module-handling/20250906-214415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250906134148.55-1-rootuserhere%40gmail.com
patch subject: [PATCH] tracing: Fix multiple issues in trace_printk module handling
config: x86_64-buildonly-randconfig-001-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070951.9KQcO9l6-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070951.9KQcO9l6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070951.9KQcO9l6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_printk.c: In function 'init_trace_printk_function_export':
>> kernel/trace/trace_printk.c:388:16: warning: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     388 |         dentry = tracing_init_dentry();
         |                ^


vim +388 kernel/trace/trace_printk.c

   383	
   384	static __init int init_trace_printk_function_export(void)
   385	{
   386		struct dentry *dentry;
   387	
 > 388		dentry = tracing_init_dentry();
   389		if (IS_ERR(dentry))
   390			return 0;
   391	
   392		trace_create_file("printk_formats", TRACE_MODE_READ, NULL,
   393					    NULL, &ftrace_formats_fops);
   394	
   395		return 0;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
