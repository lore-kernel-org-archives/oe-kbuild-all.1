Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B37163
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757809358; cv=none; b=U4vvLkrztpzblymdfObrl3FVi7/MiufrQZJ731ooHy9hz/DiG3JC5Op13J7paC5n6ByYc0gWE8SK70GMiP+o59Sme9N6zVhN6oA2d03D8tf05ny/Jv/Jc1ebhTpj3Wafl0315V8FlSC131wGq+7poRQ5RkEYOVKHwsXm9c/HTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757809358; c=relaxed/simple;
	bh=qcbUCfnMRnyn4/D/epVadGaMxsaPN1/Yd5KPC3kjidY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsybdSOB5SNQKhsOnyyor4fNpfA0Kkqis2UL3zz6niKIyQe0oOTDxzqKsCjkYDAW8MsK7YFk7ng1H16ltPR45rwasPb1G1RNlaHcHmZ1sty9kLl0x9nn//ugVbG3Jm+WwpR1d3Hm0LB1keCDkvSaR6Zf+UCyz3tDJcvGgIuEv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI9gprRd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI9gprRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757809356; x=1789345356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcbUCfnMRnyn4/D/epVadGaMxsaPN1/Yd5KPC3kjidY=;
  b=nI9gprRd7mrM21Sn8u4oK5MjHmSvpM8aIS/NMiyPCQ4mNNJ0ZfUJujWV
   TK4dfZ8Y818siynIEsK+GvohFDcEgp06tI3pIPLjjGpjDmFh2K6mE/ci+
   8qBsTDDQ9+78dg1peECV4VZCRF4UF66Bnc3qm8+1a99wGgV/UQ+gwYN3D
   zpczeC7AUDbqrrHG4THzD08ls5qpo1viL7S1nuquTom2r4iqCwpXkwigU
   /5qJ9GYgg8PuTom2/vtjldCnQ2JCiq08XBGZTQMAPqnGuUNsm+qDRJD96
   zOZUWDZyJzWrIS5d+ukvf+ZGJeB9anfiZS4XUbcnfABKDgrAFU0+ktbHG
   g==;
X-CSE-ConnectionGUID: W+rxZz4nQBSNBEmptTtY6Q==
X-CSE-MsgGUID: XF0HfR2VSFmJHlfGNJl6Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71479043"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="71479043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 17:22:36 -0700
X-CSE-ConnectionGUID: RgPHRGyRR8axuDyog4a/6w==
X-CSE-MsgGUID: 17B72xOkTvGQQVs+xUnLzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="179541033"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2025 17:22:35 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxaVl-0001yG-05;
	Sun, 14 Sep 2025 00:22:33 +0000
Date: Sun, 14 Sep 2025 08:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_first_size 38/38] drivers/scsi/lpfc/lpfc_sli.c:20383:45:
 warning: & has lower precedence than ==; == will be evaluated first
Message-ID: <202509140820.jG0pjp4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_first_size
head:   19fff28fbf729956258aeb0cd260f8dc1186952f
commit: 19fff28fbf729956258aeb0cd260f8dc1186952f [38/38] rfc: lpfc_sli4_fcf_rr_next_index_get rework
config: i386-buildonly-randconfig-005-20250914 (https://download.01.org/0day-ci/archive/20250914/202509140820.jG0pjp4D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140820.jG0pjp4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140820.jG0pjp4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_sli.c:20383:45: warning: & has lower precedence than ==; == will be evaluated first [-Wparentheses]
    20383 |                         if (phba->fcf.fcf_pri[next].fcf_rec.flag & LPFC_FCF_FLOGI_FAILED == 0) {
          |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_sli.c:20383:45: note: place parentheses around the '==' expression to silence this warning
    20383 |                         if (phba->fcf.fcf_pri[next].fcf_rec.flag & LPFC_FCF_FLOGI_FAILED == 0) {
          |                                                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_sli.c:20383:45: note: place parentheses around the & expression to evaluate it first
    20383 |                         if (phba->fcf.fcf_pri[next].fcf_rec.flag & LPFC_FCF_FLOGI_FAILED == 0) {
          |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +20383 drivers/scsi/lpfc/lpfc_sli.c

 20266	
 20267	/**
 20268	 * lpfc_check_next_fcf_pri_level
 20269	 * @phba: pointer to the lpfc_hba struct for this port.
 20270	 * This routine is called from the lpfc_sli4_fcf_rr_next_index_get
 20271	 * routine when the rr_bmask is empty. The FCF indecies are put into the
 20272	 * rr_bmask based on their priority level. Starting from the highest priority
 20273	 * to the lowest. The most likely FCF candidate will be in the highest
 20274	 * priority group. When this routine is called it searches the fcf_pri list for
 20275	 * next lowest priority group and repopulates the rr_bmask with only those
 20276	 * fcf_indexes.
 20277	 * returns:
 20278	 * 1=success 0=failure
 20279	 **/
 20280	static int
 20281	lpfc_check_next_fcf_pri_level(struct lpfc_hba *phba)
 20282	{
 20283		uint16_t next_fcf_pri;
 20284		uint16_t last_index;
 20285		struct lpfc_fcf_pri *fcf_pri;
 20286		int rc;
 20287		int ret = 0;
 20288	
 20289		last_index = find_first_bit(phba->fcf.fcf_rr_bmask,
 20290				LPFC_SLI4_FCF_TBL_INDX_MAX);
 20291		lpfc_printf_log(phba, KERN_INFO, LOG_FIP,
 20292				"3060 Last IDX %d\n", last_index);
 20293	
 20294		/* Verify the priority list has 2 or more entries */
 20295		spin_lock_irq(&phba->hbalock);
 20296		if (list_empty(&phba->fcf.fcf_pri_list) ||
 20297		    list_is_singular(&phba->fcf.fcf_pri_list)) {
 20298			spin_unlock_irq(&phba->hbalock);
 20299			lpfc_printf_log(phba, KERN_ERR, LOG_FIP,
 20300				"3061 Last IDX %d\n", last_index);
 20301			return 0; /* Empty rr list */
 20302		}
 20303		spin_unlock_irq(&phba->hbalock);
 20304	
 20305		next_fcf_pri = 0;
 20306		/*
 20307		 * Clear the rr_bmask and set all of the bits that are at this
 20308		 * priority.
 20309		 */
 20310		memset(phba->fcf.fcf_rr_bmask, 0,
 20311				sizeof(*phba->fcf.fcf_rr_bmask));
 20312		spin_lock_irq(&phba->hbalock);
 20313		list_for_each_entry(fcf_pri, &phba->fcf.fcf_pri_list, list) {
 20314			if (fcf_pri->fcf_rec.flag & LPFC_FCF_FLOGI_FAILED)
 20315				continue;
 20316			/*
 20317			 * the 1st priority that has not FLOGI failed
 20318			 * will be the highest.
 20319			 */
 20320			if (!next_fcf_pri)
 20321				next_fcf_pri = fcf_pri->fcf_rec.priority;
 20322			spin_unlock_irq(&phba->hbalock);
 20323			if (fcf_pri->fcf_rec.priority == next_fcf_pri) {
 20324				rc = lpfc_sli4_fcf_rr_index_set(phba,
 20325							fcf_pri->fcf_rec.fcf_index);
 20326				if (rc)
 20327					return 0;
 20328			}
 20329			spin_lock_irq(&phba->hbalock);
 20330		}
 20331		/*
 20332		 * if next_fcf_pri was not set above and the list is not empty then
 20333		 * we have failed flogis on all of them. So reset flogi failed
 20334		 * and start at the beginning.
 20335		 */
 20336		if (!next_fcf_pri && !list_empty(&phba->fcf.fcf_pri_list)) {
 20337			list_for_each_entry(fcf_pri, &phba->fcf.fcf_pri_list, list) {
 20338				fcf_pri->fcf_rec.flag &= ~LPFC_FCF_FLOGI_FAILED;
 20339				/*
 20340				 * the 1st priority that has not FLOGI failed
 20341				 * will be the highest.
 20342				 */
 20343				if (!next_fcf_pri)
 20344					next_fcf_pri = fcf_pri->fcf_rec.priority;
 20345				spin_unlock_irq(&phba->hbalock);
 20346				if (fcf_pri->fcf_rec.priority == next_fcf_pri) {
 20347					rc = lpfc_sli4_fcf_rr_index_set(phba,
 20348							fcf_pri->fcf_rec.fcf_index);
 20349					if (rc)
 20350						return 0;
 20351				}
 20352				spin_lock_irq(&phba->hbalock);
 20353			}
 20354		} else
 20355			ret = 1;
 20356		spin_unlock_irq(&phba->hbalock);
 20357	
 20358		return ret;
 20359	}
 20360	/**
 20361	 * lpfc_sli4_fcf_rr_next_index_get - Get next eligible fcf record index
 20362	 * @phba: pointer to lpfc hba data structure.
 20363	 *
 20364	 * This routine is to get the next eligible FCF record index in a round
 20365	 * robin fashion. If the next eligible FCF record index equals to the
 20366	 * initial roundrobin FCF record index, LPFC_FCOE_FCF_NEXT_NONE (0xFFFF)
 20367	 * shall be returned, otherwise, the next eligible FCF record's index
 20368	 * shall be returned.
 20369	 **/
 20370	uint16_t
 20371	lpfc_sli4_fcf_rr_next_index_get(struct lpfc_hba *phba)
 20372	{
 20373		uint16_t next;
 20374	
 20375	
 20376		do {
 20377			/* Start next after currently registered FCF index */
 20378			for_each_set_bit_wrap(next, phba->fcf.fcf_rr_bmask,
 20379					LPFC_SLI4_FCF_TBL_INDX_MAX, phba->fcf.current_rec.fcf_indx + 1) {
 20380				if (next == phba->fcf.current_rec.fcf_indx)
 20381					break;
 20382	
 20383				if (phba->fcf.fcf_pri[next].fcf_rec.flag & LPFC_FCF_FLOGI_FAILED == 0) {
 20384					lpfc_printf_log(phba, KERN_INFO, LOG_FIP,
 20385						"2845 Get next roundrobin failover FCF (x%x)\n", next);
 20386					return next;
 20387				}
 20388	
 20389				if (list_is_singular(&phba->fcf.fcf_pri_list))
 20390					return LPFC_FCOE_FCF_NEXT_NONE;
 20391			}
 20392	
 20393			/*
 20394			 * If next fcf index is not found check if there are lower
 20395			 * Priority level fcf's in the fcf_priority list.
 20396			 * Set up the rr_bmask with all of the avaiable fcf bits
 20397			 * at that level and continue the selection process.
 20398			 */
 20399		} while (lpfc_check_next_fcf_pri_level(phba));
 20400	
 20401		lpfc_printf_log(phba, KERN_WARNING, LOG_FIP,
 20402				"2844 No roundrobin failover FCF available\n");
 20403	
 20404		return LPFC_FCOE_FCF_NEXT_NONE;
 20405	}
 20406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
