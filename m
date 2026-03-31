Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E300527FB0E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931022; cv=none; b=HkJvZi9uaaR56XVb8tFSFQFPSEF+0FyDepfcFzD9tI8Cp62ayuCSvkKEE+SdqavbTiSBZQi6jMVeSw6VqgRXOmWa2KWpRsCTE3ePHliG73ZNgx5Tweo0j8soJEBXQFfqXsoofkQR1XaUO8na6g3Hu9CGbbuJ/lovyBrIJW7dhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931022; c=relaxed/simple;
	bh=9UweBOFMNE1z+og/HnqPGLq+U4VZmoCQY5y4o7WVcGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VvCSG5nuK2EopgQQkWEO099QrRZjcIaJVqPsPe5geLkiu4p872BBa7btl7IFynVz3sjkwWkVBXHA5vE23zlrHfr39PBcxL5Evefse472dsqNsCuhjyui/93D4bTDbbmmWP6xIKKMx6jee9RWil3q9yhCS+uKyLYBx7SdgD5HlD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej8M5/Ml; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej8M5/Ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774931020; x=1806467020;
  h=date:from:to:cc:subject:message-id;
  bh=9UweBOFMNE1z+og/HnqPGLq+U4VZmoCQY5y4o7WVcGE=;
  b=ej8M5/MlMwUM9hDm1VTh83ZqSkXOcBL6MsNQ9Szk4VLRQMFKsgO7Su3E
   aRXxLexSJNB02qTmzpa3w3z6dKOPBrjF1LQoBdvfzjonBlL3jL6/Cj7Y5
   nrLhwF53syxTmra+V4Rjg2/dZGm/xw1GtYcjm2E3do+GE3f99hpry52VX
   qd84o7eQXcLpjMiCWuc+gRDcJivg3NB1lZQPuYZMOiDj+K9PNwL4YC4OW
   SEexQiF/+YiPTxYqLhZIHevWs3uVxzTQd33ozn7mvMX/+eOOXVZ1I1azE
   ++w84+7c0i3iW/SClro9rpYh4vtJaNCWUOlF/8BYn4tI9CUGYQfAwhXEC
   A==;
X-CSE-ConnectionGUID: z1OfW7fiSky5Cbpi/+24aA==
X-CSE-MsgGUID: G8Z+r54ZQ9OvvHoFdC8VJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101390944"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101390944"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:23:39 -0700
X-CSE-ConnectionGUID: qZlB6w61SviV74BOfBoKMQ==
X-CSE-MsgGUID: vpw5K6x+T2i/+4nliMYboA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249470057"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 21:23:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Qdc-000000008Hl-0ftG;
	Tue, 31 Mar 2026 04:23:36 +0000
Date: Tue, 31 Mar 2026 06:23:09 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 15/26] Warning: fs/nfsd/nfs4xdr.c:4139
 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
Message-ID: <202603310644.YVMUN5n3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   41363e319407643cd357c31a12fd344cfc9eaf48
commit: 17ead909b8fe2314cec2ea3ffe9ccc2492c9c3c9 [15/26] nfsd: add notification handlers for dir events
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260331/202603310644.YVMUN5n3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310644.YVMUN5n3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310644.YVMUN5n3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4xdr.c:4139 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4139 function parameter 'nf' not described in 'nfsd4_encode_notify_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
