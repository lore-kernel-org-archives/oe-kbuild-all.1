Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4E320B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740011023; cv=none; b=m2IPHVDh3yIYkWqmtWW1kg2PpoWSk3sekb5qPd0w8fVR33yhggczDP++K6Jws9slvR8LI15lUIVrQDRRBqY8FdK6N7dKoJDEqoOu2RnDyZ7y6TlEg9EFQpsMRsmt44eZM6LrLr5P01aLBgUZUXXeq2BBHgeQg3abpyDC5KJWKdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740011023; c=relaxed/simple;
	bh=zvrDf5Ixq9OW/37f/KTzMIU6tpKujT39+xlpWmxc3IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1CVchfHL23xz5eWIkTW0ndhxNMc1n+cr9G1w5LNjUPT3UsTAFHBPmUFt9q7iSbJDTb4aN4Lbwx30glGl1zdoob09LelK0XEa63I7AcJ6ZmNP4qQtwJbInLRZaGKjdAqqmu5ijVEGr35ngcMI1G+zfA+SE6Rfql9ifySp2GKvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqpC0piP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqpC0piP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740011021; x=1771547021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvrDf5Ixq9OW/37f/KTzMIU6tpKujT39+xlpWmxc3IE=;
  b=UqpC0piPusbiCVGK+7RPhLw0lLTT5GRc5MDBlcydSXngRbTDs8tOgNUG
   myrIj5wxtZ2amgrQRmZR8juC7RajeSnqeNovU4rSxJSWDgNRBHHsatWev
   S58z7o8VTXC0eKiq2NHQTGJEihNpeBFMZi9cFO44/bUpjkOehRmFxILfn
   fWgPBlhCVqQFzj9O+y8vxMXIyAMlF2L0pRa8TuYV+ikwV50WoCi/tq8es
   cmizr/g24cLkN2DWK1Q4/1PqjcIKNJTiTJGpm2V7t5L6jnapY4Y1gUQ89
   AhLaPUifAlgrsX5vxoQk6oeuPwjwdW1D+RQJWVK80Orue5FzK91Amw1Ar
   g==;
X-CSE-ConnectionGUID: 4/ffLERvS8GzrbI7xCMSZQ==
X-CSE-MsgGUID: Yr7MrI61S8WrnrJx1CGk5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44546222"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="44546222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 16:23:18 -0800
X-CSE-ConnectionGUID: +isHvvzsSaCL9pVdSH5gwQ==
X-CSE-MsgGUID: 6Wzc0EGnTm24ubWAs6pPPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118979239"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2025 16:23:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkuLS-0003eZ-1Z;
	Thu, 20 Feb 2025 00:23:14 +0000
Date: Thu, 20 Feb 2025 08:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 28/44] ld.lld: error: undefined symbol:
 crypto_krb5_how_much_data
Message-ID: <202502200819.C0fotKjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   2063c6715d5e06923fa3a4e603c85191c426d7e8
commit: cc8f13664552eeec006e62feb47889a342a97bf7 [28/44] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: riscv-randconfig-r073-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200819.C0fotKjK-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200819.C0fotKjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200819.C0fotKjK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crypto_krb5_how_much_data
   >>> referenced by refcount.h:191 (include/linux/refcount.h:191)
   >>>               net/rxrpc/rxgk.o:(rxgk_alloc_txbuf) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crypto_krb5_get_mic
   >>> referenced by rxgk.c:774 (net/rxrpc/rxgk.c:774)
   >>>               net/rxrpc/rxgk.o:(rxgk_secure_packet) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crypto_krb5_where_is_the_data
   >>> referenced by rxgk.c:774 (net/rxrpc/rxgk.c:774)
   >>>               net/rxrpc/rxgk.o:(rxgk_verify_packet) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crypto_krb5_verify_mic
   >>> referenced by rxgk.c:774 (net/rxrpc/rxgk.c:774)
   >>>               net/rxrpc/rxgk.o:(rxgk_verify_packet) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crypto_krb5_decrypt
   >>> referenced by rxgk.c:775 (net/rxrpc/rxgk.c:775)
   >>>               net/rxrpc/rxgk.o:(rxgk_verify_packet) in archive vmlinux.a
   >>> referenced by rxgk.c:784 (net/rxrpc/rxgk.c:784)
   >>>               net/rxrpc/rxgk.o:(rxgk_decrypt_skb) in archive vmlinux.a
   >>> referenced by rxgk_app.c:0 (net/rxrpc/rxgk_app.c:0)
   >>>               net/rxrpc/rxgk_app.o:(rxgk_extract_token) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
