Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E3191F91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763409767; cv=none; b=k4NtaSlZpjpZLqjEA2k7vgFX7ffdj4qT1OEhgI7DnVwcd9rrjxpgVEGccDvkPWpDJeJSuEQvEyJUa8rTOhVE94/73F+zZqDkx95+UEVpxdBV76eXUUWgvJ+3uChPOnpotw2Ux6QQEysPsyIAK1JTv4aWt1t0+/XctNIP5pTm7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763409767; c=relaxed/simple;
	bh=uisV2tJmvSWOvNeV5NOzQ5+mN/fx29tsHorK+E/7A2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adRLSG5w+yl/uTGrtzaeL1+aofQY6rRsmL6Y4yJoHVVA7NRIazatIVdbb8/o6w97Ffvkq+BA2mbCZCcr5bkt65S+bVJ8kOgHgMTwFW67kLfI9pz7ekCJX77UG6YK2VUYaxcJaAGDMZ26FSXId3WcOoYuUqLMZsz/8JoPpD8WwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fpz/gK8L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fpz/gK8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763409766; x=1794945766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uisV2tJmvSWOvNeV5NOzQ5+mN/fx29tsHorK+E/7A2U=;
  b=Fpz/gK8Lo0jk3rtsX+Mo/zG75Guy6C9MdJpTLlIwtoxZV0h8qpfl9Q5G
   C9one47iczEgRFeuf7SraA17VF6B+3dCTOCr56FK1POeeRfo6gi7T8Q6V
   8VQ6lRSWXSKqRPeXHqaIxw0HNijurxvLIKy92qEf1JTiZHSTS1dEkaZ3d
   cWdzhc+e21pfzASPTeccmYXA/LJ1QdJb2Jt9K4AQohxVdGMvoooyL6K9B
   VWUiwcR7F9q8i2CUZJUkIdtuvg9qc2thV8ppwaYBIsKm68XjSIgEWojGc
   raxApT9lfYpewd4FN9inweprQlcfVB0JVekBfeqpYV5gmO/idkwidwP4a
   w==;
X-CSE-ConnectionGUID: SCzCp0JMRk2LCG6I+2Tx+g==
X-CSE-MsgGUID: p5DN7phETBmxbUpi0ZmdFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="68026474"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="68026474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:02:46 -0800
X-CSE-ConnectionGUID: WKZZ4D5eSVid9TVrkiQCRg==
X-CSE-MsgGUID: yiP/n5e0Ste0QB83ogB6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190991500"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2025 12:02:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5Qx-00010p-02;
	Mon, 17 Nov 2025 20:02:43 +0000
Date: Tue, 18 Nov 2025 04:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 4/9]
 lib/crypto/tests/mldsa_kunit.c:46:undefined reference to `mldsa_44_verify'
Message-ID: <202511180300.eSkd6nJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 2c8549faf59c9e75793de9307da5ef4755daff1a [4/9] crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
config: sparc-randconfig-r072-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180300.eSkd6nJW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180300.eSkd6nJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180300.eSkd6nJW-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_44_kunit_test':
>> lib/crypto/tests/mldsa_kunit.c:46:(.text+0x24): undefined reference to `mldsa_44_verify'


vim +46 lib/crypto/tests/mldsa_kunit.c

    38	
    39	static void dilithium_44_kunit_test(struct kunit *test)
    40	{
    41		const struct dilithium_testvector *tc = dilithium_44_testvectors;
    42		int count = ARRAY_SIZE(dilithium_44_testvectors);
    43		int ret;
    44	
    45		for (int index = 0; index < count; index++) {
  > 46			ret = mldsa_44_verify(tc->pk, tc->pk_len,
    47					      tc->msg, tc->msg_len,
    48					      tc->sig, tc->sig_len);
    49			KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Verify failed");
    50		}
    51	
    52		KUNIT_SUCCEED(test);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
