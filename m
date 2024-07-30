Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC118E741
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722332195; cv=none; b=aNTUG27fQ+WkMCvPTPvu/cJzoNT7hxRoSA2P5NAewOaUtMSnA4YHgXKw2KyxjmJRhYsnnQBaNh3ToJWYSt+ot3IXO70029fhtnQawgDjC39vVEAjjkjLRa3JUVA0PIlafCNs9a5x65tkICpI62h/71TnrjAw6Ehh/KOWKstJx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722332195; c=relaxed/simple;
	bh=kkS6opl1E3BW4Fwv0GYoQZl5emYIQmLurdb5l6BI4pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4tWvDcklfnsGCJRM+yNXR7KdC+7jruKwKFnt92zpqnx6iGSmAWG7jiHrnCSezpSLA9vrWc+H1vA5lEeT5vdqeXhmbrGtmqUl8MPrMRQA8680U9ZBw9Xt80a2uTvZ/lu8FtCtFF1U85qB/tdQlcaLU732kxSzBh2rkR98mY3rEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjHvv3uc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjHvv3uc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722332193; x=1753868193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkS6opl1E3BW4Fwv0GYoQZl5emYIQmLurdb5l6BI4pw=;
  b=WjHvv3ucei9Mt3Toa08HYY7DPYQunbJuI+25qviDHDvshXn4y07pkoRc
   qVdK2EjFnxBToQbMV0CfVhbm+0Ak4V7eFGYnAtPTeKkAr0QIiuiJ+VoFk
   HWwblkPX/gaBDLweYF7GoE0Lw7/Uk+HT9CGMUP8HXUkL8jGS1wEL+3vA8
   zZHUwOAOLKWcRTbiVweGJwPBN147ECzSCgdASugViDiOqSCGAjXUBsfsD
   aLLdWF25IMeFBw7alLg+WOAv/atLWD8wg48VPiWMOZsMl5eXrGN4txlcd
   d6gZ8xFYD3hYdIKvgUcSCjBkdBJjusvfKvUboTvvKnI/YN5k/CzPiLIGF
   A==;
X-CSE-ConnectionGUID: veE+7qCSSaqVQp+oe6II0w==
X-CSE-MsgGUID: OE5KV+jMRvCbCzLhi0vh0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="24001195"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="24001195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 02:36:33 -0700
X-CSE-ConnectionGUID: aJknaxQ9RhmPj+ZFOcyQEQ==
X-CSE-MsgGUID: 2SuNOWCBQZqtMbghGN8MKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="85229182"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2024 02:36:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYjHS-000sjM-0s;
	Tue, 30 Jul 2024 09:36:30 +0000
Date: Tue, 30 Jul 2024 17:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 4/4] security/apparmor/af_unix.c:604:17:
 error: implicit declaration of function 'unix_state_lock_nested'; did you
 mean 'mmap_write_lock_nested'?
Message-ID: <202407301751.8RM4AudE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b2ff78a1aeb16f290e483536dedf626ba2d1e9
commit: e6b2ff78a1aeb16f290e483536dedf626ba2d1e9 [4/4] apparmor: add fine grained af_unix mediation
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240730/202407301751.8RM4AudE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301751.8RM4AudE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301751.8RM4AudE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   security/apparmor/af_unix.c: In function 'unix_state_double_lock':
>> security/apparmor/af_unix.c:604:17: error: implicit declaration of function 'unix_state_lock_nested'; did you mean 'mmap_write_lock_nested'? [-Wimplicit-function-declaration]
     604 |                 unix_state_lock_nested(sk2, U_LOCK_SECOND);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 mmap_write_lock_nested
>> security/apparmor/af_unix.c:604:45: error: 'U_LOCK_SECOND' undeclared (first use in this function)
     604 |                 unix_state_lock_nested(sk2, U_LOCK_SECOND);
         |                                             ^~~~~~~~~~~~~
   security/apparmor/af_unix.c:604:45: note: each undeclared identifier is reported only once for each function it appears in
--
>> security/apparmor/lsm.c:1143: warning: Function parameter or struct member 'sk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1143: warning: Function parameter or struct member 'peer_sk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1143: warning: Function parameter or struct member 'newsk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1175: warning: Function parameter or struct member 'sock' not described in 'apparmor_unix_may_send'
>> security/apparmor/lsm.c:1175: warning: Function parameter or struct member 'peer' not described in 'apparmor_unix_may_send'
   security/apparmor/lsm.c:1286: warning: Function parameter or struct member 'sock' not described in 'apparmor_socket_bind'
   security/apparmor/lsm.c:1286: warning: Function parameter or struct member 'address' not described in 'apparmor_socket_bind'
   security/apparmor/lsm.c:1286: warning: Function parameter or struct member 'addrlen' not described in 'apparmor_socket_bind'


vim +604 security/apparmor/af_unix.c

   595	
   596	static void unix_state_double_lock(struct sock *sk1, struct sock *sk2)
   597	{
   598		if (unlikely(sk1 == sk2) || !sk2) {
   599			unix_state_lock(sk1);
   600			return;
   601		}
   602		if (sk1 < sk2) {
   603			unix_state_lock(sk1);
 > 604			unix_state_lock_nested(sk2, U_LOCK_SECOND);
   605		} else {
   606			unix_state_lock(sk2);
   607			unix_state_lock_nested(sk1, U_LOCK_SECOND);
   608		}
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
