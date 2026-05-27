Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAA34D91F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851535; cv=none; b=Fw78wJlLFrvWqAJjA4FB30fQERAvIUJRxSg8fr70P/6JFo8T8nbAvDGt3Eff/3XxComhS3Xryn0TPNWX5ysNSBpPsN+VOCTYqSgQMqav1G70YBY5+RUJw/679QQIl1zaEYB5L1hQzQrY7WQVeYPdahoALG2BMuH5UBmcuPinVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851535; c=relaxed/simple;
	bh=zT+SWjKojHYmsj9eVVbDZaGjPg5aptCwfifb/CGb4PU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vc+07CSnnzFSpHMCGZDui/U0J72OirQHLNeQVfmjZnrlRe4YTRndEq6LPbKgQ84MQ+U7rkydLy4GGqbB+VjIPNcBClqRldbL/BLsLUUcNaRsrHpAJMRclnipkw1rX/t9bLEBO2hUDBrOh1XezimBIMMgX3W+VYZoPq9ZJkuKAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zs79Mq71; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zs79Mq71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779851533; x=1811387533;
  h=date:from:to:cc:subject:message-id;
  bh=zT+SWjKojHYmsj9eVVbDZaGjPg5aptCwfifb/CGb4PU=;
  b=Zs79Mq71w9FdJY2T6t+IToa9ockKSGUlWD4Q7lh56FkDKS2ksBVRnAiN
   XUkVPmeu3GaMUMIs52I4seF8E0ilvNBL6q3Fs7LVw72b6dd8GEKvmAUhR
   oSic1cn4/KjMqXpxdSNqrhGYTuzzza9S6QSUmzUNh7SjfiJZAlaWvo8pi
   DZY6HnV7ihvuV/6tANHesROd7atjgXcBbZqPnU9URhDUpp3mmjhH2KES4
   aYY2nGWBPEN/AFi33dhg4W3HFGVpEAoq64FoV05fWtgYeb6fqd86kU5Q2
   P7jLnPKY3mO7TN8Gj2LYEXtRchx7RLt25Qq80Dgnr2sZczpfn0XMoZTOx
   Q==;
X-CSE-ConnectionGUID: gMJD6twKTsq8PLfs6JeV3Q==
X-CSE-MsgGUID: puDtfNseTpyCNgElNUrDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80862949"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80862949"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:12:11 -0700
X-CSE-ConnectionGUID: ioyi9B0ZQIeVPJme4+PWjg==
X-CSE-MsgGUID: V5gG1VS9Rwepa83Emy6veA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="243929835"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 20:12:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS4gh-000000003JS-0joM;
	Wed, 27 May 2026 03:12:07 +0000
Date: Wed, 27 May 2026 11:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1016/1130]
 kernel/module/main.c:1573:50: error: passing argument 1 of '__c_pa' from
 pointer to non-enclosed address space
Message-ID: <202605271142.UZKldMeL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 96c8d778005ee7b53898c41756e279f0dfb9cdca [1016/1130] module: Use __c_pa() and __ptraddr_t where sensible
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260527/202605271142.UZKldMeL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271142.UZKldMeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271142.UZKldMeL-lkp@intel.com/

Note: the scosu-sched/topic/mmap-cap-prot-wip/v6.18 HEAD f69a5a9d9fee15edde28429e23a4c749a59937bd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/module/main.c: In function 'simplify_symbols':
>> kernel/module/main.c:1573:50: error: passing argument 1 of '__c_pa' from pointer to non-enclosed address space
    1573 |                                 secbase = __c_pa(mod_percpu(mod));
         |                                                  ^~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:11,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from include/linux/moduleloader.h:6,
                    from kernel/module/main.c:12:
   include/linux/cheri.h:241:29: note: expected 'const volatile void *' but argument is of type '__seg_fs void *'
     241 | __c_pa(const volatile void *ptr)
         |        ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/__c_pa +1573 kernel/module/main.c

  1511	
  1512	/* Change all symbols so that st_value encodes the pointer directly. */
  1513	static int simplify_symbols(struct module *mod, const struct load_info *info)
  1514	{
  1515		Elf_Shdr *symsec = &info->sechdrs[info->index.sym];
  1516		Elf_Sym *sym = (void *)symsec->sh_addr;
  1517		unsigned long secbase;
  1518		unsigned int i;
  1519		int ret = 0;
  1520		const struct kernel_symbol *ksym;
  1521	
  1522		for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
  1523			const char *name = info->strtab + sym[i].st_name;
  1524	
  1525			switch (sym[i].st_shndx) {
  1526			case SHN_COMMON:
  1527				/* Ignore common symbols */
  1528				if (!strncmp(name, "__gnu_lto", 9))
  1529					break;
  1530	
  1531				/*
  1532				 * We compiled with -fno-common.  These are not
  1533				 * supposed to happen.
  1534				 */
  1535				pr_debug("Common symbol: %s\n", name);
  1536				pr_warn("%s: please compile with -fno-common\n",
  1537				       mod->name);
  1538				ret = -ENOEXEC;
  1539				break;
  1540	
  1541			case SHN_ABS:
  1542				/* Don't need to do anything */
  1543				pr_debug("Absolute symbol: 0x%08lx %s\n",
  1544					 (long)sym[i].st_value, name);
  1545				break;
  1546	
  1547			case SHN_LIVEPATCH:
  1548				/* Livepatch symbols are resolved by livepatch */
  1549				break;
  1550	
  1551			case SHN_UNDEF:
  1552				ksym = resolve_symbol_wait(mod, info, name);
  1553				/* Ok if resolved.  */
  1554				if (ksym && !IS_ERR(ksym)) {
  1555					sym[i].st_value = kernel_symbol_value(ksym);
  1556					break;
  1557				}
  1558	
  1559				/* Ok if weak or ignored.  */
  1560				if (!ksym &&
  1561				    (ELF_ST_BIND(sym[i].st_info) == STB_WEAK ||
  1562				     ignore_undef_symbol(info->hdr->e_machine, name)))
  1563					break;
  1564	
  1565				ret = PTR_ERR(ksym) ?: -ENOENT;
  1566				pr_warn("%s: Unknown symbol %s (err %d)\n",
  1567					mod->name, name, ret);
  1568				break;
  1569	
  1570			default:
  1571				/* Divert to percpu allocation if a percpu var. */
  1572				if (sym[i].st_shndx == info->index.pcpu)
> 1573					secbase = __c_pa(mod_percpu(mod));
  1574				else
  1575					secbase = info->sechdrs[sym[i].st_shndx].sh_addr;
  1576				sym[i].st_value += secbase;
  1577				break;
  1578			}
  1579		}
  1580	
  1581		return ret;
  1582	}
  1583	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
