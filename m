Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E04F9D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 04:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748145674; cv=none; b=dT+CSCCQKZZtyxAvYFsPJG9yv2l+TMYoCFR81s41HKRtHvq12Q9BOzyHnpHnUPQsFwxTNu2EyUakRtAerkxpkzxOh31iCuFzG1kG2jK9QvJk8u/O5JSq7um2YvZtDNjTfYWHcjoPUrnf/k4V/jd0fpCKdeMiME0O6lVzDvBQ5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748145674; c=relaxed/simple;
	bh=YA0LoK92G2GdkwK98JBcLGfwwDBL6VKkpIVm3CTkCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZo7itOL0K2HvUsuvxv7L9m5f59qxNVLS1jGj6w9SAmkGjogU90Vzk2KR+b2GF/W32Hwn6IyjHM72+GRggXbbM3F9IgpyXukpKLnRc9v1Zs1hu/bkAGO8UooG4lTY25STaWBGKtlzccchNGNaxW4z421rXBnqaVm1lSul/ve0dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+ttZ8qy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+ttZ8qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748145671; x=1779681671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YA0LoK92G2GdkwK98JBcLGfwwDBL6VKkpIVm3CTkCCg=;
  b=S+ttZ8qy3rl4X6F2m1PtnUomwxaFdM865k1a/QYaTZBSgiBah0Ca1CM+
   qkbH1tFCJxSSEwJMbfipkT4fmSwRGMO6vjWFVhcofXrCJz3LmSNZRQXEE
   S/DewaIMairhRVmNQUseL941WJXEU596TGxM/uV7zgrWaZIjqzNHHSLZK
   OtA99Lr2kF26jXlyIAjlhQolt3bvdW39BobCdP8+XBof/W0+Mv+etizla
   BeMPVUSg0V1OKSQMHNf25icPHWGfhPH8V0XWni57UasHuqyYdxmoK+mna
   bITIGbeBVeSMu+5sJO+fmIdgrz63hg7j8FlvkeLRk2hlKxGVN5wMacgCm
   A==;
X-CSE-ConnectionGUID: Ebp/2nvUTkqZFU4LzNMsEw==
X-CSE-MsgGUID: OLwj1HpQR9yvRPFOiJ2big==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50075939"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50075939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 21:01:10 -0700
X-CSE-ConnectionGUID: E9hXB7JrQ2G5G0GWQtb50Q==
X-CSE-MsgGUID: BUBIn0J2QkycuCd2XBgB8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="146636242"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 May 2025 21:01:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ2Xn-000Rbw-38;
	Sun, 25 May 2025 04:01:03 +0000
Date: Sun, 25 May 2025 12:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 13/15] security/keys/container.c:260:19:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202505251156.6MwZxmnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 4c687c8a6028c2d7224a8d8b6e404a5f9c981c43 [13/15] keys: Provide a keyctl to query a request_key authentication key
config: arm64-randconfig-r133-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251156.6MwZxmnN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251156.6MwZxmnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251156.6MwZxmnN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/keys/container.c:160:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const [noderef] __user *_type @@     got char const *_type @@
   security/keys/container.c:160:52: sparse:     expected char const [noderef] __user *_type
   security/keys/container.c:160:52: sparse:     got char const *_type
   security/keys/container.c:132:6: sparse: sparse: symbol 'keyctl_container_intercept' redeclared with different type (incompatible argument 2 (different address spaces)):
   security/keys/container.c:132:6: sparse:    long extern [addressable] [signed] [toplevel] keyctl_container_intercept( ... )
   security/keys/container.c: note: in included file:
   security/keys/internal.h:367:6: sparse: note: previously declared as:
   security/keys/internal.h:367:6: sparse:    long extern [addressable] [signed] [toplevel] keyctl_container_intercept( ... )
>> security/keys/container.c:260:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/keys/container.c:260:19: sparse:    struct key [noderef] __rcu *
   security/keys/container.c:260:19: sparse:    struct key *

vim +260 security/keys/container.c

   228	
   229	/*
   230	 * Query information about a request_key_auth key.
   231	 */
   232	long keyctl_query_request_key_auth(key_serial_t auth_id,
   233					   struct keyctl_query_request_key_auth __user *_data)
   234	{
   235		struct keyctl_query_request_key_auth data;
   236		struct request_key_auth *rka;
   237		struct key *session, *reg_keyring;
   238		key_ref_t authkey_ref, usession_ref;
   239		uid_t uid;
   240		char buf[20];
   241		int ret = 0;
   242	
   243		if (auth_id <= 0 || !_data)
   244			return -EINVAL;
   245	
   246		authkey_ref = lookup_user_key(auth_id, 0, KEY_NEED_SEARCH);
   247		if (IS_ERR(authkey_ref))
   248			return PTR_ERR(authkey_ref);
   249		rka = get_request_key_auth(key_ref_to_ptr(authkey_ref));
   250	
   251		memset(&data, 0, sizeof(data));
   252		strncpy(data.operation, rka->op, sizeof(data.operation));
   253		data.fsuid		= from_kuid(current_user_ns(), rka->cred->fsuid);
   254		data.fsgid		= from_kgid(current_user_ns(), rka->cred->fsgid);
   255		data.target_key		= rka->target_key->serial;
   256		data.thread_keyring	= key_serial(rka->cred->thread_keyring);
   257		data.process_keyring	= key_serial(rka->cred->process_keyring);
   258	
   259		rcu_read_lock();
 > 260		session = rcu_dereference(rka->cred->session_keyring);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
