Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2105E36D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716534464; cv=none; b=RTINn5h+p9Iq2JPBBj4Ni4N+jrNnvlODEAv1eg3b9LjauaXCx2Yvv3UXcXtNRpdA5isVqOsdblXE7SGrDPL9cEbD5aDpjkNN3ljXT3KoDCCmc3XXDtX1IiyViMIc12hj6b7JxfPe612AWT8pb2Q/oLVRthQHIvDepKSyOFbJXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716534464; c=relaxed/simple;
	bh=0iNfF7ui3M8ZQRBciGnDtSup1pHxi9lDuPf8fyfc0nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=goDcda/OAPMt5CuMn7NTAtkkE/0Xcit6kFsJ+2dn7Ke6ns8oXuGrCpJ6gEUIe01sj7EZlXFhyRQ/pJfdnQEUdX5N8TOHV+rSHjwReJcRNItaidPOTQDs8lVTMbs2AleDxmWpROsWQqT3Ri3JoMvaCa/HvOAr6O2gmbUOupBFaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHZpYds2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHZpYds2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716534462; x=1748070462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0iNfF7ui3M8ZQRBciGnDtSup1pHxi9lDuPf8fyfc0nA=;
  b=fHZpYds2alFFD6oamL8aSQ8wRww9AADh+bY5nTP9H9RULk2a+j1WNLN8
   LsH+OI4aopYWVD/bM/1JepXh+dXg2i/zH8YcnwvLHqguwOHGlICL941eL
   qKuZFvVRkrAIFWKzALbZRnM+CEGF0yZjOC2tVHehFEsJqP6Py0Kf2zYVv
   mxFnbbaGW2WV6TJ9fgWGwhZqJNYNdM9fwIb0mOTznW1F3sxJFWhroYg5w
   L9W4waiw/wXjztu2svXN6tlNhJVnI7BRYLgtHQpZFYnSjMQF7CQvCpGl9
   kvrAy4mEfeW+GXKkaVjxbZz0CaTYdTaQ9m3kURWzlXbxnzolcms8tOon6
   g==;
X-CSE-ConnectionGUID: 5zz/JLKCRMufz1RUT8d5tA==
X-CSE-MsgGUID: k3nB9k/iSKujUrxgKwjS1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12771640"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="12771640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 00:07:42 -0700
X-CSE-ConnectionGUID: pmsjhT/7QOuVMAEGLuiuLA==
X-CSE-MsgGUID: g8beV1TRSrKLGhnIPkaUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="34020117"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2024 00:07:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAP1e-00044G-0X;
	Fri, 24 May 2024 07:07:38 +0000
Date: Fri, 24 May 2024 15:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v6 7/8]
 crypto/asymmetric_keys/tpm2_key_rsa.c:589:13: warning: variable 'attr' set
 but not used
Message-ID: <202405241408.hYtPOeFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   e757613ecd3146679925b1d4fcdaf8da2332d5a2
commit: dc8c127b9503176de77a8fb410c8ea5a8bb22222 [7/8] keys: asymmetric: tpm2_key_rsa
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240524/202405241408.hYtPOeFg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241408.hYtPOeFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241408.hYtPOeFg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function 'tpm2_key_rsa_probe':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:589:13: warning: variable 'attr' set but not used [-Wunused-but-set-variable]
     589 |         u32 attr;
         |             ^~~~


vim +/attr +589 crypto/asymmetric_keys/tpm2_key_rsa.c

   582	
   583	static int tpm2_key_rsa_probe(struct tpm2_key_rsa *key_rsa)
   584	{
   585		struct tpm2_key *key = &key_rsa->key;
   586		struct tpm_buf buf;
   587		off_t offset = 2;
   588		u16 policy_len;
 > 589		u32 attr;
   590		u16 bits;
   591		u16 type;
   592		u16 len;
   593		u16 alg;
   594		u32 exp;
   595	
   596		buf.flags = TPM_BUF_TPM2B;
   597		buf.length = key->pub_len;
   598		buf.data = (void *)key->pub;
   599	
   600		if (get_unaligned_be16(key->pub) != buf.length - 2)
   601			return -EBADMSG;
   602	
   603		type = tpm_buf_read_u16(&buf, &offset);
   604		if (type != TPM_ALG_RSA)
   605			return -EBADMSG;
   606	
   607		alg = tpm_buf_read_u16(&buf, &offset);
   608		attr = tpm_buf_read_u32(&buf, &offset);
   609		policy_len = tpm_buf_read_u16(&buf, &offset);
   610		offset += policy_len;
   611	
   612		alg = tpm_buf_read_u16(&buf, &offset);
   613		if (alg != TPM_ALG_NULL)
   614			return -EBADMSG;
   615	
   616		alg = tpm_buf_read_u16(&buf, &offset);
   617		if (alg != TPM_ALG_NULL)
   618			return -EBADMSG;
   619	
   620		bits = tpm_buf_read_u16(&buf, &offset);
   621		if (bits != 2048 && bits != 3072 && bits != 4096)
   622			return -EBADMSG;
   623	
   624		exp = tpm_buf_read_u32(&buf, &offset);
   625		if (exp != 0x00000000 && exp !=  0x00010001)
   626			return -EBADMSG;
   627	
   628		len = tpm_buf_read_u16(&buf, &offset);
   629		key_rsa->pub = key->pub + offset;
   630		key_rsa->pub_len = len;
   631	
   632		return buf.flags & TPM_BUF_BOUNDARY_ERROR ? -EIO : 0;
   633	}
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
