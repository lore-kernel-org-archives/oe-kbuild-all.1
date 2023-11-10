Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BB1D53E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIeC4Qqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699635200; x=1731171200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bum07ot+EhHhU0+B8hXeh/y26CaVcozlLP9PAvyQoHU=;
  b=LIeC4QqbwUigNx4YlY2CLgHmwoznMxGn3ZOYzVjFJn2ErgK10xOdbTI0
   JMHtfT+HMgyw40rN6ciOQ1UOQ9g2xf8LQUppHSoyOfXYhOrdOvuUE3XVX
   cQwa4FfBpBum7Zbpgp+G0DHE17jQYk2zRjiEwbb/s25ki5OcHcLpHtyaT
   lYvktBPN8I/YGE9MLfk9xk6oWnaLTDeTzENKw7ZFhAebr8wuFtqeRmifq
   zzEz8QweHzp78A2uXeL8VNlHxFQvsKdvFXsOjYUhgB0Fkpr4b6fyfx3MQ
   WW9oNej3APEtTZKXc6RH/neKxivazvBKSmCDHVhL+ze0e0qDiQKd8Cl9h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394111919"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="394111919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 08:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881006458"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="881006458"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 08:53:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Uku-0009kt-1E;
	Fri, 10 Nov 2023 16:53:16 +0000
Date: Sat, 11 Nov 2023 00:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/journal_io.c:1839 bch2_journal_write_pick_flush() warn:
 inconsistent indenting
Message-ID: <202311110013.AMJ0IWhw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89cdf9d556016a54ff6ddd62324aa5ec790c05cc
commit: 80396a47490936f73729548310ad60e9f5df61c9 bcachefs: Break up bch2_journal_write()
date:   5 days ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231111/202311110013.AMJ0IWhw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110013.AMJ0IWhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110013.AMJ0IWhw-lkp@intel.com/

New smatch warnings:
fs/bcachefs/journal_io.c:1839 bch2_journal_write_pick_flush() warn: inconsistent indenting

Old smatch warnings:
fs/bcachefs/journal_io.c:132 journal_entry_add() warn: missing error code 'ret'

vim +1839 fs/bcachefs/journal_io.c

  1808	
  1809	static int bch2_journal_write_pick_flush(struct journal *j, struct journal_buf *w)
  1810	{
  1811		struct bch_fs *c = container_of(j, struct bch_fs, journal);
  1812		int error = bch2_journal_error(j);
  1813	
  1814		/*
  1815		 * If the journal is in an error state - we did an emergency shutdown -
  1816		 * we prefer to continue doing journal writes. We just mark them as
  1817		 * noflush so they'll never be used, but they'll still be visible by the
  1818		 * list_journal tool - this helps in debugging.
  1819		 *
  1820		 * There's a caveat: the first journal write after marking the
  1821		 * superblock dirty must always be a flush write, because on startup
  1822		 * from a clean shutdown we didn't necessarily read the journal and the
  1823		 * new journal write might overwrite whatever was in the journal
  1824		 * previously - we can't leave the journal without any flush writes in
  1825		 * it.
  1826		 *
  1827		 * So if we're in an error state, and we're still starting up, we don't
  1828		 * write anything at all.
  1829		 */
  1830		if (error && test_bit(JOURNAL_NEED_FLUSH_WRITE, &j->flags))
  1831			return -EIO;
  1832	
  1833		if (error ||
  1834		    w->noflush ||
  1835		    (!w->must_flush &&
  1836		     (jiffies - j->last_flush_write) < msecs_to_jiffies(c->opts.journal_flush_delay) &&
  1837		     test_bit(JOURNAL_MAY_SKIP_FLUSH, &j->flags))) {
  1838			     w->noflush = true;
> 1839			SET_JSET_NO_FLUSH(w->data, true);
  1840			w->data->last_seq	= 0;
  1841			w->last_seq		= 0;
  1842	
  1843			j->nr_noflush_writes++;
  1844		} else {
  1845			j->last_flush_write = jiffies;
  1846			j->nr_flush_writes++;
  1847			clear_bit(JOURNAL_NEED_FLUSH_WRITE, &j->flags);
  1848		}
  1849	
  1850		return 0;
  1851	}
  1852	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
