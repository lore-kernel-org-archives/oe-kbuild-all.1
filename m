Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1221A9B52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811578; cv=none; b=dRbbqsZRA3LUHSK8PnGSuVmIfEsZqYBCul2wL9pDpw/J5G5LihKRIcwKDGA1d5vKf3MMJ1G8A7vCVOB29DSxFC3I7UJ29ENfxZ0jnZxEHoD08iRUGgDDyxU0O4pTfPUhtvZO5zBfGBHSCUB23de9bJgHB/ML5xWzZkr/vz8mOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811578; c=relaxed/simple;
	bh=JfO3+VmEDLPbiagBxkXdaJGgpx44YAIkYrCL180yqfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMsL6qAnWUIfdVDraWLKh+Jc+JTz1mCvwiA65mLhk1qEgJywX2mkabwyBNuAavl73TCqUFLtn3IO7CRmeDC44sRlWanRdSG7nKeX+HsqdB5qWQ1+6qHmvucL58WR/ZIV0gWVaYmZcFZQO2puXTjfMGKXtn9I08RhuzyYmsGAnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGKgDFaQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGKgDFaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749811577; x=1781347577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfO3+VmEDLPbiagBxkXdaJGgpx44YAIkYrCL180yqfI=;
  b=WGKgDFaQlA1NePX5fsp9tZDD1OjoXKrTzY4m0SoH185ui4J7aAkbMbzv
   B7kKJtNhaix7RbmiGSUeNQq6FwhhYCk0+Qt57X5AoFSlnGaLhc0kZzlcQ
   GAsUghmHfk2Q5u6MlyHsBsqnUgEWzy/5kHVW7YGe8PwN3RFcZu157eiX6
   3vr8NRboasUL3Ly/nU+/e60V5oPa5IfAM5taBcY855Gb4ptUmp5Oq3051
   4Q3JP9fsNMI56t5hl/C3Ytao1dqksqB9ZcSuHTIVzHDuY7+qDH+Dgsr57
   +lkgKKC3CCXxMHDPj0MXfeAFr2FoPqIwhxlflAwMF82sG4R2EZACUoB+H
   w==;
X-CSE-ConnectionGUID: dNVuJL6nROyhr5hWGM1aoA==
X-CSE-MsgGUID: lNN0OvLHT2+tFN6yaDb0Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55822991"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55822991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:46:16 -0700
X-CSE-ConnectionGUID: s51+Dx+wTQyYpJyZAACfCA==
X-CSE-MsgGUID: DMxFMesSSMyjEMh9Eypwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147699955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 03:46:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ1vI-000CUO-1b;
	Fri, 13 Jun 2025 10:46:12 +0000
Date: Fri, 13 Jun 2025 18:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-rsassa-pkcs1 9/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:546:10: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202506131837.j2Uua407-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-rsassa-pkcs1
head:   c233b7cd00588a7a3397f17fd2650880aa7cecf7
commit: c233b7cd00588a7a3397f17fd2650880aa7cecf7 [9/9] KEYS: asymmetric: TPM2 RSA key
config: i386-randconfig-011-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131837.j2Uua407-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131837.j2Uua407-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131837.j2Uua407-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/tpm2_key_rsa.c:546:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     546 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:542:9: note: initialize the variable 'ret' to silence this warning
     542 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +546 crypto/asymmetric_keys/tpm2_key_rsa.c

   535	
   536	/*
   537	 * Attempt to parse a data blob for a key as a TPM private key blob.
   538	 */
   539	static int tpm2_key_rsa_preparse(struct key_preparsed_payload *prep)
   540	{
   541		struct tpm2_key *key;
   542		int ret;
   543	
   544		key = tpm2_key_decode(prep->data, prep->datalen);
   545		if (IS_ERR(key))
 > 546			return ret;
   547	
   548		if (key->oid != OID_TPMLoadableKey) {
   549			kfree(key);
   550			return -EBADMSG;
   551		}
   552	
   553		ret = __tpm2_key_rsa_preparse(key);
   554		if (ret < 0) {
   555			kfree(key);
   556			return ret;
   557		}
   558	
   559		prep->payload.data[asym_subtype] = &tpm2_key_rsa_subtype;
   560		prep->payload.data[asym_key_ids] = NULL;
   561		prep->payload.data[asym_crypto] = key;
   562		prep->payload.data[asym_auth] = NULL;
   563		prep->quotalen = 100;
   564	
   565		return 0;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
