Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321125A642
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 03:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639688; cv=none; b=lCx0WWdTUQjufQ3fo+Ha2fegFWU5JkU87GP67p//ORrD14Ffz/Pcwoyv/AIMmiceLI8dxzI/gwlC/20XapaiVvc2f46GNDTflH+7a298VmY8jsndzVM8mgiqmXmULssMjwushzvIAbT8uMZJQU1kCrTmzGoVqTe3ND/5Q+rLD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639688; c=relaxed/simple;
	bh=RBQzP72GrCRFKrfwgzeGPK9Y8xOl72KJuw6lthIAFXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgcAuQ0faPoAQ1S5MYkNjc9Kxlh1X6Kwy05pBZ8EhFxt8GLpinWU0DsAxSKwdqI4fVHxOacZuPg+cN7BCSbGU/nNyeOmIQkh/FAXjyFqvy/y411vNqoC9PYubLuQRrAfYShhcukgGserJZXCBsnKhLo3evgvG0h5mPk48ouNqPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYNUFNPa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYNUFNPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639686; x=1770175686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBQzP72GrCRFKrfwgzeGPK9Y8xOl72KJuw6lthIAFXI=;
  b=hYNUFNPaI9a25N093wjKiQhlFZyWL3C/vqjg81qJyZCRVKk+y9AFNvRj
   moLnWfnOKG4JCtxfov+vjwlGlVrcKiJuUQxeRJosylbNqtJGt5MhkPdyB
   v+QpXtmGOf0pd+LPZFE3v3p1tVFRS001S+PGR3iNkd6EYavjsZDdehFeJ
   BW/h7LmD+EL5fIhdeSYwrgA9ZXCWBQmRHHr1bKcw8dYjMVll/jGHOwoM+
   FPr1dvo9VKmql/JmYwT5IDqAcOfB1Wkv04eU1at2w+6+Lm2nAGxGYFQzY
   IxboeR1LxhWILg1Fqugf/HoNyGO3JfBNncrrokfQM9K3kOjRtyOG9YroP
   w==;
X-CSE-ConnectionGUID: gNR4TawERdqHxr8D3HylzA==
X-CSE-MsgGUID: 4DjY3mxbTu2WYt6ZTztJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39305649"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39305649"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:28:05 -0800
X-CSE-ConnectionGUID: dh01YxWbSc6bgT0GY5Cemg==
X-CSE-MsgGUID: AmjIEskrRMmIGSWukm+1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133716525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 19:28:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf9bW-000run-1h;
	Tue, 04 Feb 2025 03:28:02 +0000
Date: Tue, 4 Feb 2025 11:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 43/43]
 fs/bcachefs/move.c:852:31: warning: implicit conversion from 'enum
 data_progress_data_type_special' to 'enum bch_data_type'
Message-ID: <202502041114.c3ws68GM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   0fa5e3f3a667536531d798fa35334305c47c779a
commit: 0fa5e3f3a667536531d798fa35334305c47c779a [43/43] bcachefs: Convert migrate to move_data_phys()
config: i386-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041114.c3ws68GM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041114.c3ws68GM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.c3ws68GM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/move.c: In function 'bch2_move_data_phys':
>> fs/bcachefs/move.c:852:31: warning: implicit conversion from 'enum data_progress_data_type_special' to 'enum bch_data_type' [-Wenum-conversion]
     852 |         ctxt.stats->data_type = DATA_PROGRESS_DATA_TYPE_phys;
         |                               ^
--
   fs/bcachefs/chardev.c: In function 'bch2_data_thread':
>> fs/bcachefs/chardev.c:320:38: warning: implicit conversion from 'enum data_progress_data_type_special' to 'enum bch_data_type' [-Wenum-conversion]
     320 |                 ctx->stats.data_type = DATA_PROGRESS_DATA_TYPE_done;
         |                                      ^


vim +852 fs/bcachefs/move.c

   834	
   835	static int bch2_move_data_phys(struct bch_fs *c,
   836				       unsigned dev,
   837				       u64 start,
   838				       u64 end,
   839				       unsigned data_types,
   840				       struct bch_ratelimit *rate,
   841				       struct bch_move_stats *stats,
   842				       struct write_point_specifier wp,
   843				       bool wait_on_copygc,
   844				       move_pred_fn pred, void *arg)
   845	{
   846		struct moving_context ctxt;
   847	
   848		bch2_trans_run(c, bch2_btree_write_buffer_flush_sync(trans));
   849	
   850		bch2_moving_ctxt_init(&ctxt, c, rate, stats, wp, wait_on_copygc);
   851		ctxt.stats->phys = true;
 > 852		ctxt.stats->data_type = DATA_PROGRESS_DATA_TYPE_phys;
   853	
   854		int ret = __bch2_move_data_phys(&ctxt, NULL, dev, start, end, data_types, pred, arg);
   855		bch2_moving_ctxt_exit(&ctxt);
   856	
   857		return ret;
   858	}
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
