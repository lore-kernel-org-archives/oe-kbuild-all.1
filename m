Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F917591
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739162667; cv=none; b=l0t38Yuu9FLsbpaDzXObwR0ElArARmzgEUG5+IPumMaB0pZfmhb0B+7PGP4SqQz7hm7/OZp1wb/IolfWQN6krgvVu9wwg/jRVTNTLbQJ/aIp0ZMchOHr/uJC3ED9N2b0zjE2eWbKhg94+htFTRP4N8oWnvf3BEA0DELZCHJQCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739162667; c=relaxed/simple;
	bh=dDsMddmwcw2xGdMn7gujzfnJekg3GQVQsfefwo7itME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfOM0Zl/fHfPEXaujYHDwV72/2JuVD3oS21SxvrjHnXxDm2OANn9aPKFqBcagRje0w4PGX7dGn/4vkreovki7IMeDuVG9N90aO6LUpoHH5IzcsTDP6Gt/HePDqJLki5FX9eFmqYUZzchMM1bBIVKUh7fQnFMBpJqethz9FqA42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIMjvd0V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIMjvd0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739162665; x=1770698665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDsMddmwcw2xGdMn7gujzfnJekg3GQVQsfefwo7itME=;
  b=VIMjvd0Vbc07Wn9D7WVr2FX+e3N4/zrGg950s31bA4Ioe7TF6gBJ9UDi
   9doG+0t7R6QfnCICSVu0+G77K/xLk5MlCNcDQIgG+9ay8/VY/I96SrCV9
   uk74W7XASNK7mbm7Pj3PKqRSMho41pea6SeEMOfvXVr1mcNAjvSo5XAF2
   VZ8007qKWt1qbsZti5+JTC4uXfIYay6+DAD2siWx0LX9in7eZ5xWNID3K
   oZ7tuQcU5p7ixXCPuCWEN5MSlEmJN9cEslGXldYtcAaZmETDSLpFQgjhK
   jBznhQYcjUcre0e3lcc4ZTwteYfyn57qesokHeTnh5UXCAUFIxdvFfh/F
   g==;
X-CSE-ConnectionGUID: 0+Jh4g9zR5GbJnQQdg2eng==
X-CSE-MsgGUID: Yz828Wr5S9S26F98WGBgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39416156"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39416156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 20:44:25 -0800
X-CSE-ConnectionGUID: PKXXGd9aRimHIB8djE1lzg==
X-CSE-MsgGUID: ZrjgSx3ATY+Qm5DKatk7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="111916673"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2025 20:44:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thLef-0012Hv-1w;
	Mon, 10 Feb 2025 04:44:21 +0000
Date: Mon, 10 Feb 2025 12:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 35/35] net/rxrpc/rxperf.c:587:undefined
 reference to `crypto_krb5_find_enctype'
Message-ID: <202502101229.Cm30u9yV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   6385ba8f265471ebf57f38e2bd2e6a4fabac7424
commit: 6385ba8f265471ebf57f38e2bd2e6a4fabac7424 [35/35] rxrpc: rxperf: Add test RxGK server keys
config: csky-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101229.Cm30u9yV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101229.Cm30u9yV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101229.Cm30u9yV-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/rxrpc/rxperf.o: in function `rxperf_add_yfs_rxgk_key':
>> net/rxrpc/rxperf.c:587:(.text.unlikely+0x16): undefined reference to `crypto_krb5_find_enctype'
>> csky-linux-ld: net/rxrpc/rxperf.c:619:(.text.unlikely+0xb4): undefined reference to `crypto_krb5_find_enctype'
   net/ipv4/tcp_ipv4.o: in function `tcp_add_backlog':
   net/ipv4/tcp_ipv4.c:2028:(.text+0x2838): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2063:(.text+0x297a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2076:(.text+0x29e4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2106:(.text+0x2ab6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2108:(.text+0x2ad2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.o: in function `tcp_checksum_complete':
   include/net/tcp.h:1484:(.text+0x2ae2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.o: in function `spin_unlock':
   include/linux/spinlock.h:391:(.text+0x2aee): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.o: in function `tcp_add_backlog':
   net/ipv4/tcp_ipv4.c:2009:(.text+0x2822): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2106:(.text+0x2ab2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_ipv4.c:2106:(.text+0x2aba): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'


vim +587 net/rxrpc/rxperf.c

   581	
   582	/*
   583	 * Add a yfs-rxgk key to the security keyring.
   584	 */
   585	static int rxperf_add_yfs_rxgk_key(struct key *keyring, u32 enctype)
   586	{
 > 587		const struct krb5_enctype *krb5 = crypto_krb5_find_enctype(enctype);
   588		key_ref_t kref;
   589		char name[64];
   590		int ret;
   591		u8 key[32];
   592	
   593		if (!krb5 || krb5->key_len > sizeof(key))
   594			return 0;
   595	
   596		/* The key is just { 0, 1, 2, 3, 4, ... } */
   597		for (int i = 0; i < krb5->key_len; i++)
   598			key[i] = i;
   599	
   600		sprintf(name, "%u:6:1:%u", RX_PERF_SERVICE, enctype);
   601	
   602		kref = key_create_or_update(make_key_ref(keyring, true),
   603					    "rxrpc_s", name,
   604					    key, krb5->key_len,
   605					    KEY_POS_VIEW | KEY_POS_READ | KEY_POS_SEARCH |
   606					    KEY_USR_VIEW,
   607					    KEY_ALLOC_NOT_IN_QUOTA);
   608	
   609		if (IS_ERR(kref)) {
   610			pr_err("Can't allocate rxperf server key: %ld\n", PTR_ERR(kref));
   611			return PTR_ERR(kref);
   612		}
   613	
   614		ret = key_link(keyring, key_ref_to_ptr(kref));
   615		if (ret < 0)
   616			pr_err("Can't link rxperf server key: %d\n", ret);
   617		key_ref_put(kref);
   618		return ret;
 > 619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
