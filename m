Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E742611A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 03:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707017505; cv=none; b=Lj11bJpeVjibuxtQw3CjASONQYU1/smJm359ECON2/85GQtU1xxjKfckI1zmP9eHYdOS6RJJqDVwQnPxdAln8ayb6caj1tXQ9B9rPgqH0jmVdMB28AZw9G0d8+WIMvmfvjDNhJ7WmQihsAeaGIGWRU7rBxUJlul5M940ieKFHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707017505; c=relaxed/simple;
	bh=3xVWaKpbNBtvyLFCIm1OC4SV8y9QYFAC6mt6k/I7j9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEQr5+KYLzhpvexIwWsz95LcViA9+gTFInJsHkYmfAq5krn4fAvBJmQ+EP66lQbGzphY/8h2cqYwvqAM55PuAEydli/ua961Yi5L8Kxw3BPohIqYeFYj8I7RqjKR7SS4aR4PaY9o5tikBiWvZRTzi89S5n/kWQLOVnwfTfJuekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORAUn2BB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORAUn2BB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707017502; x=1738553502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xVWaKpbNBtvyLFCIm1OC4SV8y9QYFAC6mt6k/I7j9Q=;
  b=ORAUn2BBi1xXIYBI9aQ9kulkuDxP9RJ7swsMLRvALVJMFsRGbkkXT54z
   LwPDtSotrPgM5k5kp68G1p15TsBdo2nrgucC81B7PJmIA0IWLsamCAPFK
   SFubk32nHH8CoE7uNi/c6wzugsHfT1EH5EG/9cbrifJ/bYpXYw3v7Gu9A
   atzl2ovlUa2+387e7AOkZrneVNMepDF02eT5AoCvag3AJ3gM7eX6SgIZj
   dsKYOm1SMtxTvi7uFYHODkBhaMOLj8nQJmbBvXH+igNmn/sh0sQfFcrbN
   wlJoCyC4IhW41dOhPxol5tdl0wWw6+Y64aRk/JdGkMVOiWQUp7RXLOMT/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4252470"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4252470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 19:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5012331"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2024 19:31:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWTEI-0005xi-04;
	Sun, 04 Feb 2024 03:31:38 +0000
Date: Sun, 4 Feb 2024 11:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 14/37] fs/btrfs/zlib.c:231
 zlib_compress_folios() error: uninitialized symbol 'ret'.
Message-ID: <202402041144.c6bTqlrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   a5c508d84a99a0ea3646eaa03ff6293433cda7af
commit: 046bf67791fef3776ca221391a57ef718905e7ce [14/37] btrfs: compression: migrate compression/decompression paths to folios
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041144.c6bTqlrj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041144.c6bTqlrj-lkp@intel.com/

smatch warnings:
fs/btrfs/zlib.c:231 zlib_compress_folios() error: uninitialized symbol 'ret'.

vim +/ret +231 fs/btrfs/zlib.c

c8b978188c9a0f Chris Mason           2008-10-29   93  
046bf67791fef3 Qu Wenruo             2024-01-29   94  int zlib_compress_folios(struct list_head *ws, struct address_space *mapping,
046bf67791fef3 Qu Wenruo             2024-01-29   95  		u64 start, struct folio **folios, unsigned long *out_folios,
c4bf665a319755 David Sterba          2019-10-01   96  		unsigned long *total_in, unsigned long *total_out)
c8b978188c9a0f Chris Mason           2008-10-29   97  {
261507a02ccba9 Li Zefan              2010-12-17   98  	struct workspace *workspace = list_entry(ws, struct workspace, list);
c8b978188c9a0f Chris Mason           2008-10-29   99  	int ret;
718e58551aecf7 Fabio M. De Francesco 2022-06-27  100  	char *data_in = NULL;
046bf67791fef3 Qu Wenruo             2024-01-29  101  	char *cfolio_out;
046bf67791fef3 Qu Wenruo             2024-01-29  102  	int nr_folios = 0;
046bf67791fef3 Qu Wenruo             2024-01-29  103  	struct folio *in_folio = NULL;
046bf67791fef3 Qu Wenruo             2024-01-29  104  	struct folio *out_folio = NULL;
c8b978188c9a0f Chris Mason           2008-10-29  105  	unsigned long bytes_left;
046bf67791fef3 Qu Wenruo             2024-01-29  106  	unsigned int in_buf_folios;
38c31464089f63 David Sterba          2017-02-14  107  	unsigned long len = *total_out;
046bf67791fef3 Qu Wenruo             2024-01-29  108  	unsigned long nr_dest_folios = *out_folios;
046bf67791fef3 Qu Wenruo             2024-01-29  109  	const unsigned long max_out = nr_dest_folios * PAGE_SIZE;
c8b978188c9a0f Chris Mason           2008-10-29  110  
046bf67791fef3 Qu Wenruo             2024-01-29  111  	*out_folios = 0;
c8b978188c9a0f Chris Mason           2008-10-29  112  	*total_out = 0;
c8b978188c9a0f Chris Mason           2008-10-29  113  	*total_in = 0;
c8b978188c9a0f Chris Mason           2008-10-29  114  
f51d2b59120ff3 David Sterba          2017-09-15  115  	if (Z_OK != zlib_deflateInit(&workspace->strm, workspace->level)) {
62e855771dacf7 Jeff Mahoney          2016-09-20  116  		pr_warn("BTRFS: deflateInit failed\n");
60e1975acb48fc Zach Brown            2014-05-09  117  		ret = -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  118  		goto out;
c8b978188c9a0f Chris Mason           2008-10-29  119  	}
c8b978188c9a0f Chris Mason           2008-10-29  120  
7880991344f736 Sergey Senozhatsky    2014-07-07  121  	workspace->strm.total_in = 0;
7880991344f736 Sergey Senozhatsky    2014-07-07  122  	workspace->strm.total_out = 0;
c8b978188c9a0f Chris Mason           2008-10-29  123  
046bf67791fef3 Qu Wenruo             2024-01-29  124  	out_folio = btrfs_alloc_compr_folio();
046bf67791fef3 Qu Wenruo             2024-01-29  125  	if (out_folio == NULL) {
60e1975acb48fc Zach Brown            2014-05-09  126  		ret = -ENOMEM;
4b72029dc3fd6b Li Zefan              2010-11-09  127  		goto out;
4b72029dc3fd6b Li Zefan              2010-11-09  128  	}
046bf67791fef3 Qu Wenruo             2024-01-29  129  	cfolio_out = folio_address(out_folio);
046bf67791fef3 Qu Wenruo             2024-01-29  130  	folios[0] = out_folio;
046bf67791fef3 Qu Wenruo             2024-01-29  131  	nr_folios = 1;
c8b978188c9a0f Chris Mason           2008-10-29  132  
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  133  	workspace->strm.next_in = workspace->buf;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  134  	workspace->strm.avail_in = 0;
046bf67791fef3 Qu Wenruo             2024-01-29  135  	workspace->strm.next_out = cfolio_out;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  136  	workspace->strm.avail_out = PAGE_SIZE;
c8b978188c9a0f Chris Mason           2008-10-29  137  
7880991344f736 Sergey Senozhatsky    2014-07-07  138  	while (workspace->strm.total_in < len) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  139  		/*
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  140  		 * Get next input pages and copy the contents to
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  141  		 * the workspace buffer if required.
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  142  		 */
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  143  		if (workspace->strm.avail_in == 0) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  144  			bytes_left = len - workspace->strm.total_in;
046bf67791fef3 Qu Wenruo             2024-01-29  145  			in_buf_folios = min(DIV_ROUND_UP(bytes_left, PAGE_SIZE),
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  146  					    workspace->buf_size / PAGE_SIZE);
046bf67791fef3 Qu Wenruo             2024-01-29  147  			if (in_buf_folios > 1) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  148  				int i;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  149  
046bf67791fef3 Qu Wenruo             2024-01-29  150  				for (i = 0; i < in_buf_folios; i++) {
718e58551aecf7 Fabio M. De Francesco 2022-06-27  151  					if (data_in) {
718e58551aecf7 Fabio M. De Francesco 2022-06-27  152  						kunmap_local(data_in);
046bf67791fef3 Qu Wenruo             2024-01-29  153  						folio_put(in_folio);
2f81f11aa2e058 Qu Wenruo             2024-01-29  154  						data_in = NULL;
55276e14df4324 David Sterba          2021-10-27  155  					}
046bf67791fef3 Qu Wenruo             2024-01-29  156  					ret = btrfs_compress_filemap_get_folio(mapping,
046bf67791fef3 Qu Wenruo             2024-01-29  157  							start, &in_folio);
2f81f11aa2e058 Qu Wenruo             2024-01-29  158  					if (ret < 0)
2f81f11aa2e058 Qu Wenruo             2024-01-29  159  						goto out;
046bf67791fef3 Qu Wenruo             2024-01-29  160  					data_in = kmap_local_folio(in_folio, 0);
9e5e6d4e2e5e37 David Sterba          2022-10-31  161  					copy_page(workspace->buf + i * PAGE_SIZE,
9e5e6d4e2e5e37 David Sterba          2022-10-31  162  						  data_in);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  163  					start += PAGE_SIZE;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  164  				}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  165  				workspace->strm.next_in = workspace->buf;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  166  			} else {
718e58551aecf7 Fabio M. De Francesco 2022-06-27  167  				if (data_in) {
718e58551aecf7 Fabio M. De Francesco 2022-06-27  168  					kunmap_local(data_in);
046bf67791fef3 Qu Wenruo             2024-01-29  169  					folio_put(in_folio);
2f81f11aa2e058 Qu Wenruo             2024-01-29  170  					data_in = NULL;
55276e14df4324 David Sterba          2021-10-27  171  				}
046bf67791fef3 Qu Wenruo             2024-01-29  172  				ret = btrfs_compress_filemap_get_folio(mapping,
046bf67791fef3 Qu Wenruo             2024-01-29  173  						start, &in_folio);
2f81f11aa2e058 Qu Wenruo             2024-01-29  174  				if (ret < 0)
2f81f11aa2e058 Qu Wenruo             2024-01-29  175  					goto out;
046bf67791fef3 Qu Wenruo             2024-01-29  176  				data_in = kmap_local_folio(in_folio, 0);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  177  				start += PAGE_SIZE;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  178  				workspace->strm.next_in = data_in;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  179  			}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  180  			workspace->strm.avail_in = min(bytes_left,
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  181  						       (unsigned long) workspace->buf_size);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  182  		}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  183  
7880991344f736 Sergey Senozhatsky    2014-07-07  184  		ret = zlib_deflate(&workspace->strm, Z_SYNC_FLUSH);
c8b978188c9a0f Chris Mason           2008-10-29  185  		if (ret != Z_OK) {
62e855771dacf7 Jeff Mahoney          2016-09-20  186  			pr_debug("BTRFS: deflate in loop returned %d\n",
c8b978188c9a0f Chris Mason           2008-10-29  187  			       ret);
7880991344f736 Sergey Senozhatsky    2014-07-07  188  			zlib_deflateEnd(&workspace->strm);
60e1975acb48fc Zach Brown            2014-05-09  189  			ret = -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  190  			goto out;
c8b978188c9a0f Chris Mason           2008-10-29  191  		}
c8b978188c9a0f Chris Mason           2008-10-29  192  
c8b978188c9a0f Chris Mason           2008-10-29  193  		/* we're making it bigger, give up */
7880991344f736 Sergey Senozhatsky    2014-07-07  194  		if (workspace->strm.total_in > 8192 &&
7880991344f736 Sergey Senozhatsky    2014-07-07  195  		    workspace->strm.total_in <
7880991344f736 Sergey Senozhatsky    2014-07-07  196  		    workspace->strm.total_out) {
130d5b415a091e David Sterba          2014-06-20  197  			ret = -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  198  			goto out;
c8b978188c9a0f Chris Mason           2008-10-29  199  		}
c8b978188c9a0f Chris Mason           2008-10-29  200  		/* we need another page for writing out.  Test this
c8b978188c9a0f Chris Mason           2008-10-29  201  		 * before the total_in so we will pull in a new page for
c8b978188c9a0f Chris Mason           2008-10-29  202  		 * the stream end if required
c8b978188c9a0f Chris Mason           2008-10-29  203  		 */
7880991344f736 Sergey Senozhatsky    2014-07-07  204  		if (workspace->strm.avail_out == 0) {
046bf67791fef3 Qu Wenruo             2024-01-29  205  			if (nr_folios == nr_dest_folios) {
60e1975acb48fc Zach Brown            2014-05-09  206  				ret = -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  207  				goto out;
c8b978188c9a0f Chris Mason           2008-10-29  208  			}
046bf67791fef3 Qu Wenruo             2024-01-29  209  			out_folio = btrfs_alloc_compr_folio();
046bf67791fef3 Qu Wenruo             2024-01-29  210  			if (out_folio == NULL) {
60e1975acb48fc Zach Brown            2014-05-09  211  				ret = -ENOMEM;
4b72029dc3fd6b Li Zefan              2010-11-09  212  				goto out;
4b72029dc3fd6b Li Zefan              2010-11-09  213  			}
046bf67791fef3 Qu Wenruo             2024-01-29  214  			cfolio_out = folio_address(out_folio);
046bf67791fef3 Qu Wenruo             2024-01-29  215  			folios[nr_folios] = out_folio;
046bf67791fef3 Qu Wenruo             2024-01-29  216  			nr_folios++;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  217  			workspace->strm.avail_out = PAGE_SIZE;
046bf67791fef3 Qu Wenruo             2024-01-29  218  			workspace->strm.next_out = cfolio_out;
c8b978188c9a0f Chris Mason           2008-10-29  219  		}
c8b978188c9a0f Chris Mason           2008-10-29  220  		/* we're all done */
7880991344f736 Sergey Senozhatsky    2014-07-07  221  		if (workspace->strm.total_in >= len)
c8b978188c9a0f Chris Mason           2008-10-29  222  			break;
7880991344f736 Sergey Senozhatsky    2014-07-07  223  		if (workspace->strm.total_out > max_out)
c8b978188c9a0f Chris Mason           2008-10-29  224  			break;
c8b978188c9a0f Chris Mason           2008-10-29  225  	}
7880991344f736 Sergey Senozhatsky    2014-07-07  226  	workspace->strm.avail_in = 0;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  227  	/*
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  228  	 * Call deflate with Z_FINISH flush parameter providing more output
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  229  	 * space but no more input data, until it returns with Z_STREAM_END.
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  230  	 */
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30 @231  	while (ret != Z_STREAM_END) {
7880991344f736 Sergey Senozhatsky    2014-07-07  232  		ret = zlib_deflate(&workspace->strm, Z_FINISH);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  233  		if (ret == Z_STREAM_END)
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  234  			break;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  235  		if (ret != Z_OK && ret != Z_BUF_ERROR) {
7880991344f736 Sergey Senozhatsky    2014-07-07  236  			zlib_deflateEnd(&workspace->strm);
60e1975acb48fc Zach Brown            2014-05-09  237  			ret = -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  238  			goto out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  239  		} else if (workspace->strm.avail_out == 0) {
046bf67791fef3 Qu Wenruo             2024-01-29  240  			/* get another folio for the stream end */
046bf67791fef3 Qu Wenruo             2024-01-29  241  			if (nr_folios == nr_dest_folios) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  242  				ret = -E2BIG;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  243  				goto out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  244  			}
046bf67791fef3 Qu Wenruo             2024-01-29  245  			out_folio = btrfs_alloc_compr_folio();
046bf67791fef3 Qu Wenruo             2024-01-29  246  			if (out_folio == NULL) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  247  				ret = -ENOMEM;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  248  				goto out;
c8b978188c9a0f Chris Mason           2008-10-29  249  			}
046bf67791fef3 Qu Wenruo             2024-01-29  250  			cfolio_out = folio_address(out_folio);
046bf67791fef3 Qu Wenruo             2024-01-29  251  			folios[nr_folios] = out_folio;
046bf67791fef3 Qu Wenruo             2024-01-29  252  			nr_folios++;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  253  			workspace->strm.avail_out = PAGE_SIZE;
046bf67791fef3 Qu Wenruo             2024-01-29  254  			workspace->strm.next_out = cfolio_out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  255  		}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  256  	}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  257  	zlib_deflateEnd(&workspace->strm);
c8b978188c9a0f Chris Mason           2008-10-29  258  
7880991344f736 Sergey Senozhatsky    2014-07-07  259  	if (workspace->strm.total_out >= workspace->strm.total_in) {
60e1975acb48fc Zach Brown            2014-05-09  260  		ret = -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  261  		goto out;
c8b978188c9a0f Chris Mason           2008-10-29  262  	}
c8b978188c9a0f Chris Mason           2008-10-29  263  
c8b978188c9a0f Chris Mason           2008-10-29  264  	ret = 0;
7880991344f736 Sergey Senozhatsky    2014-07-07  265  	*total_out = workspace->strm.total_out;
7880991344f736 Sergey Senozhatsky    2014-07-07  266  	*total_in = workspace->strm.total_in;
c8b978188c9a0f Chris Mason           2008-10-29  267  out:
046bf67791fef3 Qu Wenruo             2024-01-29  268  	*out_folios = nr_folios;
718e58551aecf7 Fabio M. De Francesco 2022-06-27  269  	if (data_in) {
718e58551aecf7 Fabio M. De Francesco 2022-06-27  270  		kunmap_local(data_in);
046bf67791fef3 Qu Wenruo             2024-01-29  271  		folio_put(in_folio);
55276e14df4324 David Sterba          2021-10-27  272  	}
718e58551aecf7 Fabio M. De Francesco 2022-06-27  273  
c8b978188c9a0f Chris Mason           2008-10-29  274  	return ret;
c8b978188c9a0f Chris Mason           2008-10-29  275  }
c8b978188c9a0f Chris Mason           2008-10-29  276  

:::::: The code at line 231 was first introduced by commit
:::::: 3fd396afc05fc90097276c6b7a70c406ad4df5bb btrfs: use larger zlib buffer for s390 hardware compression

:::::: TO: Mikhail Zaslonko <zaslonko@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
