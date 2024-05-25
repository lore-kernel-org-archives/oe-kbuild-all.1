Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084D2F2F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 21:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716671044; cv=none; b=aHr5erxl5QeGhQ1/ptHAx7imv57bagDGi7aaR39abdTfr2zOrZPjuZhW9iRZ2lM43QeR6ULHi9hlMvjenQBOTRK/Qi+wMJd/gajQ6POmEHRsWcgF1/Iis5DBHfZUJz2OWGHxV7LNRH/WfNJYb0XK1lt5FSdJsr9LnW3GHh621+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716671044; c=relaxed/simple;
	bh=7a0cgGyRUyaA6jd44Vw8EXx4gX9wBdQQ8QmOu5WExR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLEPnnZgW5sOe7kQRrgzeksfa4DkolALg/zJAf4QRRR0pqOB0W30j4NymfI9vAi4qyNjaZ4NqxGeHSxSoZbhqx++eFhv6J6A+lGT1P42ignosYTsA3Gpwl5Gh8OoKvBHIBjhpoK+cHxCboAWD75RFOp+W6HbabTvnyIENpLESKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTlZ5tyH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTlZ5tyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716671042; x=1748207042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7a0cgGyRUyaA6jd44Vw8EXx4gX9wBdQQ8QmOu5WExR0=;
  b=JTlZ5tyHHNPAuEvQ8+kVHTMKSYGFk66lwfiQKqb7nQmu6q1aIQ2q0A4x
   Y8ThSYSvcn8+7/2wIq3Jz1Lhqy1PkuF9jIZ1DlbB9uhnF2q0Hv0kA1+oo
   hhgTjd8tsODNYirun2LQkckshHFMe3XSQRYudygmuebhpcmVYXnRcCmwN
   ZjXjPSGfE3FFgQtvxrrTQ6OTkqfcVqsFcliqbpgH2yfjOJXtfF4Tdjz3X
   ktTh6M7YGSkJN/eILpFva1H3ErcY/+O5MipWnETRQeAGOBz6frE1uZo7U
   3SeJqcXqf/PBa6sT4zN3lExUiwQb5i1osVxOEHbvfPkuMVeQsIlpCBkG4
   A==;
X-CSE-ConnectionGUID: 1JyvKBbQSjmtTHrJDmNMCw==
X-CSE-MsgGUID: 32dyAVMtTYeJ31Sm09S8+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="23592523"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="23592523"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 14:04:01 -0700
X-CSE-ConnectionGUID: R7Tq8hNoROe344HDjYJOnw==
X-CSE-MsgGUID: jpbQGZYGSo6riq4gjDLB2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34239878"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 May 2024 14:04:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAyYX-0007Pb-2M;
	Sat, 25 May 2024 21:03:57 +0000
Date: Sun, 26 May 2024 05:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v6 7/8]
 crypto/asymmetric_keys/tpm2_key_rsa.c:591:13: warning: variable 'alg' set
 but not used
Message-ID: <202405260540.gGFO0Lf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   d68aa6486fd8c27b17a28484c3da8724ebfc26cf
commit: 89db40264dffec84747b770d7ba79f893ef48f4b [7/8] keys: asymmetric: tpm2_key_rsa
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260540.gGFO0Lf4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260540.gGFO0Lf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260540.gGFO0Lf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function '__tpm2_key_rsa_preparse':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:591:13: warning: variable 'alg' set but not used [-Wunused-but-set-variable]
     591 |         u16 alg;
         |             ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:589:13: warning: variable 'attr' set but not used [-Wunused-but-set-variable]
     589 |         u32 attr;
         |             ^~~~


vim +/alg +591 crypto/asymmetric_keys/tpm2_key_rsa.c

   582	
   583	static int __tpm2_key_rsa_preparse(struct tpm2_key *key)
   584	{
   585		struct tpm2_rsa_parms parms;
   586		struct tpm_buf buf;
   587		off_t offset = 2;
   588		u16 policy_len;
   589		u32 attr;
   590		u16 type;
 > 591		u16 alg;
   592	
   593		buf.flags = TPM_BUF_TPM2B;
   594		buf.length = key->pub_len;
   595		buf.data = (void *)key->pub;
   596	
   597		if (get_unaligned_be16(key->pub) != buf.length - 2)
   598			return -EBADMSG;
   599	
   600		type = tpm_buf_read_u16(&buf, &offset);
   601		if (type != TPM_ALG_RSA)
   602			return -EBADMSG;
   603	
   604		alg = tpm_buf_read_u16(&buf, &offset);
   605		attr = tpm_buf_read_u32(&buf, &offset);
   606		policy_len = tpm_buf_read_u16(&buf, &offset);
   607		offset += policy_len;
   608	
   609		if ((offset + sizeof(parms)) > buf.length)
   610			return -EBADMSG;
   611	
   612		parms.symmetric = tpm_buf_read_u16(&buf, &offset);
   613		parms.scheme = tpm_buf_read_u16(&buf, &offset);
   614		parms.key_bits = tpm_buf_read_u16(&buf, &offset);
   615		parms.exponent = tpm_buf_read_u32(&buf, &offset);
   616	
   617		if (parms.symmetric != TPM_ALG_NULL)
   618			return -EBADMSG;
   619	
   620		if (parms.scheme != TPM_ALG_NULL)
   621			return -EBADMSG;
   622	
   623		if (parms.key_bits != 2048 &&
   624		    parms.key_bits != 3072 &&
   625		    parms.key_bits != 4096)
   626			return -EBADMSG;
   627	
   628		parms.exponent = tpm_buf_read_u32(&buf, &offset);
   629		if (parms.exponent != 0x00000000 && parms.exponent !=  0x00010001)
   630			return -EBADMSG;
   631	
   632		/* Sanity check, expected never happen: */
   633		return buf.flags & TPM_BUF_BOUNDARY_ERROR ? -EIO : 0;
   634	}
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
