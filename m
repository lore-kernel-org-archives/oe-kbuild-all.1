Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C63B6371
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793839; cv=none; b=pzaGrLDcR3B6O0fubvHFFiZpV7ypa7WExtOTzWcfRolAA0R9gL4ClziPt+v+7GVgdtU8O49xgQgqCoV5+L00snVLJ54Gfv2pal9nrHeFZQVO7n0nTdoTvxQhCgaJ1kwWS5aBzL8P6ykCXEuJTfEqJp1qC1fcVFtPqAVLIZFfYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793839; c=relaxed/simple;
	bh=8JyOWH4+K48A9Sg6QCP+L/vdSKxLV8C7ro5BCHnOVd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJkhvadXC2bxBMQ5PaB3KF9dBr6MV/106yCa2PtzSfyTw3D+VWlQ8zsrqnb1507gm7zaugNskxXVjR4M6MopDon+sQqNkX1RFFMI2d7CUUy7cTl7dkJSG2kUU3RcpFrB2vY1qfBCRqfoNU9TrQX5LCYLulQ8byVdnkp9tXDiXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iltpciAG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iltpciAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793837; x=1810329837;
  h=date:from:to:cc:subject:message-id;
  bh=8JyOWH4+K48A9Sg6QCP+L/vdSKxLV8C7ro5BCHnOVd0=;
  b=iltpciAGLEbnGsp0c4nPcFGOWPQxIdWbsfk1NerIxwf2J4UL3KnU2SIo
   SteBtRleazFiKQSqgzLr47kN+LRQipbDnDFX47mbPcM2KUGM9rZuobZMV
   vNHoAT1D1Oi8NS4pCPvVClEVAXsIfH1KSlFpICGHg7nomwRHdoFwrT3qV
   40cGKeuoEVGOwDnOUDDYusqITjUGlTQGlWkeFWMZx+Jzk86WsCxraNE5g
   MQv8kQ0D58DFNoNOzA+PsWb1xdAaZvvTuWhZt1XDSPjezz0xcTs4afT5V
   5tt/mfhrLj/0+/3r5mPxrxdVP3CZqmF02Hff7rdLxFZJm9pNdeg7wRGTM
   g==;
X-CSE-ConnectionGUID: P6th/eZfRnO4B2EyLh91NA==
X-CSE-MsgGUID: h/MeCDfNSPqrpaavt/QMqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603424"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: Zfxar8uFS/aasEDf43eimg==
X-CSE-MsgGUID: PB7RenX0TZa+tFLjMoQhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458970"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX3-0000000001y-0giJ;
	Thu, 14 May 2026 21:23:49 +0000
Date: Fri, 15 May 2026 05:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 223/332]
 fs/bcachefs/data/reconcile/work.c:440 check_reconcile_pending_err() warn:
 inconsistent indenting
Message-ID: <202605150529.R2iLMt7f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: de374d7b7296203619ba70f976867051cebaf41b [223/332] bcachefs: Break up reconcile.c
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150529.R2iLMt7f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150529.R2iLMt7f-lkp@intel.com/

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
