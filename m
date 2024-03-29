Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B013342A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749432; cv=none; b=aBFAV3eIPJxfaIVjqDOTI7Grqu1XtqQ6ZvEjWgWL1khMHAKuP7fSFitKLp4phSXa0ZXGAJCUmvKPITLOWEV64TtSRzVIkbsQEqTXI/Ie/M5ieVIDUYztE0amoLDK3NeVny1XECapkSzVNH6zlc7YnQDRrMd5hSfKhf1gC++ACPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749432; c=relaxed/simple;
	bh=sZaLgnS1uXyJTgiVDKhf8rID+mfzb77umu1vOiy92do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCdkCsUVNcDeECJSiTzR/rrHb8XLNoMItvaTiuWUxLq1epUcCJ0sIzEquUCnFxiFdzk+u6KI0VxKrTX2OPyvI/yOAYfhNCteUfDyPbVIbvZhgzihcJSDJb8yweHIPokZQfQ3RwIY8bruqyzNsS+all7Nx+OM/0H0Wd4DLkQzrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/sANYc0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/sANYc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711749430; x=1743285430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZaLgnS1uXyJTgiVDKhf8rID+mfzb77umu1vOiy92do=;
  b=T/sANYc0oWuiPnxXP3HVOUyOs6f2UQNuwwrLUenzajbvEYIKiGDYpSvx
   9MfgQog30WdOwVU+WurbviejRF2l7eT6fCXueCFfM2+plfCa7lB77RCh7
   KmQi1YZW27mnSuMF/uCF/MySfIyiYum46NgfjbrKEOGFOLN5h2sHkLDEW
   KK8BkVck8V00NYJmrP4GVYZF8bMgC/VebuT2dJrewxSXFTXyimBq6OXrV
   PEqThfJkUPR+z32WAP9syGmxLsHpm6L9Co0gzpP4b9jqBbZ5234Veda61
   XIHcbR6u0jWxyMpBgzpQPEDx2Vy782FhFBPxxp0reU1MFuHzNvivm2vIo
   g==;
X-CSE-ConnectionGUID: eYmYssDeQnyYJMVIGx9fzg==
X-CSE-MsgGUID: dfIllPVXTMu4wYB9FDQviQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6885704"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="6885704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 14:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="21824335"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2024 14:57:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqKDh-0003fM-0s;
	Fri, 29 Mar 2024 21:57:05 +0000
Date: Sat, 30 Mar 2024 05:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace 64/64] lib/dynamic_debug.c:663:30:
 warning: argument 2 null where non-null expected
Message-ID: <202403300501.BxCxq14X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace
head:   9cf8914e3a113c16ba8cd3da48422401f20cfc33
commit: 3341029059d1eb4ef9a6b48d5c2075e3f694daaf [64/64] dyndbg: grind out ctrl
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403300501.BxCxq14X-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403300501.BxCxq14X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403300501.BxCxq14X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_change':
>> lib/dynamic_debug.c:663:30: warning: argument 2 null where non-null expected [-Wnonnull]
     663 |                         if (!memcmp(&new_desc, get_ctrl(dp), sizeof(new_desc)))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/dynamic_debug.c:17:
   arch/sparc/include/asm/string.h:38:5: note: in a call to function 'memcmp' declared 'nonnull'
      38 | int memcmp(const void *,const void *,__kernel_size_t);
         |     ^~~~~~


vim +663 lib/dynamic_debug.c

   573	
   574	/*
   575	 * Search the tables for _ddebug's which match the given `query' and
   576	 * apply the `flags' and `mask' to them.  Returns number of matching
   577	 * callsites, normally the same as number of changes.  If verbose,
   578	 * logs the changes.
   579	 */
   580	static int ddebug_change(const struct ddebug_query *query,
   581				 struct flag_settings *modifiers)
   582	{
   583		int i;
   584		struct ddebug_table *dt;
   585		unsigned int nfound = 0;
   586		struct ctrlbuf cbuf, nbuf;
   587		struct _ddebug new_desc = {0};
   588		struct ddebug_class_map *map = NULL;
   589		int __outvar valid_class;
   590	
   591		/* search for matching ddebugs */
   592		list_for_each_entry(dt, &ddebug_tables, link) {
   593	
   594			/* match against the module name */
   595			if (query->module &&
   596			    !match_wildcard(query->module, dt->mod_name))
   597				continue;
   598	
   599			if (query->class_string) {
   600				map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
   601				if (!map)
   602					continue;
   603			} else {
   604				/* constrain query, do not touch class'd callsites */
   605				valid_class = _DPRINTK_CLASS_DFLT;
   606			}
   607	
   608			for (i = 0; i < dt->num_ddebugs; i++) {
   609				struct _ddebug *dp = &dt->ddebugs[i];
   610	
   611				/* match site against query-class */
   612				if (dp->class_id != valid_class)
   613					continue;
   614	
   615				/* match against a given label */
   616				if (query->user_label) {
   617					int idx	= find_tr_instance(query->user_label);
   618	
   619					if (idx < 0)
   620						continue;
   621					if (idx != get_trace_dst(dp))
   622						continue;
   623				}
   624	
   625				/* match against the source filename */
   626				if (query->filename &&
   627				    !match_wildcard(query->filename, dp->filename) &&
   628				    !match_wildcard(query->filename,
   629						   kbasename(dp->filename)) &&
   630				    !match_wildcard(query->filename,
   631						   trim_prefix(dp->filename)))
   632					continue;
   633	
   634				/* match against the function */
   635				if (query->function &&
   636				    !match_wildcard(query->function, dp->function))
   637					continue;
   638	
   639				/* match against the format */
   640				if (query->format) {
   641					if (*query->format == '^') {
   642						char *p;
   643						/* anchored search. match must be at beginning */
   644						p = strstr(dp->format, query->format+1);
   645						if (p != dp->format)
   646							continue;
   647					} else if (!strstr(dp->format, query->format))
   648						continue;
   649				}
   650	
   651				/* match against the line number range */
   652				if (query->first_lineno &&
   653				    dp->lineno < query->first_lineno)
   654					continue;
   655				if (query->last_lineno &&
   656				    dp->lineno > query->last_lineno)
   657					continue;
   658	
   659				nfound++;
   660	
   661				new_desc.flags = (get_flags(dp) & modifiers->mask) | modifiers->flags;
   662				new_desc.trace_dst = select_tr_dst(modifiers, get_trace_dst(dp));
 > 663				if (!memcmp(&new_desc, get_ctrl(dp), sizeof(new_desc)))
   664					continue;
   665	#ifdef CONFIG_JUMP_LABEL
   666				if (get_flags(dp) & _DPRINTK_FLAGS_ENABLED) {
   667					if (!(new_desc.flags & _DPRINTK_FLAGS_ENABLED))
   668						static_branch_disable(&dp->key.dd_key_true);
   669				} else if (new_desc.flags & _DPRINTK_FLAGS_ENABLED) {
   670					static_branch_enable(&dp->key.dd_key_true);
   671				}
   672	#endif
   673				v4pr_info("changed %s:%d [%s]%s %s => %s\n",
   674					  trim_prefix(dp->filename), dp->lineno,
   675					  dt->mod_name, dp->function,
   676					  ddebug_describe_flags(dp, &cbuf),
   677					  ddebug_describe_flags(&new_desc, &nbuf));
   678				update_tr_dst(dp, &new_desc);
   679				set_dest(dp, new_desc.trace_dst);
   680			}
   681		}
   682	
   683		return nfound;
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
