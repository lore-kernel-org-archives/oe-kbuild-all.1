Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAA4501A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730701850; cv=none; b=Sv22DZVRLUoq57D/gUkp6S4ssb4VEjFTfwAZHpRnWYE6UlNYtfJp/u5Y8O1jQAspOsMAQRIWOwKskst48ukB90xB+2oMeEUX+iMQYmnHKdLOwkAiCUAEZ3kftACEbM4Lh21n94KLGcNZKSHzNy7xNpzWRwIQUJamsTxgnRMEdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730701850; c=relaxed/simple;
	bh=8nAb/AF4Sjr0v90Ds6/tQONEEcAbVIJNxgvFQXgTdSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zo07mGRAALRadlvR0teBX/kYWKI5Gz8hYKuIBUoviNHsVBniWq1ZlGJAWz71iEVjRrAydjkci7TPUXbo10uuubIIgaGQRomAs4gy6umHCuBu3RepYoN0WVb1zAYUzEQXM7rdLzl9aKSsu9NdCD0TyyAPGmZgmmoij2z2BsRi7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMMHM2Co; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMMHM2Co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730701848; x=1762237848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nAb/AF4Sjr0v90Ds6/tQONEEcAbVIJNxgvFQXgTdSY=;
  b=aMMHM2CoHHLyT32JFC2htB6yZTX2xRKXp7W/cahiF0/b+toCMTTpBeXD
   jZyD8sjnqK4mZlAfrYEBVT09hezs5COLlLPs3Z3YTMvp/bw9qSoDEi8GD
   xQYoJlQwE2NqsXzUFJXbsN0MfcPSN4HG6MCzD6X8e5QWi1uTxverr+ehi
   QfF5izEOIJy55prClJ0vN7nBt8yW4MUo3oOw+fgU51qcj9LD8HnalQeYp
   uNpxMV2Y/tQBdzrDjZUCY0WfAApxV/yypoM38rA+lJr5VSr+BKnXAIjgb
   iQkhRTjhY/zPJnT+iSwkiHvDY+eMzMeZeRAvJUrRJP5BMjW9crQAOCAG5
   A==;
X-CSE-ConnectionGUID: XKYskcn2STOFaOQHbYyuKQ==
X-CSE-MsgGUID: zN4G6TXJTYiIwVaE9h8cQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="18002509"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="18002509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 22:30:47 -0800
X-CSE-ConnectionGUID: 7zEeJ7LtSFOEtZiXnDU9Cg==
X-CSE-MsgGUID: YDSzl1HRT/WlDFMDLhTGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="84002932"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2024 22:30:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7qbr-000kXf-3A;
	Mon, 04 Nov 2024 06:30:43 +0000
Date: Mon, 4 Nov 2024 14:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 11/12]
 crypto/asymmetric_keys/tpm2_key_rsa.c:633:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202411041402.87goDFKV-lkp@intel.com>
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
commit: 70ff943241a1202554120aa67fdb4708c684fed4 [11/12] KEYS: asymmetric: Add tpm2_key_rsa signer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241104/202411041402.87goDFKV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041402.87goDFKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041402.87goDFKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:21:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
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
>> crypto/asymmetric_keys/tpm2_key_rsa.c:633:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     633 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:629:9: note: initialize the variable 'ret' to silence this warning
     629 |         int ret;
         |                ^
         |                 = 0
   5 warnings generated.


vim +/ret +633 crypto/asymmetric_keys/tpm2_key_rsa.c

   622	
   623	/*
   624	 * Attempt to parse a data blob for a key as a TPM private key blob.
   625	 */
   626	static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
   627	{
   628		struct tpm2_key *key;
   629		int ret;
   630	
   631		key = tpm2_key_decode(prep->data, prep->datalen);
   632		if (IS_ERR(key))
 > 633			return ret;
   634	
   635		if (key->oid != OID_TPMLoadableKey) {
   636			kfree(key);
   637			return -EBADMSG;
   638		}
   639	
   640		ret = __tpm2_key_rsa_preparse(key);
   641		if (ret < 0) {
   642			kfree(key);
   643			return ret;
   644		}
   645	
   646		prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
   647		prep->payload.data[asym_key_ids] = NULL;
   648		prep->payload.data[asym_crypto] = key;
   649		prep->payload.data[asym_auth] = NULL;
   650		prep->quotalen = 100;
   651	
   652		return 0;
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
