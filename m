Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ABD2BE7AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425817; cv=none; b=OeOL3sCtxupmHiS5waewpIQeWW98PWi3uw+uk+j8Lwq/u/W1eMUVi9HUfW+3LNz10ekbf2abW8RCY6AfYfeGUhb9LepWfOxX0EAcr+idP4UGCEeWlNntUXpjud2Nd8OIcR8PxCZCUIDRbHuI326QM4Tbn7iWD3u1oEFp+m5g9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425817; c=relaxed/simple;
	bh=+64fszcoXQZlbd4wadN2e42J5Un+H8RmLRqK9GgXgRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRw2OC37XT93ZMdxR7MDdbNxz6eoQ6swDQcDSfgvLP+hRNCSBv9OtXU61BxOurrtAhNAS1/Et394DoNQQXBBX36me6Pt3wDJd+K+X2ybZ3Se6uWgJ3eVtKpFibDGh0WSmRANVuyfb/XxmOhqQIozohbp+Wb7Pwdvm3WpaFly1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeyHNqBz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeyHNqBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425816; x=1796961816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+64fszcoXQZlbd4wadN2e42J5Un+H8RmLRqK9GgXgRg=;
  b=QeyHNqBz6EC5xpWmQn8axntWlk1GcTY/w0SHXhazUO9iy2bXD14TY7kJ
   KbgEX3Lrv7hiXCMyJR0A6tloYhqSxZgFvCVYc0M4iGaSM2Ju+PeOhidfp
   81pxuFMOujzi3+6uNl7xUEeyKcIfm1A6+dbXGt6kcfKdIZarfv1+GcdB3
   0zyyh9qGFKCfc4SmoIrApmJBQvEXXTMDppWSuM9Ytsbyfz+HGG/okR+8Q
   6NvAeKc2ToImLYiyGbDmEnlhmlUH8d8WvaqZCHuIFPSMNgxiXeNJSi1vX
   otiOzhJlnoxhuJJ4mUCBesRsECAHv9sSHzy0zSg0VRD9g4AxaEZoeE5mC
   A==;
X-CSE-ConnectionGUID: ZiPkN45yROSBLBdu/0wjHw==
X-CSE-MsgGUID: j4amPr7rQJ2iGCNPx+p28Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="85011452"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="85011452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:03:33 -0800
X-CSE-ConnectionGUID: hpHpyMCVSTWTceqHzEEw4w==
X-CSE-MsgGUID: BSYG7o+tT3Cfd5Q6Kbzsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201787122"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 20:03:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXtp-0000000048F-3BTB;
	Thu, 11 Dec 2025 04:03:29 +0000
Date: Thu, 11 Dec 2025 12:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/5] net/smc/smc_wr.c:87:33: warning:
 variable 'wr_id' set but not used
Message-ID: <202512111210.sWkL34f8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 48dc03c645d04247e6ffd2aa607af4c9ea9f52de [0/5] anolis: net/smc: Support Rdma Write with Imm for SMC-R
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111210.sWkL34f8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111210.sWkL34f8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111210.sWkL34f8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/smc/smc_wr.c: In function 'smc_wr_tx_process_cqe':
>> net/smc/smc_wr.c:87:33: warning: variable 'wr_id' set but not used [-Wunused-but-set-variable]
      87 |         union smc_wr_rwwi_tx_id wr_id;
         |                                 ^~~~~
--
   net/smc/smc_tx.c: In function 'smcr_tx_rdma_writes':
>> net/smc/smc_tx.c:588:13: warning: variable 'src_len_sum' set but not used [-Wunused-but-set-variable]
     588 |         int src_len_sum = src_len, dst_len_sum = dst_len;
         |             ^~~~~~~~~~~


vim +/wr_id +87 net/smc/smc_wr.c

    83	
    84	static inline void smc_wr_tx_process_cqe(struct ib_wc *wc, bool is_rwwi)
    85	{
    86		struct smc_wr_tx_pend pnd_snd;
  > 87		union smc_wr_rwwi_tx_id wr_id;
    88		struct smc_link *link;
    89		u32 pnd_snd_idx;
    90	
    91		link = wc->qp->qp_context;
    92		if (is_rwwi) {
    93			wr_id.data = wc->wr_id;
    94			smc_tx_put_free_slot_rwwi(link, true);
    95			if (wc->status)
    96				smcr_link_down_cond_sched(link);
    97			smc_cdc_tx_handler_rwwi(wc);
    98			goto wake_tx_wait;
    99		}
   100	
   101		if (wc->opcode == IB_WC_REG_MR) {
   102			if (wc->status)
   103				link->wr_reg_state = FAILED;
   104			else
   105				link->wr_reg_state = CONFIRMED;
   106			smc_wr_wakeup_reg_wait(link);
   107			return;
   108		}
   109	
   110		pnd_snd_idx = smc_wr_tx_find_pending_index(link, wc->wr_id);
   111		if (pnd_snd_idx == link->wr_tx_cnt) {
   112			if (link->lgr->smc_version != SMC_V2 ||
   113			    link->wr_tx_v2_pend->wr_id != wc->wr_id)
   114				return;
   115			link->wr_tx_v2_pend->wc_status = wc->status;
   116			memcpy(&pnd_snd, link->wr_tx_v2_pend, sizeof(pnd_snd));
   117			/* clear the full struct smc_wr_tx_pend including .priv */
   118			memset(link->wr_tx_v2_pend, 0,
   119			       sizeof(*link->wr_tx_v2_pend));
   120			memset(link->lgr->wr_tx_buf_v2, 0,
   121			       sizeof(*link->lgr->wr_tx_buf_v2));
   122		} else {
   123			link->wr_tx_pends[pnd_snd_idx].wc_status = wc->status;
   124			if (link->wr_tx_pends[pnd_snd_idx].compl_requested)
   125				complete(&link->wr_tx_compl[pnd_snd_idx]);
   126			memcpy(&pnd_snd, &link->wr_tx_pends[pnd_snd_idx],
   127			       sizeof(pnd_snd));
   128			/* clear the full struct smc_wr_tx_pend including .priv */
   129			memset(&link->wr_tx_pends[pnd_snd_idx], 0,
   130			       sizeof(link->wr_tx_pends[pnd_snd_idx]));
   131			memset(&link->wr_tx_bufs[pnd_snd_idx], 0,
   132			       sizeof(link->wr_tx_bufs[pnd_snd_idx]));
   133			if (!test_and_clear_bit(pnd_snd_idx, link->wr_tx_mask))
   134				return;
   135		}
   136	
   137		if (wc->status) {
   138			if (link->lgr->smc_version == SMC_V2) {
   139				memset(link->wr_tx_v2_pend, 0,
   140				       sizeof(*link->wr_tx_v2_pend));
   141				memset(link->lgr->wr_tx_buf_v2, 0,
   142				       sizeof(*link->lgr->wr_tx_buf_v2));
   143			}
   144			/* terminate link */
   145			smcr_link_down_cond_sched(link);
   146		}
   147		if (pnd_snd.handler)
   148			pnd_snd.handler(&pnd_snd.priv, link, wc->status);
   149	wake_tx_wait:
   150		if (wq_has_sleeper(&link->wr_tx_wait))
   151			wake_up(&link->wr_tx_wait);
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
