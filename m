Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538602C6AF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 23:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720310367; cv=none; b=Z1ZD4bCllPnL+ARn3AhY7VsL/Hd3xz86KLZ/CUu1bsf8HTjRoZCWKRH4lqLAD9UDisSZ28EercEhRKN6wwyJgeEVCqb9OLHaV2leYm3AzkEWoWEL+U7mWv+Ro2N/8vDQ3cucF/0gcMNMDv2lj5FtN6hLPjGIjfsRmbE614QegVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720310367; c=relaxed/simple;
	bh=dksHQ7p6qA9ZnmQZ86GQU727mtDMY3VmYA4/oFvu9IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRA0nzzbCOghzl0IlHafK9fHAsqbwp3OrZXAK23E79fyDqi0Vg79h9bbZMDEVU59kFK9i+4RmJ5DGmAX7ivql/BEwCcU2ry4ZhvSgadkRC9ZY7nYlmx6y0FqmSuGr3b6XU6nu17sP8iPc/xcvIWo6ThQX+yDeMIz/4g9tOmou+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp5CmacT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp5CmacT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720310365; x=1751846365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dksHQ7p6qA9ZnmQZ86GQU727mtDMY3VmYA4/oFvu9IY=;
  b=Mp5CmacTRLkVwTpMtFhe0ZlJJzeh9NiHAcL9NpeJe4c3FifcewkpTcFe
   471YLqRkSpcWmWS1KXvDNYS4DNT0scGhG4jV6/izpBjNi7dKB8scful39
   Z641KeqOE2AdWjJg2GloEOqGufJ/RaVWnOQA+z/u+7Nww3ThVGU1+i2lx
   HzVP4dExhstPL8IEqZ2c5/wNbD2xmB2ThqOz98Nx54S9CPC8qjjtrgkh+
   45jrzmhFRb6SnSUuXv7ZE9WuXMRHSR03MKmz2tdKVjaJavNle7of4xcq8
   3cHb6GKPeCEj3uoV+evyNg53wLvw5lEgVhfMziChcqAOFLPDE0saaxW9f
   g==;
X-CSE-ConnectionGUID: FbzPOLDFRjSfzwAOAMElDg==
X-CSE-MsgGUID: HqKyZZSXSL64/LDUbBqiPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28160158"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="28160158"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 16:59:24 -0700
X-CSE-ConnectionGUID: lGi3vaM7QE2pcfflKXP+3g==
X-CSE-MsgGUID: zH4oG8WJTeq8ftcDAosm3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="47230785"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2024 16:59:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQFJJ-000UQA-1S;
	Sat, 06 Jul 2024 23:59:21 +0000
Date: Sun, 7 Jul 2024 07:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:probes/for-next 16/16] kernel/trace/trace_kprobe.c:810:21:
 warning: assignment to 'struct module *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202407070744.RcLkn8sq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
head:   9d8616034f161222a4ac166c1b42b6d79961c005
commit: 9d8616034f161222a4ac166c1b42b6d79961c005 [16/16] tracing/kprobes: Add symbol counting check when module loads
config: arc-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070744.RcLkn8sq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070744.RcLkn8sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070744.RcLkn8sq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_kprobe.c: In function 'validate_probe_symbol':
   kernel/trace/trace_kprobe.c:810:23: error: implicit declaration of function 'find_module'; did you mean 'init_module'? [-Werror=implicit-function-declaration]
     810 |                 mod = find_module(modname);
         |                       ^~~~~~~~~~~
         |                       init_module
>> kernel/trace/trace_kprobe.c:810:21: warning: assignment to 'struct module *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     810 |                 mod = find_module(modname);
         |                     ^
   cc1: some warnings being treated as errors


vim +810 kernel/trace/trace_kprobe.c

   796	
   797	static int validate_probe_symbol(char *symbol)
   798	{
   799		struct module *mod = NULL;
   800		char *modname = NULL, *p;
   801		int ret = 0;
   802	
   803		p = strchr(symbol, ':');
   804		if (p) {
   805			modname = symbol;
   806			symbol = p + 1;
   807			*p = '\0';
   808			/* Return 0 (defer) if the module does not exist yet. */
   809			rcu_read_lock_sched();
 > 810			mod = find_module(modname);
   811			if (mod && !try_module_get(mod))
   812				mod = NULL;
   813			rcu_read_unlock_sched();
   814			if (!mod)
   815				goto out;
   816		}
   817	
   818		ret = validate_module_probe_symbol(modname, symbol);
   819	out:
   820		if (p)
   821			*p = ':';
   822		if (mod)
   823			module_put(mod);
   824		return ret;
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
