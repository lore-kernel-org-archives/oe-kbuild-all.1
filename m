Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C074E25
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706198826; cv=none; b=OBXZVRBqq2EuqN8WXU49lND3ztjBfXyftU3oCElTA0QxsOWFySxsHEzxBTz4FdKl2i13DkKL9xKXVmMm95PTscCkz3bMZ3JDeEVULKJEeqm2xeAtcc5KAbInV2IpwyTNBn3swckmwoHQQkiK5QwKHTxEpEQWTTCasMOrlRC53A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706198826; c=relaxed/simple;
	bh=/w8wwSZoWuBYYbXDOiHmN090Ze/yHsIMoxSgw/168yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQPZhoVbA5EmMfFhbtPhr2wd/dW5m3wZMUiAYGGkYEuBjcMXnPVXYzluId49uRlkEjCMSflztGjhuqON2Dt/FeLp4FuNoOCGmK3mGbDIz1reXdfkzrmZU+qJdU2odnsDQ/qBpwOQBxytjjr7Vom+cCIhjpl7+kKLxA6SvRCgvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jav8nJmw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jav8nJmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706198825; x=1737734825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/w8wwSZoWuBYYbXDOiHmN090Ze/yHsIMoxSgw/168yk=;
  b=jav8nJmwuAWbwr4mgot4NFTZHZCVC3tEYbliAFBIR68Lb6EhgEF4GI5b
   Yf8LNTyg8oJgWDN6JZyuQ3YtXDy1LtskNE7Zlo3SHjZVkOEhPTUOnv717
   VJFQZGk9AGwL6cC6TClMtyvEkOp4hc1/pOLaKYNdFXATvyTHJwzp17FKD
   wBXQhVBqEI3p/UIPWMrumfVeAuBWIVgl0DfkK3d4spweTDotybdfevuSb
   bSOQgwVUA4RHyk+IrUBM+2ot1a+4nsyrjWVLaIt4c+1ls3n8LQF33ZTDq
   GBDm5VtJ0aImfRFsgnPRLaPU2Ybtj4+JZFzhmUimROJas7eFwTr1WyWw4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9585302"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9585302"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 08:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28521957"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2024 08:07:02 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT2Fn-0000Aq-20;
	Thu, 25 Jan 2024 16:06:59 +0000
Date: Fri, 26 Jan 2024 00:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [linux-next:master 1200/1892] net/core/sock_diag.c:210:17: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202401252355.PhD9im8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
commit: 1d55a6974756cf3979efd2cc68bcece611a44053 [1200/1892] sock_diag: allow concurrent operations
config: hexagon-randconfig-r121-20240125 (https://download.01.org/0day-ci/archive/20240125/202401252355.PhD9im8z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240125/202401252355.PhD9im8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252355.PhD9im8z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/sock_diag.c:210:17: sparse: sparse: Using plain integer as NULL pointer

vim +210 net/core/sock_diag.c

   202	
   203	int sock_diag_register(const struct sock_diag_handler *hndl)
   204	{
   205		int family = hndl->family;
   206	
   207		if (family >= AF_MAX)
   208			return -EINVAL;
   209	
 > 210		return !cmpxchg((const struct sock_diag_handler **)
   211					&sock_diag_handlers[family],
   212				NULL, hndl) ? 0 : -EBUSY;
   213	}
   214	EXPORT_SYMBOL_GPL(sock_diag_register);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
