Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC11391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769294502; cv=none; b=B/zCGhlzNAGlT19QKmJZdGRwsHAKlRf5HJQzcctIOpGZSxJFHtGm1kZj2GOFxOjIlUIwP3TJHfIzjoesjFSC1vtP3lYo6g8QANhJKoTNSs8QPHDX4WtXu1X/LrqpeKXyJKTUui0LMST8D1uxWe7kaUsjyekixnZcRR+chnAFP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769294502; c=relaxed/simple;
	bh=tCiVIRjJzhkPB5YrUZHxI4VllBKOQPTDRVM4LskwCzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou9T1Eo7RrlKlvqsQgfDsZjwfGawEw3YZUJBl9KgfKGp6AOFpD0UXNn5JPPfC/nEBalvWNQ8wLxB8NxRNjtzR76uB59ZAkyL2rv4/Qw2zXuUxx2xw+0cOpQFe1gEgEx9ga7sUOmPWiAttOZ+UIyZ3A+XREsYQ+nhhzu8XFuHiG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpburiHF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpburiHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769294501; x=1800830501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tCiVIRjJzhkPB5YrUZHxI4VllBKOQPTDRVM4LskwCzY=;
  b=bpburiHFIgcp8VCD1FADfvLtFC/NmQF8mOsTRwCdTHSnj8e+mONUnZtu
   X5K4C5vFOALcUOVLtTE/RqZjVdzS9DezpstBapBV2tinL7lyFN+wemBmx
   6uvyk94QxfhoFQhypYZYgxar7ixNNnP9SumSgQneZ4cMz4EGBKLrM1cPh
   IPD/hefwlImMBO+LwyGkR2YTxDHb7z+ayh2oxUXlLLKTEg0CHJzxjosH7
   7yMsNK1kTx63yn+V8Shz3eWVAfHmoxC1VGXnY1i3zZmkbEQZORX5n13B0
   QFpEhnWZ6ULOhfinnfklWB45OKfSRUEBCVO5vptSQEjohhcXKeTHA5Ovl
   A==;
X-CSE-ConnectionGUID: umx6JLL2Ql2Bot46K0z01Q==
X-CSE-MsgGUID: OFU+9p9FSn+iCBRzfOdArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="93174507"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="93174507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 14:41:41 -0800
X-CSE-ConnectionGUID: neLE7maPTlam7SqQOlqFwg==
X-CSE-MsgGUID: tvptXF33SgCgQEY+q+vxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="230293681"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2026 14:41:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjmJz-00000000Vas-3rhF;
	Sat, 24 Jan 2026 22:41:35 +0000
Date: Sun, 25 Jan 2026 06:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <202601250653.LXBUL5W6-lkp@intel.com>
References: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mtd-cfi_cmdset_0001-Factor-out-do_write_buffer_locked-to-reduce-stack-frame/20260124-213936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out do_write_buffer_locked() to reduce stack frame
config: xtensa-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250653.LXBUL5W6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer_locked':
>> drivers/mtd/chips/cfi_cmdset_0001.c:1734:6: warning: unused variable 'initial_len' [-Wunused-variable]
     int initial_len = len;
         ^~~~~~~~~~~
>> drivers/mtd/chips/cfi_cmdset_0001.c:1733:16: warning: variable 'initial_adr' set but not used [-Wunused-but-set-variable]
     unsigned long initial_adr;
                   ^~~~~~~~~~~


vim +/initial_len +1734 drivers/mtd/chips/cfi_cmdset_0001.c

^1da177e4c3f415 Linus Torvalds   2005-04-16  1721  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1722  
b8a0764c058e872 Andy Shevchenko  2026-01-24  1723  static int __xipram do_write_buffer_locked(struct map_info *map, struct flchip *chip,
b8a0764c058e872 Andy Shevchenko  2026-01-24  1724  					   unsigned long cmd_adr, unsigned long adr,
b8a0764c058e872 Andy Shevchenko  2026-01-24  1725  					   const struct kvec **pvec,
e102d54abf6806b Nicolas Pitre    2005-08-06  1726  					   unsigned long *pvec_seek, int len)
^1da177e4c3f415 Linus Torvalds   2005-04-16  1727  {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1728  	struct cfi_private *cfi = map->fldrv_priv;
c172471b78255a5 Nicolas Pitre    2006-03-30  1729  	map_word status, write_cmd, datum;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1730  	int ret, word_gap, words;
e102d54abf6806b Nicolas Pitre    2005-08-06  1731  	const struct kvec *vec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1732  	unsigned long vec_seek;
646fd12784d5061 Massimo Cirillo  2008-01-11 @1733  	unsigned long initial_adr;
646fd12784d5061 Massimo Cirillo  2008-01-11 @1734  	int initial_len = len;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1735  
646fd12784d5061 Massimo Cirillo  2008-01-11  1736  	initial_adr = adr;
812c5fa82bae9f3 Andrea Adami     2014-06-02  1737  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1738  	/* Let's determine this according to the interleave only once */
b5d194ceaeffce6 Guillaume LECERF 2010-10-26  1739  	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1740  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1741  	xip_disable(map, chip, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1742  
151e76590f66f54 David Woodhouse  2006-05-14  1743  	/* §4.8 of the 28FxxxJ3A datasheet says "Any time SR.4 and/or SR.5 is set
^1da177e4c3f415 Linus Torvalds   2005-04-16  1744  	   [...], the device will not accept any more Write to Buffer commands".
^1da177e4c3f415 Linus Torvalds   2005-04-16  1745  	   So we must check here and reset those bits if they're set. Otherwise
^1da177e4c3f415 Linus Torvalds   2005-04-16  1746  	   we're just pissing in the wind */
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1747  	if (chip->state != FL_STATUS) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1748  		map_write(map, CMD(0x70), cmd_adr);
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1749  		chip->state = FL_STATUS;
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1750  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1751  	status = map_read(map, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1752  	if (map_word_bitsset(map, status, CMD(0x30))) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1753  		xip_enable(map, chip, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1754  		printk(KERN_WARNING "SR.4 or SR.5 bits set in buffer write (status %lx). Clearing.\n", status.x[0]);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1755  		xip_disable(map, chip, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1756  		map_write(map, CMD(0x50), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1757  		map_write(map, CMD(0x70), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1758  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1759  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1760  	chip->state = FL_WRITING_TO_BUFFER;
638d983840bb64e Nicolas Pitre    2005-08-06  1761  	map_write(map, write_cmd, cmd_adr);
e93cafe45fd7493 Anders Grafström 2008-08-05  1762  	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0, 0);
c172471b78255a5 Nicolas Pitre    2006-03-30  1763  	if (ret) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1764  		/* Argh. Not ready for write to buffer */
c172471b78255a5 Nicolas Pitre    2006-03-30  1765  		map_word Xstatus = map_read(map, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1766  		map_write(map, CMD(0x70), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1767  		chip->state = FL_STATUS;
c172471b78255a5 Nicolas Pitre    2006-03-30  1768  		status = map_read(map, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1769  		map_write(map, CMD(0x50), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1770  		map_write(map, CMD(0x70), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1771  		xip_enable(map, chip, cmd_adr);
c172471b78255a5 Nicolas Pitre    2006-03-30  1772  		printk(KERN_ERR "%s: Chip not ready for buffer write. Xstatus = %lx, status = %lx\n",
c172471b78255a5 Nicolas Pitre    2006-03-30  1773  				map->name, Xstatus.x[0], status.x[0]);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1774  		return ret;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1775  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1776  
e102d54abf6806b Nicolas Pitre    2005-08-06  1777  	/* Figure out the number of words to write */
e102d54abf6806b Nicolas Pitre    2005-08-06  1778  	word_gap = (-adr & (map_bankwidth(map)-1));
c8872b069c53697 Julia Lawall     2008-08-02  1779  	words = DIV_ROUND_UP(len - word_gap, map_bankwidth(map));
e102d54abf6806b Nicolas Pitre    2005-08-06  1780  	if (!word_gap) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1781  		words--;
e102d54abf6806b Nicolas Pitre    2005-08-06  1782  	} else {
e102d54abf6806b Nicolas Pitre    2005-08-06  1783  		word_gap = map_bankwidth(map) - word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1784  		adr -= word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1785  		datum = map_word_ff(map);
e102d54abf6806b Nicolas Pitre    2005-08-06  1786  	}
e102d54abf6806b Nicolas Pitre    2005-08-06  1787  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1788  	/* Write length of data to come */
e102d54abf6806b Nicolas Pitre    2005-08-06  1789  	map_write(map, CMD(words), cmd_adr );
^1da177e4c3f415 Linus Torvalds   2005-04-16  1790  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1791  	/* Write data */
e102d54abf6806b Nicolas Pitre    2005-08-06  1792  	vec = *pvec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1793  	vec_seek = *pvec_seek;
e102d54abf6806b Nicolas Pitre    2005-08-06  1794  	do {
e102d54abf6806b Nicolas Pitre    2005-08-06  1795  		int n = map_bankwidth(map) - word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1796  		if (n > vec->iov_len - vec_seek)
e102d54abf6806b Nicolas Pitre    2005-08-06  1797  			n = vec->iov_len - vec_seek;
e102d54abf6806b Nicolas Pitre    2005-08-06  1798  		if (n > len)
e102d54abf6806b Nicolas Pitre    2005-08-06  1799  			n = len;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1800  
e102d54abf6806b Nicolas Pitre    2005-08-06  1801  		if (!word_gap && len < map_bankwidth(map))
e102d54abf6806b Nicolas Pitre    2005-08-06  1802  			datum = map_word_ff(map);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1803  
e102d54abf6806b Nicolas Pitre    2005-08-06  1804  		datum = map_word_load_partial(map, datum,
e102d54abf6806b Nicolas Pitre    2005-08-06  1805  					      vec->iov_base + vec_seek,
e102d54abf6806b Nicolas Pitre    2005-08-06  1806  					      word_gap, n);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1807  
e102d54abf6806b Nicolas Pitre    2005-08-06  1808  		len -= n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1809  		word_gap += n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1810  		if (!len || word_gap == map_bankwidth(map)) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1811  			map_write(map, datum, adr);
e102d54abf6806b Nicolas Pitre    2005-08-06  1812  			adr += map_bankwidth(map);
e102d54abf6806b Nicolas Pitre    2005-08-06  1813  			word_gap = 0;
e102d54abf6806b Nicolas Pitre    2005-08-06  1814  		}
e102d54abf6806b Nicolas Pitre    2005-08-06  1815  
e102d54abf6806b Nicolas Pitre    2005-08-06  1816  		vec_seek += n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1817  		if (vec_seek == vec->iov_len) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1818  			vec++;
e102d54abf6806b Nicolas Pitre    2005-08-06  1819  			vec_seek = 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1820  		}
e102d54abf6806b Nicolas Pitre    2005-08-06  1821  	} while (len);
e102d54abf6806b Nicolas Pitre    2005-08-06  1822  	*pvec = vec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1823  	*pvec_seek = vec_seek;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1824  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1825  	/* GO GO GO */
^1da177e4c3f415 Linus Torvalds   2005-04-16  1826  	map_write(map, CMD(0xd0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1827  	chip->state = FL_WRITING;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1828  
c172471b78255a5 Nicolas Pitre    2006-03-30  1829  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
646fd12784d5061 Massimo Cirillo  2008-01-11  1830  				   initial_adr, initial_len,
e93cafe45fd7493 Anders Grafström 2008-08-05  1831  				   chip->buffer_write_time,
e93cafe45fd7493 Anders Grafström 2008-08-05  1832  				   chip->buffer_write_time_max);
c172471b78255a5 Nicolas Pitre    2006-03-30  1833  	if (ret) {
4843653cab0db03 Nicolas Pitre    2005-08-06  1834  		map_write(map, CMD(0x70), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1835  		chip->state = FL_STATUS;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1836  		xip_enable(map, chip, cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1837  		printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1838  		return ret;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1839  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1840  
4843653cab0db03 Nicolas Pitre    2005-08-06  1841  	/* check for errors */
c172471b78255a5 Nicolas Pitre    2006-03-30  1842  	status = map_read(map, cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1843  	if (map_word_bitsset(map, status, CMD(0x1a))) {
4843653cab0db03 Nicolas Pitre    2005-08-06  1844  		unsigned long chipstatus = MERGESTATUS(status);
4843653cab0db03 Nicolas Pitre    2005-08-06  1845  
4843653cab0db03 Nicolas Pitre    2005-08-06  1846  		/* reset status */
^1da177e4c3f415 Linus Torvalds   2005-04-16  1847  		map_write(map, CMD(0x50), cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1848  		map_write(map, CMD(0x70), cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1849  		xip_enable(map, chip, cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1850  
b8a0764c058e872 Andy Shevchenko  2026-01-24  1851  		if (chipstatus & 0x02)
b8a0764c058e872 Andy Shevchenko  2026-01-24  1852  			return -EROFS;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1853  
b8a0764c058e872 Andy Shevchenko  2026-01-24  1854  		if (chipstatus & 0x08) {
4843653cab0db03 Nicolas Pitre    2005-08-06  1855  			printk(KERN_ERR "%s: buffer write error (bad VPP)\n", map->name);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1856  			return  -EIO;
4843653cab0db03 Nicolas Pitre    2005-08-06  1857  		}
4843653cab0db03 Nicolas Pitre    2005-08-06  1858  
b8a0764c058e872 Andy Shevchenko  2026-01-24  1859  		printk(KERN_ERR "%s: buffer write error (status 0x%lx)\n", map->name, chipstatus);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1860  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1861  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1862  
^1da177e4c3f415 Linus Torvalds   2005-04-16  1863  	xip_enable(map, chip, cmd_adr);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1864  	return 0;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1865  }
b8a0764c058e872 Andy Shevchenko  2026-01-24  1866  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
