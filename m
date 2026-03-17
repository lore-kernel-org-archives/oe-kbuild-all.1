Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA639B94E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752945; cv=none; b=ZH5X+jz/sU+G4HHwdXUnDXwiT3M8IXPjLyJqMo3THlSrEzN/Sz3TJKfuBJJHVmmhec5esKPDdbvslGqq/1O6DEG+mv9aBJQ8qw3qv+NLqa1/tvVpWYFqKs8YKAsIHLe3j6TGvQzjlDLWtdtVc1NPwFbKJixHr/OVrFOxdBMbfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752945; c=relaxed/simple;
	bh=kHjs5RVyEWdMrca1VsWKr8w6kTUocb7gPm7mFUDS3E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KPLksL+beKkq51IEM0OUzh8JFF339GddGnYPj1XKiVfCcqIZzeNyrZ1M5T41psWks7VSf5kL82SFmBNx7Sr1O3IF1s0IeRq06E300cexJEYfE3cnSTmKHyOKZcFw1eZPeSTZzUFMCZOO/VUpzRrHbkm0XkUkhr82SmKZpmWY1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd5bNb3V; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd5bNb3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752942; x=1805288942;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kHjs5RVyEWdMrca1VsWKr8w6kTUocb7gPm7mFUDS3E8=;
  b=kd5bNb3V1w/RTXnDnP9eaAJVa6Mz450DKXcxhj71BxSJkLFsz8K5VNM0
   /x85uC4pRmDXXwExbPI3uMOFi5E376rATMcuOLoxApiVCRXrkPtmIuwgL
   OIqu7NGzny1H2KqQEQjs9B4lOwRcBS2DeLKgPaPSxI7S7cauHQHLQhuZU
   4sAn8u/QK6lRt8i/iQFws8btjcePYemZwPyf/iiOiDa2z0qYCK+2G6HUH
   IjWHDp+76WSWSjayHt45rYbTBId8FiyDJvbsMziqmvaN8ZnElZQymm+Sa
   E1VknoywBgQfP/mifO0IjAwfXZdB329wiGlDnb8r7ikn7j0TKrJ5hd8uG
   Q==;
X-CSE-ConnectionGUID: jtK4iHFDTfaq5S4BM+nTnA==
X-CSE-MsgGUID: SzwU7Y4mRP+j0tI2DcBDaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78675889"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78675889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:09:02 -0700
X-CSE-ConnectionGUID: 8MZBuO8wRqONjtRhFeMp+Q==
X-CSE-MsgGUID: uGGvCopkRXWAyZDkbrjNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260168015"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2026 06:09:00 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2UAL-000000000Qn-08Fm;
	Tue, 17 Mar 2026 13:08:57 +0000
Date: Tue, 17 Mar 2026 21:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 4/4] mm/migrate.c:425
 folio_migrate_mapping() warn: inconsistent indenting
Message-ID: <202603172031.odP7EOee-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   299d5eca2e4a24cd1681c1df2d963b69121adf7d
commit: 49100c0b070e900f87c8fac3be9b9ef8a30fa673 [4/4] mm/migrate: fix shme=
m xarray update during migration
config: i386-randconfig-141-20260317 (https://download.01.org/0day-ci/archi=
ve/20260317/202603172031.odP7EOee-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172031.odP7EOee-lkp@i=
ntel.com/

smatch warnings:
mm/migrate.c:425 folio_migrate_mapping() warn: inconsistent indenting

vim +425 mm/migrate.c

0b3901b38d9d91 Jan Kara                2018-12-28  374 =20
b20a35035f983f Christoph Lameter       2006-03-22  375  /*
c3fcf8a5daacf3 Christoph Lameter       2006-06-23  376   * Replace the page=
 in the mapping.
5b5c7120e21542 Christoph Lameter       2006-06-23  377   *
5b5c7120e21542 Christoph Lameter       2006-06-23  378   * The number of re=
maining references must be:
5b5c7120e21542 Christoph Lameter       2006-06-23  379   * 1 for anonymous =
pages without a mapping
5b5c7120e21542 Christoph Lameter       2006-06-23  380   * 2 for pages with=
 a mapping
266cf658efcf6a David Howells           2009-04-03  381   * 3 for pages with=
 a mapping and PagePrivate/PagePrivate2 set.
b20a35035f983f Christoph Lameter       2006-03-22  382   */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  383) int folio_migrate_m=
apping(struct address_space *mapping,
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  384) 		struct folio *new=
folio, struct folio *folio, int extra_count)
b20a35035f983f Christoph Lameter       2006-03-22  385  {
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  386) 	XA_STATE(xas, &map=
ping->i_pages, folio_index(folio));
42cb14b110a569 Hugh Dickins            2015-11-05  387  	struct zone *oldzo=
ne, *newzone;
42cb14b110a569 Hugh Dickins            2015-11-05  388  	int dirty;
108ca8358139be Matthew Wilcox (Oracle  2022-06-06  389) 	int expected_count=
 =3D folio_expected_refs(mapping, folio) + extra_count;
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  390) 	long nr =3D folio_=
nr_pages(folio);
be72d197b2281e Charan Teja Kalla       2023-12-14  391  	long entries, i;
8763cb45ab967a J=C3=A9r=C3=B4me Glisse           2017-09-08  392 =20
6c5240ae7f48c8 Christoph Lameter       2006-06-23  393  	if (!mapping) {
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  394  		/* Anonymous page=
 without mapping */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  395) 		if (folio_ref_cou=
nt(folio) !=3D expected_count)
6c5240ae7f48c8 Christoph Lameter       2006-06-23  396  			return -EAGAIN;
cf4b769abb8aef Hugh Dickins            2015-11-05  397 =20
cf4b769abb8aef Hugh Dickins            2015-11-05  398  		/* No turning bac=
k from here */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  399) 		newfolio->index =
=3D folio->index;
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  400) 		newfolio->mapping=
 =3D folio->mapping;
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  401) 		if (folio_test_sw=
apbacked(folio))
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  402) 			__folio_set_swap=
backed(newfolio);
cf4b769abb8aef Hugh Dickins            2015-11-05  403 =20
78bd52097d0420 Rafael Aquini           2012-12-11  404  		return MIGRATEPAG=
E_SUCCESS;
6c5240ae7f48c8 Christoph Lameter       2006-06-23  405  	}
6c5240ae7f48c8 Christoph Lameter       2006-06-23  406 =20
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  407) 	oldzone =3D folio_=
zone(folio);
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  408) 	newzone =3D folio_=
zone(newfolio);
42cb14b110a569 Hugh Dickins            2015-11-05  409 =20
89eb946a7432be Matthew Wilcox          2017-12-04  410  	xas_lock_irq(&xas);
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  411) 	if (!folio_ref_fre=
eze(folio, expected_count)) {
89eb946a7432be Matthew Wilcox          2017-12-04  412  		xas_unlock_irq(&x=
as);
e286781d5f2e9c Nicholas Piggin         2008-07-25  413  		return -EAGAIN;
e286781d5f2e9c Nicholas Piggin         2008-07-25  414  	}
e286781d5f2e9c Nicholas Piggin         2008-07-25  415 =20
b20a35035f983f Christoph Lameter       2006-03-22  416  	/*
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  417) 	 * Now we know tha=
t no one else is looking at the folio:
cf4b769abb8aef Hugh Dickins            2015-11-05  418  	 * no turning back=
 from here.
b20a35035f983f Christoph Lameter       2006-03-22  419  	 */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  420) 	newfolio->index =
=3D folio->index;
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  421) 	newfolio->mapping =
=3D folio->mapping;
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  422) 	folio_ref_add(newf=
olio, nr); /* add cache reference */
49100c0b070e90 Zi Yan                  2025-03-05  423  	if (folio_test_swa=
pbacked(folio))
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  424) 		__folio_set_swapb=
acked(newfolio);
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07 @425)     if (folio_test_=
swapcache(folio)) {
3372c3ffc34509 Zi Yan                  2024-03-06  426          int i;
3372c3ffc34509 Zi Yan                  2024-03-06  427 =20
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  428)         folio_set_s=
wapcache(newfolio);
3372c3ffc34509 Zi Yan                  2024-03-06  429          for (i =3D =
0; i < nr; i++)
3372c3ffc34509 Zi Yan                  2024-03-06  430              set_pag=
e_private(folio_page(newfolio, i),
3372c3ffc34509 Zi Yan                  2024-03-06  431                  pag=
e_private(folio_page(folio, i)));
be72d197b2281e Charan Teja Kalla       2023-12-14  432  		entries =3D nr;
6326fec1122cde Nicholas Piggin         2016-12-25  433  	} else {
be72d197b2281e Charan Teja Kalla       2023-12-14  434  		entries =3D 1;
6326fec1122cde Nicholas Piggin         2016-12-25  435  	}
b20a35035f983f Christoph Lameter       2006-03-22  436 =20
42cb14b110a569 Hugh Dickins            2015-11-05  437  	/* Move dirty whil=
e page refs frozen and newpage not yet exposed */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  438) 	dirty =3D folio_te=
st_dirty(folio);
42cb14b110a569 Hugh Dickins            2015-11-05  439  	if (dirty) {
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  440) 		folio_clear_dirty=
(folio);
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  441) 		folio_set_dirty(n=
ewfolio);
42cb14b110a569 Hugh Dickins            2015-11-05  442  	}
42cb14b110a569 Hugh Dickins            2015-11-05  443 =20
be72d197b2281e Charan Teja Kalla       2023-12-14  444  	/* Swap cache stil=
l stores N entries instead of a high-order entry */
be72d197b2281e Charan Teja Kalla       2023-12-14  445  	for (i =3D 0; i < =
entries; i++) {
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  446) 		xas_store(&xas, n=
ewfolio);
be72d197b2281e Charan Teja Kalla       2023-12-14  447  		xas_next(&xas);
be72d197b2281e Charan Teja Kalla       2023-12-14  448  	}
7cf9c2c76c1a17 Nicholas Piggin         2006-12-06  449 =20
7cf9c2c76c1a17 Nicholas Piggin         2006-12-06  450  	/*
937a94c9db30a8 Jacobo Giralt           2012-01-10  451  	 * Drop cache refe=
rence from old page by unfreezing
937a94c9db30a8 Jacobo Giralt           2012-01-10  452  	 * to one less ref=
erence.
7cf9c2c76c1a17 Nicholas Piggin         2006-12-06  453  	 * We know this is=
n't the last reference.
7cf9c2c76c1a17 Nicholas Piggin         2006-12-06  454  	 */
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  455) 	folio_ref_unfreeze=
(folio, expected_count - nr);
7cf9c2c76c1a17 Nicholas Piggin         2006-12-06  456 =20
89eb946a7432be Matthew Wilcox          2017-12-04  457  	xas_unlock(&xas);
42cb14b110a569 Hugh Dickins            2015-11-05  458  	/* Leave irq disab=
led to prevent preemption while updating stats */
42cb14b110a569 Hugh Dickins            2015-11-05  459 =20
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  460  	/*
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  461  	 * If moved to a d=
ifferent zone then also account
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  462  	 * the page for th=
at zone. Other VM counters will be
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  463  	 * taken care of w=
hen we establish references to the
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  464  	 * new page and dr=
op references to the old page.
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  465  	 *
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  466  	 * Note that anony=
mous pages are accounted for
4b9d0fab7166c9 Mel Gorman              2016-07-28  467  	 * via NR_FILE_PAG=
ES and NR_ANON_MAPPED if they
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  468  	 * are mapped to s=
wap space.
0e8c7d0fd5b499 Christoph Lameter       2007-04-23  469  	 */
42cb14b110a569 Hugh Dickins            2015-11-05  470  	if (newzone !=3D o=
ldzone) {
0d1c20722ab333 Johannes Weiner         2020-06-03  471  		struct lruvec *ol=
d_lruvec, *new_lruvec;
0d1c20722ab333 Johannes Weiner         2020-06-03  472  		struct mem_cgroup=
 *memcg;
0d1c20722ab333 Johannes Weiner         2020-06-03  473 =20
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  474) 		memcg =3D folio_m=
emcg(folio);
0d1c20722ab333 Johannes Weiner         2020-06-03  475  		old_lruvec =3D me=
m_cgroup_lruvec(memcg, oldzone->zone_pgdat);
0d1c20722ab333 Johannes Weiner         2020-06-03  476  		new_lruvec =3D me=
m_cgroup_lruvec(memcg, newzone->zone_pgdat);
0d1c20722ab333 Johannes Weiner         2020-06-03  477 =20
5c447d274f3746 Shakeel Butt            2021-01-23  478  		__mod_lruvec_stat=
e(old_lruvec, NR_FILE_PAGES, -nr);
5c447d274f3746 Shakeel Butt            2021-01-23  479  		__mod_lruvec_stat=
e(new_lruvec, NR_FILE_PAGES, nr);
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  480) 		if (folio_test_sw=
apbacked(folio) && !folio_test_swapcache(folio)) {
5c447d274f3746 Shakeel Butt            2021-01-23  481  			__mod_lruvec_sta=
te(old_lruvec, NR_SHMEM, -nr);
5c447d274f3746 Shakeel Butt            2021-01-23  482  			__mod_lruvec_sta=
te(new_lruvec, NR_SHMEM, nr);
4b02108ac1b335 KOSAKI Motohiro         2009-09-21  483  		}
b6038942480e57 Shakeel Butt            2021-02-24  484  #ifdef CONFIG_SWAP
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  485) 		if (folio_test_sw=
apcache(folio)) {
b6038942480e57 Shakeel Butt            2021-02-24  486  			__mod_lruvec_sta=
te(old_lruvec, NR_SWAPCACHE, -nr);
b6038942480e57 Shakeel Butt            2021-02-24  487  			__mod_lruvec_sta=
te(new_lruvec, NR_SWAPCACHE, nr);
b6038942480e57 Shakeel Butt            2021-02-24  488  		}
b6038942480e57 Shakeel Butt            2021-02-24  489  #endif
f56753ac2a9081 Christoph Hellwig       2020-09-24  490  		if (dirty && mapp=
ing_can_writeback(mapping)) {
5c447d274f3746 Shakeel Butt            2021-01-23  491  			__mod_lruvec_sta=
te(old_lruvec, NR_FILE_DIRTY, -nr);
5c447d274f3746 Shakeel Butt            2021-01-23  492  			__mod_zone_page_=
state(oldzone, NR_ZONE_WRITE_PENDING, -nr);
5c447d274f3746 Shakeel Butt            2021-01-23  493  			__mod_lruvec_sta=
te(new_lruvec, NR_FILE_DIRTY, nr);
5c447d274f3746 Shakeel Butt            2021-01-23  494  			__mod_zone_page_=
state(newzone, NR_ZONE_WRITE_PENDING, nr);
42cb14b110a569 Hugh Dickins            2015-11-05  495  		}
42cb14b110a569 Hugh Dickins            2015-11-05  496  	}
42cb14b110a569 Hugh Dickins            2015-11-05  497  	local_irq_enable();
b20a35035f983f Christoph Lameter       2006-03-22  498 =20
78bd52097d0420 Rafael Aquini           2012-12-11  499  	return MIGRATEPAGE=
_SUCCESS;
b20a35035f983f Christoph Lameter       2006-03-22  500  }
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  501) EXPORT_SYMBOL(folio=
_migrate_mapping);
b20a35035f983f Christoph Lameter       2006-03-22  502 =20

:::::: The code at line 425 was first introduced by commit
:::::: 3417013e0d183be9b42d794082eec0ec1c5b5f15 mm/migrate: Add folio_migra=
te_mapping()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
