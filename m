Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29A32D451
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400380; cv=none; b=AhtLnxiVFg21nM03ApsCdlnwlWFOI4cMRUrkECiuATItlCANtiLRbFWrhdfi8xhqcNj9/BYr+N1bMT2oDHvuIF3r9iZwiuA3xUJ69Jq0aXOZ9IMovMxqx6Iyc6YHY3ChgCFShYmHzkiCJ846dYkLspPOiKGmL6kvHlAk7L3KycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400380; c=relaxed/simple;
	bh=nxX8dsG49W5ZG8jCaFW+56jQa/l7qfnOtcgtjUcsvVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KM1Sh1Ja5ke0PLB5aI/QYrAK2drAuKSyInuH5+nurxmKCM9o5ZXpe+4wzb+/jItw1rW3etm7RgN0eMfvLQ3gpRaLUx4RHRsksdZz6hYjR/P8CSkJ6S6G+VamSSg17x9t/2cuMSkP5k0Y7h89sE8Uyx+ix+wRTus0u8bg5/kMfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp8jElbd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp8jElbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766400379; x=1797936379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxX8dsG49W5ZG8jCaFW+56jQa/l7qfnOtcgtjUcsvVA=;
  b=Fp8jElbdsF1hXA6GPEGyuVtdchLertz0B4pHm9KEPYnxQO24Khb1TmfT
   7ibNTZj+6+wxF9KyKJTdzfXYi3+G83gJryRr2/PaUVFpl0sNrtFzI4qhI
   IHsX3YYvl3YEMu9P4+DfseSA4JsdodGNxZ8RaiiS5BX5Y/TXDYnqy/G5H
   ri8MDXI8CIKl1zzdwvxvnYKz/hjF2KCVH7YI5q/yyXw70glYJEjISA/0t
   gtDl4lZlny9DPvC2YsKT45z/8rVDU/jcBh5vRTbFlSXJVrpMXAAuyL7yk
   uD8Cea+Dz2FC9sJC/65TUwyXBQO68AvwRFAkQSeQCVMqU7HFyMhMjzXx9
   A==;
X-CSE-ConnectionGUID: FilbTOBmR6ylrR3qDpG2HA==
X-CSE-MsgGUID: Xa7Qg+7tRP+pksD+/ivDSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71885208"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="71885208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:46:18 -0800
X-CSE-ConnectionGUID: uMlXR6/IS+ShIjMDzLNGcQ==
X-CSE-MsgGUID: w0uU8N+ASWWjzuObb+Jcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198650248"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2025 02:46:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXdQc-000000005Qi-2uXb;
	Mon, 22 Dec 2025 10:46:14 +0000
Date: Mon, 22 Dec 2025 11:45:39 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 05/11] tpm2-sessions: Remove AUTH_MAX_NAMES
Message-ID: <202512221155.GEZqjbSr-lkp@intel.com>
References: <20251214153808.73831-6-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214153808.73831-6-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19-rc2 next-20251219]
[cannot apply to zohar-integrity/next-integrity dhowells-fs/fscache-next dhowells-fs/keys-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-Define-TPM2_NAME_MAX_SIZE/20251214-234436
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251214153808.73831-6-jarkko%40kernel.org
patch subject: [PATCH v6 05/11] tpm2-sessions: Remove AUTH_MAX_NAMES
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221155.GEZqjbSr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221155.GEZqjbSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221155.GEZqjbSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-sessions.c:66:
   In file included from drivers/char/tpm/tpm.h:28:
   ./include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-sessions.c:261:20: warning: unused variable 'auth' [-Wunused-variable]
     261 |         struct tpm2_auth *auth;
         |                           ^~~~
   2 warnings generated.


vim +/auth +261 drivers/char/tpm/tpm2-sessions.c

a61809a3323982 Jarkko Sakkinen 2024-07-03  231  
a61809a3323982 Jarkko Sakkinen 2024-07-03  232  /**
708971b661887e Jarkko Sakkinen 2025-12-14  233   * tpm_buf_append_name() - Append a handle and store TPM name
708971b661887e Jarkko Sakkinen 2025-12-14  234   * @chip:		TPM chip to use.
708971b661887e Jarkko Sakkinen 2025-12-14  235   * @buf:		TPM buffer containing the TPM command in-transit.
708971b661887e Jarkko Sakkinen 2025-12-14  236   * @handle:		TPM handle to be appended.
708971b661887e Jarkko Sakkinen 2025-12-14  237   * @name:		TPM name of the handle
708971b661887e Jarkko Sakkinen 2025-12-14  238   * @name_size:		Size of the TPM name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  239   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  240   * In order to compute session HMACs, we need to know the names of the
a61809a3323982 Jarkko Sakkinen 2024-07-03  241   * objects pointed to by the handles.  For most objects, this is simply
a61809a3323982 Jarkko Sakkinen 2024-07-03  242   * the actual 4 byte handle or an empty buf (in these cases @name
a61809a3323982 Jarkko Sakkinen 2024-07-03  243   * should be NULL) but for volatile objects, permanent objects and NV
a61809a3323982 Jarkko Sakkinen 2024-07-03  244   * areas, the name is defined as the hash (according to the name
a61809a3323982 Jarkko Sakkinen 2024-07-03  245   * algorithm which should be set to sha256) of the public area to
a61809a3323982 Jarkko Sakkinen 2024-07-03  246   * which the two byte algorithm id has been appended.  For these
a61809a3323982 Jarkko Sakkinen 2024-07-03  247   * objects, the @name pointer should point to this.  If a name is
a61809a3323982 Jarkko Sakkinen 2024-07-03  248   * required but @name is NULL, then TPM2_ReadPublic() will be called
a61809a3323982 Jarkko Sakkinen 2024-07-03  249   * on the handle to obtain the name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  250   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  251   * As with most tpm_buf operations, success is assumed because failure
a61809a3323982 Jarkko Sakkinen 2024-07-03  252   * will be caused by an incorrect programming model and indicated by a
a61809a3323982 Jarkko Sakkinen 2024-07-03  253   * kernel message.
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  254   *
708971b661887e Jarkko Sakkinen 2025-12-14  255   * Returns zero on success.
708971b661887e Jarkko Sakkinen 2025-12-14  256   * Returns -EIO when the authorization area state is malformed.
a61809a3323982 Jarkko Sakkinen 2024-07-03  257   */
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  258  int tpm_buf_append_name(struct tpm_chip *chip, struct tpm_buf *buf,
708971b661887e Jarkko Sakkinen 2025-12-14  259  			u32 handle, u8 *name, u16 name_size)
a61809a3323982 Jarkko Sakkinen 2024-07-03  260  {
a61809a3323982 Jarkko Sakkinen 2024-07-03 @261  	struct tpm2_auth *auth;
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  262  	int ret;
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  263  
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  264  	if (tpm_buf_length(buf) != TPM_HEADER_SIZE) {
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  265  		dev_err(&chip->dev, "too many handles\n");
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  266  		ret = -EIO;
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  267  		goto err;
db19f5a5bd7be5 Jarkko Sakkinen 2025-12-14  268  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  269  
a61809a3323982 Jarkko Sakkinen 2024-07-03  270  	if (!tpm2_chip_auth(chip)) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  271  		tpm_buf_append_handle(chip, buf, handle);
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  272  		return 0;
a61809a3323982 Jarkko Sakkinen 2024-07-03  273  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  274  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
