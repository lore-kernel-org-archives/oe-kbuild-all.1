Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1318BB8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709840; cv=none; b=ACw5Z4o4uAtUOwKLJb0aV46jRLPWEOYTfEq3weBczAZkOSswnyeDuHvMpFYf8GfkrZQPiXgBPlW9Du9fRUBwHFQ0J1iMy0dSx8s8obNuNMnXJwWd6sCjY+9WsgG5C3VnaiZBFgXp+VULRmN0GzM6V9m0k0eSMbKmBSDttC/+geU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709840; c=relaxed/simple;
	bh=xYNwywpoMShFA+5id6HFLosxqPAVUtellR8QUBis1D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+PMw0lfKAztOx6QymxqiNr6drC/ctnIujcosrg8xWHdzArI9OzopkQyuuIlmxU8xMGI/KS5I1+hmxxEl7W8wJPIP9oExaMNsQBmg4eNTfIHFrfCcGE4OuMfJ4loKzk85k8jlo9eir4vlRFkmkH0DBv5uipH3wY8ydNO5saaUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD3KEIxy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD3KEIxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709840; x=1762245840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYNwywpoMShFA+5id6HFLosxqPAVUtellR8QUBis1D0=;
  b=bD3KEIxyI5c0f2eFsf/YVApJWAfRnPmKlpKzVfAE5F/7KXTC37XLObh8
   jQP4uLZY4wbFW54+itlALg9OrQgIcdLAlU+LjyQVPwG8OjbaxJguYj8cJ
   I9g+JJ1zefzJGz+7OxMte5I/o5mZF9UqhkTfVeY8xFMV4FrW+OvaqGPri
   l2k+J3Fx8D1CrjezFVrGKsLCWGXSyFkLp3wtozFf2c2ScFhSM16vVXM4q
   c30n8Ex0JjsI0E0x0CcnnvpLSCwvceCbqdU44BdPDmJsEgGrpjyQrBqzL
   uv63L32j4Hvs8t+7O7yBH9hYvb1txH6l362dpVcudiX27SDCIH+VbGBmF
   g==;
X-CSE-ConnectionGUID: QWY5DwHRSf2QCsl5XejK+A==
X-CSE-MsgGUID: uQk0M3uKQvaz7a5AcveGFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34089807"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34089807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:43:59 -0800
X-CSE-ConnectionGUID: V+I2HO7iQ2GNBji1zRuDXg==
X-CSE-MsgGUID: 4vhHOXOBQYGR+5q6ZSTNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="121050434"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2024 00:43:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7sgl-000kec-2N;
	Mon, 04 Nov 2024 08:43:55 +0000
Date: Mon, 4 Nov 2024 16:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 12/12]
 crypto/asymmetric_keys/tpm2_key_ecc.c:417:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202411041645.kUdtTSqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   676e39dca229e7ee2b1d90a1e8accda6fdede98f
commit: 3ca44efc8f37aa7aeada1dd406ec273f92859022 [12/12] KEYS: asymmetric: Add tpm2_key_ecdsa signer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241104/202411041645.kUdtTSqR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041645.kUdtTSqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041645.kUdtTSqR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_ecc.c:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/tpm2_key_ecc.c:417:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     417 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_ecc.c:413:9: note: initialize the variable 'ret' to silence this warning
     413 |         int ret;
         |                ^
         |                 = 0
   5 warnings generated.


vim +/ret +417 crypto/asymmetric_keys/tpm2_key_ecc.c

   406	
   407	/*
   408	 * Attempt to parse a data blob for a key as a TPM private key blob.
   409	 */
   410	static int tpm2_key_ecc_preparse(struct key_preparsed_payload *prep)
   411	{
   412		struct tpm2_key *key;
   413		int ret;
   414	
   415		key = tpm2_key_decode(prep->data, prep->datalen);
   416		if (IS_ERR(key))
 > 417			return ret;
   418	
   419		if (key->oid != OID_TPMLoadableKey) {
   420			kfree(key);
   421			return -EBADMSG;
   422		}
   423	
   424		ret = __tpm2_key_ecc_preparse(key);
   425		if (ret < 0) {
   426			kfree(key);
   427			return ret;
   428		}
   429	
   430		prep->payload.data[asym_subtype] = &tpm2_key_ecc_subtype;
   431		prep->payload.data[asym_key_ids] = NULL;
   432		prep->payload.data[asym_crypto] = key;
   433		prep->payload.data[asym_auth] = NULL;
   434		prep->quotalen = 100;
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
