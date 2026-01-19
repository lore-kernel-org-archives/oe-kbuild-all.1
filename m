Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67138A71C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836145; cv=none; b=ZPsD0RRMwZ4D3YQjcC3lcRlnBpmAicGKp0xsVn7dBhw/fq23+Vh1/61vSuIX6rFiqvjfkGexEaf6BERVO4oHorhNNBS+sP4qC9G4Z6WOcqQXYJ3p+1BkLzjnGRquRxhJRttNEGihpf+D9hBfLoRUwo/FysxcUi5uDHkppU7x9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836145; c=relaxed/simple;
	bh=QpceYh5i09+vGjY/HiBHlj30aSsJtdjgNm8W+7lxXJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKa3XF+VfrOx3fJM2skX3x+w9TDhUnXblPV9BzZ+MI4cH6fBLgPmohFMHf2Jri3Q4NL2LoxQXnthFsluaua/pcF9b2WHbrtWtivBKsGklXsYlKtD/2joSFU2soNQ71M5+J6ernNhP245lHdw8OB7YfE6SDbVfA0ZLlOITS0yS2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaKWlthG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaKWlthG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768836144; x=1800372144;
  h=date:from:to:cc:subject:message-id;
  bh=QpceYh5i09+vGjY/HiBHlj30aSsJtdjgNm8W+7lxXJ4=;
  b=LaKWlthGnY3wvOPuDYqNXQtORlVsbo3rz5PuVSeKxxwaeQrFYEiqJCeA
   zYoNQyB8Z2aABL37YNVhxTdl/A47gwKE2am/ATQV4Nx4WE7Sgb/FoL+vX
   Xg1lgXsSVBkmMCYq+kqnBp95vzQF/FkANCjVWTN5E+srAFOExapVlViHN
   t7beG3LxJ40s9agA0izN/a8VdBFOsJsjq39QnpJcemXHvHtNXAPuQSxV0
   tJ2MDFzTScfMYPYXnRlYwHPh7rpkzFBwob6SLlpXPTqY7WdSKylilvF+1
   Nr/fQS2m6Gn2ftYAhUmfJNlLihCVhKOyMBiviCbwcBEiAn+27wtAYQcSE
   A==;
X-CSE-ConnectionGUID: cskp0v0oQFqidna1yA8fWg==
X-CSE-MsgGUID: rkH29W7cR7OCcp7gq8Wmzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95521809"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95521809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:22:24 -0800
X-CSE-ConnectionGUID: WoAf2HgzQWGr1TX0D2vvHg==
X-CSE-MsgGUID: aB7OIiXLRNWhl1lz4nIAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210377875"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2026 07:22:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhr5A-00000000NvL-1oGs;
	Mon, 19 Jan 2026 15:22:20 +0000
Date: Mon, 19 Jan 2026 23:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/223]
 fs/bcachefs/data/reconcile/work.c:440 check_reconcile_pending_err() warn:
 inconsistent indenting
Message-ID: <202601192358.GfrU0oPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: 1c240e59948ecca320c96b94db4ffae87581d477 [223/223] bcachefs: Break up reconcile.c
config: arm64-randconfig-r073-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192358.GfrU0oPM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601192358.GfrU0oPM-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/reconcile/work.c:440 check_reconcile_pending_err() warn: inconsistent indenting

vim +440 fs/bcachefs/data/reconcile/work.c

   432	
   433	static int check_reconcile_pending_err(struct btree_trans *trans,
   434					       struct bch_inode_opts *opts,
   435					       struct data_update_opts *data_opts,
   436					       struct bkey_s_c k, int err)
   437	{
   438		struct bch_fs *c = trans->c;
   439	
 > 440		 if (!bch2_err_matches(err, BCH_ERR_data_update_fail_no_rw_devs) &&
   441		     !bch2_err_matches(err, BCH_ERR_insufficient_devices) &&
   442		     !bch2_err_matches(err, ENOSPC))
   443			 return err;
   444	
   445		event_add_trace(c, reconcile_set_pending, k.k->size, buf, ({
   446			prt_printf(&buf, "%s\n", bch2_err_str(err));
   447			bch2_bkey_val_to_text(&buf, c, k);
   448			prt_newline(&buf);
   449			bch2_data_update_opts_to_text(&buf, c, opts, data_opts);
   450			prt_newline(&buf);
   451			int ret = bch2_can_do_data_update(trans, opts, data_opts, k, &buf);
   452			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   453				return ret;
   454		}));
   455		return 1;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
