Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E84F610
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfsjEKH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704918571; x=1736454571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZSa7xszYu4bua5T/020qLCx2Dk1KLhVHqoryxXWPKg=;
  b=QfsjEKH4syfRUvewlaJoKrpopfVhukSVzS9jsOIQt4LqnuA57fngSA87
   Axw+Ld2J40kH//F1BNYxlT/Rw6vDNngBb4UtInHJ0DK4/1oHzj89W8tOJ
   +U7u9T61wyczoctquHkKyQnWPPml5fG7DxpesZCK8qGbi/tzShSihzzw/
   vCP1iq6N3ZfIfp1b9hD+ZwY/6KorraJUZqs8stdUY8QQ/0WytqHUyi+cI
   0rUH35wiVbebWu89ITDfus3pDAjPhCchPIZKSm+oX2feCssr4P/PsHeQh
   ORcdZ0aKvMmgtrycmUyYz9uhbnR2mSKcCrAIZ+JoluBgK46+RQox7L2Un
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="429825441"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="429825441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 12:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="731951513"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731951513"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 12:29:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNfCZ-0007Tg-04;
	Wed, 10 Jan 2024 20:29:27 +0000
Date: Thu, 11 Jan 2024 04:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.2 32/35] htmldocs:
 Documentation/admin-guide/dynamic-debug-howto.rst:239: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202401110427.9br4PQNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.2
head:   839a3f42a3bc8f1463a3a0eef5ea701da5ce7371
commit: 33f283020361f21a73ef51dfa75a81b57a217177 [32/35] Docs/dyndbg: explain debug-to-tracefs (=T:label.flags)
reproduce: (https://download.01.org/0day-ci/archive/20240111/202401110427.9br4PQNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110427.9br4PQNY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/dynamic-debug-howto.rst:239: WARNING: Inline emphasis start-string without end-string.

vim +239 Documentation/admin-guide/dynamic-debug-howto.rst

   231	
   232	  # because match-spec can be empty, these are legal commands.
   233	  =p   # output to syslog (on all sites)
   234	  =T   # output to trace (on all sites)
   235	  =_   # clear all flags (set them to off)
   236	  +_   # set no flags. effect-free cmd
   237	  -_   # clear no flags. effect-free cmd
   238	  
 > 239	Optionally, the T flag can be followed by a label, which is either an
   240	opened trace-instance (as found in /sys/kernel/tracing/instances/*),
   241	or "0", dyndbg's name for /sys/kernel/tracing/trace.
   242	
   243	  =T       # enable tracing/trace (implied label, "0" default)
   244	  =T:0     # enable global tracing/trace (explicit "0" label)
   245	  =T:0.mf  # same, with "module:function:" prefix
   246	
   247	  =T:foo    # label these callsites, enable them to tracing/instances/foo
   248	  =T:foo.mf # same, with "module:function:" prefix
   249	  =_:foo    # clear all flags, set all labels to foo (if it is open'd)
   250	  =:foo     # same
   251	  =:0       # clear all flags, reset all labels to global trace-buf
   252	  =:0.      # same, with buf-name termination char (not needed here)
   253	  =p:foo    # RFC: this could be legal and useful
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
