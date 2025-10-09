Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE2223A9AC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760030472; cv=none; b=R3Esor3Cxxv7OYS7gPFKEfYDYBFgrVChouKG3e9BzoAkaj38seowRkNqxFQ0+SUgXj9an9pDywGIKHIZKPvZeFM8LZHvlbX1RXX0MTwwJ+wKoCeAwemN5eBCbcynEuvbd/yd7fnm9LFXLuAclriUxaZ+EvihVVomGMExpfcPcw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760030472; c=relaxed/simple;
	bh=5EIWAmnnzGbGIdhcR+DFaUVY4getjv4Cb05KtOuV/fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F59JeeZNKXjMBc50ahN8nOpU5QBU0D9uzcVLptVNvQzQqSmolSX0N0f3mbP+Cr/IFgdEx7FvPGuY8E2Uua18VBexwmgvMSaDAQkXqHCcIGfmpUBZkKPKRQ95or0uutAS8uLHqD6ad6bf7yLH2ykW0UG6oKo4ArOPDZop069GCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgqcKBP4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgqcKBP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760030471; x=1791566471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EIWAmnnzGbGIdhcR+DFaUVY4getjv4Cb05KtOuV/fg=;
  b=bgqcKBP4jYYUYH6IFP4+VA91OByAHefyp4kvQ/auk4Igd5bqSAn5jBHQ
   DIPgWqlbRR2WMvMC0VasCJ448O1wP2IoaGAoei/C+UYlTH8exKbg3OaMV
   DutZpMNf9I89nAYc41TXbh+zqlzLex2ya3bM00CyBnY8KEGyHyukETRNg
   2Xj/rHWJMVBRNeBDPLNXHI8jZE8bSvDXMv4bzeu5ZyERIrbHpWLjtvJTT
   a8t5qXaxpoA6Q6Vn3/DwI9p2aQvb76QUEGwwLD8Qy8uThkG/gFnEt59iP
   buOqd/gmEB8ihvgGq8V1a1uEjxe/C3kbQxvmUJtcOlig16i3RvJ9zDroP
   Q==;
X-CSE-ConnectionGUID: V2IwSac6QgqMz8BonsC2Lg==
X-CSE-MsgGUID: TrM5iGVjSDeV6czbwuO2bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72930565"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="72930565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:21:10 -0700
X-CSE-ConnectionGUID: IetflFjYRzWuHwmq8/6mgg==
X-CSE-MsgGUID: lFt978MUSWS9uZIl+2HkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180365334"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2025 10:21:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6uKA-00015f-22;
	Thu, 09 Oct 2025 17:21:06 +0000
Date: Fri, 10 Oct 2025 01:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 11/20]
 drivers/char/tpm/tpm2-space.c:393:29: warning: variable 'i' is uninitialized
 when used here
Message-ID: <202510100115.Je4zLxam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   5ff746df84024ce3acd63bc2c69a92d76c5daf97
commit: a09691e4bb366823a4eb2972ba4a4569e90a7549 [11/20] tpm: Skip stale tpmrm0 flushes and saves
config: powerpc-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100115.Je4zLxam-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100115.Je4zLxam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100115.Je4zLxam-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-space.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-space.c:393:29: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     393 |         attrs = chip->cc_attrs_tbl[i];
         |                                    ^
   drivers/char/tpm/tpm2-space.c:388:7: note: initialize the variable 'i' to silence this warning
     388 |         int i;
         |              ^
         |               = 0
>> drivers/char/tpm/tpm2-space.c:415:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     415 |         default:
         |         ^
   drivers/char/tpm/tpm2-space.c:415:2: note: insert 'break;' to avoid fall-through
     415 |         default:
         |         ^
         |         break; 
   3 warnings generated.


vim +/i +393 drivers/char/tpm/tpm2-space.c

745b361e989af21 Jarkko Sakkinen 2017-01-06  381  
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  382  static int tpm2_map_response_header(struct tpm_chip *chip, u8 *rsp, size_t len)
745b361e989af21 Jarkko Sakkinen 2017-01-06  383  {
b34b77a99b1a4cc Jarkko Sakkinen 2018-11-06  384  	struct tpm_header *header = (struct tpm_header *)rsp;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  385  	struct tpm_space *space = &chip->work_space;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  386  	u32 phandle, vhandle;
745b361e989af21 Jarkko Sakkinen 2017-01-06  387  	u32 attrs;
745b361e989af21 Jarkko Sakkinen 2017-01-06  388  	int i;
745b361e989af21 Jarkko Sakkinen 2017-01-06  389  
745b361e989af21 Jarkko Sakkinen 2017-01-06  390  	if (be32_to_cpu(header->return_code) != TPM2_RC_SUCCESS)
745b361e989af21 Jarkko Sakkinen 2017-01-06  391  		return 0;
745b361e989af21 Jarkko Sakkinen 2017-01-06  392  
745b361e989af21 Jarkko Sakkinen 2017-01-06 @393  	attrs = chip->cc_attrs_tbl[i];
745b361e989af21 Jarkko Sakkinen 2017-01-06  394  	if (!((attrs >> TPM2_CC_ATTR_RHANDLE) & 1))
745b361e989af21 Jarkko Sakkinen 2017-01-06  395  		return 0;
745b361e989af21 Jarkko Sakkinen 2017-01-06  396  
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  397  	switch (chip->last_phandle & 0xFF000000) {
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  398  	case TPM2_HT_TRANSIENT:
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  399  		if (chip->last_cc == TPM2_CC_FLUSH_CONTEXT) {
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  400  			for (i = 0; i < ARRAY_SIZE(space->context_tbl); i++) {
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  401  				if (space->context_tbl[i] == chip->last_phandle)
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  402  					space->context_tbl[i] = 0;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  403  			}
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  404  		}
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  405  		break;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  406  	case TPM2_HT_HMAC_SESSION:
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  407  	case TPM2_HT_POLICY_SESSION:
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  408  		if (chip->last_cc == TPM2_CC_CONTEXT_SAVE ||
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  409  		    chip->last_cc == TPM2_CC_FLUSH_CONTEXT) {
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  410  			for (i = 0; i < ARRAY_SIZE(space->session_tbl); i++) {
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  411  				if (space->session_tbl[i] == chip->last_phandle)
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  412  					space->session_tbl[i] = 0;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  413  			}
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  414  		}
a09691e4bb36682 Jarkko Sakkinen 2025-10-04 @415  	default:
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  416  		break;
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  417  	}
745b361e989af21 Jarkko Sakkinen 2017-01-06  418  
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  419  	phandle = be32_to_cpup((__be32 *)&rsp[TPM_HEADER_SIZE]);
a09691e4bb36682 Jarkko Sakkinen 2025-10-04  420  	switch (phandle & 0xFF000000) {
745b361e989af21 Jarkko Sakkinen 2017-01-06  421  	case TPM2_HT_TRANSIENT:
745b361e989af21 Jarkko Sakkinen 2017-01-06  422  		vhandle = tpm2_map_to_vhandle(space, phandle, true);
745b361e989af21 Jarkko Sakkinen 2017-01-06  423  		if (!vhandle)
745b361e989af21 Jarkko Sakkinen 2017-01-06  424  			goto out_no_slots;
745b361e989af21 Jarkko Sakkinen 2017-01-06  425  
745b361e989af21 Jarkko Sakkinen 2017-01-06  426  		*(__be32 *)&rsp[TPM_HEADER_SIZE] = cpu_to_be32(vhandle);
745b361e989af21 Jarkko Sakkinen 2017-01-06  427  		break;
745b361e989af21 Jarkko Sakkinen 2017-01-06  428  	case TPM2_HT_HMAC_SESSION:
745b361e989af21 Jarkko Sakkinen 2017-01-06  429  	case TPM2_HT_POLICY_SESSION:
4d57856a21ed2ab James Bottomley 2017-01-31  430  		if (!tpm2_add_session(chip, phandle))
4d57856a21ed2ab James Bottomley 2017-01-31  431  			goto out_no_slots;
745b361e989af21 Jarkko Sakkinen 2017-01-06  432  		break;
745b361e989af21 Jarkko Sakkinen 2017-01-06  433  	default:
745b361e989af21 Jarkko Sakkinen 2017-01-06  434  		dev_err(&chip->dev, "%s: unknown handle 0x%08X\n",
745b361e989af21 Jarkko Sakkinen 2017-01-06  435  			__func__, phandle);
745b361e989af21 Jarkko Sakkinen 2017-01-06  436  		break;
c22780ff0c764ca Tomas Winkler   2018-10-19  437  	}
745b361e989af21 Jarkko Sakkinen 2017-01-06  438  
745b361e989af21 Jarkko Sakkinen 2017-01-06  439  	return 0;
745b361e989af21 Jarkko Sakkinen 2017-01-06  440  out_no_slots:
47a6c28b6861b14 Jarkko Sakkinen 2018-11-05  441  	tpm2_flush_context(chip, phandle);
745b361e989af21 Jarkko Sakkinen 2017-01-06  442  	dev_warn(&chip->dev, "%s: out of slots for 0x%08X\n", __func__,
745b361e989af21 Jarkko Sakkinen 2017-01-06  443  		 phandle);
745b361e989af21 Jarkko Sakkinen 2017-01-06  444  	return -ENOMEM;
745b361e989af21 Jarkko Sakkinen 2017-01-06  445  }
745b361e989af21 Jarkko Sakkinen 2017-01-06  446  

:::::: The code at line 393 was first introduced by commit
:::::: 745b361e989af21ad40811c2586b60229f870a68 tpm: infrastructure for TPM spaces

:::::: TO: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
