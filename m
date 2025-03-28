Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D771CEAC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200527; cv=none; b=qmQrq1vdyd4v54ZdM2xHq1+TO3juCrtKnrFLnyxfkreIlCMvW0HfxoflaeEyu/ZHPT0faIviklOFJAorIWWHTanPT9XMdhde4H5CEx5LCXHP7Xxpledy9L9R0MB7wIk5rUnMHW5zyUw4sXdNNFk306EuaHm7aabAfQGmLE0x3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200527; c=relaxed/simple;
	bh=aJ8rUPar+IIuwgKPPNMZVpG1XLyF1h+IehJQLcCfe50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbIVXOElLv2UqDW6NuEWyXKIB+4kU+HvEjl5j5hMeFD1cmuHUHm72XF2kj12nWvNe1tix7bFJjGlQ9AoU+IoD/tSVLLAsaDadWXqrowZrC//1NcMC7G3ZT0AONphRvKS5EW95JAXFcza4D+yQDNsgFzG2aO4JI04Tfky2ts1UNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmnnYniI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmnnYniI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743200526; x=1774736526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJ8rUPar+IIuwgKPPNMZVpG1XLyF1h+IehJQLcCfe50=;
  b=hmnnYniIPGUA+k1kOVMo6SKto+CukWPuOM0su4lQsMX2dzts+OaKiIex
   SzP07UuDbqbPgQ7UFC4o65TRekNgp/wyunMlF1Hgi6tZ13+Mo/aIkMBRx
   a4vqYg2vhDNqJgjmzGx+nujMjXlkdkR5G9l4H1PaXUpWOX0cBBOf5aU8v
   JDD6RfKUkAg937DPCPJXI6e0LR8JUbBL+qUCFSV2q7Lsc9WAkR+n0xqNH
   GfMnL38Um8psA6TOZh46S1W60qU7HaMsmTMVlFS7h4LrDb2+zQdAGk5xu
   faEUkaOye3lTkRgHNFZc3y/ZJJ9onsMKsa67BrxwWNYX1dActx+HY0jOt
   g==;
X-CSE-ConnectionGUID: 33anF24pQfaf9vByZftHow==
X-CSE-MsgGUID: +QtBXcLYSIKDUm6MeTyCkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54771476"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="54771476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 15:22:05 -0700
X-CSE-ConnectionGUID: 8HtDmqsrSO+OiGGOy+JhFQ==
X-CSE-MsgGUID: +jsyN3wUQBS/tSB7RuNhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156553350"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2025 15:22:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyI5R-0007jw-2l;
	Fri, 28 Mar 2025 22:22:01 +0000
Date: Sat, 29 Mar 2025 06:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 219/222] fs/bcachefs/btree_io.c:605:1: warning:
 label 'print' defined but not used
Message-ID: <202503290602.E6Xw563B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   3720faca3701df3bb8f5cd2a12061664d01ce817
commit: 1e8de9663f8533830bd12df800d14d7a062bec7d [219/222] bcachefs: Better printing of inconsistency errors
config: sh-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290602.E6Xw563B-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290602.E6Xw563B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290602.E6Xw563B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_io.c: In function '__btree_err':
>> fs/bcachefs/btree_io.c:605:1: warning: label 'print' defined but not used [-Wunused-label]
     605 | print:
         | ^~~~~


vim +/print +605 fs/bcachefs/btree_io.c

   538	
   539	__printf(10, 11)
   540	static int __btree_err(int ret,
   541			       struct bch_fs *c,
   542			       struct bch_dev *ca,
   543			       struct btree *b,
   544			       struct bset *i,
   545			       struct bkey_packed *k,
   546			       int write,
   547			       bool have_retry,
   548			       enum bch_sb_error_id err_type,
   549			       const char *fmt, ...)
   550	{
   551		bool silent = c->curr_recovery_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes;
   552	
   553		if (!have_retry && ret == -BCH_ERR_btree_node_read_err_want_retry)
   554			ret = -BCH_ERR_btree_node_read_err_fixable;
   555		if (!have_retry && ret == -BCH_ERR_btree_node_read_err_must_retry)
   556			ret = -BCH_ERR_btree_node_read_err_bad_node;
   557	
   558		if (!silent && ret != -BCH_ERR_btree_node_read_err_fixable)
   559			bch2_sb_error_count(c, err_type);
   560	
   561		struct printbuf out = PRINTBUF;
   562		if (write != WRITE && ret != -BCH_ERR_btree_node_read_err_fixable) {
   563			printbuf_indent_add_nextline(&out, 2);
   564	#ifdef BCACHEFS_LOG_PREFIX
   565			prt_printf(&out, bch2_log_msg(c, ""));
   566	#endif
   567		}
   568	
   569		btree_err_msg(&out, c, ca, b, i, k, b->written, write);
   570	
   571		va_list args;
   572		va_start(args, fmt);
   573		prt_vprintf(&out, fmt, args);
   574		va_end(args);
   575	
   576		if (write == WRITE) {
   577			prt_str(&out, ", ");
   578			ret = __bch2_inconsistent_error(c, &out)
   579				? -BCH_ERR_fsck_errors_not_fixed
   580				: 0;
   581			silent = false;
   582		}
   583	
   584		switch (ret) {
   585		case -BCH_ERR_btree_node_read_err_fixable:
   586			ret = !silent
   587				? __bch2_fsck_err(c, NULL, FSCK_CAN_FIX, err_type, "%s", out.buf)
   588				: -BCH_ERR_fsck_fix;
   589			if (ret != -BCH_ERR_fsck_fix &&
   590			    ret != -BCH_ERR_fsck_ignore)
   591				goto fsck_err;
   592			ret = -BCH_ERR_fsck_fix;
   593			goto out;
   594		case -BCH_ERR_btree_node_read_err_bad_node:
   595			prt_str(&out, ", ");
   596			ret = __bch2_topology_error(c, &out);
   597			if (ret)
   598				silent = false;
   599			break;
   600		case -BCH_ERR_btree_node_read_err_incompatible:
   601			ret = -BCH_ERR_fsck_errors_not_fixed;
   602			silent = false;
   603			break;
   604		}
 > 605	print:
   606		if (!silent)
   607			bch2_print_string_as_lines(KERN_ERR, out.buf);
   608	out:
   609	fsck_err:
   610		printbuf_exit(&out);
   611		return ret;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
