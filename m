Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09CE442368
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979721; cv=none; b=i5jXqdwgg7t/EeMHUY4PcIBaXbvzSn2rE/FSR++uPEcay355tEuzz2rdVsd/oI++CGQDiXA2u6FCSckfrFuBwRm99+jdHFfsmrtsgZefhv0uIC9ZNcFjhxZI6FpKA/IQ2kcNrKNXpTKI8NZfPUfeIX0CnFDJOi44CzTbXSh7U08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979721; c=relaxed/simple;
	bh=qjRTAp7jbyU9j8N4MFMnhLPKkid/Tt8q0DghW8jzzqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FrC7fRUPwYNDkmBIm4NDbCwymNRd65SeoNr8K2gP3O2LMv7jNdEEqZzzJFk73L0nDv2KyZlIXq6NnWCfQzpMj5Melib/lDyVUfbBV83PP3oTVvlH10F02lQTPsjq/X65KNpKF6pRciVLIJrKgNMdnnExY5UppCYpOsGsrhe00po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxgD6t+L; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxgD6t+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786979720; x=1818515720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjRTAp7jbyU9j8N4MFMnhLPKkid/Tt8q0DghW8jzzqY=;
  b=JxgD6t+LJnPJZJi8spvs1mTLA/dOoCn8ReN9ozqkL43wXHtprNrw8dzr
   8JacSH4jNbX0X7cKcnBfHJsh00mg8Pp+2BhUOwsUIwLmlWZUsCKo2FjA7
   VMeb1YqkxrvA9/tLUH20SgaJnn/ShptYR9/zlMDpOxTRQ1KCdcQD7Z/s2
   EnRO85lz7QqX4oCBSB8xnExBiFt+UL1vqcpjiBXRtKd7DGTo8fyOC6WFD
   gAJAxr23FhUdaKy00iuLFZF2o7tGgh0Nip14/eiNr46SVXzufm0VeaLHM
   JcJP6KGesVnxVwakf+cUDWcJNbxKjnN2xOOfE5nBoPYIYy4ON8xgCA7oq
   Q==;
X-CSE-ConnectionGUID: GmVwN5A0RyWSCWVjeLafNA==
X-CSE-MsgGUID: r7/D+O/FTZmiC/8aumGMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87667225"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87667225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:15:19 -0700
X-CSE-ConnectionGUID: cqz9bEXuRsmEq5jKP67vnA==
X-CSE-MsgGUID: GgHjbaPFRD6fZ/4h+6YqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="261198541"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2026 08:15:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvz3S-00000000dY8-3tjH;
	Mon, 17 Aug 2026 15:15:14 +0000
Date: Mon, 17 Aug 2026 23:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix 65/71] lib/dynamic_debug.c:1375:58:
 error: 'pr_prefixes_count' undeclared; did you mean 'pr_prefixes_lock'?
Message-ID: <202608172309.6uMYk6WP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   9c2bc97085eaafb97fb747811e19d549297d5e0a
commit: a033e345061f1753387ea54e6920ec9eb3b0c952 [65/71] dyndbg: add cached-prefixes to control file's epilogue
config: i386-randconfig-011-20260812 (https://download.01.org/0day-ci/archive/20260817/202608172309.6uMYk6WP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172309.6uMYk6WP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172309.6uMYk6WP-lkp@intel.com/

Note: the jimc/dd-cached-prefix HEAD 9c2bc97085eaafb97fb747811e19d549297d5e0a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_proc_show':
>> lib/dynamic_debug.c:1375:58: error: 'pr_prefixes_count' undeclared (first use in this function); did you mean 'pr_prefixes_lock'?
    1375 |                 seq_printf(m, "#: cached_prefixes=%u\n", pr_prefixes_count);
         |                                                          ^~~~~~~~~~~~~~~~~
         |                                                          pr_prefixes_lock
   lib/dynamic_debug.c:1375:58: note: each undeclared identifier is reported only once for each function it appears in


vim +1375 lib/dynamic_debug.c

  1355	
  1356	/*
  1357	 * Seq_ops show method.  Called several times within a read()
  1358	 * call from userspace, with ddebug_lock held.  Formats the
  1359	 * current _ddebug as a single human-readable line, with a
  1360	 * special case for the header line.
  1361	 */
  1362	static int ddebug_proc_show(struct seq_file *m, void *p)
  1363	{
  1364		struct ddebug_iter *iter = m->private;
  1365		struct _ddebug *dp = p;
  1366		struct flagsbuf flags;
  1367		char const *class;
  1368	
  1369		if (p == SEQ_START_TOKEN) {
  1370			seq_puts(m,
  1371				 "# filename:lineno [module]function flags format\n");
  1372			return 0;
  1373		}
  1374		if (p == EPILOGUE_TOKEN) {
> 1375			seq_printf(m, "#: cached_prefixes=%u\n", pr_prefixes_count);
  1376			seq_printf(m, "#: total call-counts: %lu\n",
  1377				   get_ddebug_call_count());
  1378			return 0;
  1379		}
  1380	
  1381		seq_printf(m, "%s:%u [%s]%s =%s \"",
  1382			   trim_prefix(desc_filename(dp)), dp->lineno,
  1383			   iter->table->info.mod_name, desc_function(dp),
  1384			   ddebug_describe_flags(dp->flags, &flags));
  1385		seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
  1386		seq_putc(m, '"');
  1387	
  1388		if (dp->class_id != _DPRINTK_CLASS_DFLT) {
  1389			class = ddebug_class_name(&iter->table->info, dp);
  1390			if (class)
  1391				seq_printf(m, " class:%s", class);
  1392			else
  1393				seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
  1394		}
  1395		seq_putc(m, '\n');
  1396	
  1397		return 0;
  1398	}
  1399	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
